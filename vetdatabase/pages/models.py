from pages import db, login_manager
from pages import bcrypt
from pages import db
from flask_login import UserMixin
from flask_login import current_user
from sqlalchemy import Time


@login_manager.user_loader
def load_user(user_id):
    user = Hekim.query.filter_by(num=user_id).first()
    if not user:
        user = Stajyer.query.filter_by(num=user_id).first()
    if not user:
        user = Sahip.query.filter_by(email_address=user_id).first()
    return user

class Hekim(db.Model, UserMixin): 
    __tablename__ = 'hekim'
    isim = db.Column(db.String(length=10),nullable = False)
    soyisim = db.Column(db.String(length=12),nullable= False)
    email = db.Column(db.String(length = 20),unique=True)
    sifre = db.Column(db.String(length= 15),nullable = False)
    num = db.Column(db.String(length=12), primary_key = True)
    appo = db.relationship('Hayvan',secondary='randevu',back_populates="appo")

    def __init__(self,isim,soyisim,email,password,num):
        self.isim = isim
        self.soyisim = soyisim
        self.email = email
        self.password = password
        self.num = num


    def get_id(self):
        # Use 'num' as the identifier
        return self.num
    
    def isAdmin(self):
        return True
    
      
    def hekim_query():
        return Hekim.query
    
class Sahip(db.Model,UserMixin):
    __tablename__ = 'sahip'
    tc = db.Column(db.String(length = 12), primary_key = True)
    isim = db.Column(db.String(length = 12),nullable=False)
    soyisim = db.Column(db.String(length= 12),nullable = False)
    email_address = db.Column(db.String(length = 20), nullable = False, unique = True)
    password_hash = db.Column(db.String(length = 20),nullable = False)
    hayvan = db.relationship('Hayvan',backref = 'sahip',lazy=True)
    
    def __init__(self,tc,isim,soyisim,email_address,password_hash):
        self.tc = tc
        self.isim = isim
        self.soyisim = soyisim
        self.email_address = email_address
        self.password_hash = password_hash
    
    @property
    def password(self):
        return self.password
    
    def get_id(self):
        return str(self.email_address)
    
    def get_tc(self):
        return str(self.tc)
    
    def isAdmin(self):
        if self.tc == '000000000000':
            return True
        return False
    
    @password.setter
    def password(self, plain_text_password):
        self.password_hash = bcrypt.generate_password_hash(plain_text_password).decode('utf-8')  
              
    def check_password_correction(self, attempted_password):
        if (self.password_hash == attempted_password):
            return True
        return False
    
class Hayvan(db.Model,UserMixin):
    __tablename__ = 'hayvan'
    hnum = db.Column(db.String(length=12),primary_key = True)
    sahip_tc = db.Column(db.String(length=12), db.ForeignKey('sahip.tc'))
    isim = db.Column(db.String(length=15),nullable= False)
    tur = db.Column(db.String(length=15), nullable= False)
    yas = db.Column(db.Integer)
    appo = db.relationship('Hekim',secondary='randevu',back_populates="appo")

    def __init__(self,hnum,sahip_tc,isim,tur,yas):
        self.hnum = hnum
        self.sahip_tc = sahip_tc
        self.isim = isim
        self.tur = tur
        self.yas = yas
    
    def __repr__(self):
        return '{}'.format(self.isim)

class Randevu(db.Model,UserMixin):
    __tablename__ = 'randevu'
    tarih = db.Column(db.Date,nullable = False)
    saat = db.Column(db.String(length=5),nullable=False)
    hayvan_no = db.Column(db.String(length=12),db.ForeignKey('hayvan.hnum'),primary_key = True)
    hekim_no = db.Column(db.String(length=12), db.ForeignKey('hekim.num') ,primary_key = True)
    
    



class Ameliyat(db.Model):
    __tablename__ = 'ameliyat'
    tarih = db.Column(db.Date, nullable=False, primary_key=True)
    saat = db.Column(Time, nullable=False, primary_key=True)
    hayvan_no = db.Column(db.Integer, nullable=False, primary_key=True)
    hekim_no = db.Column(db.Integer, nullable=False, primary_key=True)
    aciklama = db.Column(db.String(255), nullable=True)



class Stajyer(db.Model, UserMixin):
    __tablename__ = 'stajyer'
    num = db.Column(db.Integer, primary_key=True)
    isim = db.Column(db.String(10), nullable=False)
    soyisim = db.Column(db.String(12), nullable=False)
    email = db.Column(db.String(20), unique=True, nullable=False)
    sifre = db.Column(db.String(20), nullable=False)

    def get_id(self):
        return self.num
    
    def isAdmin(self):
        return True
    
class BAGLIDIR(db.Model):
    __tablename__ = 'baglidir'
    HekimNo = db.Column(db.Integer, db.ForeignKey('hekim.num', ondelete='CASCADE', onupdate='CASCADE'), primary_key=True)
    StajerNo = db.Column(db.Integer, db.ForeignKey('stajyer.num', ondelete='CASCADE', onupdate='CASCADE'), primary_key=True)

    # Relationships (optional)
    hekim = db.relationship('Hekim', backref='stajyer_baglantilari', lazy=True)
    stajyer = db.relationship('Stajyer', backref='hekim_baglantilari', lazy=True)



    