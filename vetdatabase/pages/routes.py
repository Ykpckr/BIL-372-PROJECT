from datetime import datetime, date
from pages import app
from flask import render_template, redirect, url_for, flash
from flask import request
from pages.models import Sahip, Hekim , Randevu, Ameliyat, Hayvan, Stajyer, BAGLIDIR, RECETE, TIBBI_GECMIS
from pages.forms import HekimLoginForm, RegisterForm, LoginForm, AnimalForm, AppointmentForm, HekimForm, AmeliyatForm, StajyerForm, ReceteForm, SonucYazForm
from pages import db
from flask_login import login_user, logout_user, login_required
from flask_login import current_user
import time
import json


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
        for randevu in randevular:
            hayvan = Hayvan.query.filter_by(hnum=randevu.hayvan_no).first()
            hekim = Hekim.query.filter_by(num=randevu.hekim_no).first()
            randevu.hayvan_adi = hayvan.isim if hayvan else "Bilinmiyor"
            randevu.hekim_adi = f"{hekim.isim} {hekim.soyisim}" if hekim else "Bilinmiyor"
        return render_template('randevu_stajyer.html', randevular=randevular)
    elif isinstance(current_user, Hekim):
        # Hekim sees their own randevus
        randevular = Randevu.query.filter_by(hekim_no=current_user.num).all()
        for randevu in randevular:
            randevu.receteler = RECETE.query.filter_by(hayvan_no=randevu.hayvan_no, status='pending').all()
            hayvan = Hayvan.query.filter_by(hnum=randevu.hayvan_no).first()
            randevu.hayvan_adi = hayvan.isim if hayvan else "Bilinmiyor"
        return render_template('randevu_hekim.html', randevular=randevular)
    else:
        # Default behavior for other users
        hayvanlar = Hayvan.query.filter_by(sahip_tc=current_user.tc).all()
        return render_template('randevu.html', hayvanlar=hayvanlar)
    
@app.route('/randevu/durumu', methods=['GET'])
@login_required
def randevu_durumu():
    # Fetch hayvanlar associated with the current user
    hayvanlar = Hayvan.query.filter_by(sahip_tc=current_user.tc).all()
    hayvan_nos = [hayvan.hnum for hayvan in hayvanlar]

    # Handle cases where hayvan_nos might be empty
    if not hayvan_nos:
        hayvan_nos = [-1]  # Use a placeholder value to prevent SQL errors

    # Fetch related ameliyatlar and receteler
    ameliyatlar = Ameliyat.query.filter(Ameliyat.hayvan_no.in_(hayvan_nos)).all()
    receteler = RECETE.query.filter(RECETE.hayvan_no.in_(hayvan_nos), RECETE.status == 'accepted').all()
    tibbi_gecmisler = TIBBI_GECMIS.query.filter(TIBBI_GECMIS.hayvan_no.in_(hayvan_nos)).all()

    for ameliyat in ameliyatlar:
        hayvan = Hayvan.query.filter_by(hnum=ameliyat.hayvan_no).first()
        hekim = Hekim.query.filter_by(num=ameliyat.hekim_no).first()
        ameliyat.hayvan_adi = hayvan.isim if hayvan else "Bilinmiyor"
        ameliyat.hekim_adi = hekim.isim if hekim else "Bilinmiyor"
        ameliyat.hekim_soyisim = hekim.soyisim if hekim else "Bilinmiyor"

    for recete in receteler:
        hayvan = Hayvan.query.filter_by(hnum=recete.hayvan_no).first()
        hekim = Hekim.query.filter_by(num=recete.hekim_no).first()
        recete.hayvan_adi = hayvan.isim if hayvan else "Bilinmiyor"
        recete.hekim_adi = hekim.isim if hekim else "Bilinmiyor"
        recete.hekim_soyisim = hekim.soyisim if hekim else "Bilinmiyor"

    for tibbi in tibbi_gecmisler:
        hayvan = Hayvan.query.filter_by(hnum=tibbi.hayvan_no).first()
        tibbi.hayvan_adi = hayvan.isim if hayvan else "Bilinmiyor"
    

    # Render the template with fetched data
    return render_template('randevu_durumu.html', ameliyatlar=ameliyatlar, receteler=receteler , tibbi_gecmisler=tibbi_gecmisler)




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
            flash('Ekleme sırasında bir hata oluştu. Lütfen tekrar deneyin.', category='danger')
    elif request.method == 'POST':
        flash('Ekleme sırasında bir hata oluştu. Lütfen tekrar deneyin.', category='danger')
    return render_template('hayvan.html', form=form)    

@app.route('/randevu/al', methods=['GET', 'POST'])
@login_required
def randevu_page():
    form = AppointmentForm()
    
    # Kullanıcının hayvanlarını ve hekimleri al
    hayvanlar = Hayvan.query.filter_by(sahip_tc=current_user.tc).all()
    hekimler = Hekim.query.all()

    # Dropdown menüler için seçenekleri doldur
    form.hayvanlar.choices = [(str(hayvan.hnum), hayvan.isim) for hayvan in hayvanlar]
    form.hekimler.choices = [(str(hekim.num), f"{hekim.isim} {hekim.soyisim}") for hekim in hekimler]

    if form.validate_on_submit():
        # Formdan gelen verilerle randevuyu oluştur
        insert = f"INSERT INTO randevu (tarih, saat, hayvan_no, hekim_no) VALUES ('{form.tarih.data}', '{form.saat.data}', '{form.hayvanlar.data}', '{form.hekimler.data}')"
        db.engine.execute(insert)
        db.session.commit()
        flash('Randevu başarıyla alındı!', category='success')
        return redirect(url_for("market_page"))

    return render_template('al.html', form=form)


@app.route('/randevu/eski')
@login_required
def eski_page():
    # Sadece mevcut sahibin randevularını getir
    randevular = Randevu.query.join(Hayvan).filter(Hayvan.sahip_tc == current_user.tc).all()

    # Hayvan ve Hekim adlarını ekle
    for randevu in randevular:
        randevu.hayvan_adi = Hayvan.query.filter_by(hnum=randevu.hayvan_no).first().isim
        randevu.hekim_adi = Hekim.query.filter_by(num=randevu.hekim_no).first().isim
        randevu.hekim_soyisim = Hekim.query.filter_by(num=randevu.hekim_no).first().soyisim

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
        print(attempted_stajyer)
        print(attempted_stajyer.sifre)
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

    # Kullanıcının rolünü belirle
    if isinstance(current_user, Stajyer):
        user_role = 'stajyer'

        # Stajyerin bağlı olduğu hekimin numarasını bul
        linked_hekim = db.session.query(BAGLIDIR).filter_by(StajerNo=current_user.num).first()
        linked_hekim_no = linked_hekim.HekimNo if linked_hekim else None
        print(linked_hekim_no)
    elif isinstance(current_user, Hekim):
        user_role = 'hekim'

        # Hekime bağlı olmayan stajyerleri bul
        linked_stajyer_nos = [relation.StajerNo for relation in BAGLIDIR.query.all()]
        unlinked_stajyers = [stajyer.num for stajyer in stajyers if stajyer.num not in linked_stajyer_nos]
    else:
        user_role = 'other'
        linked_hekim_no = None
        unlinked_stajyers = []

    # Template'e gerekli verileri gönder
    return render_template(
        'admin.html',
        user_role=user_role,
        hekimler=hekims,
        stajyers=stajyers,
        linked_hekim_no=linked_hekim_no if user_role == 'stajyer' else None,
        unlinked_stajyers=unlinked_stajyers if user_role == 'hekim' else None
    )



@app.route('/admin/hekim', methods=['GET', 'POST'])
@login_required
def hekim_page():
    form = HekimForm()
    if form.validate_on_submit():
        # Maksimum numarayı bul ve yeni numarayı oluştur
        max_num_query = """
        SELECT MAX(num) FROM (
            SELECT num FROM hekim
            UNION
            SELECT num FROM stajyer
        ) AS combined
        """
        max_num_result = db.engine.execute(max_num_query).fetchone()
        new_hekim_num = (int(max_num_result[0]) if max_num_result[0] is not None else 0) + 1

        # Yeni hekimin bilgilerini ekle
        insert = """
        INSERT INTO hekim (isim, soyisim, email, sifre, num) 
        VALUES ('{isim}', '{soyisim}', '{email}', '{sifre}', {num})
        """.format(
            isim=form.isim.data,
            soyisim=form.soyisim.data,
            email=form.email.data,
            sifre=form.sifre.data,
            num=new_hekim_num
        )

        try:
            db.engine.execute(insert)
            db.session.commit()
            flash('Hekim başarıyla eklendi.', category='success')
            return redirect(url_for("admin_page"))
        except Exception as e:
            db.session.rollback()
            flash(f'Ekleme sırasında bir hata oluştu: {str(e)}', category='danger')

    elif request.method == 'POST':
        flash('Form doğrulama hatası: {}'.format(form.errors), category='danger')

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
    existing_link = BAGLIDIR.query.filter_by(StajerNo=stajyer_no).first()
    if existing_link:
        # Check if the stajyer is linked to the current user
        if existing_link.HekimNo == current_user.num:
            flash('Bu stajyer zaten size bağlı.', category='warning')
        else:
            flash('Bu stajyer başka bir hekime bağlı.', category='danger')
        return redirect(url_for('admin_page'))

    # Add the relationship
    new_link = BAGLIDIR(HekimNo=current_user.num, StajerNo=stajyer_no)
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



@app.route('/recete/ekle/<int:hayvan_no>/<int:hekim_no>/<string:tarih>/<string:saat>', methods=['GET', 'POST'])
@login_required
def recete_ekle(hayvan_no, hekim_no, tarih, saat):
    # Convert string parameters back to the appropriate types if needed
    randevu_tarih = datetime.strptime(tarih, "%Y-%m-%d").date()
    
    # Fetch the Randevu based on these details
    randevu = Randevu.query.filter_by(
        hayvan_no=hayvan_no,
        hekim_no=hekim_no,
        tarih=randevu_tarih,
        saat=saat
    ).first_or_404()
    
    if request.method == 'POST':
        # Extract prescription details
        medications = request.form.get('medications')
        try:
            medications_data = json.loads(medications)
        except json.JSONDecodeError:
            flash('Lütfen geçerli bir JSON formatı girin.', category='danger')
            return render_template('recete_ekle.html', randevu=randevu)
        
        # Add a new prescription
        new_recete = RECETE(
            tarih = randevu_tarih,
            hayvan_no=hayvan_no,
            hekim_no=hekim_no,
            medications=medications_data,
            status='accepted'
        )
        db.session.add(new_recete)
        db.session.commit()
        flash('Reçete başarıyla eklendi!', category='success')
        return redirect(url_for('market_page'))
    
    return render_template('recete_ekle.html', randevu=randevu)



@app.route('/recete_ekle_stajyer/<int:hayvan_no>/<int:hekim_no>', methods=['GET', 'POST'])
@login_required
def recete_ekle_stajyer(hayvan_no, hekim_no):
    # Fetch the randevu
    randevu = Randevu.query.filter_by(hayvan_no=hayvan_no, hekim_no=hekim_no).first()
    if not randevu:
        flash('Randevu bulunamadı.', category='danger')
        return redirect(url_for('market_page'))

    if request.method == 'POST':
        # Extract prescription details
        medications = request.form.get('medications')
        try:
            medications_data = json.loads(medications)
        except json.JSONDecodeError:
            flash('Lütfen geçerli bir JSON formatı girin. Örnek: {"Parol": "500mg", "Augmentin": "1g"}', category='danger')
            return render_template('recete_form.html', randevu=randevu, example_json='{"Parol": "500mg", "Augmentin": "1g"}')

        # Add a new prescription
        new_recete = RECETE(
            tarih=randevu.tarih,
            hayvan_no=hayvan_no,
            hekim_no=hekim_no,
            stajyer_no=current_user.num,
            medications=medications_data,
            status='pending'
        )
        db.session.add(new_recete)
        db.session.commit()
        flash('Reçete başarıyla eklendi ve beklemede.', category='success')
        return redirect(url_for('market_page'))

    # Render the form with an example JSON
    return render_template('recete_form.html', randevu=randevu, example_json='{"Parol": "500mg", "Augmentin": "1g"}')




@app.route('/recete_onay/<int:recete_id>', methods=['POST'])
@login_required
def recete_onay(recete_id):
    action = request.form.get('action')  # "approve" veya "reject"
    recete = RECETE.query.get_or_404(recete_id)

    # Sadece hekimler bu işlemi yapabilir
    if not isinstance(current_user, Hekim):
        flash('Bu işlemi yapma yetkiniz yok.', category='danger')
        return redirect(url_for('market_page'))

    if action == 'approve':
        recete.status = 'accepted'
        flash('Reçete kabul edildi.', category='success')
    elif action == 'reject':
        db.session.delete(recete)
        flash('Reçete reddedildi.', category='danger')
    else:
        flash('Geçersiz işlem.', category='warning')
    
    db.session.commit()
    return redirect(url_for('market_page'))




def is_stajyer_linked_to_hekim(stajyer_no, hekim_no):
    return BAGLIDIR.query.filter_by(StajerNo=stajyer_no, HekimNo=hekim_no).first() is not None


@app.route('/hayvan/<int:hayvan_no>', methods=['GET'])
@login_required
def hayvan_detay(hayvan_no):
    # Hayvan bilgilerini al
    hayvan = Hayvan.query.filter_by(hnum=hayvan_no).first()
    if not hayvan:
        flash("Hayvan bulunamadı.", category="danger")
        return redirect(url_for('eski_page'))

    sahip = Sahip.query.filter_by(tc=hayvan.sahip_tc).first()
    # Ameliyatlar ve reçeteler
    ameliyatlar = Ameliyat.query.filter_by(hayvan_no=hayvan_no).all()
    receteler = RECETE.query.filter_by(hayvan_no=hayvan_no, status='accepted').all()

    # Tıbbi geçmiş
    tibbi_gecmis = db.engine.execute(
        f"SELECT * FROM TIBBI_GECMIS WHERE hayvan_no = {hayvan_no}"
    ).fetchall()

    return render_template(
        'hayvan_detay.html',
        hayvan=hayvan,
        ameliyatlar=ameliyatlar,
        sahip=sahip,
        receteler=receteler,
        tibbi_gecmis=tibbi_gecmis
    )


@app.route('/sonuc_yaz/<int:hayvan_no>', methods=['GET', 'POST'])
@login_required
def sonuc_yaz(hayvan_no):
    form = SonucYazForm()
    if form.validate_on_submit():
        # Yeni tıbbi geçmiş kaydı ekleme
        new_record = TIBBI_GECMIS(
            hayvan_no=hayvan_no,
            diagnosis=form.diagnosis.data,
            treatment=form.treatment.data,
            visit_date=date.today()  # Bugünün tarihi otomatik eklenir
        )
        db.session.add(new_record)
        db.session.commit()
        flash('Tıbbi geçmişe yeni sonuç eklendi.', category='success')
        return redirect(url_for('market_page'))
    return render_template('sonuc_yaz.html', form=form, hayvan_no=hayvan_no)


@app.route('/randevu/guncelle/<int:id>', methods=['GET', 'POST'])
@login_required
def randevu_guncelle(id):
    randevu = Randevu.query.get_or_404(id)
    form = AppointmentForm()

    # Dropdown menüler için hayvanlar ve hekimler
    hayvanlar = Hayvan.query.filter_by(sahip_tc=current_user.tc).all()
    hekimler = Hekim.query.all()

    form.hayvanlar.choices = [(str(hayvan.hnum), hayvan.isim) for hayvan in hayvanlar]
    form.hekimler.choices = [(str(hekim.num), f"{hekim.isim} {hekim.soyisim}") for hekim in hekimler]

    if form.validate_on_submit():
        randevu.tarih = form.tarih.data
        randevu.saat = form.saat.data
        randevu.hayvan_no = int(form.hayvanlar.data)
        randevu.hekim_no = int(form.hekimler.data)
        db.session.commit()
        flash("Randevu başarıyla güncellendi!", category="success")
        return redirect(url_for('eski_page'))

    # Form varsayılan değerlerini doldur
    form.tarih.data = randevu.tarih
    form.saat.data = randevu.saat
    form.hayvanlar.data = str(randevu.hayvan_no)
    form.hekimler.data = str(randevu.hekim_no)

    return render_template('guncelle_randevu.html', form=form, randevu=randevu)



@app.route('/randevu/sil/<int:id>', methods=['POST'])
@login_required
def randevu_sil(id):
    randevu = Randevu.query.get_or_404(id)
    db.session.delete(randevu)
    db.session.commit()
    flash("Randevu başarıyla silindi!", category="success")
    return redirect(url_for('eski_page'))

@app.route('/admin/hekim/<int:hekim_id>/islem_guncelle', methods=['GET', 'POST'])
@login_required
def islem_guncelle(hekim_id):
    # Hekimi getir
    hekim = Hekim.query.get_or_404(hekim_id)
    
    # Hekimin yaptığı ameliyatları, reçeteleri ve sonuçları al
    ameliyatlar = Ameliyat.query.filter_by(hekim_no=hekim.num).all()
    receteler = RECETE.query.filter_by(hekim_no=hekim.num).all()
    sonuclar = TIBBI_GECMIS.query.filter_by().all()  # TIBBI_GECMIS uygun filtre ekleyin

    return render_template('islem_guncelle.html', hekim=hekim, ameliyatlar=ameliyatlar, receteler=receteler, sonuclar=sonuclar)

@app.route('/ameliyat/<int:ameliyat_id>/guncelle', methods=['GET', 'POST'])
@login_required
def ameliyat_guncelle(ameliyat_id):
    ameliyat = Ameliyat.query.get_or_404(ameliyat_id)

    if request.method == 'POST':
        ameliyat.tarih = request.form.get('tarih')
        ameliyat.saat = request.form.get('saat')
        ameliyat.aciklama = request.form.get('description')
        db.session.commit()
        flash('Ameliyat başarıyla güncellendi.', category='success')
        return redirect(url_for('islem_guncelle', hekim_id=ameliyat.hekim_no))

    return render_template('ameliyat_guncelle.html', ameliyat=ameliyat)

@app.route('/ameliyat/<int:ameliyat_id>/sil', methods=['POST'])
@login_required
def ameliyat_sil(ameliyat_id):
    ameliyat = Ameliyat.query.get_or_404(ameliyat_id)
    db.session.delete(ameliyat)
    db.session.commit()
    flash('Ameliyat başarıyla silindi.', category='success')
    return redirect(url_for('islem_guncelle', hekim_id=ameliyat.hekim_no))


@app.route('/recete/<int:recete_id>/guncelle', methods=['GET', 'POST'])
@login_required
def recete_guncelle(recete_id):
    recete = RECETE.query.get_or_404(recete_id)

    # Kullanıcının rolünü belirle
    if isinstance(current_user, Stajyer):
        user_role = 'stajyer'
    elif isinstance(current_user, Hekim):
        user_role = 'hekim'
    else:
        user_role = None

    if request.method == 'POST':
        recete.tarih = request.form.get('tarih')
        medications = request.form.get('medications')
        try:
            recete.medications = json.loads(medications)
        except json.JSONDecodeError:
            flash('Lütfen geçerli bir JSON formatı girin. Örnek: {"Parol": "500mg", "Augmentin": "1g"}', category='danger')
            return render_template('recete_guncelle.html', recete=recete)

        db.session.commit()
        flash('Reçete başarıyla güncellendi.', category='success')

        # Kullanıcının rolüne göre yönlendirme
        if user_role == 'stajyer':
            return redirect(url_for('stajyer_islem_guncelle', stajyer_id=current_user.num))
        elif user_role == 'hekim':
            return redirect(url_for('islem_guncelle', hekim_id=recete.hekim_no))

    return render_template('recete_guncelle.html', recete=recete)


@app.route('/recete/<int:recete_id>/sil', methods=['POST'])
@login_required
def recete_sil(recete_id):
    if isinstance(current_user, Stajyer):
        user_role = 'stajyer'
    elif isinstance(current_user, Hekim):
        user_role = 'hekim'
    else:
        user_role = None
    recete = RECETE.query.get_or_404(recete_id)
    
    # Kullanıcının stajyer olup olmadığını kontrol et
    if user_role == 'stajyer':  # Role kontrolü için varsayılan bir sütun 'role' örnek olarak alınmıştır
        redirect_url = url_for('stajyer_islem_guncelle', stajyer_id=current_user.num)
    else:
        redirect_url = url_for('islem_guncelle', hekim_id=recete.hekim_no)
    
    db.session.delete(recete)
    db.session.commit()
    flash('Reçete başarıyla silindi.', category='success')
    return redirect(redirect_url)



@app.route('/sonuc/<int:sonuc_id>/guncelle', methods=['GET', 'POST'])
@login_required
def sonuc_guncelle(sonuc_id):
    sonuc = TIBBI_GECMIS.query.get_or_404(sonuc_id)

    if request.method == 'POST':
        sonuc.visit_date = request.form.get('visit_date')
        sonuc.diagnosis = request.form.get('diagnosis')
        sonuc.treatment = request.form.get('treatment')
        db.session.commit()
        flash('Sonuç başarıyla güncellendi.', category='success')
        return redirect(url_for('islem_guncelle', hekim_id=current_user.num))

    return render_template('sonuc_guncelle.html', sonuc=sonuc)



@app.route('/sonuc/<int:sonuc_id>/sil', methods=['POST'])
@login_required
def sonuc_sil(sonuc_id):
    sonuc = TIBBI_GECMIS.query.get_or_404(sonuc_id)
    db.session.delete(sonuc)
    db.session.commit()
    flash('Sonuç başarıyla silindi.', category='success')
    return redirect(url_for('islem_guncelle', hekim_id=current_user.num))


@app.route('/admin/stajyer_islem_guncelle/<int:stajyer_id>', methods=['GET', 'POST'])
@login_required
def stajyer_islem_guncelle(stajyer_id):
    # İlgili stajyerin reçetelerini getir
    receteler = RECETE.query.filter_by(stajyer_no=stajyer_id, status='pending').all()
    
    return render_template('stajyer_islem_guncelle.html', receteler=receteler)
