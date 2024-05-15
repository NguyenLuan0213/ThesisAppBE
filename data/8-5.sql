-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: thesis
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;



LOCK TABLES `committee_member` WRITE;
/*!40000 ALTER TABLE `committee_member` DISABLE KEYS */;
INSERT INTO `committee_member` VALUES (1,'2024-05-08 15:41:43.731031','CT',1,42),(2,'2024-05-08 15:41:43.731031','TK',1,43),(3,'2024-05-08 15:42:48.599442','TV',1,44),(4,'2024-05-08 15:43:33.720864','TV',1,45),(5,'2024-05-08 15:43:41.420889','TV',1,46),(6,'2024-05-08 15:41:43.731031','CT',2,47),(7,'2024-05-08 15:41:43.731031','TK',2,48),(8,'2024-05-08 15:42:48.599442','TV',2,49),(9,'2024-05-08 15:43:33.720864','TV',2,50),(10,'2024-05-08 15:43:41.420889','TV',2,51);
/*!40000 ALTER TABLE `committee_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `criteria`
--

LOCK TABLES `criteria` WRITE;
/*!40000 ALTER TABLE `criteria` DISABLE KEYS */;
INSERT INTO `criteria` VALUES (1,'Hình thức báo cáo (20%)',NULL),(2,'Nội dung báo cáo(60%)',NULL),(3,'Thái độ của sinh viên(20%)',NULL);
/*!40000 ALTER TABLE `criteria` ENABLE KEYS */;
UNLOCK TABLES;



LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('w02ye58u6vsebeh54wkkv8v66imc3o2m','.eJxVjEEOwiAQRe_C2hCglAGX7j0DGWaoVA0kpV0Z765NutDtf-_9l4i4rSVuPS9xZnEWWpx-t4T0yHUHfMd6a5JaXZc5yV2RB-3y2jg_L4f7d1Cwl29N5BJwUj57cEOygGZiPQUyyBySNmR8HiDYUQV25BCyHQwg8EgMyov3B_7aOEE:1s3HMz:_VO5bvr0liXG0WkfhQXptYaGJlSnD6TUp89AQqKSGuE','2024-05-18 15:32:13.356456');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_accesstoken` VALUES (1,'fRLjb3zsl8K6ZmeJZ3aNrI7bz1SAxU','2024-05-05 01:35:27.907552','read write',2,1,'2024-05-04 15:35:27.908550','2024-05-04 15:35:27.908550',NULL,NULL),(2,'P5i8FEhZ2aNh8YOwQFWV17ziBsHy0f','2024-05-05 01:37:31.034311','read write',2,1,'2024-05-04 15:37:31.035308','2024-05-04 15:37:31.035308',NULL,NULL),(3,'kXFFPXw1V1DM05eMlmR7kAkSjStJdJ','2024-05-07 00:39:40.145365','read write',2,14,'2024-05-06 14:39:40.146362','2024-05-06 14:39:40.146362',NULL,NULL);
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
INSERT INTO `oauth2_provider_application` VALUES (2,'1C9ApNwkhy9nrJApEDCaAnTqgrrDwKkMeloc4M1T','','confidential','password','pbkdf2_sha256$600000$HCy1NHpGrgKXAGJNXtuTYC$9DNPiP8wcu8ucZt/4tpiZVWL7wmi/xvG79E5sm20xIg=','ThesisApp',1,0,'2024-05-04 15:35:11.274181','2024-05-04 15:35:11.274181','','');
/*!40000 ALTER TABLE `oauth2_provider_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `oauth2_provider_grant`
--

LOCK TABLES `oauth2_provider_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_grant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `oauth2_provider_idtoken`
--

LOCK TABLES `oauth2_provider_idtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_refreshtoken` VALUES (1,'KGylONkoHiw8t6NTwhYhT80X0GzU96',1,2,1,'2024-05-04 15:35:27.909548','2024-05-04 15:35:27.909548',NULL),(2,'LyqObnBHGnKhHibGCMYDuCQYQn2gwW',2,2,1,'2024-05-04 15:37:31.036305','2024-05-04 15:37:31.036305',NULL),(3,'EkLn0JLUVn4x4tt0YJNmKG2XJRhBdf',3,2,14,'2024-05-06 14:39:40.148357','2024-05-06 14:39:40.148357',NULL);
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `specific_criteria`
--

LOCK TABLES `specific_criteria` WRITE;
/*!40000 ALTER TABLE `specific_criteria` DISABLE KEYS */;
INSERT INTO `specific_criteria` VALUES (1,'Trình bày(5%)','<p>Thực hiện đ&uacute;ng tất cả c&aacute;c y&ecirc;u cầu về tr&igrave;nh b&agrave;y, Kh&ocirc;ng c&oacute; lỗi ch&iacute;nh tả</p>','<p>C&oacute; &iacute;t hơn 3 lỗi tr&igrave;nh b&agrave;y (theo quy định) hoặc lỗi ch&iacute;nh tả.</p>','<p>C&oacute; &iacute;t hơn 6 lỗi tr&igrave;nh b&agrave;y (theo quy định) hoặc lỗi ch&iacute;nh tả</p>','<p>C&oacute; &iacute;t hơn 10 lỗi tr&igrave;nh b&agrave;y(theo quy định) hoặc lỗi ch&iacute;nh tả</p>','<p>Lớn hơn 10 lỗi tr&igrave;nh b&agrave;y, lỗi ch&iacute;nh tả.</p>','2024-04-17 15:46:26.200473',1,1),(2,'Kết cấu báo cáo (10%)','<ul>\r\n	<li>Thứ tự tr&igrave;nh b&agrave;y c&aacute;c chương hợp l&yacute;.</li>\r\n	<li>Ph&acirc;n bổ <em>rất </em>hợp l&yacute; số trang giữa c&aacute;c chương.</li>\r\n	<li>C&oacute; t&iacute;nh hệ thống v&agrave; li&ecirc;n kếtgiữa c&aacute;c nội dung trong b&aacute;o c&aacute;o</li>\r\n	<li>T&ecirc;n b&aacute;o c&aacute;o, t&ecirc;n c&aacute;c mục ngắn gọn, s&uacute;c t&iacute;ch v&agrave; phản &aacute;nh đ&uacute;ng nội dung</li>\r\n</ul>','<p style=\"margin-left:4px; margin-right:7px\">Kh&ocirc;ng đạt 1 trong 3 ti&ecirc;u ch&iacute;: (1) ph&acirc;n bổ số trang giữa c&aacute;c chương, (2) c&oacute; t&iacute;nh li&ecirc;n kết c&aacute;o giữa nội dung c&aacute;c chương, v&agrave;</p>\r\n\r\n<p>(3) t&ecirc;n b&aacute;o c&aacute;o, đề mục chưa r&otilde; r&agrave;ng, s&uacute;c t&iacute;ch.</p>','<p>Kh&ocirc;ng đạt 2 trong 3 ti&ecirc;u ch&iacute;: (1) ph&acirc;n bổ số trang giữa c&aacute;c chương, (2)c&oacute; t&iacute;nh li&ecirc;n kết c&aacute;o giữa nội dung c&aacute;c chương, v&agrave; (3) t&ecirc;n b&aacute;o c&aacute;o, đề mục chưa r&otilde; r&agrave;ng, s&uacute;c t&iacute;ch.</p>','<p>Kh&ocirc;ng đạt 3 trong 4 ti&ecirc;u ch&iacute;: (1) thứ tự chương (1) ph&acirc;n bổ số trang giữa c&aacute;c chương, (2)c&oacute; t&iacute;nh li&ecirc;n kết c&aacute;o giữa nội dung c&aacute;c chương, v&agrave; (3) t&ecirc;n b&aacute;o c&aacute;o, đề mục chưa r&otilde; r&agrave;ng, s&uacute;c t&iacute;ch.</p>','<p>Kh&ocirc;ng đạt cả 4 ti&ecirc;u ch&iacute;.</p>','2024-05-04 08:58:56.514927',1,1),(3,'Văn phong (5%)','<p>Văn phong mạch lạc, r&otilde; r&agrave;ng, dễ hiểu.</p>','<p>Văn phong mạch lạc, r&otilde; r&agrave;ng.</p>','<p>Văn phong chưa thật mạch lạc, r&otilde; r&agrave;ng, v&agrave; g&acirc;y kh&oacute; khăn cho người đọc hiểu vấn đề.</p>','<p>Văn phong kh&ocirc;ng mạch lạc, r&otilde; r&agrave;ng, v&agrave; g&acirc;y <em>nhiều </em>kh&oacute; khăn cho người đọc.</p>','<p>Văn phong cẩu thả, v&agrave; sai ngữ ph&aacute;p.</p>','2024-04-24 08:45:22.804347',1,1),(4,'Kỹ năng phân tích (10%)','<p>Ph&acirc;n t&iacute;ch, lập luận <em>sắc sảo</em>, c&oacute; cơ sở r&otilde; r&agrave;ng, tin cậy.</p>','<p>Ph&acirc;n t&iacute;ch, lập luận c&oacute; cơ sở r&otilde; r&agrave;ng, tin cậy.</p>','<p>Ph&acirc;n t&iacute;ch, lập luận c&oacute; cơ sở chưa thật r&otilde; r&agrave;ng, tin cậy v&agrave; mang t&iacute;nh chủ quan.</p>','<p>Ph&acirc;n t&iacute;ch, lập luận thiếu c&oacute; cơ sở r&otilde; r&agrave;ng, tin cậy.</p>','<p>Lập luận kh&ocirc;ng c&oacute; cơ sở r&otilde; r&agrave;ng, tin cậy.</p>','2024-04-24 08:46:15.992105',1,2),(5,'Mục tiêu (10%)','<p>B&aacute;o c&aacute;o đạt được mục ti&ecirc;u đề ra</p>','<p>Đạt được tr&ecirc;n 75% mục ti&ecirc;u</p>','<p>Đạt được tr&ecirc;n 50% mục ti&ecirc;u</p>','<p>B&aacute;o c&aacute;o kh&ocirc;ng đạt được tr&ecirc;n 50% mục ti&ecirc;u ban đầu th&igrave; đ&aacute;nh gi&aacute; kh&ocirc;ng đạt kh&oacute;a luận tốt nghiệp.</p>','<p>B&aacute;o c&aacute;o kh&ocirc;ng đạt được tr&ecirc;n 50% mục ti&ecirc;u ban đầu th&igrave; đ&aacute;nh gi&aacute; kh&ocirc;ng đạt kh&oacute;a luận tốt nghiệp.</p>','2024-04-24 08:47:11.702357',1,2),(6,'Kết quả (30%)','<p>B&aacute;o c&aacute;o đạt tốt về nội dung chuy&ecirc;n m&ocirc;n li&ecirc;n quan đến đề t&agrave;i theo đ&aacute;nh gi&aacute; của giảng vi&ecirc;n hướng dẫn. (điểm 9-10).</p>','<p style=\"margin-left:4px; margin-right:7px\">B&aacute;o c&aacute;o đạt kh&aacute; về nội dung chuy&ecirc;n m&ocirc;n li&ecirc;n quan đến đề t&agrave;i theo đ&aacute;nh gi&aacute; của giảng vi&ecirc;n</p>\r\n\r\n<p>hướng dẫn. (điểm 7-8).</p>','<p style=\"margin-left:4px; margin-right:6px\">B&aacute;o c&aacute;o đạt trung b&igrave;nh kh&aacute; về nội dung chuy&ecirc;n m&ocirc;n li&ecirc;n quan đến đề t&agrave;i theo đ&aacute;nh gi&aacute; của giảng vi&ecirc;n</p>\r\n\r\n<p>hướng dẫn. (điểm 5-6)</p>','<p><strong>Nếu b&aacute;o c&aacute;o kh&ocirc;ng đạt nội dung chuy&ecirc;n m&ocirc;n th&igrave; đ&aacute;nh gi&aacute; kh&ocirc;ng đạt kh&oacute;a luận tốt nghiệp.</strong></p>','<p><strong>Nếu b&aacute;o c&aacute;o kh&ocirc;ng đạt nội dung chuy&ecirc;n m&ocirc;n th&igrave; đ&aacute;nh gi&aacute; kh&ocirc;ng đạt kh&oacute;a luận tốt nghiệp.</strong></p>','2024-04-24 08:47:55.554583',1,2),(7,'Ý nghĩa đề tài (10%)','<p>Đề t&agrave;i c&oacute; nghĩa khoa học v&agrave; thực tiết cao, c&oacute; t&iacute;nh mới s&aacute;ng tạo.</p>','<p>Đề t&agrave;i c&oacute; nghĩa khoa học v&agrave; thực tiễn.</p>','<p>Đề t&agrave;i chưa c&oacute; nhiều &yacute; nghĩa khoa học hoặc thực tiến.</p>','<p>&Yacute; nghĩa khoa học hoặc thực tiễn được tr&igrave;nh b&agrave;y chưa thuyết phục.</p>','<p>B&aacute;o c&aacute;o kh&ocirc;ng tr&igrave;nh b&agrave;y &yacute; nghĩa khoa học hoặc thực tiễn</p>','2024-04-24 08:48:47.306268',1,2),(8,'Thái độ của sinh viên','<p style=\"margin-left:4px; margin-right:6px\">Sinh vi&ecirc;n gặp gỡ GVHD 4 lần trở l&ecirc;n. T&iacute;ch cực trao đổi c&aacute;c vấn đề về thực tập tốt nghiệp.</p>\r\n\r\n<p>Chấp h&agrave;nh tốt c&aacute;c y&ecirc;u cầu của giảng vi&ecirc;n.</p>','<p style=\"margin-left:4px; margin-right:7px\">Sinh vi&ecirc;n gặp gỡ GVHD 4 lần trở l&ecirc;n.</p>\r\n\r\n<p style=\"margin-left:4px; margin-right:7px\">C&oacute; trao đổi c&aacute;c vấn đề về thực tập tốt nghiệp.</p>\r\n\r\n<p>&nbsp;Chấp h&agrave;nh c&aacute;c y&ecirc;u cầu của giảng vi&ecirc;n</p>','<p style=\"margin-left:9px\">Sinh vi&ecirc;n gặp gỡ GVHD 4 lần trở l&ecirc;n.</p>\r\n\r\n<p style=\"margin-left:9px\">&Iacute;t trao đổi c&aacute;c vấn đề về thực tập tốt nghiệp.</p>\r\n\r\n<p>&nbsp; Chấp h&agrave;nh c&aacute;c y&ecirc;u cầu của giảng vi&ecirc;n.</p>','<p style=\"margin-left:4px; margin-right:11px\">Sinh vi&ecirc;n gặp gỡ GVHD kh&ocirc;ng đủ 4 lần (kh&ocirc;ng x&eacute;t ti&ecirc;u ch&iacute; kh&aacute;c).</p>\r\n\r\n<p style=\"margin-left:4px; margin-right:11px\">Kh&ocirc;ng trao đổi c&aacute;c vấn đề về thực tập tốt nghiệp</p>\r\n\r\n<p>Chấp h&agrave;nh kh&ocirc;ng tốt c&aacute;c y&ecirc;u cầu của giảng vi&ecirc;n.</p>','<p><strong>Sinh vi&ecirc;n kh&ocirc;ng li&ecirc;n hệ v&agrave; gặp giảng vi&ecirc;n th&igrave; đ&aacute;nh gi&aacute; kh&ocirc;ng đạt kh&oacute;a luận tốt nghiệp.</strong></p>','2024-04-24 08:49:47.185135',1,3);
/*!40000 ALTER TABLE `specific_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `student_do_thesis`
--

LOCK TABLES `student_do_thesis` WRITE;
/*!40000 ALTER TABLE `student_do_thesis` DISABLE KEYS */;
INSERT INTO `student_do_thesis` VALUES (1,'2024-05-08 14:39:09.584766',1,'DN',2,1,1),(2,'2024-05-08 14:39:18.396561',1,'DN',3,1,1),(3,'2024-05-08 14:39:32.376902',1,'DN',4,2,1),(4,'2024-05-08 14:39:32.377899',1,'DN',5,2,1),(5,'2024-05-08 14:39:52.389869',1,'DN',6,3,1),(6,'2024-05-08 14:39:52.390866',1,'DN',7,3,1),(7,'2024-05-08 14:40:07.210766',1,'DN',8,4,1),(8,'2024-05-08 14:40:07.211268',1,'DN',9,4,1),(9,'2024-05-08 14:40:36.222757',1,'DN',10,5,1),(10,'2024-05-08 14:40:36.223755',1,'DN',11,5,1),(11,'2024-05-08 14:40:54.577881',1,'DN',12,6,2),(12,'2024-05-08 14:41:10.373625',1,'DN',13,6,2),(13,'2024-05-08 14:41:30.684530',1,'DN',14,7,2),(14,'2024-05-08 14:41:30.685527',1,'DN',15,7,2),(15,'2024-05-08 14:42:01.617761',1,'DN',16,8,2),(16,'2024-05-08 14:42:01.618789',1,'DN',17,8,2),(17,'2024-05-08 14:42:20.219620',1,'DN',18,9,2),(18,'2024-05-08 14:42:20.220617',1,'DN',19,9,2),(19,'2024-05-08 14:42:40.388496',1,'DN',20,10,2),(20,'2024-05-08 14:42:40.389491',1,'DN',21,10,2);
/*!40000 ALTER TABLE `student_do_thesis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `teacher_do_thesis`
--

LOCK TABLES `teacher_do_thesis` WRITE;
/*!40000 ALTER TABLE `teacher_do_thesis` DISABLE KEYS */;
INSERT INTO `teacher_do_thesis` VALUES (1,'2024-05-08 15:09:39.390000',22,1),(2,'2024-05-08 15:10:25.250000',22,2),(3,'2024-05-08 15:11:39.390000',23,1),(4,'2024-05-08 15:11:47.470000',23,2),(5,'2024-05-08 15:11:57.570000',24,3),(6,'2024-05-09 15:11:57.570000',24,4),(7,'2024-05-10 15:11:57.570000',25,3),(8,'2024-05-11 15:11:57.570000',25,4),(9,'2024-05-12 15:11:57.570000',26,5),(10,'2024-05-13 15:11:57.570000',26,6),(11,'2024-05-14 15:11:57.570000',27,5),(12,'2024-05-15 15:11:57.570000',27,6),(13,'2024-05-16 15:11:57.570000',28,7),(14,'2024-05-17 15:11:57.570000',28,8),(15,'2024-05-18 15:11:57.570000',29,7),(16,'2024-05-19 15:11:57.570000',29,8),(17,'2024-05-20 15:11:57.570000',30,9),(18,'2024-05-21 15:11:57.570000',30,10),(19,'2024-05-22 15:11:57.570000',31,9),(20,'2024-05-23 15:11:57.570000',31,10),(21,'2024-05-24 15:11:57.570000',32,11),(22,'2024-05-25 15:11:57.570000',32,12),(23,'2024-05-26 15:11:57.570000',33,11),(24,'2024-05-27 15:11:57.570000',33,12),(25,'2024-05-28 15:11:57.570000',34,13),(26,'2024-05-29 15:11:57.570000',34,14),(27,'2024-05-30 15:11:57.570000',35,13),(28,'2024-05-31 15:11:57.570000',35,14),(29,'2024-06-01 15:11:57.570000',36,15),(30,'2024-06-02 15:11:57.570000',36,16),(31,'2024-06-03 15:11:57.570000',37,15),(32,'2024-06-04 15:11:57.570000',37,16),(33,'2024-06-05 15:11:57.570000',38,17),(34,'2024-06-06 15:11:57.570000',38,18),(35,'2024-06-07 15:11:57.570000',39,17),(36,'2024-06-08 15:11:57.570000',39,18),(37,'2024-06-09 15:11:57.570000',40,19),(38,'2024-06-10 15:11:57.570000',40,20),(39,'2024-06-11 15:11:57.570000',41,19),(40,'2024-06-12 15:11:57.570000',41,20);
/*!40000 ALTER TABLE `teacher_do_thesis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `thesis`
--

LOCK TABLES `thesis` WRITE;
/*!40000 ALTER TABLE `thesis` DISABLE KEYS */;
INSERT INTO `thesis` VALUES (1,'Web bán hàng online','thesis/2024/05/Doc1.docx','thesis/2024/05/cac16195074517363.png','2024-05-08 13:32:14.861529',1),(2,'Web bán điện thoại','thesis/2024/05/Doc2.docx','thesis/2024/05/cac16195080204084.jpg','2024-05-08 13:32:14.861529',1),(3,'Web nhà hàng','thesis/2024/05/Doc3.docx','thesis/2024/05/cc.png','2024-05-08 13:32:14.861529',1),(4,'Web giữ xe','thesis/2024/05/Doc4.docx','thesis/2024/05/Giao-dien-web-ban-hang-quan-ao-thoi-trang-1027x2048.jpeg','2024-05-08 13:32:14.861529',1),(5,'Web xem phim','thesis/2024/05/Doc5.docx','thesis/2024/05/giao-diện-website-bán-hàng-đẹp.jpg','2024-05-08 13:32:14.861529',1),(6,'Web đọc truyện','thesis/2024/05/Doc6.docx','thesis/2024/05/Mau-giao-dien-website-ban-hang-my-pham-va-cong-cu-lam-dep-1070x2048.jpeg','2024-05-08 13:32:14.861529',1),(7,'Web bán cafe','thesis/2024/05/Doc7.docx','thesis/2024/05/mau-website-ban-hang-dep-hai-phong2.jpg','2024-05-08 13:32:14.861529',1),(8,'Web tuyển dụng','thesis/2024/05/Doc8.docx','thesis/2024/05/thiet-ke-website-ban-hang-1000x562.jpg','2024-05-08 13:32:14.861529',1),(9,'Web chơi game','thesis/2024/05/Doc9.docx','thesis/2024/05/cac16195074517363_qpkY1AG.png','2024-05-08 13:32:14.861529',1),(10,'Web đặt vé','thesis/2024/05/Doc10.docx','thesis/2024/05/cac16195080204084_MqOZURP.jpg','2024-05-08 13:32:14.861529',1);
/*!40000 ALTER TABLE `thesis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `thesis_defense_committee`
--

LOCK TABLES `thesis_defense_committee` WRITE;
/*!40000 ALTER TABLE `thesis_defense_committee` DISABLE KEYS */;
INSERT INTO `thesis_defense_committee` VALUES (1,'Hội Đồng Khóa 1-1','2024-05-08 13:46:59.092477','2024-08-02 23:00:00.000000'),(2,'Hội Đồng Khóa 1-2','2024-05-08 13:46:59.092477','2024-08-02 23:00:00.000000');
/*!40000 ALTER TABLE `thesis_defense_committee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `thesis_user`
--

LOCK TABLES `thesis_user` WRITE;
/*!40000 ALTER TABLE `thesis_user` DISABLE KEYS */;
INSERT INTO `thesis_user` VALUES (1,'pbkdf2_sha256$600000$YDVrYq2l4lRdq12vr1nH1p$fUGUAAqY9jcBuKqJWj8eJejheoNirNXqm51MmqNYH5A=','2024-05-04 15:32:13.353464',1,'admin123','Nguyễn Ngọc','Luân','codon0213@gmail.com',1,1,'2024-05-04 08:43:16.000000','user/2024/05/img_nam_avatar.png'),(2,'bcrypt_sha256$$2b$12$CQJRwPd4.iOJkQz5SxYbI.r9gLjVp1p4tze59r8BeFQOf2ncPvj2G',NULL,0,'hs1','Nguyen','Tiên','hs1@gmail.com',0,1,'2024-04-08 04:37:18.000000','user/2024/05/img_nam_avatar.png'),(3,'bcrypt_sha256$$2b$12$SqBfVsyQPe6WK40XjLOON.9gqRFU6CUT0m0hzZuLMVCWNR/FWzNHW',NULL,0,'hs2','Nguyen','Hoàng','hs2@gmail.com',0,1,'2024-04-08 04:37:18.000000','user/2024/05/img_nam_avatar.png'),(4,'bcrypt_sha256$$2b$12$aHfIaMExshbnDXES5SZkeukKUAS1OOmjvzhKwFbqUZqwfpT3VKXXu',NULL,0,'hs3','Nguyen','Hạo','hs3@gmail.com',0,1,'2024-04-08 04:58:14.000000','user/2024/05/img_nam_avatar.png'),(5,'bcrypt_sha256$$2b$12$aHfIaMExshbnDXES5SZkeukKUAS1OOmjvzhKwFbqUZqwfpT3VKXXu',NULL,0,'hs4','Nguyen','Thanh','hs4@gmail.com',0,1,'2024-04-08 04:58:14.000000','user/2024/05/img_nu_avatar.png'),(6,'bcrypt_sha256$$2b$12$aHfIaMExshbnDXES5SZkeukKUAS1OOmjvzhKwFbqUZqwfpT3VKXXu',NULL,0,'hs5','Nguyen','Tùng','hs5@gmail.com',0,1,'2024-04-08 04:58:14.000000','user/2024/05/img_nam_avatar.png'),(7,'bcrypt_sha256$$2b$12$aHfIaMExshbnDXES5SZkeukKUAS1OOmjvzhKwFbqUZqwfpT3VKXXu',NULL,0,'hs6','Nguyen','Sơn','hs6@gmail.com',0,1,'2024-04-08 04:58:14.000000','user/2024/05/img_nu_avatar.png'),(8,'bcrypt_sha256$$2b$12$aHfIaMExshbnDXES5SZkeukKUAS1OOmjvzhKwFbqUZqwfpT3VKXXu',NULL,0,'hs7','Nguyen','Lan','hs7@gmail.com',0,1,'2024-04-08 04:58:14.000000','user/2024/05/img_nu_avatar.png'),(9,'bcrypt_sha256$$2b$12$aHfIaMExshbnDXES5SZkeukKUAS1OOmjvzhKwFbqUZqwfpT3VKXXu',NULL,0,'hs8','Nguyen','Thuyền','hs8@gmail.com',0,1,'2024-04-08 04:58:14.000000','user/2024/05/img_nam_avatar.png'),(10,'bcrypt_sha256$$2b$12$aHfIaMExshbnDXES5SZkeukKUAS1OOmjvzhKwFbqUZqwfpT3VKXXu',NULL,0,'hs9','Nguyen','Duyên','hs9@gmail.com',0,1,'2024-04-08 04:58:14.000000','user/2024/05/img_nu_avatar.png'),(11,'bcrypt_sha256$$2b$12$aHfIaMExshbnDXES5SZkeukKUAS1OOmjvzhKwFbqUZqwfpT3VKXXu',NULL,0,'hs10','Nguyen','Thanh','hs10@gmail.com',0,1,'2024-05-06 14:13:15.466677','user/2024/05/img_nam_avatar_BzAebjm.png'),(12,'bcrypt_sha256$$2b$12$aHfIaMExshbnDXES5SZkeukKUAS1OOmjvzhKwFbqUZqwfpT3VKXXu',NULL,0,'hs11','Nguyen','Bằng','hs11@gmail.com',0,1,'2024-05-06 14:31:16.801921','user/2024/05/img_nam_avatar_XykkXtb.png'),(13,'bcrypt_sha256$$2b$12$aHfIaMExshbnDXES5SZkeukKUAS1OOmjvzhKwFbqUZqwfpT3VKXXu',NULL,0,'hs12','Nguyen','Đô','hs12@gmail.com',0,1,'2024-05-06 14:34:46.824291','user/2024/05/img_nam_avatar_GUazr4t.png'),(14,'pbkdf2_sha256$600000$jvzYoX0IF2dquRGXl9iesm$KSwzwYvvV1MwbmCYugQTAijcR3bil8pGBcWLKIfE4zo=',NULL,0,'hs13','Nguyen','Duẩn','hs13@gmail.com',0,1,'2024-05-06 14:36:38.993033','user/2024/05/img_nam_avatar_9JPZAPD.png'),(15,'bcrypt_sha256$$2b$12$aHfIaMExshbnDXES5SZkeukKUAS1OOmjvzhKwFbqUZqwfpT3VKXXu',NULL,0,'hs14','Nguyen','Tâm','hs14@gmail.com',0,1,'2024-04-08 04:58:14.000000','user/2024/05/img_nu_avatar.png'),(16,'bcrypt_sha256$$2b$12$aHfIaMExshbnDXES5SZkeukKUAS1OOmjvzhKwFbqUZqwfpT3VKXXu',NULL,0,'hs15','Nguyen','Lam','hs15@gmail.com',0,1,'2024-04-08 04:58:14.000000','user/2024/05/img_nu_avatar.png'),(17,'bcrypt_sha256$$2b$12$aHfIaMExshbnDXES5SZkeukKUAS1OOmjvzhKwFbqUZqwfpT3VKXXu',NULL,0,'hs16','Nguyen','Thư','hs16@gmail.com',0,1,'2024-05-06 14:13:15.466677','user/2024/05/img_nam_avatar_BzAebjm.png'),(18,'bcrypt_sha256$$2b$12$aHfIaMExshbnDXES5SZkeukKUAS1OOmjvzhKwFbqUZqwfpT3VKXXu',NULL,0,'hs17','Nguyen','Nhi','hs17@gmail.com',0,1,'2024-05-06 14:31:16.801921','user/2024/05/img_nam_avatar_XykkXtb.png'),(19,'bcrypt_sha256$$2b$12$aHfIaMExshbnDXES5SZkeukKUAS1OOmjvzhKwFbqUZqwfpT3VKXXu',NULL,0,'hs18','Nguyen','Hùng','hs18@gmail.com',0,1,'2024-05-06 14:34:46.824291','user/2024/05/img_nam_avatar.png'),(20,'pbkdf2_sha256$600000$jvzYoX0IF2dquRGXl9iesm$KSwzwYvvV1MwbmCYugQTAijcR3bil8pGBcWLKIfE4zo=',NULL,0,'hs19','Nguyen','Thiên','hs19@gmail.com',0,1,'2024-05-06 14:36:38.993033','user/2024/05/img_nam_avatar.png'),(21,'pbkdf2_sha256$600000$jvzYoX0IF2dquRGXl9iesm$KSwzwYvvV1MwbmCYugQTAijcR3bil8pGBcWLKIfE4zo=',NULL,0,'hs20','Nguyen','Hàng','hs20@gmail.com',0,1,'2024-05-06 14:36:38.993033','user/2024/05/img_nam_avatar.png'),(22,'pbkdf2_sha256$600000$jvzYoX0IF2dquRGXl9iesm$KSwzwYvvV1MwbmCYugQTAijcR3bil8pGBcWLKIfE4zo=',NULL,0,'gv1','Nguyên Hào','Nhi','gv1@gmail.com',0,1,'2024-05-08 14:01:28.000000','user/2024/05/img_nam_avatar.png'),(23,'pbkdf2_sha256$600000$jvzYoX0IF2dquRGXl9iesm$KSwzwYvvV1MwbmCYugQTAijcR3bil8pGBcWLKIfE4zo=',NULL,0,'gv2','Nguyên Hào','Nhi','gv2@gmail.com',0,1,'2024-05-08 14:01:28.000000','user/2024/05/img_nam_avatar.png'),(24,'pbkdf2_sha256$600000$jvzYoX0IF2dquRGXl9iesm$KSwzwYvvV1MwbmCYugQTAijcR3bil8pGBcWLKIfE4zo=',NULL,0,'gv3','Nguyên Hào','Nhi','gv3@gmail.com',0,1,'2024-05-08 14:01:28.000000','user/2024/05/img_nam_avatar.png'),(25,'pbkdf2_sha256$600000$jvzYoX0IF2dquRGXl9iesm$KSwzwYvvV1MwbmCYugQTAijcR3bil8pGBcWLKIfE4zo=',NULL,0,'gv4','Nguyên Hào','Nhi','gv4@gmail.com',0,1,'2024-05-08 14:01:28.000000','user/2024/05/img_nu_avatar_QhaRaEm.png'),(26,'pbkdf2_sha256$600000$jvzYoX0IF2dquRGXl9iesm$KSwzwYvvV1MwbmCYugQTAijcR3bil8pGBcWLKIfE4zo=',NULL,0,'gv5','Nguyên Hào','Nhi','gv5@gmail.com',0,1,'2024-05-08 14:01:28.000000','user/2024/05/img_nu_avatar_QhaRaEm.png'),(27,'pbkdf2_sha256$600000$jvzYoX0IF2dquRGXl9iesm$KSwzwYvvV1MwbmCYugQTAijcR3bil8pGBcWLKIfE4zo=',NULL,0,'gv6','Nguyên Hào','Nhi','gv6@gmail.com',0,1,'2024-05-08 14:01:28.000000','user/2024/05/img_nam_avatar.png'),(28,'pbkdf2_sha256$600000$jvzYoX0IF2dquRGXl9iesm$KSwzwYvvV1MwbmCYugQTAijcR3bil8pGBcWLKIfE4zo=',NULL,0,'gv7','Nguyên Hào','Nhi','gv7@gmail.com',0,1,'2024-05-08 14:01:28.000000','user/2024/05/img_nu_avatar_QhaRaEm.png'),(29,'pbkdf2_sha256$600000$jvzYoX0IF2dquRGXl9iesm$KSwzwYvvV1MwbmCYugQTAijcR3bil8pGBcWLKIfE4zo=',NULL,0,'gv8','Nguyên Hào','Nhi','gv8@gmail.com',0,1,'2024-05-08 14:01:28.000000','user/2024/05/img_nu_avatar_QhaRaEm.png'),(30,'pbkdf2_sha256$600000$jvzYoX0IF2dquRGXl9iesm$KSwzwYvvV1MwbmCYugQTAijcR3bil8pGBcWLKIfE4zo=',NULL,0,'gv9','Nguyên Hào','Nhi','gv9@gmail.com',0,1,'2024-05-08 14:01:28.000000','user/2024/05/img_nam_avatar.png'),(31,'pbkdf2_sha256$600000$jvzYoX0IF2dquRGXl9iesm$KSwzwYvvV1MwbmCYugQTAijcR3bil8pGBcWLKIfE4zo=',NULL,0,'gv10','Nguyên Hào','Nhi','gv10@gmail.com',0,1,'2024-05-08 14:01:28.000000','user/2024/05/img_nam_avatar.png'),(32,'pbkdf2_sha256$600000$jvzYoX0IF2dquRGXl9iesm$KSwzwYvvV1MwbmCYugQTAijcR3bil8pGBcWLKIfE4zo=',NULL,0,'gv11','Nguyên Hào','Nhi','gv11@gmail.com',0,1,'2024-05-08 14:01:28.000000','user/2024/05/img_nu_avatar_QhaRaEm.png'),(33,'pbkdf2_sha256$600000$jvzYoX0IF2dquRGXl9iesm$KSwzwYvvV1MwbmCYugQTAijcR3bil8pGBcWLKIfE4zo=',NULL,0,'gv12','Nguyên Hào','Nhi','gv12@gmail.com',0,1,'2024-05-08 14:01:28.000000','user/2024/05/img_nam_avatar.png'),(34,'pbkdf2_sha256$600000$jvzYoX0IF2dquRGXl9iesm$KSwzwYvvV1MwbmCYugQTAijcR3bil8pGBcWLKIfE4zo=',NULL,0,'gv13','Nguyên Hào','Nhi','gv13@gmail.com',0,1,'2024-05-08 14:01:28.000000','user/2024/05/img_nam_avatar.png'),(35,'pbkdf2_sha256$600000$jvzYoX0IF2dquRGXl9iesm$KSwzwYvvV1MwbmCYugQTAijcR3bil8pGBcWLKIfE4zo=',NULL,0,'gv14','Nguyên Hào','Nhi','gv14@gmail.com',0,1,'2024-05-08 14:01:28.000000','user/2024/05/img_nam_avatar.png'),(36,'pbkdf2_sha256$600000$jvzYoX0IF2dquRGXl9iesm$KSwzwYvvV1MwbmCYugQTAijcR3bil8pGBcWLKIfE4zo=',NULL,0,'gv15','Nguyên Hào','Nhi','gv15@gmail.com',0,1,'2024-05-08 14:01:28.000000','user/2024/05/img_nam_avatar.png'),(37,'pbkdf2_sha256$600000$jvzYoX0IF2dquRGXl9iesm$KSwzwYvvV1MwbmCYugQTAijcR3bil8pGBcWLKIfE4zo=',NULL,0,'gv16','Nguyên Hào','Nhi','gv16@gmail.com',0,1,'2024-05-08 14:01:28.000000','user/2024/05/img_nam_avatar.png'),(38,'pbkdf2_sha256$600000$jvzYoX0IF2dquRGXl9iesm$KSwzwYvvV1MwbmCYugQTAijcR3bil8pGBcWLKIfE4zo=',NULL,0,'gv17','Nguyên Hào','Nhi','gv17@gmail.com',0,1,'2024-05-08 14:01:28.000000','user/2024/05/img_nam_avatar.png'),(39,'pbkdf2_sha256$600000$jvzYoX0IF2dquRGXl9iesm$KSwzwYvvV1MwbmCYugQTAijcR3bil8pGBcWLKIfE4zo=',NULL,0,'gv18','Nguyên Hào','Nhi','gv18@gmail.com',0,1,'2024-05-08 14:01:28.000000','user/2024/05/img_nu_avatar_QhaRaEm.png'),(40,'pbkdf2_sha256$600000$jvzYoX0IF2dquRGXl9iesm$KSwzwYvvV1MwbmCYugQTAijcR3bil8pGBcWLKIfE4zo=',NULL,0,'gv19','Nguyên Hào','Nhi','gv19@gmail.com',0,1,'2024-05-08 14:01:28.000000','user/2024/05/img_nu_avatar_QhaRaEm.png'),(41,'pbkdf2_sha256$600000$jvzYoX0IF2dquRGXl9iesm$KSwzwYvvV1MwbmCYugQTAijcR3bil8pGBcWLKIfE4zo=',NULL,0,'gv20','Nguyên Hào','Nhi','gv20@gmail.com',0,1,'2024-05-08 14:01:28.000000','user/2024/05/img_nu_avatar_QhaRaEm.png'),(42,'pbkdf2_sha256$600000$jvzYoX0IF2dquRGXl9iesm$KSwzwYvvV1MwbmCYugQTAijcR3bil8pGBcWLKIfE4zo=',NULL,0,'gv21','Nguyên Hào','Nhi','gv21@gmail.com',0,1,'2024-05-08 14:01:28.000000','user/2024/05/img_nam_avatar.png'),(43,'pbkdf2_sha256$600000$jvzYoX0IF2dquRGXl9iesm$KSwzwYvvV1MwbmCYugQTAijcR3bil8pGBcWLKIfE4zo=',NULL,0,'gv22','Nguyên Hào','Nhi','gv22@gmail.com',0,1,'2024-05-08 14:01:28.000000','user/2024/05/img_nu_avatar_QhaRaEm.png'),(44,'pbkdf2_sha256$600000$jvzYoX0IF2dquRGXl9iesm$KSwzwYvvV1MwbmCYugQTAijcR3bil8pGBcWLKIfE4zo=',NULL,0,'gv23','Nguyên Hào','Nhi','gv23@gmail.com',0,1,'2024-05-08 14:01:28.000000','user/2024/05/img_nam_avatar.png'),(45,'pbkdf2_sha256$600000$jvzYoX0IF2dquRGXl9iesm$KSwzwYvvV1MwbmCYugQTAijcR3bil8pGBcWLKIfE4zo=',NULL,0,'gv24','Nguyên Hào','Nhi','gv24@gmail.com',0,1,'2024-05-08 14:01:28.000000','user/2024/05/img_nu_avatar_QhaRaEm.png'),(46,'pbkdf2_sha256$600000$jvzYoX0IF2dquRGXl9iesm$KSwzwYvvV1MwbmCYugQTAijcR3bil8pGBcWLKIfE4zo=',NULL,0,'gv25','Nguyên Hào','Nhi','gv25@gmail.com',0,1,'2024-05-08 14:01:28.000000','user/2024/05/img_nu_avatar_QhaRaEm.png'),(47,'pbkdf2_sha256$600000$jvzYoX0IF2dquRGXl9iesm$KSwzwYvvV1MwbmCYugQTAijcR3bil8pGBcWLKIfE4zo=',NULL,0,'gv26','Nguyên Hào','Nhi','gv26@gmail.com',0,1,'2024-05-08 14:01:28.000000','user/2024/05/img_nam_avatar.png'),(48,'pbkdf2_sha256$600000$jvzYoX0IF2dquRGXl9iesm$KSwzwYvvV1MwbmCYugQTAijcR3bil8pGBcWLKIfE4zo=',NULL,0,'gv27','Nguyên Hào','Nhi','gv27@gmail.com',0,1,'2024-05-08 14:01:28.000000','user/2024/05/img_nam_avatar.png'),(49,'pbkdf2_sha256$600000$jvzYoX0IF2dquRGXl9iesm$KSwzwYvvV1MwbmCYugQTAijcR3bil8pGBcWLKIfE4zo=',NULL,0,'gv28','Nguyên Hào','Nhi','gv28@gmail.com',0,1,'2024-05-08 14:01:28.000000','user/2024/05/img_nu_avatar_QhaRaEm.png'),(50,'pbkdf2_sha256$600000$jvzYoX0IF2dquRGXl9iesm$KSwzwYvvV1MwbmCYugQTAijcR3bil8pGBcWLKIfE4zo=',NULL,0,'gv29','Nguyên Hào','Nhi','gv29@gmail.com',0,1,'2024-05-08 14:01:28.000000','user/2024/05/img_nu_avatar_QhaRaEm.png'),(51,'pbkdf2_sha256$600000$jvzYoX0IF2dquRGXl9iesm$KSwzwYvvV1MwbmCYugQTAijcR3bil8pGBcWLKIfE4zo=',NULL,0,'gv30','Nguyên Hào','Nhi','gv30@gmail.com',0,1,'2024-05-08 14:01:28.000000','user/2024/05/img_nam_avatar.png');
/*!40000 ALTER TABLE `thesis_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `thesis_user_groups`
--

LOCK TABLES `thesis_user_groups` WRITE;
/*!40000 ALTER TABLE `thesis_user_groups` DISABLE KEYS */;
INSERT INTO `thesis_user_groups` VALUES (1,2,3),(2,3,3),(3,4,3),(4,5,3),(5,6,3),(6,7,3),(7,8,3),(8,9,3),(9,10,3),(10,11,3),(11,12,3),(12,13,3),(13,14,3),(14,15,3),(15,16,3),(16,17,3),(17,18,3),(18,19,3),(19,20,3),(20,21,3),(21,22,2),(22,23,2),(23,24,2),(24,25,2),(25,26,2),(26,27,2),(27,28,2),(28,29,2),(29,30,2),(30,31,2),(31,32,2),(32,33,2),(33,34,2),(34,35,2),(35,36,2),(36,37,2),(37,38,2),(38,39,2),(39,40,2),(40,41,2),(41,42,2),(42,43,2),(43,44,2),(44,45,2),(45,46,2),(46,47,2),(47,48,2),(48,49,2),(49,50,2),(50,51,2);
/*!40000 ALTER TABLE `thesis_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `thesis_user_user_permissions`
--

LOCK TABLES `thesis_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `thesis_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `thesis_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-08 23:57:25
