from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField, DateField, SelectField, IntegerField, TimeField
from wtforms.validators import Length, EqualTo, Email, DataRequired, ValidationError
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

    tc = StringField(label='TC Kimlik Numaraniz: ', validators=[Length(min=12), DataRequired()])
    fname = StringField(label = "Isminiz: ", validators=[DataRequired()])
    lname = StringField(label = "Soyisminiz: ", validators=[DataRequired()])
    email_address = StringField(label='Email Adresiniz:', validators=[Email(), DataRequired()])
    password1 = PasswordField(label='Sifre:', validators=[Length(min=6), DataRequired()])
    password2 = PasswordField(label='Sifre Tekrar:', validators=[EqualTo('password1'), DataRequired()])
    submit = SubmitField(label='Hesap Olustur')


class LoginForm(FlaskForm):
    email_address = StringField(label='Email:', validators=[DataRequired()])
    password = PasswordField(label='Sifre:', validators=[DataRequired()])
    submit = SubmitField(label='Giris')
    
class AnimalForm(FlaskForm):
    name = StringField(label="Adi:", validators=[DataRequired()])
    tur = StringField(label="Tur:", validators=[DataRequired()])
    yas = IntegerField(label="Yas",validators=[DataRequired()])    
    submit = SubmitField(label='Hayvan Ekle')
    
class AppointmentForm(FlaskForm):
    tarih = DateField(label="Tarih&Saat:", validators=[DataRequired()])
    saat = StringField(label="Saat:", validators=[DataRequired()])
    hayvanlar = StringField(label="Hayvanlar", validators=[DataRequired()])
    hekimler = StringField(label="Hekimler", validators=[DataRequired()])
    submit = SubmitField(label='Randevu Ekle')   
    
class HekimForm(FlaskForm):
    isim = StringField(label='Isim:',validators=[DataRequired()])
    soyisim = StringField(label='Soyisim:',validators=[DataRequired()])
    email = StringField(label='Email Adresiniz:', validators=[Email(), DataRequired()])
    sifre = PasswordField(label='Sifre:',validators=[DataRequired()])
    sifre2 = PasswordField(label='Sifre Tekrar:', validators=[EqualTo('sifre2'), DataRequired()])
    num = StringField(label='ID:',validators=[DataRequired()])
    submit = SubmitField(label='Hekim Ekle')

class HekimLoginForm(FlaskForm):
    email = StringField(label='Email:', validators=[DataRequired(), Email()])
    password = PasswordField(label='Sifre:', validators=[DataRequired()])
    submit = SubmitField(label='Hekim Giris')

class AmeliyatForm(FlaskForm):
    tarih = DateField('Tarih', validators=[DataRequired()])
    saat = TimeField('Saat', validators=[DataRequired()])
    aciklama = StringField('Açıklama', validators=[DataRequired()])
    submit = SubmitField('Ameliyat Ekle')

class StajyerForm(FlaskForm):
    isim = StringField(label='İsim', validators=[DataRequired(), Length(max=10)])
    soyisim = StringField(label='Soyisim', validators=[DataRequired(), Length(max=12)])
    email = StringField(label='Email', validators=[DataRequired(), Email(), Length(max=20)])
    sifre = PasswordField(label='Şifre', validators=[DataRequired(), Length(min=4, max=20)])
    submit = SubmitField(label='Stajyer Ekle')

