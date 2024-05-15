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


LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `student_do_thesis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `teacher_do_thesis`
--

LOCK TABLES `teacher_do_thesis` WRITE;
/*!40000 ALTER TABLE `teacher_do_thesis` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_do_thesis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `thesis`
--

LOCK TABLES `thesis` WRITE;
/*!40000 ALTER TABLE `thesis` DISABLE KEYS */;
/*!40000 ALTER TABLE `thesis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `thesis_defense_committee`
--

LOCK TABLES `thesis_defense_committee` WRITE;
/*!40000 ALTER TABLE `thesis_defense_committee` DISABLE KEYS */;
/*!40000 ALTER TABLE `thesis_defense_committee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `thesis_user`
--

LOCK TABLES `thesis_user` WRITE;
/*!40000 ALTER TABLE `thesis_user` DISABLE KEYS */;
INSERT INTO `thesis_user` VALUES (1,'pbkdf2_sha256$600000$YDVrYq2l4lRdq12vr1nH1p$fUGUAAqY9jcBuKqJWj8eJejheoNirNXqm51MmqNYH5A=','2024-05-04 08:48:08.000000',1,'admin123','Luân','Nguyễn','codon0213@gmail.com',1,1,'2024-05-04 08:43:16.000000','user/2024/05/img_nam_avatar.png'),(2,'bcrypt_sha256$$2b$12$CQJRwPd4.iOJkQz5SxYbI.r9gLjVp1p4tze59r8BeFQOf2ncPvj2G',NULL,0,'hs1','Test1','Nguyễn','test1@gmail.com',0,1,'2024-04-08 04:37:18.000000',''),(3,'bcrypt_sha256$$2b$12$SqBfVsyQPe6WK40XjLOON.9gqRFU6CUT0m0hzZuLMVCWNR/FWzNHW',NULL,0,'hs2','Test2','Nguyễn','test2@gmail.com',0,1,'2024-04-08 04:37:18.000000',''),(4,'bcrypt_sha256$$2b$12$aHfIaMExshbnDXES5SZkeukKUAS1OOmjvzhKwFbqUZqwfpT3VKXXu',NULL,0,'hs3','Test3','Nguyễn','test3@gmail.com',0,1,'2024-04-08 04:58:14.000000',''),(5,'bcrypt_sha256$$2b$12$aHfIaMExshbnDXES5SZkeukKUAS1OOmjvzhKwFbqUZqwfpT3VKXXu',NULL,0,'hs4','Test4','Nguyễn','test4@gmail.com',0,1,'2024-04-08 04:58:14.000000',''),(6,'bcrypt_sha256$$2b$12$aHfIaMExshbnDXES5SZkeukKUAS1OOmjvzhKwFbqUZqwfpT3VKXXu',NULL,0,'hs5','Test5','Nguyễn','test5@gmail.com',0,1,'2024-04-08 04:58:14.000000',''),(7,'bcrypt_sha256$$2b$12$aHfIaMExshbnDXES5SZkeukKUAS1OOmjvzhKwFbqUZqwfpT3VKXXu',NULL,0,'hs6','Test6','Nguyễn','test6@gmail.com',0,1,'2024-04-08 04:58:14.000000',''),(8,'bcrypt_sha256$$2b$12$aHfIaMExshbnDXES5SZkeukKUAS1OOmjvzhKwFbqUZqwfpT3VKXXu',NULL,0,'gv1','gv1','Nguyễn','gv1@gmail.com',0,1,'2024-04-08 04:58:14.000000',''),(9,'bcrypt_sha256$$2b$12$aHfIaMExshbnDXES5SZkeukKUAS1OOmjvzhKwFbqUZqwfpT3VKXXu',NULL,0,'gv2','gv2','Nguyễn','gv2@gmail.com',0,1,'2024-04-08 04:58:14.000000',''),(10,'bcrypt_sha256$$2b$12$aHfIaMExshbnDXES5SZkeukKUAS1OOmjvzhKwFbqUZqwfpT3VKXXu',NULL,0,'gv3','gv3','Nguyễn','gv3@gmail.com',0,1,'2024-04-08 04:58:14.000000','');
/*!40000 ALTER TABLE `thesis_user` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping routines for database 'thesis'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-04 16:01:59
