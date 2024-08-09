-- MySQL dump 10.13  Distrib 5.7.39, for Linux (x86_64)
--
-- Host: localhost    Database: test_db
-- ------------------------------------------------------
-- Server version	5.7.39-0ubuntu0.18.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `attendence_logs`
--

LOCK TABLES `attendence_logs` WRITE;
/*!40000 ALTER TABLE `attendence_logs` DISABLE KEYS */;
INSERT INTO `attendence_logs` VALUES (1,1,'jo_sir@yopmail.com','2024-08-09 10:43:45.752522',1,2);
/*!40000 ALTER TABLE `attendence_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add blacklisted token',6,'add_blacklistedtoken'),(22,'Can change blacklisted token',6,'change_blacklistedtoken'),(23,'Can delete blacklisted token',6,'delete_blacklistedtoken'),(24,'Can view blacklisted token',6,'view_blacklistedtoken'),(25,'Can add outstanding token',7,'add_outstandingtoken'),(26,'Can change outstanding token',7,'change_outstandingtoken'),(27,'Can delete outstanding token',7,'delete_outstandingtoken'),(28,'Can view outstanding token',7,'view_outstandingtoken'),(29,'Can add user',8,'add_user'),(30,'Can change user',8,'change_user'),(31,'Can delete user',8,'delete_user'),(32,'Can view user',8,'view_user'),(33,'Can add department',9,'add_department'),(34,'Can change department',9,'change_department'),(35,'Can delete department',9,'delete_department'),(36,'Can view department',9,'view_department'),(37,'Can add cource',10,'add_cource'),(38,'Can change cource',10,'change_cource'),(39,'Can delete cource',10,'delete_cource'),(40,'Can view cource',10,'view_cource'),(41,'Can add attendence log',11,'add_attendencelog'),(42,'Can change attendence log',11,'change_attendencelog'),(43,'Can delete attendence log',11,'delete_attendencelog'),(44,'Can view attendence log',11,'view_attendencelog');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `courcess`
--

LOCK TABLES `courcess` WRITE;
/*!40000 ALTER TABLE `courcess` DISABLE KEYS */;
INSERT INTO `courcess` VALUES (1,'MCA','first','Programming C',60,'rizwan@yopmail.com','2024-08-09 10:38:37.451729','2024-08-09 10:38:37.451739',1);
/*!40000 ALTER TABLE `courcess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'CSIT','rizwan@yopmail.com','2024-08-09 10:36:51.812921');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-08-09 10:36:51.821907','1','Department object (1)',1,'[{\"added\": {}}]',9,1),(2,'2024-08-09 10:38:37.465661','1','Cource object (1)',1,'[{\"added\": {}}]',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(11,'authAPIs','attendencelog'),(10,'authAPIs','cource'),(9,'authAPIs','department'),(8,'authAPIs','user'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(6,'token_blacklist','blacklistedtoken'),(7,'token_blacklist','outstandingtoken');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-08-09 09:45:14.186358'),(2,'contenttypes','0002_remove_content_type_name','2024-08-09 09:45:14.227391'),(3,'auth','0001_initial','2024-08-09 09:45:14.358173'),(4,'auth','0002_alter_permission_name_max_length','2024-08-09 09:45:14.368311'),(5,'auth','0003_alter_user_email_max_length','2024-08-09 09:45:14.381122'),(6,'auth','0004_alter_user_username_opts','2024-08-09 09:45:14.395257'),(7,'auth','0005_alter_user_last_login_null','2024-08-09 09:45:14.408054'),(8,'auth','0006_require_contenttypes_0002','2024-08-09 09:45:14.414047'),(9,'auth','0007_alter_validators_add_error_messages','2024-08-09 09:45:14.426799'),(10,'auth','0008_alter_user_username_max_length','2024-08-09 09:45:14.441423'),(11,'auth','0009_alter_user_last_name_max_length','2024-08-09 09:45:14.455692'),(12,'auth','0010_alter_group_name_max_length','2024-08-09 09:45:14.469731'),(13,'auth','0011_update_proxy_permissions','2024-08-09 09:45:14.495173'),(14,'auth','0012_alter_user_first_name_max_length','2024-08-09 09:45:14.513643'),(15,'authAPIs','0001_initial','2024-08-09 09:45:14.856718'),(16,'admin','0001_initial','2024-08-09 09:45:14.911808'),(17,'admin','0002_logentry_remove_auto_add','2024-08-09 09:45:14.925489'),(18,'admin','0003_logentry_add_action_flag_choices','2024-08-09 09:45:14.938687'),(19,'sessions','0001_initial','2024-08-09 09:45:14.960886'),(20,'token_blacklist','0001_initial','2024-08-09 09:45:15.042256'),(21,'token_blacklist','0002_outstandingtoken_jti_hex','2024-08-09 09:45:15.070200'),(22,'token_blacklist','0003_auto_20171017_2007','2024-08-09 09:45:15.090531'),(23,'token_blacklist','0004_auto_20171017_2013','2024-08-09 09:45:15.126786'),(24,'token_blacklist','0005_remove_outstandingtoken_jti','2024-08-09 09:45:15.164817'),(25,'token_blacklist','0006_auto_20171017_2113','2024-08-09 09:45:15.201727'),(26,'token_blacklist','0007_auto_20171017_2214','2024-08-09 09:45:16.157038'),(27,'token_blacklist','0008_migrate_to_bigautofield','2024-08-09 09:45:16.326003'),(28,'token_blacklist','0010_fix_migrate_to_bigautofield','2024-08-09 09:45:16.361849'),(29,'token_blacklist','0011_linearizes_history','2024-08-09 09:45:16.364319'),(30,'token_blacklist','0012_alter_outstandingtoken_user','2024-08-09 09:45:16.379747');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('h2jkle9mlrhrb4kgq1k0q2ohkwl3qw6q','.eJxVjDsOwjAQBe_iGlmxs86Hkp4zRG_XaxJAjhQnFeLuECkFtG9m3ssM2NZx2IouwxTN2Thz-t0Y8tC8g3hHvs1W5rwuE9tdsQct9jpHfV4O9-9gRBm_dSA4qnxkcWjU1y1BQSE1CUF7sIvUVyzErpUuoVOSOilaAXugS-b9Af8gOWY:1scMj5:eB1b1DfF25NEvR2QUxMqAnj6H8yozUBjtrNyFGLyNds','2024-08-23 10:20:03.024914');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `token_blacklist_blacklistedtoken`
--

LOCK TABLES `token_blacklist_blacklistedtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `token_blacklist_outstandingtoken`
--

LOCK TABLES `token_blacklist_outstandingtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` DISABLE KEYS */;
INSERT INTO `token_blacklist_outstandingtoken` VALUES (1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyMzI4NTc3NywiaWF0IjoxNzIzMTk5Mzc3LCJqdGkiOiJlOGIzZGYyMjUxOWQ0NWZiODMxYjJlNjMzMGFjZmMxMCIsInVzZXJfaWQiOjJ9.Ss0aqjicIhrwUkKiROeT6_n7P2pC6MxR5L12RqvdwVI','2024-08-09 10:29:37.036749','2024-08-10 10:29:37.000000',2,'e8b3df22519d45fb831b2e6330acfc10'),(2,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyMzI4NjA0NCwiaWF0IjoxNzIzMTk5NjQ0LCJqdGkiOiI1MmU4OTExMTgxMTY0MjQ2YmVlOGQ1NGU0NDYxMTVkYiIsInVzZXJfaWQiOjJ9.iwxggy0aYO3D0vmx5xRH2DYQDU9lh8POOVLkGoY_hg0','2024-08-09 10:34:04.821409','2024-08-10 10:34:04.000000',2,'52e8911181164246bee8d54e446115db'),(3,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyMzI4NjM5NSwiaWF0IjoxNzIzMTk5OTk1LCJqdGkiOiI1ZDgzYTJhNzZjNTU0MWQwOTE5Mzg5OWM5ZjlhZWIzMiIsInVzZXJfaWQiOjN9.UakXxDOfTZ_hXBZjKwpTya73Cs6BFITmp_cXLMXppZ4','2024-08-09 10:39:55.178468','2024-08-10 10:39:55.000000',3,'5d83a2a76c5541d09193899c9f9aeb32');
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'rizwan ali',NULL,'rizwan@yopmail.com','pbkdf2_sha256$320000$FIKiUVZIExEAcewO3l5XsD$mml21KPgTPcUXDDTO40a2WVGe6Ny1c8npmcHjFSzc60=',NULL,NULL,NULL,'2024-08-09 10:20:03.021622',1,1,NULL,'2024-08-09 10:19:54.996995','2024-08-09 10:19:54.996997'),(2,'john wick','john_nick_123','john@yopmail.com','pbkdf2_sha256$320000$Y35EXN1B8wGm192O9LUMy8$NNRCJQYoTHUz5um2Ze/sX3xo5oBD/9bfqYj23NVNmKc=',1,NULL,NULL,'2024-08-09 10:34:04.818828',0,0,NULL,'2024-08-09 10:29:37.034421','2024-08-09 10:29:37.034423'),(3,'john wick','jo_sir_123','jo_sir@yopmail.com','pbkdf2_sha256$320000$3lFFjo6ZGWbwHuZGeXqzYp$LU1AvnXeiWoRfRlvtneRmnXmHizX7TPmmG3Rxjw+CW8=',2,NULL,NULL,'2024-08-09 10:39:55.175143',0,0,NULL,'2024-08-09 10:39:55.175154','2024-08-09 10:39:55.175156');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users_user_permissions`
--

LOCK TABLES `users_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-09 16:37:04
