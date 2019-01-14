/*
Navicat MySQL Data Transfer

Source Server         : khjgcxfghb
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : silownia

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-01-14 12:00:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `adres`
-- ----------------------------
DROP TABLE IF EXISTS `adres`;
CREATE TABLE `adres` (
  `id_adres` int(10) NOT NULL AUTO_INCREMENT,
  `street` varchar(15) DEFAULT NULL,
  `code` varchar(5) DEFAULT NULL,
  `city` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_adres`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adres
-- ----------------------------
INSERT INTO `adres` VALUES ('1', 'Skarżyńskiego', '3', 'Kraków');
INSERT INTO `adres` VALUES ('2', 'Bora', '27', 'Kraków');
INSERT INTO `adres` VALUES ('15', 'Wesoła', '4', 'Kraków');
INSERT INTO `adres` VALUES ('17', 'Niebieska', '45', 'Kraków');
INSERT INTO `adres` VALUES ('26', 'Kebab', '345', 'Kraków');
INSERT INTO `adres` VALUES ('28', 'Nowa', '91', 'Kraków');
INSERT INTO `adres` VALUES ('30', 'Miła', '32', 'Kraków');
INSERT INTO `adres` VALUES ('31', 'Polna', '23', 'Kraków');
INSERT INTO `adres` VALUES ('32', 'Warszawska', '13', 'Kraków');
INSERT INTO `adres` VALUES ('33', 'Miodowa', '525', 'Kraków');
INSERT INTO `adres` VALUES ('34', 'Wspólna', '45', 'Kraków');
INSERT INTO `adres` VALUES ('35', 'Warszawska', '12', 'Kraków');
INSERT INTO `adres` VALUES ('36', 'Grotgera', '87', 'Kraków');
INSERT INTO `adres` VALUES ('37', 'Miechowity', '57', 'Kraków');
INSERT INTO `adres` VALUES ('38', 'Dobra', '135', 'Kraków');
INSERT INTO `adres` VALUES ('39', 'Zielona', '321', 'Kraków');
INSERT INTO `adres` VALUES ('40', 'Kolorowa', '43', 'Kraków');

-- ----------------------------
-- Table structure for `entrance`
-- ----------------------------
DROP TABLE IF EXISTS `entrance`;
CREATE TABLE `entrance` (
  `id_entrance` int(10) NOT NULL AUTO_INCREMENT,
  `begin_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `id_person` int(10) NOT NULL,
  `id_type` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_entrance`),
  KEY `fk_person` (`id_person`),
  KEY `fk_type` (`id_type`),
  CONSTRAINT `id_person` FOREIGN KEY (`id_person`) REFERENCES `person` (`id_person`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_type` FOREIGN KEY (`id_type`) REFERENCES `entr_type` (`id_type`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of entrance
-- ----------------------------
INSERT INTO `entrance` VALUES ('17', '2018-04-12 12:32:12', '2018-10-09 12:32:12', '2', '2');
INSERT INTO `entrance` VALUES ('18', '2018-07-20 18:15:12', '2019-01-16 18:15:12', '5', '2');
INSERT INTO `entrance` VALUES ('19', '2018-11-10 14:52:15', '2019-05-09 14:52:15', '6', '2');
INSERT INTO `entrance` VALUES ('20', '2018-10-05 10:44:16', '2019-04-03 10:44:16', '9', '2');
INSERT INTO `entrance` VALUES ('21', '2018-01-23 02:33:14', '2018-07-22 02:33:14', '11', '2');
INSERT INTO `entrance` VALUES ('22', '2018-04-12 15:27:13', '2018-10-09 15:27:13', '12', '2');
INSERT INTO `entrance` VALUES ('23', '2019-01-02 14:19:12', '2019-07-01 14:19:12', '3', '2');
INSERT INTO `entrance` VALUES ('24', '2018-05-20 17:42:14', '2019-05-20 17:42:14', '4', '1');
INSERT INTO `entrance` VALUES ('25', '2018-01-11 19:34:15', '2019-01-11 19:34:15', '7', '1');
INSERT INTO `entrance` VALUES ('26', '2018-08-09 21:27:12', '2019-08-09 21:27:12', '8', '1');
INSERT INTO `entrance` VALUES ('27', '2018-10-30 11:35:32', '2019-10-30 11:35:32', '13', '1');
INSERT INTO `entrance` VALUES ('28', '2018-06-10 03:31:22', '2019-06-10 03:31:22', '14', '1');
INSERT INTO `entrance` VALUES ('29', '2018-04-30 15:35:32', '2019-04-30 15:35:32', '10', '1');
INSERT INTO `entrance` VALUES ('30', '2019-01-14 11:45:55', '2019-07-13 11:45:55', '17', '2');

-- ----------------------------
-- Table structure for `entrance_log`
-- ----------------------------
DROP TABLE IF EXISTS `entrance_log`;
CREATE TABLE `entrance_log` (
  `id_log` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_log` datetime NOT NULL,
  `id_entrance` int(10) NOT NULL,
  PRIMARY KEY (`id_log`,`id_entrance`),
  KEY `id_entrance` (`id_entrance`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8
/*!50100 PARTITION BY RANGE (id_entrance)
(PARTITION p0 VALUES LESS THAN (100) ENGINE = InnoDB,
 PARTITION p1 VALUES LESS THAN (200) ENGINE = InnoDB,
 PARTITION p2 VALUES LESS THAN (300) ENGINE = InnoDB,
 PARTITION p3 VALUES LESS THAN (400) ENGINE = InnoDB) */;

-- ----------------------------
-- Records of entrance_log
-- ----------------------------
INSERT INTO `entrance_log` VALUES ('17', '2019-01-14 02:14:26', '18');
INSERT INTO `entrance_log` VALUES ('18', '2019-01-14 02:14:29', '20');
INSERT INTO `entrance_log` VALUES ('19', '2019-01-14 02:14:32', '24');
INSERT INTO `entrance_log` VALUES ('20', '2018-04-15 18:43:12', '17');
INSERT INTO `entrance_log` VALUES ('21', '2018-08-15 13:33:00', '17');
INSERT INTO `entrance_log` VALUES ('22', '2018-05-15 15:46:11', '17');
INSERT INTO `entrance_log` VALUES ('23', '2018-05-15 12:23:12', '17');
INSERT INTO `entrance_log` VALUES ('24', '2018-06-15 11:12:12', '17');
INSERT INTO `entrance_log` VALUES ('25', '2018-07-15 10:40:15', '17');
INSERT INTO `entrance_log` VALUES ('26', '2018-10-08 13:00:20', '17');
INSERT INTO `entrance_log` VALUES ('27', '2018-07-30 18:43:12', '18');
INSERT INTO `entrance_log` VALUES ('28', '2018-10-15 13:33:00', '18');
INSERT INTO `entrance_log` VALUES ('29', '2018-11-11 15:46:11', '18');
INSERT INTO `entrance_log` VALUES ('30', '2018-11-12 12:23:12', '18');
INSERT INTO `entrance_log` VALUES ('31', '2018-10-23 11:12:12', '18');
INSERT INTO `entrance_log` VALUES ('32', '2018-12-30 10:40:15', '18');
INSERT INTO `entrance_log` VALUES ('33', '2019-01-08 13:00:20', '18');
INSERT INTO `entrance_log` VALUES ('34', '2018-11-30 18:43:12', '19');
INSERT INTO `entrance_log` VALUES ('35', '2018-12-05 13:33:00', '19');
INSERT INTO `entrance_log` VALUES ('36', '2018-12-11 15:46:11', '19');
INSERT INTO `entrance_log` VALUES ('37', '2018-12-12 12:23:12', '19');
INSERT INTO `entrance_log` VALUES ('38', '2018-01-03 11:12:12', '19');
INSERT INTO `entrance_log` VALUES ('39', '2018-01-10 10:40:15', '19');
INSERT INTO `entrance_log` VALUES ('40', '2018-11-30 18:43:12', '20');
INSERT INTO `entrance_log` VALUES ('41', '2018-12-05 13:33:00', '20');
INSERT INTO `entrance_log` VALUES ('42', '2018-10-11 15:46:11', '20');
INSERT INTO `entrance_log` VALUES ('43', '2018-12-12 12:23:12', '20');
INSERT INTO `entrance_log` VALUES ('44', '2018-01-03 11:12:12', '20');
INSERT INTO `entrance_log` VALUES ('45', '2019-01-08 13:00:20', '20');
INSERT INTO `entrance_log` VALUES ('46', '2018-01-30 18:43:12', '21');
INSERT INTO `entrance_log` VALUES ('47', '2018-03-05 13:33:00', '21');
INSERT INTO `entrance_log` VALUES ('48', '2018-02-11 15:46:11', '21');
INSERT INTO `entrance_log` VALUES ('49', '2018-03-12 12:23:12', '21');
INSERT INTO `entrance_log` VALUES ('50', '2018-05-03 11:12:12', '21');
INSERT INTO `entrance_log` VALUES ('51', '2018-06-10 10:40:15', '21');
INSERT INTO `entrance_log` VALUES ('53', '2018-04-30 18:43:12', '22');
INSERT INTO `entrance_log` VALUES ('54', '2018-05-05 13:33:00', '22');
INSERT INTO `entrance_log` VALUES ('55', '2018-07-11 15:46:11', '22');
INSERT INTO `entrance_log` VALUES ('56', '2018-09-12 12:23:12', '22');
INSERT INTO `entrance_log` VALUES ('57', '2018-10-03 11:12:12', '22');
INSERT INTO `entrance_log` VALUES ('58', '2019-01-10 10:40:15', '23');
INSERT INTO `entrance_log` VALUES ('59', '2019-01-08 13:00:20', '23');
INSERT INTO `entrance_log` VALUES ('60', '2018-05-30 18:43:12', '24');
INSERT INTO `entrance_log` VALUES ('61', '2018-10-05 13:33:00', '24');
INSERT INTO `entrance_log` VALUES ('62', '2018-07-11 15:46:11', '24');
INSERT INTO `entrance_log` VALUES ('63', '2018-09-12 12:23:12', '24');
INSERT INTO `entrance_log` VALUES ('64', '2018-10-03 11:12:12', '25');
INSERT INTO `entrance_log` VALUES ('65', '2018-01-10 10:40:15', '25');
INSERT INTO `entrance_log` VALUES ('66', '2019-01-08 13:00:20', '26');

-- ----------------------------
-- Table structure for `entr_type`
-- ----------------------------
DROP TABLE IF EXISTS `entr_type`;
CREATE TABLE `entr_type` (
  `id_type` int(10) unsigned NOT NULL,
  `price` float(10,0) unsigned NOT NULL,
  `name_of_type` varchar(20) NOT NULL,
  `duration` int(5) NOT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of entr_type
-- ----------------------------
INSERT INTO `entr_type` VALUES ('1', '50', 'premium', '365');
INSERT INTO `entr_type` VALUES ('2', '40', 'normal', '180');

-- ----------------------------
-- Table structure for `person`
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id_person` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `surname` varchar(80) NOT NULL,
  `email` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` int(11) unsigned NOT NULL,
  `id_adres` int(10) DEFAULT NULL,
  `id_P_Type` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_person`),
  KEY `id_adres` (`id_adres`),
  KEY `id_P_Type` (`id_P_Type`),
  CONSTRAINT `id_P_Type` FOREIGN KEY (`id_P_Type`) REFERENCES `per_type` (`id_P_Type`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_adres` FOREIGN KEY (`id_adres`) REFERENCES `adres` (`id_adres`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10091 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('1', 'Karolina', 'Jasińska', 'kjaisn@gmail.com', '$2y$10$W0g2u2MXmSzKiMufexAvC.Jk244W5Bin6ci7ZFq9dFUI3nUOknx7.', '123123654', '1', '1');
INSERT INTO `person` VALUES ('2', 'Kamila', 'Sroka', 'ks@gmail.com', '$2y$10$W0g2u2MXmSzKiMufexAvC.Jk244W5Bin6ci7ZFq9dFUI3nUOknx7.', '123987654', '2', '2');
INSERT INTO `person` VALUES ('3', 'Aleksandra', 'Kula', 'ak@gmail.com', '$2y$10$Z7HBBdOkwMLouJ3C.JUt3eDQx.Ce3iE6luwwEHjjAh02R4F/x4VNS', '596074958', '15', '2');
INSERT INTO `person` VALUES ('4', 'Agnieszka', 'Kowal', 'akk@gmail.com', '$2y$10$GdCimcHWNFfK98FhNfhAQu6l.wft8w3rMytbbVVdGuk1ebqtzCPqm', '394850697', '17', '2');
INSERT INTO `person` VALUES ('5', 'Mirosław', 'Fajny', 'mf@gmail.com', '$2y$10$Qkob/sLUp8xnKRyqq5c/Iu1/aAIMvrPOLh9CFR66rMIi4s5ZAP/ti', '405967476', '26', '2');
INSERT INTO `person` VALUES ('6', 'Mikołaj', 'Święty', 'ms@gmail.com', '$2y$10$NJYj/KnWWYEMdJssHrdI4.Z8O52A61GZPaaToh2Dx0lMgBh7Shx0W', '495867321', '28', '2');
INSERT INTO `person` VALUES ('7', 'Konrad', 'Piaseczny', 'ww@gmail.com', '$2y$10$eoeOumN0PQbjcoVExYhXDOsjDOOpD2nelzrJ83QmL6s1LKp9pZGNK', '495867675', '30', '2');
INSERT INTO `person` VALUES ('8', 'Żaklina', 'Łabędź', 'kk@gmail.com', '$2y$10$eoeOumN0PQbjcoVExYhXDOsjDOOpD2nelzrJ83QmL6s1LKp9pZGNK', '495867675', '31', '2');
INSERT INTO `person` VALUES ('9', 'Piotr', 'Noga', 'pn@gmail.com', '$2y$10$eoeOumN0PQbjcoVExYhXDOsjDOOpD2nelzrJ83QmL6s1LKp9pZGNK', '203045950', '32', '2');
INSERT INTO `person` VALUES ('10', 'Kamil', 'Nowak', 'kn@gmail.com', '$2y$10$eoeOumN0PQbjcoVExYhXDOsjDOOpD2nelzrJ83QmL6s1LKp9pZGNK', '395869785', '33', '2');
INSERT INTO `person` VALUES ('11', 'Krzysztof', 'Krawczyk', 'kkr@gmail.com', '$2y$10$eoeOumN0PQbjcoVExYhXDOsjDOOpD2nelzrJ83QmL6s1LKp9pZGNK', '554332356', '34', '2');
INSERT INTO `person` VALUES ('12', 'Grzegorz', 'Las', 'gl@gmail.com', '$2y$10$eoeOumN0PQbjcoVExYhXDOsjDOOpD2nelzrJ83QmL6s1LKp9pZGNK', '304958056', '35', '2');
INSERT INTO `person` VALUES ('13', 'Damian', 'Niedźwiedź', 'dn@gmail.com', '$2y$10$eoeOumN0PQbjcoVExYhXDOsjDOOpD2nelzrJ83QmL6s1LKp9pZGNK', '876543564', '36', '2');
INSERT INTO `person` VALUES ('14', 'Norbert', 'Kabel', 'nk@gmail.com', '$2y$10$eoeOumN0PQbjcoVExYhXDOsjDOOpD2nelzrJ83QmL6s1LKp9pZGNK', '234683457', '37', '2');
INSERT INTO `person` VALUES ('15', 'Katarzyna', 'Osa', 'ko@gmail.com', '$2y$10$eoeOumN0PQbjcoVExYhXDOsjDOOpD2nelzrJ83QmL6s1LKp9pZGNK', '68476236', '38', '2');
INSERT INTO `person` VALUES ('16', 'Szczepan', 'Nosal', 'sn@gmail.com', '$2y$10$eoeOumN0PQbjcoVExYhXDOsjDOOpD2nelzrJ83QmL6s1LKp9pZGNK', '69584395', '39', '2');
INSERT INTO `person` VALUES ('17', 'Sebastian', 'Struś', 'ss@gmail.com', '$2y$10$eoeOumN0PQbjcoVExYhXDOsjDOOpD2nelzrJ83QmL6s1LKp9pZGNK', '304950495', '40', '2');

-- ----------------------------
-- Table structure for `per_type`
-- ----------------------------
DROP TABLE IF EXISTS `per_type`;
CREATE TABLE `per_type` (
  `id_P_Type` int(10) unsigned NOT NULL,
  `role` varchar(15) NOT NULL,
  PRIMARY KEY (`id_P_Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of per_type
-- ----------------------------
INSERT INTO `per_type` VALUES ('1', 'Admin');
INSERT INTO `per_type` VALUES ('2', 'Klient');

-- ----------------------------
-- View structure for `vperson_entrance_type`
-- ----------------------------
DROP VIEW IF EXISTS `vperson_entrance_type`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vperson_entrance_type` AS select `e`.`id_entrance` AS `id_entrance`,`e`.`begin_date` AS `begin_date`,`e`.`end_date` AS `end_date`,`p`.`id_person` AS `id_person`,`p`.`name` AS `name`,`p`.`surname` AS `surname`,`t`.`name_of_type` AS `name_of_type` from ((`entrance` `e` join `person` `p` on((`e`.`id_person` = `p`.`id_person`))) join `entr_type` `t` on((`e`.`id_type` = `t`.`id_type`))) ;

-- ----------------------------
-- Procedure structure for `find_adress`
-- ----------------------------
DROP PROCEDURE IF EXISTS `find_adress`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `find_adress`(IN `id_add` INT(10))
BEGIN
Select * from adres where id_adres=id_add;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `pShowCarnet`
-- ----------------------------
DROP PROCEDURE IF EXISTS `pShowCarnet`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pShowCarnet`(IN `idPerson` INT(10))
BEGIN
select * from entrance e join entr_type t on(e.id_type=t.id_type) where e.id_person=idPerson;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `p_schow_dateLog`
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_schow_dateLog`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_schow_dateLog`(IN `id_p` INT)
BEGIN
	#Routine body goes here...
SELECT l.date_log FROM entrance_log l WHERE l.id_entrance = (select e.id_entrance from entrance e where id_person=id_p and e.end_date>now())order by date_log desc;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `t_add_Entrance`
-- ----------------------------
DROP PROCEDURE IF EXISTS `t_add_Entrance`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `t_add_Entrance`(IN `id_p` INT, IN `id_t` INT)
BEGIN
set session transaction ISOLATION level read committed;
	#Routine body goes here...
 start TRANSACTION;
  SET autocommit = OFF;
    SELECT @Dur:=duration FROM entr_type where id_type=id_t;
    
    if((select count(*) from Entrance where id_person=id_p and end_date>now())>0)
    then
	signal sqlstate '45000' set message_text = 'Osoba posiada juz ważny karnet!';
	else 
    insert into Entrance (begin_date, end_date, id_person, id_type) values (now(),now()+interval @Dur day, id_p, id_t);
    end if;
    commit;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `t_add_Log`
-- ----------------------------
DROP PROCEDURE IF EXISTS `t_add_Log`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `t_add_Log`(IN `id_p` INT)
BEGIN
set session transaction ISOLATION level read committed;
 start TRANSACTION;
  SET autocommit = OFF;
    select @id_entr:=id_entrance from Entrance where id_person=id_p and end_date>now();
    if(@id_entr is not null)
    then
		insert into entrance_log (date_log, id_entrance) values (now(), @id_entr);
	  else 
    signal sqlstate '45000' set message_text = 'Osoba nie posiada ważnego karnetu!';
    end if;
  commit;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `t_del_OldEntrance`
-- ----------------------------
DROP PROCEDURE IF EXISTS `t_del_OldEntrance`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `t_del_OldEntrance`(IN `id_p` INT)
BEGIN
set session transaction ISOLATION level read committed;
	#Routine body goes here...
 start TRANSACTION;
  SET autocommit = OFF;
    if((select count(*) from Entrance where id_person=id_p and end_date<now())>0)
    then
	delete from Entrance where id_person=id_p;
	else 
    signal sqlstate '45000' set message_text = 'Twój karnet nadaj jest aktywny, nie mozesz dodać nowego!';
    end if;
    commit;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `fcheck_email`
-- ----------------------------
DROP FUNCTION IF EXISTS `fcheck_email`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fcheck_email`(`Qemail` VARCHAR(25) CHARSET utf8) RETURNS int(11)
BEGIN
declare exist int;
select count(*) into exist from Person where email=Qemail;

return exist;
end
;;
DELIMITER ;

-- ----------------------------
-- Event structure for `e_delete_Entrance`
-- ----------------------------
DROP EVENT IF EXISTS `e_delete_Entrance`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `e_delete_Entrance` ON SCHEDULE AT '2020-01-14 17:03:42' ON COMPLETION NOT PRESERVE ENABLE DO delete from entrance where end_date<now()
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_del_log`;
DELIMITER ;;
CREATE TRIGGER `t_del_log` BEFORE DELETE ON `entrance` FOR EACH ROW BEGIN
delete from entrance_log where id_entrance=old.id_entrance;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `t_del_entr`;
DELIMITER ;;
CREATE TRIGGER `t_del_entr` BEFORE DELETE ON `person` FOR EACH ROW BEGIN
if((select count(*) from Entrance where (id_person=old.id_person and end_date>now()) || old.id_P_Type=1)>0)
then
signal sqlstate '45000' set message_text = 'Osoba posiada wazny karnet lub jest administratorem!';
else 
delete from Entrance where id_person=old.id_person;
end if;
end
;;
DELIMITER ;
