
DROP TABLE IF EXISTS `TIBBI_GECMIS`;
DROP TABLE IF EXISTS `RECETE`;
DROP TABLE IF EXISTS `RANDEVU`;
DROP TABLE IF EXISTS `AMELIYAT`;
DROP TABLE IF EXISTS `BAGLIDIR`;
DROP TABLE IF EXISTS `HAYVAN`;
DROP TABLE IF EXISTS `STAJER`;
DROP TABLE IF EXISTS `HEKIM`;
DROP TABLE IF EXISTS `SAHIP`;# tabloları oluşturma sırasının tersine göre kaldırmamız gerekiyor


#
# TABLE STRUCTURE FOR: SAHIP
#



CREATE TABLE `SAHIP` (
  `TC` varchar(11) NOT NULL,
  `isim` varchar(15) NOT NULL,
  `soyisim` varchar(15) NOT NULL,
  `email_address` varchar(20) DEFAULT NULL,
  `password_hash` varchar(20) NOT NULL,
  PRIMARY KEY (`TC`),
  UNIQUE KEY `email_address` (`email_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('13170756872', 'Atakan', 'Arhan', 'tdoruk@example.org', '4693b9cb56a8f2e2b3fe');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('13913876368', 'Sarila', 'Arin', 'arin.daghan@example.', 'd5b488ea10f2b676d47b');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('14430257044', 'Yigit', 'Movsumov', 'iserhan@example.com', 'ffd1417774ff9d491d00');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('15192311503', 'Koray', 'Emirhanli', 'armagan.yigit@exampl', 'd3e09c04b8bea6fb4c6e');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('15590191191', 'Doruk', 'senturk', 'zeynep23@example.net', '4d86087e96afb5d22a27');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('16648713052', 'Arin', 'Canberk', 'alp.zeynep@example.n', '54b23ac5513194f180ca');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('18112780378', 'Ruzgar', 'irtegun', 'emirhan98@example.or', 'c10f85917d0e7b76cfa0');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('24764159482', 'Derin', 'Ada', 'gbarlas@example.com', '8e7ff6fc8af4684690fc');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('26065522962', 'Askin', 'Cemsid', 'cinar.senturk@exampl', '70478428aa5473a8d3c8');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('29293918733', 'Aliye', 'Gokturk', 'fatimah32@example.or', 'eaeb92020e5925060e5c');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('33484014396', 'Aliye', 'Mert', 'fburak@example.net', 'c46648cefcefb23a38f2');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('36094521963', 'Meric', 'Berkay', 'bbartu@example.com', '6d9ae0e9f5632c7238b4');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('37673392572', 'Ege', 'Emirhanli', 'atakan89@example.net', 'f8c528346f5b58263ce1');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('39469908035', 'Armagan', 'Movsumov', 'aliye80@example.com', 'dadbf4b2696452cfad84');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('39804783703', 'Naila', 'Koray', 'cege@example.com', '83d2807e278b8095007c');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('42158365374', 'Naila', 'Gorkem', 'derin94@example.com', '61c89a76babb8a75df48');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('42504177821', 'Cem', 'Gokturk', 'uruzgar@example.net', 'aee3d11685ef31bfc480');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('43303214857', 'Doruk', 'Bora', 'fatimah30@example.co', '786e6b1780576bdb73da');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('44502823971', 'Ferid', 'Kerem', 'hemre@example.org', '122818533fadd474727e');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('45510278697', 'Ruzgar', 'Gokturk', 'sarp91@example.com', 'f61c3de6bf1055acecb7');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('46431418262', 'Sarila', 'cagan', 'sarila.koray@example', '7b3ed98c4a7bcef2b8e2');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('51121313506', 'Fatimah', 'irtegun', 'berke.arin@example.c', '8b3e299fed001726a72a');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('53557535583', 'Toprak', 'Onur', 'mguney@example.org', '5219a500a3a4aeae0e99');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('54141232661', 'Yigit', 'Alp', 'movsumov.aliye@examp', 'a8c6a51a801a594b7b79');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('58344793798', 'Turker', 'Ege', 'daghan.serhan@exampl', '2aa07df0fa6c9591685f');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('60700146809', 'Emir', 'Onur', 'zeynep23@example.org', 'f8d0264dcdb636bca40f');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('65289508561', 'Atakan', 'Alp', 'polat46@example.com', '3c036a0c07726e4aa70a');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('65388371930', 'Utku', 'Arin', 'gorkem.cinar@example', '0d41dc9abbbdf4d6893d');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('67822007904', 'Rasha', 'Yagiz', 'lkerem@example.org', 'f0bcc13d01ec07ace80f');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('69146554891', 'Berke', 'Cemsid', 'rasha45@example.org', 'd904f88a2a7f880125d1');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('70053623981', 'Arin', 'Utku', 'koray60@example.net', '0779ff70b72ea9e83537');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('70702423024', 'Armagan', 'Gokturk', 'bartu.arin@example.c', 'e34429058a8c7da36e32');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('72108140215', 'Sarila', 'Armagan', 'sarila.derin@example', '382fb54197a94e291539');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('76351269675', 'Mert', 'Bartu', 'bartu.meric@example.', '74fbac440c666b65ddaf');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('78948390192', 'Gokturk', 'Cemsid', 'rarin@example.net', 'c0c6874b7b418dc49709');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('80162397115', 'Aliye', 'Berkay', 'hcanberk@example.net', '2f19f5ce21469e02dc98');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('80662800551', 'Kerem', 'Doruk', 'arin51@example.org', '5b1298b765f3c01c371c');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('84324929750', 'Derin', 'Bora', 'berk.arin@example.co', '80eeb7229cc1eaaf774c');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('85420633439', 'Fatimah', 'sukur', 'aliye64@example.net', '7a572c27d2ac88fdb63e');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('87367712411', 'Zeynep', 'Movsumov', 'askin.sarp@example.n', '2728ea28710e2dac0a55');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('87437282518', 'Fatimah', 'Atakan', 'ftoprak@example.org', '6681c7b21b71cd11af51');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('90772266788', 'Toprak', 'cagan', 'fatimah.yigit@exampl', '22d8e0d6e9e97e1a8aac');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('91400668693', 'Rasha', 'Emre', 'yigit.berk@example.n', '7ebd421f9a4334ddc585');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('92900430473', 'Ada', 'Serhan', 'taskin@example.com', '13d663f2e7c2abe03324');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('94883639966', 'Ruzgar', 'Berke', 'kagan.arin@example.o', '3742d49cc37b58067348');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('95140073478', 'Armagan', 'Atakan', 'armagan.serhan@examp', 'e219444d19c4c1b7045a');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('97534871202', 'cinar', 'irtegun', 'doruk.senturk@exampl', '3cf353e0e957c373fb63');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('97655600435', 'Aliye', 'Emre', 'zeynep54@example.net', '55e1a3f74ebe0c9bfe39');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('99334221400', 'Onur', 'Ruzgar', 'aliye30@example.net', '496adff8d6c2c91cb937');
INSERT INTO `SAHIP` (`TC`, `isim`, `soyisim`, `email_address`, `password_hash`) VALUES ('99775946132', 'Fatimah', 'sukur', 'fcanberk@example.net', '45c40a447d5b92fbf2d6');



#
# TABLE STRUCTURE FOR: HAYVAN
#


CREATE TABLE `HAYVAN` (
  `hnum` int(11) NOT NULL,
  `sahip_tc` varchar(11) NOT NULL,
  `isim` varchar(15) NOT NULL,
  `tur` varchar(15) DEFAULT NULL,
  `yas` int(11) DEFAULT NULL,
  PRIMARY KEY (`hnum`),
  KEY `sahip_tc` (`sahip_tc`),
  CONSTRAINT `HAYVAN_ibfk_1` FOREIGN KEY (`sahip_tc`) REFERENCES `SAHIP` (`TC`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (10118, '14430257044', 'Leo', 'Ankara Kedisi', 11);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (10242, '42504177821', 'Duke', 'Kaplumbaga', 1);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (11037, '36094521963', 'Lucy', 'Sultan Papagani', 11);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (11280, '51121313506', 'Cooper', 'Hint Bulbulu', 11);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (11374, '80162397115', 'Hank', 'cincilla', 7);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (12451, '80662800551', 'Lola', 'Van Kedisi', 1);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (12455, '26065522962', 'Sadie', 'Sibirya Kurdu', 12);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (13457, '97534871202', 'Penny', 'cincilla', 17);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (13473, '42158365374', 'Jasper', 'British Shortha', 17);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (13628, '99775946132', 'Finn', 'Holland Lop Tav', 16);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (14241, '69146554891', 'Lily', 'Tekir Kedi', 16);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (14309, '39469908035', 'Gatsby', 'Alman coban Kop', 6);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (14496, '65289508561', 'Scout', 'Scottish Fold', 18);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (14994, '85420633439', 'Blue', 'Hamster', 19);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (15358, '46431418262', 'Roxy', 'Muhabbet Kusu', 16);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (15442, '70053623981', 'Jasper', 'Beagle', 20);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (15544, '53557535583', 'Penny', 'Sultan Papagani', 8);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (15958, '67822007904', 'Leo', 'Pomeranian', 1);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (16048, '54141232661', 'Daisy', 'Holland Lop Tav', 14);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (16107, '44502823971', 'Rocky', 'Siyam Kedisi', 20);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (16195, '16648713052', 'Zeus', 'Sultan Papagani', 19);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (16475, '92900430473', 'Zeus', 'Hamster', 14);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (18100, '24764159482', 'Marley', 'Scottish Fold', 12);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (18654, '45510278697', 'Zeus', 'Holland Lop Tav', 4);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (18714, '65388371930', 'Hercules', 'cincilla', 6);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (19440, '58344793798', 'Sophie', 'British Shortha', 19);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (19557, '39804783703', 'Winston', 'Jako Papagani', 10);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (19751, '84324929750', 'Blue', 'Sultan Papagani', 1);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (19841, '90772266788', 'Harley', 'Pomeranian', 17);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (19933, '37673392572', 'Roxy', 'Sarman Kedi', 15);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (20162, '70702423024', 'Oliver', 'Leopard Gecko', 7);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (20211, '91400668693', 'Louie', 'Alman coban Kop', 13);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (20239, '13913876368', 'Mia', 'Van Kedisi', 5);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (21254, '29293918733', 'Teddy', 'Kaplumbaga', 15);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (21556, '13170756872', 'Teddy', 'Jako Papagani', 18);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (21749, '15192311503', 'Sophie', 'Leopard Gecko', 16);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (21780, '18112780378', 'Bella', 'Doberman', 3);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (21862, '60700146809', 'Marley', 'Kaplumbaga', 14);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (22085, '95140073478', 'Jasper', 'Tekir Kedi', 10);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (22889, '99334221400', 'Hank', 'Holland Lop Tav', 2);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (23378, '15590191191', 'Leo', 'Hamster', 5);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (23534, '43303214857', 'Blue', 'Golden Retrieve', 19);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (23887, '72108140215', 'Louie', 'Alman coban Kop', 8);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (25037, '94883639966', 'Maggie', 'Muhabbet Kusu', 18);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (25332, '33484014396', 'Leo', 'Van Kedisi', 11);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (26004, '78948390192', 'Max', 'Scottish Fold', 2);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (26882, '97655600435', 'Sadie', 'Beta Baligi', 18);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (27106, '76351269675', 'Hank', 'Tekir Kedi', 6);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (27620, '87367712411', 'Luna', 'Doberman', 1);
INSERT INTO `HAYVAN` (`hnum`, `sahip_tc`, `isim`, `tur`, `yas`) VALUES (28066, '87437282518', 'Marley', 'Beagle', 10);


#
# TABLE STRUCTURE FOR: HEKIM
#


CREATE TABLE `HEKIM` (
  `isim` varchar(10) NOT NULL,
  `soyisim` varchar(12) NOT NULL,
  `email` varchar(20) DEFAULT NULL,
  `sifre` varchar(20) NOT NULL,
  `num` int(11) NOT NULL,
  PRIMARY KEY (`num`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `HEKIM` (`isim`, `soyisim`, `email`, `sifre`, `num`) VALUES ('Sarila', 'Movsumov', 'zeynep10@example.com', '1234567890', 3);
INSERT INTO `HEKIM` (`isim`, `soyisim`, `email`, `sifre`, `num`) VALUES ('Ali', 'Emirhan', 'arin.kagan@example.o', 'password', 6);
INSERT INTO `HEKIM` (`isim`, `soyisim`, `email`, `sifre`, `num`) VALUES ('Meric', 'cagan', 'kutay31@example.net', '000000', 58);
INSERT INTO `HEKIM` (`isim`, `soyisim`, `email`, `sifre`, `num`) VALUES ('Zeynep', 'Guney', 'sarila.efe@example.n', '12345678', 74);
INSERT INTO `HEKIM` (`isim`, `soyisim`, `email`, `sifre`, `num`) VALUES ('Naila', 'Mert', 'bartu.yigit@example.', '111111', 118);
INSERT INTO `HEKIM` (`isim`, `soyisim`, `email`, `sifre`, `num`) VALUES ('Kutay', 'Arin', 'zeynep.emre@example.', '111111', 138);
INSERT INTO `HEKIM` (`isim`, `soyisim`, `email`, `sifre`, `num`) VALUES ('Aliye', 'Koray', 'gokturk03@example.ne', '111111', 150);
INSERT INTO `HEKIM` (`isim`, `soyisim`, `email`, `sifre`, `num`) VALUES ('Emirhan', 'Derin', 'sarila.atakan@exampl', '000000', 182);
INSERT INTO `HEKIM` (`isim`, `soyisim`, `email`, `sifre`, `num`) VALUES ('Ada', 'Bora', 'askin.meric@example.', '12345', 243);
INSERT INTO `HEKIM` (`isim`, `soyisim`, `email`, `sifre`, `num`) VALUES ('Atakan', 'Berkay', 'atakan.cemsid@exampl', 'qwerty', 245);
INSERT INTO `HEKIM` (`isim`, `soyisim`, `email`, `sifre`, `num`) VALUES ('Armagan', 'Alp', 'bartu.naila@example.', '123123', 295);
INSERT INTO `HEKIM` (`isim`, `soyisim`, `email`, `sifre`, `num`) VALUES ('Ege', 'Ege', 'varmagan@example.org', '123321', 374);
INSERT INTO `HEKIM` (`isim`, `soyisim`, `email`, `sifre`, `num`) VALUES ('Koray', 'Ege', 'koray.bora@example.n', '1234567890', 461);
INSERT INTO `HEKIM` (`isim`, `soyisim`, `email`, `sifre`, `num`) VALUES ('Burak', 'Kerem', 'aliye.ruzgar@example', 'password', 462);
INSERT INTO `HEKIM` (`isim`, `soyisim`, `email`, `sifre`, `num`) VALUES ('Derin', 'Kutay', 'qderin@example.net', 'qwertyuiop', 562);
INSERT INTO `HEKIM` (`isim`, `soyisim`, `email`, `sifre`, `num`) VALUES ('Ege', 'Armagan', 'rmert@example.net', '111111', 564);
INSERT INTO `HEKIM` (`isim`, `soyisim`, `email`, `sifre`, `num`) VALUES ('Kerem', 'Daghan', 'turker32@example.com', '123456789', 578);
INSERT INTO `HEKIM` (`isim`, `soyisim`, `email`, `sifre`, `num`) VALUES ('Naila', 'Berke', 'nruzgar@example.net', '12345', 780);
INSERT INTO `HEKIM` (`isim`, `soyisim`, `email`, `sifre`, `num`) VALUES ('Naila', 'Emirhan', 'burak.arin@example.n', '123321', 814);
INSERT INTO `HEKIM` (`isim`, `soyisim`, `email`, `sifre`, `num`) VALUES ('Ada', 'Burak', 'onur.alp@example.net', '111111', 969);


#
# TABLE STRUCTURE FOR: RANDEVU
#


CREATE TABLE `RANDEVU` (
  `tarih` date NOT NULL,
  `saat` varchar(5) NOT NULL,
  `Hayvan_no` int(11) NOT NULL,
  `Hekim_no` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  KEY `Hayvan_no` (`Hayvan_no`),
  KEY `Hekim_no` (`Hekim_no`),
  CONSTRAINT `RANDEVU_ibfk_1` FOREIGN KEY (`Hayvan_no`) REFERENCES `HAYVAN` (`hnum`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `RANDEVU_ibfk_2` FOREIGN KEY (`Hekim_no`) REFERENCES `HEKIM` (`num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('2012-06-08', '01:38', 10118, 3, 'Voluptatibus corporis iste rem doloribus dolor iure culpa. Non itaque aut odit amet. Quos voluptatem modi illo consequatur quod eaque natus. Nemo et eum placeat ullam voluptatibus.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('2013-03-10', '19:17', 10242, 6, 'Aliquid commodi quia est dolorum enim aut. Maxime omnis dignissimos voluptas aut. Veritatis fugit dolores voluptatem excepturi enim ratione alias odio. Porro molestias rerum ut occaecati.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('2004-08-22', '04:16', 11037, 58, 'Quia aliquid laudantium modi voluptas sunt. Hic repellendus facilis praesentium sit et. Sapiente est laborum nesciunt sed aut quia vel. Alias consequuntur ducimus et qui illum inventore quia.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('1981-11-09', '08:43', 11280, 74, 'Rerum quia dolore a voluptatibus. Aut suscipit qui non quod aut aut. Est in ab nostrum doloremque dolores autem incidunt. Quo minus quisquam debitis velit totam iste.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('1975-04-26', '19:06', 11374, 118, 'Repudiandae magnam ullam debitis. Magni sunt eaque qui dolor illum quas qui eaque. Voluptas magnam voluptas modi optio explicabo qui in tempora. Ut dolores distinctio eius.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('1982-11-22', '09:43', 12451, 138, 'Delectus magni accusamus facere quos magni. Cupiditate error qui quia aliquam. Id sit inventore aut. Eligendi dolore aut consequatur sunt qui amet.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('1981-04-24', '10:33', 12455, 150, 'Illo quo voluptatem autem odit ut illum ea. In ut voluptatem aut rerum mollitia magnam. Consequatur saepe officiis iure accusantium eos incidunt.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('2001-12-12', '17:24', 13457, 182, 'Similique eaque occaecati aliquam omnis sunt. Harum voluptas molestias illo odio repellat nobis ipsa. Dicta voluptas dignissimos quo magni eius. Unde labore quis quasi ut omnis deserunt quidem.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('1978-08-01', '19:34', 13473, 243, 'Perspiciatis autem adipisci non voluptatem sint quis molestias. Voluptates fugiat laudantium temporibus unde. Doloribus saepe maiores quis harum. Hic eaque vitae ipsum magni qui.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('2012-11-23', '12:35', 13628, 245, 'Magni est harum nisi possimus. Qui enim perferendis consequuntur velit alias. Qui modi omnis ad molestiae dignissimos neque.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('2011-08-21', '17:20', 14241, 295, 'Deserunt facere est consequatur illum sapiente. Eius facere ea enim quis odit odit molestiae. Autem non aperiam ut in quo placeat repellendus. Sed facere id consequatur tenetur inventore placeat.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('2013-05-12', '10:11', 14309, 374, 'Cupiditate ut sapiente temporibus nisi molestiae aperiam eaque. Quasi in voluptate accusamus deleniti. Consequuntur et qui earum aut rerum voluptatum at. Doloribus similique eum et officiis eaque id aperiam. Rerum est et pariatur officia repudiandae nobis necessitatibus quisquam.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('2004-03-01', '06:04', 14496, 461, 'Quibusdam ut quidem aut nesciunt velit vero reiciendis. Iure aut sed a velit. Rerum quia quia vel vero.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('2006-11-27', '06:01', 14994, 462, 'Maiores nisi consequuntur reprehenderit dolorum illum optio. Numquam vel assumenda maiores.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('1978-09-27', '09:59', 15358, 562, 'Quasi accusantium sequi autem tenetur. Numquam illo neque rerum optio vel molestias. Ducimus illo et earum culpa a omnis.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('1986-05-11', '22:44', 15442, 564, 'Voluptas quia repellendus dolorem rem at quo voluptas. Harum nam modi rerum voluptatum at ut repudiandae reiciendis.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('1977-11-05', '01:31', 15544, 578, 'Quidem illo provident vel voluptatem rerum delectus. Quidem aliquam ut corrupti nesciunt. Natus odio ipsa neque eaque vel vel facere. Cupiditate rerum odio eveniet eos.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('1997-12-18', '05:36', 15958, 780, 'Labore nisi sequi quidem animi atque. Ducimus vel sint nihil officia et. Ut dolor eius earum possimus modi autem.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('2000-02-19', '01:26', 16048, 814, 'Aliquam alias soluta quam vero odio non. Voluptatem culpa modi consequatur aliquid totam. Vel est adipisci doloremque. Est consequatur sit sint quaerat corporis consequuntur aut.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('1975-08-07', '19:37', 16107, 969, 'Reiciendis maxime architecto repudiandae repellendus nesciunt voluptas qui. Voluptatibus non id asperiores dolorem sunt temporibus rerum. Voluptatem praesentium repellat repellat facere dignissimos itaque beatae sunt.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('1977-10-16', '13:21', 16195, 3, 'Culpa voluptas eius aut ut. Laboriosam suscipit ut quae veniam vitae possimus est. Est itaque ad reiciendis unde. Nihil eos hic quaerat in sed hic qui aut. Ut sit qui aut ad quis qui.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('1997-09-09', '16:48', 16475, 6, 'Officiis voluptatem voluptatem laudantium laudantium et voluptatem. Dolorum consectetur alias fugiat recusandae sed qui. Accusamus ratione dignissimos pariatur quia esse.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('1975-03-04', '12:06', 18100, 58, 'Fugit assumenda aut quibusdam qui. Aperiam ea blanditiis odio et itaque. Aut qui illum ex necessitatibus est pariatur quisquam. Omnis earum at quia eligendi.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('1985-07-03', '10:35', 18654, 74, 'Fuga vero nostrum nemo aut maxime. Ut blanditiis ducimus cumque repudiandae maxime. Expedita repudiandae numquam facilis in autem sit hic.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('2020-07-09', '15:20', 18714, 118, 'Quaerat dicta delectus nesciunt similique sunt molestiae est et. Magni velit aperiam hic aut modi aliquam enim. Molestiae velit et rerum omnis et consequatur omnis.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('2018-05-29', '09:36', 19440, 138, 'Minus temporibus possimus quaerat ratione vero. Eum deleniti voluptatem iusto sint minus ut dolore. Veritatis ut assumenda quia. Sed tempore nulla adipisci consectetur autem omnis dolorem.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('1977-11-08', '18:02', 19557, 150, 'Sint ea voluptatem quo occaecati omnis. Assumenda fugiat ea aut aut. Consequuntur sit modi in id.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('1993-08-08', '12:09', 19751, 182, 'Vero placeat consectetur velit reprehenderit deleniti modi dolorem fuga. Consectetur ab repudiandae non ratione. Qui consequatur quibusdam illum et sed enim cumque.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('1995-08-13', '02:23', 19841, 243, 'Eius aut ut inventore dolorem at. Nihil sed recusandae sed dolore. Quo praesentium ea nulla totam distinctio doloribus autem. Error mollitia esse numquam assumenda quae enim inventore repellat.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('2017-08-06', '05:28', 19933, 245, 'Deleniti ipsam molestias pariatur. Reprehenderit qui est labore inventore unde iste. Officia vero iusto nostrum voluptas ex cupiditate. Repellat dolores quae minima autem excepturi voluptas voluptas.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('1972-09-11', '21:54', 20162, 295, 'Est nihil vel totam animi officia possimus. Blanditiis nihil vel quae rem. Repellat aut aut iusto commodi nam architecto. Qui molestias ut fuga omnis.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('1989-10-22', '01:15', 20211, 374, 'Possimus qui impedit et consequuntur. Saepe beatae dicta officiis vel omnis a voluptas. Dolores omnis maxime dicta ea est.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('2005-02-05', '13:20', 20239, 461, 'Delectus quis provident reiciendis beatae sit officiis. Sint vero vel ut non ab aut est. Mollitia consequuntur ea qui vel voluptatem sint impedit. Perferendis aperiam ad accusantium velit rerum aut.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('1976-05-21', '22:28', 21254, 462, 'Ratione explicabo quidem beatae expedita. At eligendi qui quia in pariatur quia ut. Quia enim labore nostrum explicabo.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('1994-01-28', '18:31', 21556, 562, 'Cupiditate harum at architecto nostrum aut assumenda. Dolor unde molestiae amet dolorem. Excepturi perspiciatis iste placeat placeat quis eum quisquam. Consequatur fugit quis eius reiciendis et molestiae.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('1990-03-27', '19:40', 21749, 564, 'Tempore nihil maxime sint suscipit nesciunt aspernatur. Delectus omnis officia reiciendis omnis adipisci occaecati. Quod at sed ut voluptatum aspernatur pariatur ex nostrum.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('2011-06-20', '03:27', 21780, 578, 'Numquam optio corrupti a et et. Et nam vel voluptas est iusto est ipsa. Accusantium ducimus asperiores nulla quia ullam.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('1977-05-21', '00:00', 21862, 780, 'Exercitationem repellat ut fugit totam. Assumenda illo consectetur error rerum repellendus sunt et. Eos nobis magnam est aut aut. Tempore veritatis cupiditate ut optio minima ut.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('2002-06-01', '01:02', 22085, 814, 'Delectus voluptates ea itaque omnis non vel. Aut autem et et sapiente. Dignissimos labore commodi voluptatem odit.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('1988-10-04', '04:32', 22889, 969, 'Culpa nisi porro voluptas quam beatae quia doloremque. Assumenda accusantium maiores quidem aut deserunt sint sunt. Voluptatum nihil quod corrupti.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('1981-06-29', '00:56', 23378, 3, 'Deserunt optio nesciunt quasi et eius at quis. Qui eos mollitia animi quibusdam ut sunt qui. Vitae et natus iste ut aspernatur est tempore.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('2009-02-04', '02:50', 23534, 6, 'Quia ducimus ullam fuga sed necessitatibus iste error tempora. Numquam incidunt minus voluptatem ea quidem. Id blanditiis perferendis sint quia. Ipsa ut illum illum sit corrupti in perferendis.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('2013-10-15', '02:00', 23887, 58, 'Eligendi ex delectus cum. Ut nihil officiis omnis et aut sunt voluptas. Odit omnis iure expedita sint excepturi quia.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('2013-08-19', '01:15', 25037, 74, 'Occaecati error libero quis soluta molestiae culpa. Ut voluptas in quod voluptatem. Aspernatur laudantium magni beatae.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('2020-01-06', '14:24', 25332, 118, 'Quidem repudiandae ea quis et qui. Occaecati officiis sed aut reprehenderit eum beatae. Reiciendis mollitia enim aut voluptatem repudiandae. Vitae totam hic necessitatibus atque atque ea fuga.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('2001-02-06', '02:26', 26004, 138, 'Eaque nesciunt consequatur voluptas enim illum ipsa. Iusto ab est deserunt inventore magnam repudiandae. Aspernatur nihil eaque officia voluptas dolores eos magni.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('2013-02-08', '19:48', 26882, 150, 'Ex veniam quas esse voluptate. Quia dolor odio quas id. Et accusamus dolor harum et. Nihil at non totam ex aliquam et rem nesciunt. Aliquam cupiditate vel quia vel voluptas id sit.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('1979-06-05', '09:44', 27106, 182, 'Rerum rerum est illo exercitationem nihil vel ratione. Non aut placeat possimus. Et sunt itaque blanditiis dolorum est. Repellat est consequatur et corrupti est error consequatur.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('2007-11-24', '20:41', 27620, 243, 'Voluptatem culpa et odit sit eaque quisquam aperiam nulla. Magnam eaque aspernatur est qui sit nobis. Voluptate minus corporis qui quo qui vitae.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('2023-11-24', '02:43', 28066, 245, 'Rem ratione magni qui repellat debitis. Ex quia ipsa nostrum placeat nisi rerum voluptas. Rerum voluptate qui commodi mollitia error. Et quae ut consectetur debitis incidunt et fugiat. Eos libero voluptas perferendis repudiandae voluptates sed.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('2000-11-02', '14:45', 10118, 295, 'Ipsa voluptas ipsam eum voluptatibus est rerum. Non ea suscipit assumenda voluptatibus. Accusamus qui animi ea fugit sit quae. Ut ex error architecto enim.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('2012-07-16', '14:32', 10242, 374, 'Maxime reprehenderit eum qui a aut unde. Enim doloremque ullam est et. Magni est explicabo magnam sit.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('1985-10-13', '12:57', 11037, 461, 'Alias et adipisci saepe adipisci omnis. Dolorum libero facere et odit. Rerum voluptatem eius dicta voluptas. Error aut cumque dolorem odio fugit et sint.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('2005-01-18', '08:37', 11280, 462, 'Dolores ut aliquam error assumenda alias est eum. Dicta vel consequatur quasi porro impedit eveniet nam. Perspiciatis est odit aspernatur dignissimos.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('2023-11-30', '03:06', 11374, 562, 'Ea amet aut quod aut aperiam nihil omnis. Quos rem maxime at. Magnam nulla ex et deleniti possimus reprehenderit ex. Distinctio deleniti vitae accusamus saepe. Ut perspiciatis sunt fugiat quis.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('2024-01-13', '22:06', 12451, 564, 'Et dolorum mollitia enim dolores repellendus. Earum cumque reiciendis quia repellat nam qui voluptatum vero. Rem velit possimus est quia consequuntur ut consequuntur ut. Itaque voluptatem aut distinctio repudiandae ea voluptas.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('1970-12-31', '13:15', 12455, 578, 'Et aut enim labore dolorem enim. Aliquid consectetur aut et aperiam. Quo voluptas quos corrupti quasi rem fugiat eaque. Et reiciendis corrupti consequuntur.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('1990-03-12', '10:29', 13457, 780, 'Temporibus veniam repellat facilis adipisci ab quia ratione. Quae numquam provident quas fugit officia et rem suscipit. Qui ipsa consequatur eveniet non quisquam minus.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('2013-04-16', '13:29', 13473, 814, 'Praesentium porro aspernatur autem aut et voluptas. Reprehenderit velit in id cum. Rerum debitis hic autem cumque perspiciatis nobis. Et in suscipit repellendus commodi numquam et.');
INSERT INTO `RANDEVU` (`tarih`, `saat`, `Hayvan_no`, `Hekim_no`, `notes`) VALUES ('2020-10-31', '08:07', 13628, 969, 'Est rerum nam nesciunt quis illo et cupiditate. Quia adipisci autem nulla a rerum enim. Sapiente vitae reiciendis blanditiis ab voluptas. Perferendis et nemo assumenda distinctio.');


#
# TABLE STRUCTURE FOR: RECETE
#


CREATE TABLE `RECETE` (
  `id` int(11) NOT NULL,
  `hayvan_no` int(11) NOT NULL,
  `hekim_no` int(11) NOT NULL,
  `medications` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`medications`)),
  PRIMARY KEY (`id`),
  KEY `hayvan_no` (`hayvan_no`),
  KEY `hekim_no` (`hekim_no`),
  CONSTRAINT `RECETE_ibfk_1` FOREIGN KEY (`hayvan_no`) REFERENCES `HAYVAN` (`hnum`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `RECETE_ibfk_2` FOREIGN KEY (`hekim_no`) REFERENCES `HEKIM` (`num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `RECETE` (`id`, `hayvan_no`, `hekim_no`, `medications`) VALUES (1713, 10242, 6, '5');
INSERT INTO `RECETE` (`id`, `hayvan_no`, `hekim_no`, `medications`) VALUES (1959, 12451, 138, '3');
INSERT INTO `RECETE` (`id`, `hayvan_no`, `hekim_no`, `medications`) VALUES (2049, 11037, 58, '7');
INSERT INTO `RECETE` (`id`, `hayvan_no`, `hekim_no`, `medications`) VALUES (2753, 11280, 74, '7');
INSERT INTO `RECETE` (`id`, `hayvan_no`, `hekim_no`, `medications`) VALUES (2981, 12455, 150, '4');
INSERT INTO `RECETE` (`id`, `hayvan_no`, `hekim_no`, `medications`) VALUES (3776, 13457, 182, '5');
INSERT INTO `RECETE` (`id`, `hayvan_no`, `hekim_no`, `medications`) VALUES (4289, 10118, 3, '1');
INSERT INTO `RECETE` (`id`, `hayvan_no`, `hekim_no`, `medications`) VALUES (8569, 13628, 245, '1');
INSERT INTO `RECETE` (`id`, `hayvan_no`, `hekim_no`, `medications`) VALUES (10166, 13473, 243, '1');
INSERT INTO `RECETE` (`id`, `hayvan_no`, `hekim_no`, `medications`) VALUES (11434, 11374, 118, '6');


#
# TABLE STRUCTURE FOR: STAJER
#


CREATE TABLE `STAJER` (
  `isim` varchar(10) NOT NULL,
  `soyisim` varchar(12) NOT NULL,
  `email` varchar(20) DEFAULT NULL,
  `sifre` varchar(20) NOT NULL,
  `num` int(11) NOT NULL,
  PRIMARY KEY (`num`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `STAJER` (`isim`, `soyisim`, `email`, `sifre`, `num`) VALUES ('Naila', 'Kagan', 'cemsid.kutay@example', '123321', 1023);
INSERT INTO `STAJER` (`isim`, `soyisim`, `email`, `sifre`, `num`) VALUES ('Aliye', 'Serhan', 'fatimah.toprak@examp', '000000', 1030);
INSERT INTO `STAJER` (`isim`, `soyisim`, `email`, `sifre`, `num`) VALUES ('Meric', 'Emre', 'efe00@example.net', 'password123', 1047);
INSERT INTO `STAJER` (`isim`, `soyisim`, `email`, `sifre`, `num`) VALUES ('Ruzgar', 'Berkay', 'eada@example.com', '12345', 1073);
INSERT INTO `STAJER` (`isim`, `soyisim`, `email`, `sifre`, `num`) VALUES ('Sarila', 'Berke', 'naila31@example.org', '12345', 1104);
INSERT INTO `STAJER` (`isim`, `soyisim`, `email`, `sifre`, `num`) VALUES ('Zeynep', 'Cemsid', 'armagan.serhan@examp', '1234', 1131);
INSERT INTO `STAJER` (`isim`, `soyisim`, `email`, `sifre`, `num`) VALUES ('Derin', 'irtegun', 'arin16@example.org', 'password123', 1135);
INSERT INTO `STAJER` (`isim`, `soyisim`, `email`, `sifre`, `num`) VALUES ('Ege', 'Berke', 'baran49@example.org', '123456789', 1144);
INSERT INTO `STAJER` (`isim`, `soyisim`, `email`, `sifre`, `num`) VALUES ('Serhan', 'Askin', 'cemsid.zeynep@exampl', 'qwerty123', 1162);
INSERT INTO `STAJER` (`isim`, `soyisim`, `email`, `sifre`, `num`) VALUES ('Ada', 'cinar', 'onur.armagan@example', 'password1', 1198);


#
# TABLE STRUCTURE FOR: BAGLIDIR
#

CREATE TABLE `BAGLIDIR` (
  `HekimNo` int(11) NOT NULL,
  `StajerNo` int(11) NOT NULL,
  KEY `HekimNo` (`HekimNo`),
  KEY `StajerNo` (`StajerNo`),
  CONSTRAINT `BAGLIDIR_ibfk_1` FOREIGN KEY (`HekimNo`) REFERENCES `HEKIM` (`num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BAGLIDIR_ibfk_2` FOREIGN KEY (`StajerNo`) REFERENCES `STAJER` (`num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `BAGLIDIR` (`HekimNo`, `StajerNo`) VALUES (3, 1023);
INSERT INTO `BAGLIDIR` (`HekimNo`, `StajerNo`) VALUES (6, 1030);
INSERT INTO `BAGLIDIR` (`HekimNo`, `StajerNo`) VALUES (58, 1047);
INSERT INTO `BAGLIDIR` (`HekimNo`, `StajerNo`) VALUES (74, 1073);
INSERT INTO `BAGLIDIR` (`HekimNo`, `StajerNo`) VALUES (118, 1104);
INSERT INTO `BAGLIDIR` (`HekimNo`, `StajerNo`) VALUES (138, 1131);
INSERT INTO `BAGLIDIR` (`HekimNo`, `StajerNo`) VALUES (150, 1135);
INSERT INTO `BAGLIDIR` (`HekimNo`, `StajerNo`) VALUES (182, 1144);
INSERT INTO `BAGLIDIR` (`HekimNo`, `StajerNo`) VALUES (243, 1162);
INSERT INTO `BAGLIDIR` (`HekimNo`, `StajerNo`) VALUES (245, 1198);

#
# TABLE STRUCTURE FOR: AMELIYAT
#


CREATE TABLE `AMELIYAT` (
  `saat` varchar(5) DEFAULT NULL,
  `tarih` date DEFAULT NULL,
  `Hayvan_no` int(11) NOT NULL,
  `Hekim_no` int(11) NOT NULL,
  KEY `Hayvan_no` (`Hayvan_no`),
  KEY `Hekim_no` (`Hekim_no`),
  CONSTRAINT `AMELIYAT_ibfk_1` FOREIGN KEY (`Hayvan_no`) REFERENCES `HAYVAN` (`hnum`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AMELIYAT_ibfk_2` FOREIGN KEY (`Hekim_no`) REFERENCES `HEKIM` (`num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `AMELIYAT` (`saat`, `tarih`, `Hayvan_no`, `Hekim_no`) VALUES ('12:16', '2017-03-13', 10118, 3);
INSERT INTO `AMELIYAT` (`saat`, `tarih`, `Hayvan_no`, `Hekim_no`) VALUES ('01:22', '1986-02-24', 10242, 6);
INSERT INTO `AMELIYAT` (`saat`, `tarih`, `Hayvan_no`, `Hekim_no`) VALUES ('04:39', '1977-02-07', 11037, 58);
INSERT INTO `AMELIYAT` (`saat`, `tarih`, `Hayvan_no`, `Hekim_no`) VALUES ('01:24', '2022-01-17', 11280, 74);
INSERT INTO `AMELIYAT` (`saat`, `tarih`, `Hayvan_no`, `Hekim_no`) VALUES ('12:36', '1982-12-12', 11374, 118);
INSERT INTO `AMELIYAT` (`saat`, `tarih`, `Hayvan_no`, `Hekim_no`) VALUES ('09:26', '2014-11-23', 12451, 138);
INSERT INTO `AMELIYAT` (`saat`, `tarih`, `Hayvan_no`, `Hekim_no`) VALUES ('13:23', '2001-10-27', 12455, 150);
INSERT INTO `AMELIYAT` (`saat`, `tarih`, `Hayvan_no`, `Hekim_no`) VALUES ('21:26', '1973-07-16', 13457, 182);
INSERT INTO `AMELIYAT` (`saat`, `tarih`, `Hayvan_no`, `Hekim_no`) VALUES ('15:19', '2015-08-24', 13473, 243);
INSERT INTO `AMELIYAT` (`saat`, `tarih`, `Hayvan_no`, `Hekim_no`) VALUES ('08:13', '2000-01-06', 13628, 245);


#
# TABLE STRUCTURE FOR: TIBBI_GECMIS
#


CREATE TABLE `TIBBI_GECMIS` (
  `id` int(11) NOT NULL,
  `hayvan_no` int(11) NOT NULL,
  `diagnosis` text DEFAULT NULL,
  `treatment` text DEFAULT NULL,
  `visit_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hayvan_no` (`hayvan_no`),
  CONSTRAINT `TIBBI_GECMIS_ibfk_1` FOREIGN KEY (`hayvan_no`) REFERENCES `HAYVAN` (`hnum`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50000, 21254, 'Dignissimos qui fuga ut dolor reprehenderit iste est magnam.', 'Fugit odio.', '2007-10-16');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50001, 16048, 'Ut voluptatibus magni aut beatae. Sit est dolore sapiente corporis fugit aliquid.', 'Eum hic.', '1983-05-29');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50002, 26882, 'Quae qui iure minus voluptatem. Omnis quas ipsa voluptatem sed culpa sapiente.', 'Vero.', '2015-06-15');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50003, 20211, 'Dicta et a distinctio quia est et.', 'Voluptatem pariatur.', '2014-10-18');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50004, 13628, 'Molestiae aut sed praesentium atque occaecati. Nihil voluptatem fuga qui accusamus molestias ipsam.', 'Libero non.', '1983-03-23');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50005, 28066, 'Dolorem suscipit amet eum adipisci nam cupiditate rerum consequuntur.', 'Porro.', '1977-03-26');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50006, 21780, 'Odio hic cupiditate laborum at. Commodi ducimus et iure quas voluptate sint eius.', 'Quia ratione.', '1983-06-09');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50007, 12451, 'Et consectetur architecto excepturi voluptatem sed quod distinctio dicta.', 'Ut.', '1986-05-07');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50008, 15544, 'Ad dolore animi repudiandae non culpa. In laboriosam nihil ut minus.', 'Neque.', '1972-03-16');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50009, 20211, 'Exercitationem perspiciatis et qui unde pariatur labore.', 'Et voluptatibus.', '2024-07-01');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50010, 18714, 'Quo tenetur rerum placeat ipsa praesentium eum rem illo.', 'Sit.', '2002-02-09');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50011, 22889, 'Voluptatum nobis voluptates fugiat et.', 'Sunt omnis.', '2016-01-16');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50012, 10242, 'Optio et rerum quas nihil est voluptates. Explicabo ad aliquid debitis aut natus ea quod nobis.', 'Velit.', '2000-11-21');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50013, 14309, 'Fugit a assumenda est sit.', 'Minima cumque.', '1972-04-11');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50014, 19751, 'Fugiat quibusdam aut voluptatem maiores officiis.', 'Nihil.', '1990-11-15');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50015, 23887, 'Id consequatur itaque expedita ut aliquid. Similique dolorem ad minima labore sapiente doloribus nemo.', 'Ut soluta.', '1987-07-19');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50016, 15544, 'Illo tempora eligendi ut voluptas dicta. Harum saepe vel consequatur ab omnis qui nemo.', 'Aut nihil.', '2021-06-21');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50017, 15442, 'Et aut earum dolorem perspiciatis quasi.', 'Consectetur.', '2024-10-02');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50018, 23534, 'Tenetur eum placeat deserunt voluptas. Est provident sunt illum nobis nobis.', 'Laudantium.', '2014-12-08');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50019, 27620, 'Autem molestiae similique non sit magnam.', 'Ullam.', '2010-11-13');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50020, 15958, 'Cupiditate quaerat exercitationem placeat quam.', 'Eveniet.', '2017-11-28');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50021, 18100, 'Neque ad omnis reiciendis dolores.', 'Voluptate.', '1978-10-16');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50022, 20239, 'Tenetur quod eos architecto. Est incidunt id doloribus laboriosam ut.', 'Debitis non.', '2017-07-24');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50023, 14994, 'Iure rerum illo quia vel. Illum et maxime voluptatum ad ea.', 'Cupiditate quis.', '1992-07-09');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50024, 11374, 'Fuga tenetur aut provident quod sit. Repudiandae at sit id odio illo eum mollitia in.', 'Eaque.', '1979-12-27');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50025, 14241, 'Magnam animi commodi enim molestiae placeat delectus. Fuga aliquid veritatis ad molestiae sunt.', 'Inventore consectetur.', '1986-02-15');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50026, 23534, 'Nobis sint temporibus excepturi vel ducimus sit neque. Aut pariatur error minus alias quasi maxime.', 'Illo.', '2012-04-26');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50027, 10242, 'Delectus rerum nam beatae similique beatae deserunt quis. Qui delectus enim est architecto optio.', 'Adipisci maiores.', '2008-05-29');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50028, 28066, 'Inventore eos harum explicabo vel fugiat voluptatem. Illo consequuntur fugit earum qui numquam.', 'Voluptas culpa.', '1996-07-31');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50029, 18100, 'Est nobis sapiente vero sunt enim qui. Est recusandae soluta est debitis repudiandae aperiam beatae.', 'Quia esse.', '2015-06-29');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50030, 23887, 'Quos magnam deleniti exercitationem impedit tempora odio enim.', 'Nobis.', '1974-02-21');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50031, 13457, 'Iure unde exercitationem omnis occaecati corporis quisquam.', 'Optio.', '1993-12-06');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50032, 19841, 'Debitis ullam eum debitis sequi inventore vel tempore. Ipsa deserunt sed modi voluptatem similique.', 'Quas.', '1971-03-22');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50033, 15358, 'Ipsum quidem similique quod quaerat. Maiores qui minus ex doloremque.', 'Odit voluptas.', '1988-03-31');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50034, 11280, 'Qui ex quos eos nobis.', 'Voluptas.', '2011-05-08');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50035, 27106, 'Consequatur dolorem aut quidem omnis. Nihil quos similique enim.', 'Sed neque.', '1982-08-21');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50036, 13457, 'Quaerat voluptatum et autem non. Quo distinctio maxime consequatur.', 'Temporibus velit.', '1986-06-12');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50037, 14496, 'Corrupti esse rerum nulla ut esse laborum omnis.', 'Aspernatur.', '1976-09-01');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50038, 25332, 'Harum quo magnam est aliquam at est. Nihil doloribus voluptas similique hic omnis.', 'Dolor sint.', '2010-04-30');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50039, 20162, 'Perspiciatis unde labore reiciendis ut in laudantium.', 'Dicta.', '2020-01-13');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50040, 11374, 'Voluptatem sed vel eveniet veritatis ut.', 'Aut.', '2013-09-04');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50041, 16048, 'Et adipisci deleniti culpa culpa.', 'Dolores.', '2010-03-08');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50042, 10118, 'Voluptatem corrupti laborum qui vero qui labore dolor. Aut sed possimus ratione perferendis similique.', 'Possimus quia.', '1979-06-02');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50043, 18654, 'Molestiae sit qui sed soluta et nesciunt magni. Aliquid reiciendis commodi exercitationem facere sed labore magni.', 'Qui.', '1987-01-02');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50044, 19440, 'Sit quod placeat eligendi voluptatem molestias quis rerum.', 'Aut.', '2007-10-15');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50045, 20239, 'Et accusantium nihil maiores incidunt ut et.', 'Mollitia.', '2016-02-08');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50046, 21749, 'Reiciendis repellendus eaque rerum aut consequatur sint perferendis. Ad autem et accusamus deleniti in.', 'Voluptates.', '2018-05-26');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50047, 16195, 'Fugit dolores excepturi et ipsum.', 'Sequi vel.', '1984-08-08');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50048, 14309, 'Earum nihil necessitatibus quaerat debitis aut. Neque provident laborum quaerat labore.', 'Corporis.', '1992-07-05');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50049, 19440, 'Autem aliquid est non dolorum recusandae. Reprehenderit delectus sint rerum officiis delectus ut.', 'Architecto.', '1972-05-14');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50050, 12455, 'Minima fugit non suscipit et quia.', 'Odit.', '2023-02-03');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50051, 21862, 'Consequatur eaque facilis corporis sed voluptas.', 'Veritatis.', '1988-04-26');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50052, 12451, 'Porro facere magnam vero sit in animi similique.', 'Praesentium accusamus.', '2024-02-06');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50053, 21254, 'Fugiat quidem quae suscipit quia ducimus. Et aspernatur ut repellendus nostrum ab.', 'Neque.', '1979-09-21');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50054, 11037, 'Saepe dolorem omnis repellendus unde.', 'Modi eos.', '1991-02-11');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50055, 19557, 'Aut enim est tempore enim necessitatibus id ducimus incidunt. Expedita in nisi minus provident et laborum iste.', 'Quis.', '2023-07-02');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50056, 23378, 'Incidunt id expedita deleniti est voluptatem rerum et. Est quo optio nobis officia expedita.', 'Voluptatum consequatur.', '1985-05-19');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50057, 19841, 'Ex dolorem minus vero illo aliquid perspiciatis beatae.', 'Aut.', '2001-08-23');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50058, 11280, 'Saepe deleniti a et voluptas et repellendus odio. Voluptas similique quaerat quia ut qui nihil.', 'Voluptatem itaque.', '2015-11-27');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50059, 15442, 'Enim nostrum cumque quam quisquam consequuntur dolore aut. Ab sit accusantium recusandae architecto.', 'Rerum.', '1970-10-05');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50060, 27106, 'Fugiat sit ducimus repellendus. Autem animi repellat molestiae et laudantium suscipit dolores.', 'Molestiae.', '1998-01-23');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50061, 10118, 'Labore asperiores dolore eum aspernatur qui.', 'Rerum.', '1970-06-28');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50062, 19751, 'Illum quo saepe eos quo sunt quaerat.', 'Ullam.', '2018-06-28');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50063, 14994, 'Maiores sit similique esse ab. Provident est nostrum minima sint delectus voluptates.', 'Nisi rerum.', '1974-03-31');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50064, 25037, 'Sit asperiores velit similique impedit nemo. Minus aut esse quis aut suscipit et laboriosam qui.', 'Harum.', '2016-05-15');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50065, 13628, 'Et facere minus enim.', 'Molestias.', '1980-01-09');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50066, 27620, 'In aut est nulla neque. Et tenetur voluptatibus voluptates dolores possimus voluptatem.', 'Quo a.', '2022-06-08');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50067, 19933, 'Ipsam quasi cumque at architecto.', 'Repellat.', '2009-07-18');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50068, 14496, 'Sit commodi numquam deserunt voluptatibus.', 'Odit.', '2008-10-13');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50069, 26004, 'Temporibus atque unde adipisci.', 'Totam aliquam.', '1996-09-18');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50070, 12455, 'Nemo a dignissimos aliquid itaque. Explicabo voluptas cum aut est rerum expedita id.', 'Et qui.', '1992-06-18');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50071, 16107, 'Fugiat nobis enim quam ad non.', 'Dolor omnis.', '2014-09-30');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50072, 16107, 'Quis laboriosam molestiae architecto id illum.', 'Quas.', '1977-04-11');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50073, 23378, 'Aut eos itaque nemo blanditiis magni.', 'Libero.', '2016-06-25');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50074, 20162, 'Enim id nobis est molestiae qui quo et.', 'Praesentium doloribus.', '2012-09-25');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50075, 25037, 'Ut libero est dolor amet ea dolorem quia.', 'Assumenda numquam.', '1990-08-09');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50076, 22085, 'Quis facilis itaque aut nostrum corporis quia. Repudiandae totam repudiandae ut eum nostrum mollitia quis enim.', 'Perspiciatis.', '2001-08-09');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50077, 21556, 'Enim quidem sed molestiae sit sunt eligendi pariatur.', 'In laboriosam.', '1977-02-04');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50078, 15358, 'Quisquam tempora quod dignissimos non. Rem deserunt quia dicta tempore est.', 'Ea.', '1986-09-22');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50080, 21749, 'Est voluptate ab labore illum inventore cumque reiciendis. Quidem id ipsa totam aut.', 'In.', '2012-03-26');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50081, 26882, 'Ut dolor cupiditate rerum dolorum. Nesciunt necessitatibus voluptas ex et dolor neque id qui.', 'Sit exercitationem.', '1998-10-20');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50082, 13473, 'Autem et similique quis aspernatur.', 'Unde.', '1978-09-23');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50083, 22889, 'Neque eos voluptatem laborum qui blanditiis at id ducimus. Nemo ullam est est assumenda officia reprehenderit quam rem.', 'Placeat et.', '1995-05-19');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50084, 21556, 'Odio quam doloribus eum quae amet nemo voluptatibus aperiam. Et consectetur natus perspiciatis qui odit asperiores iusto impedit.', 'Pariatur.', '2008-08-23');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50085, 13473, 'Asperiores amet ut sed ea.', 'Est architecto.', '2003-07-19');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50086, 18654, 'Atque vero optio tempora officiis.', 'Fuga quis.', '1989-08-05');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50087, 18714, 'Vero a magnam laudantium aliquam non rerum omnis.', 'Impedit dolorem.', '2015-02-16');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50088, 15958, 'Beatae at voluptas cupiditate earum odio dolorum.', 'Aperiam illo.', '1976-09-22');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50089, 21862, 'Est nihil ullam incidunt consequatur. Non omnis est maxime nihil veritatis totam.', 'Nihil.', '1975-06-21');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50090, 22085, 'Facilis qui atque eius explicabo illum eius.', 'A.', '1977-01-22');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50091, 19933, 'Eaque velit quis eos doloremque et praesentium et.', 'Cumque.', '1989-02-10');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50092, 19557, 'Modi quasi non cum cum unde explicabo quaerat esse.', 'Accusamus.', '2005-12-17');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50093, 11037, 'Eos nulla assumenda consequatur voluptatibus sint. Saepe ipsam doloremque quas debitis.', 'Blanditiis illo.', '2003-10-27');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50094, 14241, 'Omnis ut quis et vitae.', 'Quia qui.', '1993-09-05');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50095, 26004, 'Qui recusandae est est quis.', 'Aut optio.', '1974-05-07');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50096, 16195, 'Nulla doloribus accusantium quam.', 'Et qui.', '1991-04-23');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50097, 16475, 'Cum vero consequatur inventore tempora. Nulla et ab eaque nam.', 'Incidunt.', '2013-01-05');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50098, 25332, 'Ut voluptas eligendi tempora corporis.', 'Sit autem.', '2005-07-02');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50099, 16475, 'Quis et et non molestiae. Laborum facere ratione et ratione voluptatibus excepturi.', 'Ut.', '2022-12-25');
INSERT INTO `TIBBI_GECMIS` (`id`, `hayvan_no`, `diagnosis`, `treatment`, `visit_date`) VALUES (50100, 21780, 'Aspernatur rerum minima aliquam tempore ut. Aperiam quo eius minus dolorem.', 'Maxime.', '1972-09-09');

Veritabanı

ALTER TABLE Stajer RENAME TO Stajyer;
ALTER TABLE Ameliyat ADD açıklama VARCHAR(255);
ALTER TABLE RECETE MODIFY id INT AUTO_INCREMENT;
ALTER TABLE AMELIYAT MODIFY COLUMN saat TIME;

alter table recete add tarih date

ALTER TABLE `RECETE`
ADD COLUMN `stajyer_no` INT,
ADD COLUMN `status` ENUM('pending', 'approved', 'rejected') DEFAULT 'pending',
ADD CONSTRAINT `fk_recete_stajyer` FOREIGN KEY (`stajyer_no`) REFERENCES `STAJYER`(`num`) ON DELETE CASCADE ON UPDATE CASCADE;


UPDATE TIBBI_GECMIS SET diagnosis = 'Kırık bacak', treatment = 'Alçı tedavisi uygulandı' WHERE id = 50000;
UPDATE TIBBI_GECMIS SET diagnosis = 'Solunum yolu enfeksiyonu', treatment = 'Antibiyotik tedavisi başlatıldı' WHERE id = 50001;
UPDATE TIBBI_GECMIS SET diagnosis = 'Cilt enfeksiyonu', treatment = 'Antifungal krem uygulandı' WHERE id = 50002;
UPDATE TIBBI_GECMIS SET diagnosis = 'Artrit', treatment = 'Ağrı kesici ve fizik tedavi önerildi' WHERE id = 50003;
UPDATE TIBBI_GECMIS SET diagnosis = 'Deri enfeksiyonu', treatment = 'Topikal antibiyotik tedavisi' WHERE id = 50004;
UPDATE TIBBI_GECMIS SET diagnosis = 'Diş apsesi', treatment = 'Cerrahi müdahale ve antibiyotik uygulandı' WHERE id = 50005;
UPDATE TIBBI_GECMIS SET diagnosis = 'Göz enfeksiyonu', treatment = 'Steroidli göz damlası kullanımı' WHERE id = 50006;
UPDATE TIBBI_GECMIS SET diagnosis = 'Gastrit', treatment = 'Antiasit tedavisi ve diyet önerisi' WHERE id = 50007;
UPDATE TIBBI_GECMIS SET diagnosis = 'Zatürre', treatment = 'Yoğun antibiyotik tedavisi uygulandı' WHERE id = 50008;
UPDATE TIBBI_GECMIS SET diagnosis = 'Böbrek taşı', treatment = 'Ultrason destekli cerrahi işlem uygulandı' WHERE id = 50009;
UPDATE TIBBI_GECMIS SET diagnosis = 'Kalp yetmezliği', treatment = 'Kardiyolojik ilaç tedavisi' WHERE id = 50010;
UPDATE TIBBI_GECMIS SET diagnosis = 'Karaciğer yağlanması', treatment = 'Diyet ve egzersiz düzenlendi' WHERE id = 50011;
UPDATE TIBBI_GECMIS SET diagnosis = 'Bağırsak iltihabı', treatment = 'Anti-inflamatuar ilaçlar reçete edildi' WHERE id = 50012;
UPDATE TIBBI_GECMIS SET diagnosis = 'Alerjik reaksiyon', treatment = 'Antihistamin tedavisi uygulandı' WHERE id = 50013;
UPDATE TIBBI_GECMIS SET diagnosis = 'Mantar enfeksiyonu', treatment = 'Topikal antifungal ilaç kullanımı' WHERE id = 50014;
UPDATE TIBBI_GECMIS SET diagnosis = 'Omurga travması', treatment = 'Dinlenme ve fizik tedavi önerildi' WHERE id = 50015;
UPDATE TIBBI_GECMIS SET diagnosis = 'Kas zayıflığı', treatment = 'Vitamin ve mineral takviyesi' WHERE id = 50016;
UPDATE TIBBI_GECMIS SET diagnosis = 'Romatizmal hastalık', treatment = 'Antiromatizmal ilaç tedavisi' WHERE id = 50017;
UPDATE TIBBI_GECMIS SET diagnosis = 'Kanser', treatment = 'Kemoterapi ve radyoterapi uygulandı' WHERE id = 50018;
UPDATE TIBBI_GECMIS SET diagnosis = 'Epilepsi', treatment = 'Antikonvülsan ilaç tedavisi' WHERE id = 50019;
UPDATE TIBBI_GECMIS SET diagnosis = 'Tansiyon yüksekliği', treatment = 'Hipotansif ilaçlar reçete edildi' WHERE id = 50020;
UPDATE TIBBI_GECMIS SET diagnosis = 'Düşük bağışıklık', treatment = 'Bağışıklık güçlendirici tedavi' WHERE id = 50021;
UPDATE TIBBI_GECMIS SET diagnosis = 'Akut stres bozukluğu', treatment = 'Rahatlatıcı ilaç tedavisi' WHERE id = 50022;
UPDATE TIBBI_GECMIS SET diagnosis = 'Kilo kaybı', treatment = 'Diyet düzenlemesi yapıldı' WHERE id = 50023;
UPDATE TIBBI_GECMIS SET diagnosis = 'Hafif travmatik beyin hasarı', treatment = 'Dinlenme ve gözlem' WHERE id = 50024;
UPDATE TIBBI_GECMIS SET diagnosis = 'Solunum güçlüğü', treatment = 'Oksijen tedavisi uygulandı' WHERE id = 50025;
UPDATE TIBBI_GECMIS SET diagnosis = 'Bulaşıcı hastalık', treatment = 'Karantina ve antibiyotik tedavisi' WHERE id = 50026;
UPDATE TIBBI_GECMIS SET diagnosis = 'Sıcak çarpması', treatment = 'Soğutma ve sıvı tedavisi' WHERE id = 50027;
UPDATE TIBBI_GECMIS SET diagnosis = 'Kas yırtılması', treatment = 'Fizik tedavi uygulandı' WHERE id = 50028;
UPDATE TIBBI_GECMIS SET diagnosis = 'Kulak enfeksiyonu', treatment = 'Kulak damlası ve ağrı kesici tedavisi' WHERE id = 50029;
UPDATE TIBBI_GECMIS SET diagnosis = 'Gıda zehirlenmesi', treatment = 'Hidrasyon ve diyet önerisi' WHERE id = 50030;
UPDATE TIBBI_GECMIS SET diagnosis = 'Cilt yarası', treatment = 'Dikiş ve antibiyotik tedavisi' WHERE id = 50031;
UPDATE TIBBI_GECMIS SET diagnosis = 'Kan pıhtılaşması', treatment = 'Antikoagülan ilaçlar reçete edildi' WHERE id = 50032;
UPDATE TIBBI_GECMIS SET diagnosis = 'Tümör', treatment = 'Cerrahi müdahale ve kemoterapi' WHERE id = 50033;
UPDATE TIBBI_GECMIS SET diagnosis = 'Deri döküntüsü', treatment = 'Kortikosteroid tedavisi' WHERE id = 50034;
UPDATE TIBBI_GECMIS SET diagnosis = 'Kansızlık', treatment = 'Demir takviyesi reçete edildi' WHERE id = 50035;
UPDATE TIBBI_GECMIS SET diagnosis = 'Şeker hastalığı', treatment = 'İnsülin tedavisi ve diyet düzenlemesi' WHERE id = 50036;
UPDATE TIBBI_GECMIS SET diagnosis = 'Yüksek ateş', treatment = 'Ateş düşürücü ve sıvı tedavisi' WHERE id = 50037;
UPDATE TIBBI_GECMIS SET diagnosis = 'Kulak kiri tıkanıklığı', treatment = 'Kulak temizliği yapıldı' WHERE id = 50038;
UPDATE TIBBI_GECMIS SET diagnosis = 'Kas spazmı', treatment = 'Fizik tedavi ve ağrı kesici ilaçlar' WHERE id = 50039;
UPDATE TIBBI_GECMIS SET diagnosis = 'Bağırsak paraziti', treatment = 'Antiparaziter ilaç kullanımı' WHERE id = 50040;
UPDATE TIBBI_GECMIS SET diagnosis = 'Solunum güçlüğü', treatment = 'Bronkodilatör tedavi uygulandı' WHERE id = 50041;
UPDATE TIBBI_GECMIS SET diagnosis = 'Kulak enfeksiyonu', treatment = 'Antibiyotik damla ve temizleme işlemi' WHERE id = 50042;
UPDATE TIBBI_GECMIS SET diagnosis = 'Kronik böbrek hastalığı', treatment = 'Düşük proteinli diyet ve ilaç tedavisi' WHERE id = 50043;
UPDATE TIBBI_GECMIS SET diagnosis = 'Göz travması', treatment = 'Steroidli göz damlası ve göz bandajı' WHERE id = 50044;
UPDATE TIBBI_GECMIS SET diagnosis = 'Zehirlenme', treatment = 'Toksin temizleme ve sıvı tedavisi' WHERE id = 50045;
UPDATE TIBBI_GECMIS SET diagnosis = 'Mide kanaması', treatment = 'Proton pompa inhibitörü tedavisi' WHERE id = 50046;
UPDATE TIBBI_GECMIS SET diagnosis = 'Sinir zedelenmesi', treatment = 'Fizik tedavi ve ağrı yönetimi' WHERE id = 50047;
UPDATE TIBBI_GECMIS SET diagnosis = 'Kasılma nöbeti', treatment = 'Antikonvülsan ilaç tedavisi başlatıldı' WHERE id = 50048;
UPDATE TIBBI_GECMIS SET diagnosis = 'Diş çürümesi', treatment = 'Diş çekimi ve temizleme yapıldı' WHERE id = 50049;
UPDATE TIBBI_GECMIS SET diagnosis = 'Cilt tahrişi', treatment = 'Antihistamin ve kortizon krem uygulandı' WHERE id = 50050;
UPDATE TIBBI_GECMIS SET diagnosis = 'Enfekte yara', treatment = 'Antibiyotik tedavisi ve yara temizliği' WHERE id = 50051;
UPDATE TIBBI_GECMIS SET diagnosis = 'Eklem iltihabı', treatment = 'Anti-inflamatuar tedavi ve dinlenme' WHERE id = 50052;
UPDATE TIBBI_GECMIS SET diagnosis = 'Kemik kırığı', treatment = 'Alçı tedavisi uygulandı' WHERE id = 50053;
UPDATE TIBBI_GECMIS SET diagnosis = 'Bağırsak tıkanıklığı', treatment = 'Cerrahi müdahale gerçekleştirildi' WHERE id = 50054;
UPDATE TIBBI_GECMIS SET diagnosis = 'Kan zehirlenmesi (sepsis)', treatment = 'Yoğun antibiyotik tedavisi' WHERE id = 50055;
UPDATE TIBBI_GECMIS SET diagnosis = 'Tüy dökülmesi', treatment = 'Vitamin ve mineral desteği önerildi' WHERE id = 50056;
UPDATE TIBBI_GECMIS SET diagnosis = 'Cilt tümörü', treatment = 'Cerrahi müdahale ve takip tedavisi' WHERE id = 50057;
UPDATE TIBBI_GECMIS SET diagnosis = 'Tırnak enfeksiyonu', treatment = 'Antifungal tedavi uygulandı' WHERE id = 50058;
UPDATE TIBBI_GECMIS SET diagnosis = 'Anemi', treatment = 'Demir ve folik asit takviyesi' WHERE id = 50059;
UPDATE TIBBI_GECMIS SET diagnosis = 'Hipotiroidizm', treatment = 'Hormon tedavisi başlatıldı' WHERE id = 50060;
UPDATE TIBBI_GECMIS SET diagnosis = 'İştahsızlık', treatment = 'Aperatif ilaç ve diyet önerisi' WHERE id = 50061;
UPDATE TIBBI_GECMIS SET diagnosis = 'Hiperaktivite', treatment = 'Davranışsal terapi önerildi' WHERE id = 50062;
UPDATE TIBBI_GECMIS SET diagnosis = 'İdrar yolu enfeksiyonu', treatment = 'Antibiyotik tedavisi' WHERE id = 50063;
UPDATE TIBBI_GECMIS SET diagnosis = 'Sırt ağrısı', treatment = 'Fizik tedavi ve ağrı kesici tedavisi' WHERE id = 50064;
UPDATE TIBBI_GECMIS SET diagnosis = 'Cilt kuruluğu', treatment = 'Nemlendirici kremler ve omega-3 takviyesi' WHERE id = 50065;
UPDATE TIBBI_GECMIS SET diagnosis = 'Gıda intoleransı', treatment = 'Özel diyet planlandı' WHERE id = 50066;
UPDATE TIBBI_GECMIS SET diagnosis = 'Kas sertliği', treatment = 'Fizik tedavi ve kas gevşetici ilaç' WHERE id = 50067;
UPDATE TIBBI_GECMIS SET diagnosis = 'Omurilik hasarı', treatment = 'Cerrahi müdahale ve dinlenme' WHERE id = 50068;
UPDATE TIBBI_GECMIS SET diagnosis = 'Tüy mantarı', treatment = 'Antifungal şampuan ve ilaç tedavisi' WHERE id = 50069;
UPDATE TIBBI_GECMIS SET diagnosis = 'İshal', treatment = 'Probiyotikler ve diyet düzenlemesi' WHERE id = 50070;
UPDATE TIBBI_GECMIS SET diagnosis = 'Mide bulantısı', treatment = 'Antiemetik ilaç ve sıvı takviyesi' WHERE id = 50071;
UPDATE TIBBI_GECMIS SET diagnosis = 'Kronik yorgunluk', treatment = 'Diyet ve vitamin desteği' WHERE id = 50072;
UPDATE TIBBI_GECMIS SET diagnosis = 'Kemik erimesi', treatment = 'Kalsiyum ve D vitamini takviyesi' WHERE id = 50073;
UPDATE TIBBI_GECMIS SET diagnosis = 'İç kanama', treatment = 'Acil cerrahi müdahale' WHERE id = 50074;
UPDATE TIBBI_GECMIS SET diagnosis = 'Yara enfeksiyonu', treatment = 'Antiseptik tedavi ve antibiyotik uygulaması' WHERE id = 50075;
UPDATE TIBBI_GECMIS SET diagnosis = 'Duyma kaybı', treatment = 'Kulak temizliği ve destek cihaz önerisi' WHERE id = 50076;
UPDATE TIBBI_GECMIS SET diagnosis = 'Egzama', treatment = 'Kortikosteroid krem ve antihistamin ilaç' WHERE id = 50077;
UPDATE TIBBI_GECMIS SET diagnosis = 'Sıvı kaybı (dehidrasyon)', treatment = 'İntravenöz sıvı tedavisi' WHERE id = 50078;
UPDATE TIBBI_GECMIS SET diagnosis = 'Diz yaralanması', treatment = 'Cerrahi müdahale ve fizik tedavi' WHERE id = 50079;
UPDATE TIBBI_GECMIS SET diagnosis = 'Tansiyon düşüklüğü', treatment = 'Sıvı tedavisi ve izotonik çözeltiler' WHERE id = 50080;
UPDATE TIBBI_GECMIS SET diagnosis = 'Göz kuruluğu', treatment = 'Nemlendirici göz damlası uygulandı' WHERE id = 50081;
UPDATE TIBBI_GECMIS SET diagnosis = 'Cilt yanığı', treatment = 'Yanık kremi ve bandaj uygulandı' WHERE id = 50082;
UPDATE TIBBI_GECMIS SET diagnosis = 'Kas kasılması', treatment = 'Kas gevşetici ilaç ve sıcak kompres' WHERE id = 50083;
UPDATE TIBBI_GECMIS SET diagnosis = 'Bacak burkulması', treatment = 'Buz tedavisi ve bandaj uygulandı' WHERE id = 50084;
UPDATE TIBBI_GECMIS SET diagnosis = 'Deri döküntüsü', treatment = 'Kortikosteroid krem ve antihistamin tedavisi' WHERE id = 50085;
UPDATE TIBBI_GECMIS SET diagnosis = 'Bağırsak paraziti', treatment = 'Antiparaziter ilaç reçete edildi' WHERE id = 50086;
UPDATE TIBBI_GECMIS SET diagnosis = 'İştahsızlık', treatment = 'Beslenme takviyesi ve iştah açıcı ilaç' WHERE id = 50087;
UPDATE TIBBI_GECMIS SET diagnosis = 'Diş iltihabı', treatment = 'Ağrıyı hafifletmek için antibiyotik tedavisi' WHERE id = 50088;
UPDATE TIBBI_GECMIS SET diagnosis = 'Enfeksiyonlu apse', treatment = 'Apsenin boşaltılması ve antibiyotik tedavisi' WHERE id = 50089;
UPDATE TIBBI_GECMIS SET diagnosis = 'Kulak akarları', treatment = 'Akar öldürücü damla uygulandı' WHERE id = 50090;
UPDATE TIBBI_GECMIS SET diagnosis = 'Romatizma', treatment = 'Romatizmal ilaç tedavisi ve egzersiz programı' WHERE id = 50091;
UPDATE TIBBI_GECMIS SET diagnosis = 'Kronik öksürük', treatment = 'Bronkodilatör ve öksürük şurubu tedavisi' WHERE id = 50092;
UPDATE TIBBI_GECMIS SET diagnosis = 'Böbrek enfeksiyonu', treatment = 'Antibiyotik tedavisi ve sıvı desteği' WHERE id = 50093;
UPDATE TIBBI_GECMIS SET diagnosis = 'Tüy dökülmesi', treatment = 'Vitamin takviyesi ve topikal tedavi' WHERE id = 50094;
UPDATE TIBBI_GECMIS SET diagnosis = 'Karın ağrısı', treatment = 'Antispazmodik ilaç ve diyet düzenlemesi' WHERE id = 50095;
UPDATE TIBBI_GECMIS SET diagnosis = 'Sırt ağrısı', treatment = 'Fizik tedavi ve ağrı kesici ilaç' WHERE id = 50096;
UPDATE TIBBI_GECMIS SET diagnosis = 'Kist', treatment = 'Cerrahi müdahale ile çıkarıldı' WHERE id = 50097;
UPDATE TIBBI_GECMIS SET diagnosis = 'Burun tıkanıklığı', treatment = 'Dekonjestan burun damlası uygulandı' WHERE id = 50098;
UPDATE TIBBI_GECMIS SET diagnosis = 'Aşırı kilo', treatment = 'Diyet ve egzersiz programı oluşturuldu' WHERE id = 50099;
UPDATE TIBBI_GECMIS SET diagnosis = 'Göz enfeksiyonu', treatment = 'Antibiyotik göz damlası reçete edildi' WHERE id = 50100;

ALTER TABLE `TIBBI_GECMIS` MODIFY COLUMN `id` INT(11) NOT NULL AUTO_INCREMENT;



