CREATE TABLE HEKIM(
	isim varchar(10) NOT NULL,
	soyisim varchar(12) NOT NULL,
	email varchar(20) UNIQUE,
	sifre varchar(20) NOT NULL,
	num varchar(12) NOT NULL,
	Primary key(num)
);

CREATE TABLE STAJER(
	isim varchar(10) NOT NULL,
	soyisim varchar(12) NOT NULL,
	email varchar(20) UNIQUE,
	sifre varchar(20) NOT NULL,
	num varchar(12) NOT NULL,
	Primary key(num)
);

CREATE TABLE SAHIP(
	TC varchar(12) NOT NULL,
	isim varchar(15) NOT NULL,
	soyisim varchar(15) NOT NULL,
	email_address varchar(20) UNIQUE,
	password_hash varchar(20) NOT NULL,
	Primary key(TC)
);

CREATE TABLE HAYVAN(
	hnum int NOT NULL,
	sahip_tc varchar(12) NOT NULL,
	isim varchar(15) NOT NULL,
	tur varchar(15),
	yas int,
	Primary key(hnum),
	Foreign key(sahip_tc) REFERENCES SAHIP(TC) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE BAGLIDIR(
	HekimNo varchar(12) NOT NULL,
	StajerNo varchar(12) NOT NULL,
	Foreign key(HekimNo) REFERENCES HEKIM(num) ON DELETE CASCADE ON UPDATE CASCADE,
	Foreign key(StajerNo) REFERENCES STAJER(num) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE RANDEVU(
	tarih DATE NOT NULL,
	saat varchar(5) NOT NULL,
	Hayvan_no int NOT NULL,
	Hekim_no varchar(12) NOT NULL,
	Foreign key(Hayvan_no) REFERENCES HAYVAN(hnum) ON DELETE CASCADE ON UPDATE CASCADE,
	Foreign key(Hekim_no) REFERENCES HEKIM(num) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE AMELIYAT(
	saat TIME,
	tarih DATE,
	Hayvan_no int NOT NULL,
	Hekim_no varchar(12) NOT NULL,
	aciklama Varchar(255),
	Foreign key(Hayvan_no) REFERENCES HAYVAN(hnum) ON DELETE CASCADE ON UPDATE CASCADE,
	Foreign key(Hekim_no) REFERENCES HEKIM(num) ON DELETE CASCADE ON UPDATE CASCADE
);


-- Prescriptions (PRESCRIPTION) Table
CREATE TABLE RECETE (
    id INT PRIMARY KEY,
    hayvan_no INT NOT NULL,
    hekim_no varchar(12) NOT NULL,
    medications JSON,
    FOREIGN KEY(hayvan_no) REFERENCES HAYVAN(hnum) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(hekim_no) REFERENCES HEKIM(num) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Medical History (MEDICAL_HISTORY) Table
CREATE TABLE TIBBI_GECMIS (
    id INT PRIMARY KEY,
    hayvan_no INT NOT NULL,
    diagnosis TEXT,
    treatment TEXT,
    visit_date DATE,
    FOREIGN KEY(hayvan_no) REFERENCES HAYVAN(hnum) ON DELETE CASCADE ON UPDATE CASCADE
);