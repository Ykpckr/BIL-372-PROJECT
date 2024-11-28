from pages import app
from flask import render_template, redirect, url_for, flash
from flask import request
from pages.models import Sahip, Hekim , Randevu, Ameliyat, Hayvan, Stajyer, BAGLIDIR
from pages.forms import HekimLoginForm, RegisterForm, LoginForm, AnimalForm, AppointmentForm, HekimForm, AmeliyatForm, StajyerForm
from pages import db
from flask_login import login_user, logout_user, login_required
from flask_login import current_user

@app.route('/')
@app.route('/home')
def home_page():
    return render_template('home.html')

def get_linked_hekim_numbers(stajyer_no):
    linked_hekim = db.session.query(BAGLIDIR.HekimNo).filter(BAGLIDIR.StajerNo == stajyer_no).all()
    return [h[0] for h in linked_hekim]  # Extract Hekim numbers


@app.route('/randevu', methods=['GET', 'POST'])
@login_required
def market_page():
    if isinstance(current_user, Stajyer):
        hekim_nos = get_linked_hekim_numbers(current_user.num)
        randevular = Randevu.query.filter(Randevu.hekim_no.in_(hekim_nos)).all()
        return render_template('randevu_stajyer.html', randevular=randevular)
    elif isinstance(current_user, Hekim):
        # Hekim sees their own randevus
        randevular = Randevu.query.filter_by(hekim_no=current_user.num).all()
        return render_template('randevu_hekim.html', randevular=randevular)
    else:
        # Default behavior for other users
        return render_template('randevu.html')
    
@app.route('/randevu/durum', methods=['GET'])
@login_required
def randevu_durumu():
    if not isinstance(current_user, Sahip):
        flash('Bu sayfayı yalnızca hayvan sahipleri görebilir!', category='danger')
        return redirect(url_for('market_page'))

    # Kullanıcının sahip_tc'sine göre hayvanları bul
    hayvanlar = Hayvan.query.filter_by(sahip_tc=current_user.tc).all()
    hayvan_nolar = [hayvan.hnum for hayvan in hayvanlar]

    # Bu hayvanlarla ilgili ameliyat bilgilerini getirirken hayvan ve hekim bilgilerini de ekle
    ameliyatlar = db.session.execute("""
        SELECT a.tarih, a.saat, h.isim AS hayvan_adi, k.isim AS hekim_adi, k.soyisim AS hekim_soyadi, a.aciklama
        FROM ameliyat AS a
        JOIN hayvan AS h ON a.Hayvan_no = h.hnum
        JOIN hekim AS k ON a.Hekim_no = k.num
        WHERE a.hayvan_no IN :hayvan_nolar
    """, {'hayvan_nolar': tuple(hayvan_nolar)}).fetchall()

    return render_template('randevu_durumu.html', ameliyatlar=ameliyatlar)




@app.route('/ameliyat_ekle/<int:hayvan_no>/<int:hekim_no>', methods=['GET', 'POST'])
@login_required
def ameliyat_ekle(hayvan_no, hekim_no):
    # Kullanıcı Hekim mi kontrol et
    if not isinstance(current_user, Hekim):
        flash('Bu işlem yalnızca hekimler tarafından yapılabilir!', category='danger')
        return redirect(url_for('market_page'))

    # Formu yükle
    form = AmeliyatForm()

    if form.validate_on_submit():  # Form gönderildiyse ve doğrulandıysa
        # Yeni ameliyat kaydı oluştur
        yeni_ameliyat = Ameliyat(
            tarih=form.tarih.data,  # Formdan gelen tarih
            saat=form.saat.data,    # Formdan gelen saat
            hayvan_no=hayvan_no,    # URL'den gelen hayvan_no
            hekim_no=hekim_no,      # URL'den gelen hekim_no
            aciklama=form.aciklama.data  # Formdan gelen açıklama
        )

        # Veritabanına kaydet
        db.session.add(yeni_ameliyat)
        db.session.commit()

        flash('Ameliyat başarıyla kaydedildi!', category='success')
        return redirect(url_for('market_page'))  # Randevu sayfasına yönlendir

    # GET isteğinde formu göster
    return render_template('ameliyat_form.html', form=form)




@app.route('/register', methods=['GET', 'POST'])
def register_page():
    form = RegisterForm()
    if form.validate_on_submit():
        tc=form.tc.data
        isim=form.fname.data
        soyisim=form.lname.data
        email_address=form.email_address.data
        password_hash=form.password1.data
        new_user = Sahip(tc,isim,soyisim,email_address,password_hash)
        insert = 'insert into sahip values(\'{tc}\',\'{isim}\',\'{soyisim}\',\'{email_address}\',\'{password_hash}\')'.format(
                                                                                                    tc=tc,
                                                                                                    isim=isim,
                                                                                                    soyisim=soyisim,
                                                                                                    email_address=email_address,
                                                                                                    password_hash=password_hash)
        db.engine.execute(insert)
        db.session.commit()
        login_user(new_user,force = True)
        flash(f"Account created successfully! You are now logged in as {new_user.isim}", category='success')
        render_template('base.html')
        return redirect(url_for('market_page'))

    if form.errors != {}:  # If there are not errors from the validations
        for err_msg in form.errors.values():
            flash(f'There was an error with creating a user: {err_msg}', category='danger')

    return render_template('register.html', form=form)


@app.route('/login', methods=['GET', 'POST'])
def login_page():
    form = LoginForm()
    if form.validate_on_submit():
        select = "select password_hash from sahip where email_address = \'{email_address}\'".format(email_address=form.email_address.data)
        pswd1 = str(db.engine.execute(select).fetchone())
        pswd = pswd1[2:-3]
        attempted_user = Sahip.query.filter_by(
            email_address=form.email_address.data).first()
            
        if attempted_user and pswd == form.password.data and attempted_user.check_password_correction(
                attempted_password=form.password.data
        ):
            login_user(attempted_user, remember = True, force = True)
            flash(  
                f'Success! You are logged in as: {attempted_user.isim}', category='success')
            return redirect(url_for('market_page'))
        else:
            flash('Username and password are not match! Please try again',
                  category='danger')

    return render_template('login.html', form=form)


@app.route('/logout')
def logout_page():
    logout_user()
    flash("You have been logged out!", category='info')
    return redirect(url_for("home_page"))

@app.route('/randevu/hayvan', methods=['GET', 'POST'])
@login_required
def animal_page():
    form = AnimalForm()
    if form.validate_on_submit():
        query = "select h1.hnum + 1 as start from hayvan as h1 left outer join hayvan as h2 on h1.hnum + 1 = h2.hnum where h2.hnum is null"
        result = db.engine.execute(query).fetchone()
        if result and result[0]:
            hnum = str(result[0])
        else:
            # Eğer hiç hayvan yoksa, başlangıç olarak '1' verin
            hnum = '1'

        if isinstance(form.yas.data, int):
            insert = 'insert into hayvan values(\'{hnum}\',\'{owner}\',\'{name}\',\'{tur}\',{yas})'.format(
                                                                    hnum=hnum,
                                                                    owner = current_user.tc,
                                                                    name=form.name.data,
                                                                    tur=form.tur.data,
                                                                    yas=form.yas.data)
            db.engine.execute(insert)
            db.session.commit()
            return redirect(url_for("market_page"))
        else:
            flash('Ekleme sirasinda bir hata olustu. Lutfen tekrar dene',
                  category='danger')
            return render_template('hayvan.html', form=form)
    return render_template('hayvan.html', form=form)

@app.route('/randevu/al', methods=['GET', 'POST'])
@login_required
def randevu_page():
    form = AppointmentForm()
    kullanici_hayvanlari = db.engine.execute(
        "SELECT hnum, isim FROM hayvan WHERE sahip_tc = '{}'".format(current_user.tc)
    ).fetchall()

    # Hayvanların hnum ve isimlerini SelectField'in choices kısmına ekle
    form.hayvanlar.choices = [(hayvan.hnum, hayvan.isim) for hayvan in kullanici_hayvanlari]

    mevcut_hekimler = db.engine.execute("SELECT num, isim, soyisim FROM hekim").fetchall()

    # Hekimlerin id ve isimlerini SelectField'in choices kısmına ekle
    form.hekimler.choices = [(hekim.num, f"{hekim.isim} {hekim.soyisim}") for hekim in mevcut_hekimler]


    if form.validate_on_submit():
        try:
            # notlar sütununa boş bir string ekliyoruz
            insert = """
                INSERT INTO randevu (tarih, saat, hayvan_no, hekim_no, notes)
                VALUES (%s, %s, %s, %s, %s)
            """
            db.engine.execute(insert, (form.tarih.data, form.saat.data, form.hayvanlar.data, form.hekimler.data, ''))
            db.session.commit()
            flash('Randevu başarıyla alındı!', category='success')
            return redirect(url_for("market_page"))
        except Exception as e:
            flash(f'Randevu eklenirken bir hata oluştu: {e}', category='danger')

    return render_template('al.html', form=form)


@app.route('/randevu/eski')
@login_required
def eski_page():
    randevular = db.session.execute("""
            SELECT r.saat, r.tarih, h.isim AS hayvan_adi, k.isim AS hekim_adi, k.soyisim AS hekim_soyadi
            FROM randevu AS r
            JOIN hayvan AS h ON r.Hayvan_no = h.hnum
            JOIN hekim AS k ON r.Hekim_no = k.num
            WHERE h.sahip_tc = :owner_tc
        """, {'owner_tc': current_user.tc}).fetchall()

    return render_template('eski.html', randevular=randevular)


@app.route('/admin/login', methods=['GET', 'POST'])
def admin_login():
    # Admin login formunu göster
    form = HekimLoginForm()
    if form.validate_on_submit():
        # Check if user is a Hekim
        attempted_hekim = Hekim.query.filter_by(email=form.email.data).first()
        if attempted_hekim and attempted_hekim.sifre == form.password.data:
            login_user(attempted_hekim, remember=True)
            flash(f'Success! You are logged in as: {attempted_hekim.isim}', category='success')
            return redirect(url_for('admin_page'))  # Başarılı giriş sonrası admin sayfasına yönlendir

        # Check if user is a Stajyer
        attempted_stajyer = Stajyer.query.filter_by(email=form.email.data).first()
        if attempted_stajyer and attempted_stajyer.sifre == form.password.data:
            login_user(attempted_stajyer, remember=True)
            flash(f'Success! You are logged in as: {attempted_stajyer.isim}', category='success')
            return redirect(url_for('admin_page'))  # Başarılı giriş sonrası admin sayfasına yönlendir

        # If neither matched, show an error
        flash('Email and password do not match! Please try again.', category='danger')

    return render_template('admin_login.html', form=form)


@app.route('/admin', methods=['GET'])
@login_required
def admin_page():
    hekims = Hekim.query.all()
    stajyers = Stajyer.query.all()

    # Determine the user's role
    if isinstance(current_user, Stajyer):
        user_role = 'stajyer'
    elif isinstance(current_user, Hekim):
        user_role = 'hekim'
    else:
        user_role = 'other'

    # Pass data and user role to the template
    return render_template('admin.html', user_role=user_role, hekimler=hekims, stajyers=stajyers)


@app.route('/admin/hekim', methods=['GET', 'POST'])
@login_required
def hekim_page():
    form = HekimForm()
    if 1:     
        max_num_query = """
        SELECT MAX(num) FROM (
            SELECT num FROM hekim
            UNION
            SELECT num FROM stajyer
        ) AS combined
        """
        max_num_result = db.engine.execute(max_num_query).fetchone()
        new_hekim_num = (int(max_num_result[0]) if max_num_result[0] is not None else 0) + 1  
        
        if form.soyisim.data != None:
            insert = 'insert into hekim values(\'{isim}\',\'{soyisim}\',\'{email}\',\'{sifre}\',{num})'.format(
                                                                    soyisim = form.soyisim.data,
                                                                    isim=form.isim.data,
                                                                    sifre=form.sifre.data,
                                                                    email=form.email.data,
                                                                    num=new_hekim_num)
        
            db.engine.execute(insert)
            db.session.commit()
            return redirect(url_for("admin_page"))
        else:
            flash('Ekleme sirasinda bir hata olustu. Lutfen tekrar dene',
                  category='danger')
            return render_template('hekim.html', form=form)
    else:
        flash('Ekleme sirasinda bir hata olustu. Lutfen tekrar dene',
                  category='danger')
        return render_template('hekim.html', form=form)
    

@app.route('/admin/stajyer', methods=['GET', 'POST'])
@login_required
def stajyer_page():
    # Stajyer formunu göster
    form = StajyerForm()  # Stajyer eklemek için bir form oluşturduğunuzu varsayıyorum.
    if form.validate_on_submit():
        # Hekim ve Stajyer numaralarını kontrol ederek en büyük numarayı bul
        max_num_query = """
        SELECT MAX(num) FROM (
            SELECT num FROM hekim
            UNION
            SELECT num FROM stajyer
        ) AS combined
        """
        max_num_result = db.engine.execute(max_num_query).fetchone()
        new_stajyer_num = (int(max_num_result[0]) if max_num_result[0] is not None else 0) + 1

        # Yeni stajyeri ekle
        new_stajyer = Stajyer(
            isim=form.isim.data,
            soyisim=form.soyisim.data,
            email=form.email.data,
            sifre=form.sifre.data,
            num=new_stajyer_num
        )
        db.session.add(new_stajyer)
        db.session.commit()
        flash(f'Yeni Stajyer Eklendi: {new_stajyer.isim} {new_stajyer.soyisim}', category='success')
        return redirect(url_for('admin_page'))

    return render_template('stajyer.html', form=form)

@app.route('/admin/baglidir/add/<int:stajyer_no>', methods=['POST'])
@login_required
def baglidir_add(stajyer_no):
    if not isinstance(current_user, Hekim):
        flash('Bu işlemi yapmaya yetkiniz yok!', category='danger')
        return redirect(url_for('admin_page'))

    # Check if the stajyer is already linked to any hekim
    existing_link = BAGLIDIR.query.filter_by(StajyerNo=stajyer_no).first()
    if existing_link:
        # Check if the stajyer is linked to the current user
        if existing_link.HekimNo == current_user.num:
            flash('Bu stajyer zaten size bağlı.', category='warning')
        else:
            flash('Bu stajyer başka bir hekime bağlı.', category='danger')
        return redirect(url_for('admin_page'))

    # Add the relationship
    new_link = BAGLIDIR(HekimNo=current_user.num, StajyerNo=stajyer_no)
    db.session.add(new_link)
    db.session.commit()
    flash('Stajyer başarıyla hekime bağlandı!', category='success')
    return redirect(url_for('admin_page'))





@app.route('/admin/baglidir/remove/<int:hekim_no>', methods=['POST'])
@login_required
def baglidir_remove(hekim_no):
    if not isinstance(current_user, Stajyer):
        flash('Bu işlemi yapmaya yetkiniz yok!', category='danger')
        return redirect(url_for('admin_page'))

    # Check if the relationship exists
    linked_entry = BAGLIDIR.query.filter_by(HekimNo=hekim_no, StajerNo=current_user.num).first()
    if linked_entry:
        db.session.delete(linked_entry)
        db.session.commit()
        flash('Hekimden başarıyla ayrıldınız!', category='success')
    else:
        flash('Bu hekime zaten bağlı değilsiniz!', category='danger')
    return redirect(url_for('admin_page'))




