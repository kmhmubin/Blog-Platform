CREATE DATABASE  IF NOT EXISTS `writeup` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `writeup`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: writeup
-- ------------------------------------------------------
-- Server version	8.0.26

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

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add profile',7,'add_profile'),(26,'Can change profile',7,'change_profile'),(27,'Can delete profile',7,'delete_profile'),(28,'Can view profile',7,'view_profile'),(29,'Can add article',8,'add_article'),(30,'Can change article',8,'change_article'),(31,'Can delete article',8,'delete_article'),(32,'Can view article',8,'view_article'),(33,'Can add comment',9,'add_comment'),(34,'Can change comment',9,'change_comment'),(35,'Can delete comment',9,'delete_comment'),(36,'Can view comment',9,'view_comment'),(37,'Can add review',10,'add_review'),(38,'Can change review',10,'change_review'),(39,'Can delete review',10,'delete_review'),(40,'Can view review',10,'view_review'),(41,'Can add tag',11,'add_tag'),(42,'Can change tag',11,'change_tag'),(43,'Can delete tag',11,'delete_tag'),(44,'Can view tag',11,'view_tag');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$ILUCkveyyHbfTy3Leb39iO$k+OO+dISGGq6tOn2vrKLAWt8gbRaqrhiW579+csT55A=','2021-09-19 17:56:40.371927',1,'mubin','K M H Mubin','Mubin','kmhmubin@gmail.com',1,1,'2021-09-14 13:25:56.000000'),(2,'pbkdf2_sha256$260000$dr1VkFIC1DfJdmxyOjkzlW$AAu5GBo6Fxhs+HTszjH6/IslZtuXMNSiPTmPtE6jsZY=',NULL,0,'bradley','Bradley','Powell','bradley.powell@example.com',0,1,'2021-09-14 14:12:37.000000'),(5,'pbkdf2_sha256$260000$o3UdKEK2wm5kx3rr8V7EC0$n1oeK3JB2vfQG/8p7PB+0kz4+T7w19RrFu9RIio8+4Y=','2021-09-15 15:54:39.766597',0,'nadinesarah','Nadine Sarah Bishop','','nadine@example.com',0,1,'2021-09-15 15:54:39.233598');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_article`
--

DROP TABLE IF EXISTS `blog_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_article` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `excerpt` varchar(120) DEFAULT NULL,
  `featured_image` varchar(100) DEFAULT NULL,
  `content` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `last_update` datetime(6) NOT NULL,
  `publish` datetime(6) NOT NULL,
  `status` varchar(10) NOT NULL,
  `author_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `blog_article_author_id_905add38_fk_users_profile_id` (`author_id`),
  CONSTRAINT `blog_article_author_id_905add38_fk_users_profile_id` FOREIGN KEY (`author_id`) REFERENCES `users_profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article`
--

LOCK TABLES `blog_article` WRITE;
/*!40000 ALTER TABLE `blog_article` DISABLE KEYS */;
INSERT INTO `blog_article` VALUES (1,'JavaScript vs TypeScript: What\'s the deal?','javascript-vs-typescript-whats-the-deal','Typescript is a superset of Javascript.','posts/yVBQmFjLh_SNazpwZ.jpg','<h3>Introduction</h3>\r\n\r\n<p>JavaScript is a scripting language for building dynamic web pages. It adhered to client-side development principles, thus it operates entirely within the user&#39;s web browser and requires no resources from the web server. Javascript may also be used with other technologies such as REST APIs, XML, and others.</p>\r\n\r\n<p>Typescript is a superset of Javascript. It is a statically built language for writing Javascript code that is straightforward and simple. It may be used with Node.js or any browser that supports ECMAScript 3 or above.</p>\r\n\r\n<h3>Difference Between Javascript and Typescript</h3>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td><strong>Typescript</strong></td>\r\n			<td><strong>Javascript</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td>To make the code comprehensible for browsers, it will convert to JavaScript code.</td>\r\n			<td>Can be directly used in browsers</td>\r\n		</tr>\r\n		<tr>\r\n			<td>There is support for ES3, ES4, ES5 and ES6</td>\r\n			<td>No support for compiling additional ES3, ES4, ES5 or ES6 features</td>\r\n		</tr>\r\n		<tr>\r\n			<td>During the compilation process, errors can be identified and rectified.</td>\r\n			<td>Because it is an interpreted language, errors can only be discovered during runtime.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Since it is a superset, all the JavaScript libraries, and other JavaScript code works without any changes</td>\r\n			<td>JS libraries work by default</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Functions can have optional parameters</td>\r\n			<td>This feature is not possible in JavaScript</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Numbers, Strings are considered as interfaces.</td>\r\n			<td>Number, string are objects.</td>\r\n		</tr>\r\n		<tr>\r\n		</tr>\r\n		<tr>\r\n			<td>Powerful and intuitive language</td>\r\n			<td>Neat and clean, most suitable for simple web applications</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Supports modules, generics and interfaces to define data</td>\r\n			<td>No support for modules, generics or interface</td>\r\n		</tr>\r\n		<tr>\r\n			<td>The community support is still growing and not so huge</td>\r\n			<td>Huge community support, including extensive documentation and assistance in resolving issues.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Prototyping is possible</td>\r\n			<td>Prototyping support is not there</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Takes time to learn and code, scripting knowledge is a must.</td>\r\n			<td>Can be learned on the go, no prior scripting experience is needed.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h3>Features of Javascript</h3>\r\n\r\n<ul>\r\n	<li>It&#39;s utilised on both the client and server sides.</li>\r\n	<li>It&#39;s simple to learn and use, and it&#39;s a cross-platform language.</li>\r\n	<li>Strong Testing Workflow</li>\r\n	<li>It&#39;s a dynamic language: flexible and powerful</li>\r\n</ul>\r\n\r\n<h3>Features of Typescript</h3>\r\n\r\n<ul>\r\n	<li>It&#39;s a dynamic language that&#39;s both versatile and strong.</li>\r\n	<li>Offered great productivity for developers &amp; Maintainability</li>\r\n	<li>Code &#39;discoverability&#39; &amp; refactoring</li>\r\n	<li>Optional Static Type Annotation / Static Typing</li>\r\n</ul>\r\n\r\n<h3>Which one is better ?</h3>\r\n\r\n<p>JavaScript is excellent for experienced developers working on relatively small coding tasks. However, if you have a development team with experience and understanding, Typescript is the best alternative.</p>\r\n\r\n<h3>Conclusion</h3>\r\n\r\n<p>I hope you found this article helpful. If you need any help please let me know in comment section</p>\r\n\r\n<p>Let&#39;s connect on&nbsp;<a href=\"https://twitter.com/suhailkakar\" target=\"_blank\">Twitter</a>&nbsp;and&nbsp;<a href=\"https://www.linkedin.com/in/suhailkakar/\" target=\"_blank\">LinkedIn</a></p>\r\n\r\n<p>Thanks for reading, See you next time</p>','2021-09-19 11:53:49.392048','2021-09-19 13:59:15.686180','2021-09-19 11:42:01.000000','published','f2b56eaaf2d4419a98d1d13928c30f35'),(3,'Imagine Scope','imagine-scope','Complex JavaScript world','posts/xynq-hwsS_bWn44tc.jpg','<p>Each city need to have&nbsp;<strong>buildings</strong>&nbsp;and&nbsp;<strong>houses</strong>&nbsp;(it&#39;s same thing, aha). Every city has items and goods for citizens too, so that they can&nbsp;<strong>use</strong>&nbsp;it - buy, sell, cook, wear, etc. Buildings can be goods too, like a private property. Citizens&nbsp;<strong>use</strong>&nbsp;buildings too.</p>\r\n\r\n<p>City needs a Mayor. And Mayor of Function City is beloved by all! She is a very kind and generous person. City has it&#39;s own assets and goods. These goods are public and free for everyone. Every&nbsp;<strong>house</strong>hold have&nbsp;<em>access</em>&nbsp;to them.</p>\r\n\r\n<p>As in any modern society everyone has their private goods, which citizens keep inside their&nbsp;<strong>houses</strong>. Some, on the other hand, have some priviliges and can change the goods available for citizens.</p>\r\n\r\n<p>Of course, city is not complete without&nbsp;<em>helper</em>&nbsp;<strong>buildings</strong>, so that citizens can interact with them. Restaurants, Cinemas, Shops, etc. All this&nbsp;<strong>buildings</strong>&nbsp;offer you their services and are&nbsp;<strong>function</strong>ing in the city.</p>\r\n\r\n<p>By the way, your sister Julia works in one of those. She works at Translation Services Agency. How this agency works you wonder? So you&nbsp;<em>pass</em>&nbsp;them your documents (goods), they process it and&nbsp;<strong>return</strong>&nbsp;result back to you.</p>\r\n\r\n<p><img alt=\"translating agency at work processing passed document\" src=\"https://cdn.hashnode.com/res/hashnode/image/upload/v1631931296319/FfCzRrXWj.jpeg?auto=compress,format&amp;format=webp\" /></p>\r\n\r\n<p>There are so many goods in the city which are public and Agency has&nbsp;<em>access</em>&nbsp;to them. The Agency can actually change and process this documents if needed.</p>\r\n\r\n<p>So, looks like a nice city right? It is. But a little weird too. Mayor can change the meaning of the goods. What? What does it mean? Let&#39;s say, today you had a car, then Mayor has&nbsp;<em>reassigned</em>&nbsp;another item to your car and poof....now you have a carrot.</p>\r\n\r\n<p>There are set of words, which were given by the creator of this whole world. Those words can&#39;t be changed. No one can&nbsp;<em>reassign</em>&nbsp;them. Also, citizens do have some common sense. When they were building the city, they made a list of&nbsp;<strong>constant</strong>&nbsp;words which cannot be reassigned too. Whole city depends on these words.</p>\r\n\r\n<p><strong><em>Imagination OFF</em></strong></p>\r\n\r\n<p>Phew...this one was a hard abstraction to make up. I&#39;ve tried to make it simple, yet meaningful.</p>\r\n\r\n<p>Any constructions like&nbsp;<strong>building</strong>&nbsp;are representing functions. Do you remember the small world in the big one thing? Just like your own house is a small world in the big world. The&nbsp;<strong>goods</strong>&nbsp;are values. Names are variable names. Any item can be reassigned to any name, except for those rules.</p>\r\n\r\n<h2>Scope</h2>\r\n\r\n<p>Before EcmaSript 2015 (ES6) only&nbsp;<code>var</code>&nbsp;was available and scopes were a real issue. Variable declared with&nbsp;<code>var</code>&nbsp;would be accessible everywhere within the script and could be redeclared. ES6 introduced&nbsp;<code>let</code>&nbsp;and&nbsp;<code>const</code>&nbsp;variable declarations. They have block (local) scope and&nbsp;<code>var</code>&nbsp;was almost completely replaced.</p>','2021-09-19 12:24:57.741228','2021-09-19 12:24:57.742231','2021-09-19 12:24:57.555227','published','f2b56eaaf2d4419a98d1d13928c30f35'),(4,'Three Buggy React Code Examples and How to Fix Them','three-buggy-react-code-examples-and-how-to-fix-the','With its ever-growing popularity, people consider it to be a','posts/urmq32fduvwkkmvmxu67_ikAdAHE.png','<p>If you appreciate my work, or if it has helped you along your journey. It would mean a lot to me if you could write a message on my wall and share a cup of coffee (or tea) with me.</p>','2021-09-19 13:58:30.250758','2021-09-19 13:58:30.250758','2021-09-19 13:58:30.028757','published','f2b56eaaf2d4419a98d1d13928c30f35');
/*!40000 ALTER TABLE `blog_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_article_tags`
--

DROP TABLE IF EXISTS `blog_article_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_article_tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `article_id` bigint NOT NULL,
  `tag_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_article_tags_article_id_tag_id_b78a22e9_uniq` (`article_id`,`tag_id`),
  KEY `blog_article_tags_tag_id_88eb3ed9_fk_blog_tag_id` (`tag_id`),
  CONSTRAINT `blog_article_tags_article_id_82c02dd6_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `blog_article_tags_tag_id_88eb3ed9_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article_tags`
--

LOCK TABLES `blog_article_tags` WRITE;
/*!40000 ALTER TABLE `blog_article_tags` DISABLE KEYS */;
INSERT INTO `blog_article_tags` VALUES (2,1,'2014158c0cd2452bae8320943e3d9e5b'),(1,4,'cd5dcc8715bb48ccaf659bc5cfb8a037');
/*!40000 ALTER TABLE `blog_article_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_review`
--

DROP TABLE IF EXISTS `blog_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_review` (
  `body` longtext,
  `value` varchar(200) NOT NULL,
  `created` datetime(6) NOT NULL,
  `id` char(32) NOT NULL,
  `owner_id` char(32) DEFAULT NULL,
  `post_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_review_owner_id_post_id_2e9665de_uniq` (`owner_id`,`post_id`),
  KEY `blog_review_post_id_eff9e843_fk_blog_article_id` (`post_id`),
  CONSTRAINT `blog_review_owner_id_325ee14a_fk_users_profile_id` FOREIGN KEY (`owner_id`) REFERENCES `users_profile` (`id`),
  CONSTRAINT `blog_review_post_id_eff9e843_fk_blog_article_id` FOREIGN KEY (`post_id`) REFERENCES `blog_article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_review`
--

LOCK TABLES `blog_review` WRITE;
/*!40000 ALTER TABLE `blog_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_tag`
--

DROP TABLE IF EXISTS `blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_tag` (
  `name` varchar(200) NOT NULL,
  `created` datetime(6) NOT NULL,
  `id` char(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tag`
--

LOCK TABLES `blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_tag` DISABLE KEYS */;
INSERT INTO `blog_tag` VALUES ('Express','2021-09-19 13:47:45.469845','11be71c936a240e3b0ca4888629e65ce'),('JavaScript','2021-09-19 13:46:49.513624','2014158c0cd2452bae8320943e3d9e5b'),('React','2021-09-19 13:47:30.514869','3d35da1a9c854ab5ade24c5d2ab2b542'),('Django','2021-09-19 13:47:04.728211','5227848b07e14e86882087641178c957'),('HTML','2021-09-19 13:46:53.813488','61297cb4052e48c89585af681b89ef28'),('MySQL','2021-09-19 13:47:51.119278','90f53c9224aa4b51b6b00c4999e138d5'),('MongoDB','2021-09-19 13:48:06.265894','a5ba406af653425093504b88a098001c'),('Node JS','2021-09-19 13:47:16.677958','b0a1452f4fe74ddd9cf66d3418adbed1'),('Vue','2021-09-19 13:47:40.748627','c2746f29703143579dc171905fbf7214'),('Python','2021-09-19 13:46:41.883806','cd5dcc8715bb48ccaf659bc5cfb8a037'),('CSS','2021-09-19 13:46:57.947128','da527fe7ae5c49f59d33dea94c383fa1'),('PostgreSQL','2021-09-19 13:47:59.465737','ff21640f8ab24b3d8a937cc05dc4edec');
/*!40000 ALTER TABLE `blog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-09-14 13:26:53.467351','1','mubin',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',4,1),(2,'2021-09-14 13:47:45.551601','f2b56eaa-f2d4-419a-98d1-d13928c30f35','mubin',1,'[{\"added\": {}}]',7,1),(3,'2021-09-14 13:58:56.013490','f2b56eaa-f2d4-419a-98d1-d13928c30f35','mubin',2,'[{\"changed\": {\"fields\": [\"Profile image\"]}}]',7,1),(4,'2021-09-14 14:12:37.719128','2','bradley',1,'[{\"added\": {}}]',4,1),(5,'2021-09-14 14:13:08.840730','2','bradley',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]',4,1),(6,'2021-09-14 14:16:08.346937','422cffe6-05b0-4b94-aa4c-dc3a3ae47039','bradley',1,'[{\"added\": {}}]',7,1),(7,'2021-09-14 15:22:49.259644','422cffe6-05b0-4b94-aa4c-dc3a3ae47039','bradley',2,'[{\"changed\": {\"fields\": [\"Profile image\"]}}]',7,1),(8,'2021-09-14 21:59:04.548575','422cffe6-05b0-4b94-aa4c-dc3a3ae47039','bradley',2,'[]',7,1),(9,'2021-09-14 22:15:04.558698','422cffe6-05b0-4b94-aa4c-dc3a3ae47039','bradley',2,'[]',7,1),(10,'2021-09-14 22:27:24.673096','3','stevo',1,'[{\"added\": {}}]',4,1),(11,'2021-09-14 22:28:51.894095','f2b56eaa-f2d4-419a-98d1-d13928c30f35','mubin',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',7,1),(12,'2021-09-14 22:29:01.676096','422cffe6-05b0-4b94-aa4c-dc3a3ae47039','bradley',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',7,1),(13,'2021-09-14 22:32:22.426995','97f098da-12a0-4c8c-b08b-30fb979412a4','stevo',3,'',7,1),(14,'2021-09-14 22:36:36.304903','4','stevo',1,'[{\"added\": {}}]',4,1),(15,'2021-09-14 22:39:42.511725','4','stevo',3,'',4,1),(16,'2021-09-14 23:00:33.191342','422cffe6-05b0-4b94-aa4c-dc3a3ae47039','Bradley Powell',2,'[]',7,1),(17,'2021-09-14 23:01:09.510630','2','bradley',2,'[]',4,1),(18,'2021-09-15 15:57:31.449597','54f26347-052b-4303-b2d2-1a2dcddb800e','Nadine Sarah Bishop',2,'[{\"changed\": {\"fields\": [\"Full Name\", \"Profile tagline\", \"Bio\", \"Profile image\"]}}]',7,1),(19,'2021-09-17 16:03:53.823823','3ea8bfa0-171a-4005-8483-a3a51a961cd0','Doris Carla',3,'',7,1),(20,'2021-09-17 16:15:50.461610','54f26347-052b-4303-b2d2-1a2dcddb800e','Nadine Sarah Bishop',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',7,1),(21,'2021-09-18 15:16:17.666178','1','When You Should Use NodeJS',1,'[{\"added\": {}}]',8,1),(22,'2021-09-18 16:25:57.017630','2','Design Pattern',1,'[{\"added\": {}}]',8,1),(23,'2021-09-18 16:31:43.727849','3','JavaScript vs TypeScript: What\'s the deal?',1,'[{\"added\": {}}]',8,1),(24,'2021-09-18 16:35:36.141453','4','Django vs. Flask? Which one should you pick?',1,'[{\"added\": {}}]',8,1),(25,'2021-09-18 16:35:49.031053','1','When You Should Use NodeJS',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',8,1),(26,'2021-09-18 20:08:53.516731','5','Credit Card Payment UI With ReactJS',1,'[{\"added\": {}}]',8,1),(27,'2021-09-18 22:03:21.205676','6a188012-9cc1-4fcc-8256-ca25f3386e3b','Great Article',1,'[{\"added\": {}}]',9,1),(28,'2021-09-18 22:03:43.796254','e32fcf46-e199-4cee-88dc-5d75f9a6899e','Wow Nice Product',1,'[{\"added\": {}}]',9,1),(29,'2021-09-19 11:53:49.424076','1','JavaScript vs TypeScript: What\'s the deal?',1,'[{\"added\": {}}]',8,1),(30,'2021-09-19 12:06:09.936932','2','Imagine Scope',2,'[{\"changed\": {\"fields\": [\"Author\", \"Status\"]}}]',8,1),(31,'2021-09-19 12:17:44.866534','2','Imagine Scope',3,'',8,1),(32,'2021-09-19 13:46:41.919804','cd5dcc87-15bb-48cc-af65-9bc5cfb8a037','Python',1,'[{\"added\": {}}]',11,1),(33,'2021-09-19 13:46:49.546621','2014158c-0cd2-452b-ae83-20943e3d9e5b','JavaScript',1,'[{\"added\": {}}]',11,1),(34,'2021-09-19 13:46:53.848486','61297cb4-052e-48c8-9585-af681b89ef28','HTML',1,'[{\"added\": {}}]',11,1),(35,'2021-09-19 13:46:57.983127','da527fe7-ae5c-49f5-9d33-dea94c383fa1','CSS',1,'[{\"added\": {}}]',11,1),(36,'2021-09-19 13:47:04.761182','5227848b-07e1-4e86-8820-87641178c957','Django',1,'[{\"added\": {}}]',11,1),(37,'2021-09-19 13:47:16.711957','b0a1452f-4fe7-4ddd-9cf6-6d3418adbed1','Node JS',1,'[{\"added\": {}}]',11,1),(38,'2021-09-19 13:47:30.554866','3d35da1a-9c85-4ab5-ade2-4c5d2ab2b542','React',1,'[{\"added\": {}}]',11,1),(39,'2021-09-19 13:47:40.783596','c2746f29-7031-4357-9dc1-71905fbf7214','Vue',1,'[{\"added\": {}}]',11,1),(40,'2021-09-19 13:47:45.500840','11be71c9-36a2-40e3-b0ca-4888629e65ce','Express',1,'[{\"added\": {}}]',11,1),(41,'2021-09-19 13:47:51.153280','90f53c92-24aa-4b51-b6b0-0c4999e138d5','MySQL',1,'[{\"added\": {}}]',11,1),(42,'2021-09-19 13:47:59.501734','ff21640f-8ab2-4b3d-8a93-7cc05dc4edec','PostgreSQL',1,'[{\"added\": {}}]',11,1),(43,'2021-09-19 13:48:06.299864','a5ba406a-f653-4250-9350-4b88a098001c','MongoDB',1,'[{\"added\": {}}]',11,1),(44,'2021-09-19 13:59:15.856183','1','JavaScript vs TypeScript: What\'s the deal?',2,'[{\"changed\": {\"fields\": [\"Tags\"]}}]',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(8,'blog','article'),(9,'blog','comment'),(10,'blog','review'),(11,'blog','tag'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'users','profile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-09-14 13:25:31.811827'),(2,'auth','0001_initial','2021-09-14 13:25:32.629820'),(3,'admin','0001_initial','2021-09-14 13:25:32.802621'),(4,'admin','0002_logentry_remove_auto_add','2021-09-14 13:25:32.813620'),(5,'admin','0003_logentry_add_action_flag_choices','2021-09-14 13:25:32.824621'),(6,'contenttypes','0002_remove_content_type_name','2021-09-14 13:25:32.970621'),(7,'auth','0002_alter_permission_name_max_length','2021-09-14 13:25:33.058620'),(8,'auth','0003_alter_user_email_max_length','2021-09-14 13:25:33.089619'),(9,'auth','0004_alter_user_username_opts','2021-09-14 13:25:33.099620'),(10,'auth','0005_alter_user_last_login_null','2021-09-14 13:25:33.163617'),(11,'auth','0006_require_contenttypes_0002','2021-09-14 13:25:33.167619'),(12,'auth','0007_alter_validators_add_error_messages','2021-09-14 13:25:33.178621'),(13,'auth','0008_alter_user_username_max_length','2021-09-14 13:25:33.394618'),(14,'auth','0009_alter_user_last_name_max_length','2021-09-14 13:25:33.495619'),(15,'auth','0010_alter_group_name_max_length','2021-09-14 13:25:33.522619'),(16,'auth','0011_update_proxy_permissions','2021-09-14 13:25:33.532620'),(17,'auth','0012_alter_user_first_name_max_length','2021-09-14 13:25:33.608618'),(18,'sessions','0001_initial','2021-09-14 13:25:33.656619'),(19,'users','0001_initial','2021-09-14 13:41:45.124395'),(20,'users','0002_profile_username','2021-09-14 22:26:11.416098'),(27,'blog','0001_initial','2021-09-19 11:40:18.171280'),(28,'blog','0002_auto_20210919_1811','2021-09-19 12:11:19.964138'),(29,'blog','0003_auto_20210919_1924','2021-09-19 13:25:39.471783');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('e8s9hls0la06fsn4ectzykektudceade','.eJxVjMsOwiAQRf-FtSFAKQ-X7v0GMjMMUjU0Ke3K-O_apAvd3nPOfYkE21rT1nlJUxZnocXpd0OgB7cd5Du02yxpbusyodwVedAur3Pm5-Vw_w4q9PqtAwdChwOjNkpH4wiHgj7amIPVDqgUhcY4CF6RLq4o7WMYR7DBMmYS7w_pnjgG:1mQvt6:ywp-g76bxv04BjX6KQrGB85Ky0IDHA7c3JR6gban2yU','2021-09-30 18:13:32.226394'),('ptl5aenejqec8i18otdzi8308qvaxife','.eJxVjMsOwiAQRf-FtSFAKQ-X7v0GMjMMUjU0Ke3K-O_apAvd3nPOfYkE21rT1nlJUxZnocXpd0OgB7cd5Du02yxpbusyodwVedAur3Pm5-Vw_w4q9PqtAwdChwOjNkpH4wiHgj7amIPVDqgUhcY4CF6RLq4o7WMYR7DBMmYS7w_pnjgG:1mS13Q:cd2L9DlGkyo2C07kvXWrTpvmRvuT0loZCIixicXZlmk','2021-10-03 17:56:40.418927');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_profile`
--

DROP TABLE IF EXISTS `users_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_profile` (
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `profile_tagline` varchar(200) DEFAULT NULL,
  `bio` longtext,
  `profile_image` varchar(100) DEFAULT NULL,
  `address_1` varchar(128) DEFAULT NULL,
  `address_2` varchar(128) DEFAULT NULL,
  `city` varchar(65) DEFAULT NULL,
  `zip` varchar(4) DEFAULT NULL,
  `country` varchar(70) DEFAULT NULL,
  `github` varchar(200) DEFAULT NULL,
  `twitter` varchar(200) DEFAULT NULL,
  `linkedin` varchar(200) DEFAULT NULL,
  `facebook` varchar(200) DEFAULT NULL,
  `youtube` varchar(200) DEFAULT NULL,
  `website` varchar(200) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `id` char(32) NOT NULL,
  `user_id` int DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `users_profile_user_id_2112e78d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_profile`
--

LOCK TABLES `users_profile` WRITE;
/*!40000 ALTER TABLE `users_profile` DISABLE KEYS */;
INSERT INTO `users_profile` VALUES ('Bradley Powell','bradley.powell@example.com','I\'m Superman','','profiles/profile_user.jpg','9077 Oak Ridge Ln',NULL,'California',NULL,'USA',NULL,NULL,NULL,NULL,NULL,NULL,'2021-09-14 14:16:08.312939','2021-09-14 23:00:33.150340','422cffe605b04b94aa4cdc3a3ae47039',2,'bradley'),('Nadine Sarah Bishop','nadine@example.com','Nadine is a smart medical student who suffers from a severe phobia of buttons','Nadine Sarah Bishop is a 24-year-old medical student who enjoys watching sport, horse riding and walking. She is smart and friendly, but can also be very greedy and a bit sneaky.\r\n\r\nShe is English who defines herself as pan sexual. She is currently at college. studying medicine.\r\n\r\nPhysically, Nadine is slightly overweight but otherwise in good shape. She is short with brown skin, black hair and black eyes.\r\n\r\nShe grew up in an upper class neighborhood. She was raised by her mother, her father having left when she was young.','profiles/photo-1494790108377-be9c29b29330.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-09-15 15:54:39.654595','2021-09-17 16:15:50.369607','54f26347052b4303b2d21a2dcddb800e',5,'nadinesarah'),('K M H Mubin','kmhmubin@gmail.com','You\'ll Never Get Hired if You Say This in a Job Interview','Hi, I\'m a full-stack software developer and UI designer. An anime lover.','profiles/IMG_20210108_170718_Small.jpg','H#433/3, barekvandar road, membarbari, dakshinkhan, uttara',NULL,'Dhaka','1230','Bangladesh','https://github.com/kmhmubin','https://twitter.com/kmhmubin','https://www.linkedin.com/in/kmhmubin/','https://www.facebook.com/kmhmubin',NULL,'https://mubinsodyssey.com/','2021-09-14 13:47:45.516594','2021-09-18 22:25:24.441807','f2b56eaaf2d4419a98d1d13928c30f35',1,'mubin');
/*!40000 ALTER TABLE `users_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-20  0:04:17
