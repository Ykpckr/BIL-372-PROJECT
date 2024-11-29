from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField, DateField, SelectField, IntegerField, TimeField, TextAreaField
from wtforms.validators import Length, EqualTo, Email, DataRequired, ValidationError, NumberRange
from pages.models import Sahip, Hayvan, Hekim
from flask_login import current_user


class RegisterForm(FlaskForm):
    def validate_username(self, username_to_check):
        user = Sahip.query.filter_by(username=username_to_check.data).first()
        if user:
            raise ValidationError('Username already exists! Please try a different username')

    def validate_email_address(self, email_address_to_check):
        email_address = Sahip.query.filter_by(email_address=email_address_to_check.data).first()
        if email_address:
            raise ValidationError('Daha once bu mail adresiyle kayit olmus bir kullanici var! Lutfen baska bir email giriniz!')
        
    
    def validate_tc(form, field):
        """TC kimlik numarasının uzunluğunu ve int olmasını kontrol eder."""
        if not field.data.isdigit() or len(field.data) != 11:
            raise ValidationError('TC Kimlik Numarası 11 basamaklı bir sayı olmalıdır.')


    def validate_name(form, field):
        """İsim ve soyisim için harflerden oluşup oluşmadığını kontrol eder."""
        if not field.data.isalpha():
            raise ValidationError('Bu alan sadece harflerden oluşmalıdır.')

class RegisterForm(FlaskForm):
    tc = StringField(label='TC Kimlik Numaraniz: ', validators=[Length(min=11, max=11, message="TC Kimlik Numarası 11 karakter olmalıdır."), DataRequired()])
    fname = StringField(label="Isminiz: ", validators=[DataRequired(message="İsim zorunludur."), Length(min=2, max=50, message="İsim en az 2, en fazla 50 karakter olmalıdır.")])
    lname = StringField(label="Soyisminiz: ", validators=[DataRequired(message="Soyisim zorunludur."), Length(min=2, max=50, message="Soyisim en az 2, en fazla 50 karakter olmalıdır.")])
    email_address = StringField(label='Email Adresiniz:', validators=[Email(message="Geçerli bir email adresi giriniz."), DataRequired(message="Email adresi zorunludur.")])
    password1 = PasswordField(label='Sifre:', validators=[Length(min=6, message="Şifre en az 6 karakter olmalıdır."), DataRequired(message="Şifre zorunludur.")])
    password2 = PasswordField(label='Sifre Tekrar:', validators=[EqualTo('password1', message="Şifreler eşleşmelidir."), DataRequired(message="Şifre tekrarı zorunludur.")])
    submit = SubmitField(label='Hesap Olustur')



class LoginForm(FlaskForm):
    email_address = StringField(label='Email:', validators=[DataRequired()])
    password = PasswordField(label='Sifre:', validators=[DataRequired()])
    submit = SubmitField(label='Giris')
    
class AnimalForm(FlaskForm):
    name = StringField(label="Adı: ", validators=[DataRequired(message="İsim zorunludur."), Length(min=2, max=50, message="İsim en az 2, en fazla 50 karakter olmalıdır.")])
    tur = SelectField(label="Tür:", validators=[DataRequired()], choices=[
    ("Kedi", "Kedi"), ("Köpek", "Köpek"), ("At", "At"), ("Fil", "Fil"),
    ("Kaplan", "Kaplan"), ("Aslan", "Aslan"), ("Zürafa", "Zürafa"),
    ("Penguen", "Penguen"), ("Yunus", "Yunus"), ("Tavşan", "Tavşan"),
    ("Tavuk", "Tavuk"), ("Ördek", "Ördek"), ("Kaz", "Kaz"),
    ("Serçe", "Serçe"), ("Papağan", "Papağan"), ("Akbaba", "Akbaba"),
    ("Kartal", "Kartal"), ("Şahin", "Şahin"), ("Baykuş", "Baykuş"),
    ("Deve", "Deve"), ("Tilki", "Tilki"), ("Kurt", "Kurt"),
    ("Koyun", "Koyun"), ("Keçi", "Keçi"), ("İnek", "İnek"),
    ("Domuz", "Domuz"), ("Timsah", "Timsah"), ("Kurbağa", "Kurbağa"),
    ("Kaplumbağa", "Kaplumbağa"), ("Kertenkele", "Kertenkele"),
    ("Yılan", "Yılan"), ("Balık", "Balık"), ("Köpekbalığı", "Köpekbalığı"),
    ("Ahtapot", "Ahtapot"), ("Kalamar", "Kalamar"), ("Karides", "Karides"),
    ("Yengeç", "Yengeç"), ("Istakoz", "Istakoz"), ("Denizatı", "Denizatı"),
    ("Denizanası", "Denizanası"), ("Fare", "Fare"), ("Sıçan", "Sıçan"),
    ("Sincap", "Sincap"), ("Kirpi", "Kirpi"), ("Yarasa", "Yarasa"),
    ("Koala", "Koala"), ("Kanguru", "Kanguru"), ("Ayı", "Ayı"),
    ("Panda", "Panda"), ("Leopar", "Leopar"), ("Çita", "Çita"),
    ("Orangutan", "Orangutan"), ("Goril", "Goril"), ("Şempanze", "Şempanze"),
    ("Karga", "Karga"), ("Martı", "Martı"), ("Leylek", "Leylek"),
    ("Flamingo", "Flamingo"), ("Sığırcık", "Sığırcık"),
    ("Yusufçuk", "Yusufçuk"), ("Kelebek", "Kelebek"),
    ("Arı", "Arı"), ("Karınca", "Karınca"), ("Çekirge", "Çekirge"),
    ("Akrep", "Akrep"), ("Örümcek", "Örümcek"), ("Böcek", "Böcek"),
    ("Kurtçuk", "Kurtçuk"), ("Solucan", "Solucan"),
    ("Yusufcuk", "Yusufcuk"), ("Horoz", "Horoz"), ("Hindi", "Hindi"),
    ("Mandıra Balığı", "Mandıra Balığı"), ("Turna", "Turna"),
    ("Somon", "Somon"), ("Ton Balığı", "Ton Balığı"),
    ("Alabalık", "Alabalık"), ("Mezgit", "Mezgit"),
    ("Barbun", "Barbun"), ("Levrek", "Levrek"), ("Çipura", "Çipura"),
    ("Hamsi", "Hamsi"), ("Sardalya", "Sardalya"),
    ("Orfoz", "Orfoz"), ("Palamut", "Palamut"),
    ("Karabatak", "Karabatak"), ("Angut", "Angut"),
    ("Albatros", "Albatros"), ("Kanarya", "Kanarya"),
    ("Fok", "Fok"), ("Kunduz", "Kunduz"), ("Tavuskuşu", "Tavuskuşu"),
    ("Sülün", "Sülün"), ("Bıldırcın", "Bıldırcın"),
    ("Geyik", "Geyik"), ("Ceylan", "Ceylan"), ("Antilop", "Antilop"), ("Diger", "Diger")
]
)
    yas = IntegerField(label="Yas:", validators=[DataRequired(message="Yaş zorunludur."), NumberRange(min=0, max=300, message="Yaş en az 0, en fazla 300 olabilir.")])
    submit = SubmitField(label="Hayvan Ekle")
    
class AppointmentForm(FlaskForm):
    tarih = DateField(label="Tarih:", validators=[DataRequired()])
    saat = SelectField(label="Saat:", validators=[DataRequired()], choices=[
        ('09:00', '09:00'), ('10:00', '10:00'), ('11:00', '11:00'),
        ('12:00', '12:00'), ('13:00', '13:00'), ('14:00', '14:00'),
        ('15:00', '15:00'), ('16:00', '16:00'), ('17:00', '17:00')
    ])
    hayvanlar = SelectField(label="Hayvanlar", validators=[DataRequired()], choices=[])  # Dinamik doldurulacak
    hekimler = SelectField(label="Hekimler", validators=[DataRequired()], choices=[])  # Dinamik doldurulacak
    submit = SubmitField(label='Randevu Ekle')
  
    
class HekimForm(FlaskForm):
    isim = StringField(label="Isim: ", validators=[DataRequired(message="İsim zorunludur."), Length(min=2, max=50, message="İsim en az 2, en fazla 50 karakter olmalıdır.")])
    soyisim = StringField(label="Soyisim: ", validators=[DataRequired(message="Soyisim zorunludur."), Length(min=2, max=50, message="Soyisim en az 2, en fazla 50 karakter olmalıdır.")])
    email = StringField(label='Email:', validators=[Email(message="Geçerli bir email adresi giriniz."), DataRequired(message="Email adresi zorunludur.")])
    sifre = PasswordField(label='Sifre:', validators=[Length(min=6, message="Şifre en az 6 karakter olmalıdır."), DataRequired(message="Şifre zorunludur.")])
    sifre2 = PasswordField(label='Sifre Tekrar:', validators=[EqualTo('password1', message="Şifreler eşleşmelidir."), DataRequired(message="Şifre tekrarı zorunludur.")])
    submit = SubmitField(label='Hekim Ekle')

class HekimLoginForm(FlaskForm):
    email = StringField(label='Email:', validators=[DataRequired(), Email()])
    password = PasswordField(label='Sifre:', validators=[DataRequired()])
    submit = SubmitField(label='Hekim Giris')

class AmeliyatForm(FlaskForm):
    tarih = DateField('Tarih', validators=[DataRequired()])
    saat = SelectField(label="Saat:", validators=[DataRequired()], choices=[
        ('09:00', '09:00'), ('10:00', '10:00'), ('11:00', '11:00'),
        ('12:00', '12:00'), ('13:00', '13:00'), ('14:00', '14:00'),
        ('15:00', '15:00'), ('16:00', '16:00'), ('17:00', '17:00')
    ])
    aciklama = StringField('Açıklama', validators=[DataRequired()])
    submit = SubmitField('Ameliyat Ekle')

class StajyerForm(FlaskForm):
    isim = StringField(label="Isim: ", validators=[DataRequired(message="İsim zorunludur."), Length(min=2, max=50, message="İsim en az 2, en fazla 50 karakter olmalıdır.")])
    soyisim = StringField(label="Soyisim: ", validators=[DataRequired(message="Soyisim zorunludur."), Length(min=2, max=50, message="Soyisim en az 2, en fazla 50 karakter olmalıdır.")])
    email = StringField(label='Email:', validators=[Email(message="Geçerli bir email adresi giriniz."), DataRequired(message="Email adresi zorunludur.")])
    sifre = PasswordField(label='Sifre:', validators=[Length(min=6, message="Şifre en az 6 karakter olmalıdır."), DataRequired(message="Şifre zorunludur.")])
    sifre2 = PasswordField(label='Sifre Tekrar:', validators=[EqualTo('password1', message="Şifreler eşleşmelidir."), DataRequired(message="Şifre tekrarı zorunludur.")])
    submit = SubmitField(label='Stajyer Ekle')

class ReceteForm(FlaskForm):
    medications = TextAreaField('Medications (JSON format)', validators=[DataRequired()])
    submit = SubmitField('Submit Prescription')

class SonucYazForm(FlaskForm):
    diagnosis = TextAreaField(label='Teşhis:', validators=[DataRequired()])
    treatment = TextAreaField(label='Tedavi:', validators=[DataRequired()])
    submit = SubmitField(label='Sonuç Ekle')
