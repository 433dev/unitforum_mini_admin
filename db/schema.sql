--
-- Current Database: `unitforumdb`
--

/*!40000 DROP DATABASE IF EXISTS `unitforumdb`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `unitforumdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `unitforumdb`;

--
-- Table structure for table `unitforum_admin_log`
--

DROP TABLE IF EXISTS `unitforum_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unitforum_admin_log` (
  `unitforum_admin_log_idx` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '로그 순번 (AI)',
  `unitforum_article_hist_idx` bigint(20) DEFAULT NULL,
  `unitforum_article_idx` bigint(20) unsigned NOT NULL COMMENT '유닛 게시판 게시글 순번 (AI)',
  `admin_no` int(10) unsigned NOT NULL COMMENT '관리자 번호',
  `log_type` varchar(50) NOT NULL COMMENT '로그 타입',
  `comment` varchar(200) NOT NULL COMMENT '코멘트',
  `create_dt` datetime NOT NULL COMMENT '등록일시',
  PRIMARY KEY (`unitforum_admin_log_idx`),
  KEY `idx_unitforum_admin_log_unitforum_article_idx_admin_no_log_type` (`unitforum_article_idx`,`admin_no`,`log_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unitforum_admin_log`
--

LOCK TABLES `unitforum_admin_log` WRITE;
/*!40000 ALTER TABLE `unitforum_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `unitforum_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unitforum_article`
--

DROP TABLE IF EXISTS `unitforum_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unitforum_article` (
  `unitforum_article_idx` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '유닛 게시판 게시글 순번 (AI)',
  `unitforum_master_idx` int(10) unsigned NOT NULL COMMENT '유닛 게시판 기본정보 번호',
  `world_idx` int(10) unsigned NOT NULL COMMENT '게임서비스 월드번호',
  `lang_code` varchar(10) DEFAULT NULL,
  `class1_code` varchar(100) DEFAULT NULL,
  `class2_code` varchar(100) DEFAULT NULL,
  `account_idx` bigint(20) unsigned NOT NULL COMMENT '계정번호',
  `nickname` varchar(50) DEFAULT NULL,
  `char_grade` varchar(50) DEFAULT NULL,
  `content` varchar(300) DEFAULT NULL,
  `like_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '좋아요 횟수',
  `create_dt` datetime NOT NULL COMMENT '등록일시',
  PRIMARY KEY (`unitforum_article_idx`),
  KEY `idx_01` (`unitforum_master_idx`,`lang_code`,`world_idx`,`class1_code`,`class2_code`,`like_cnt`,`create_dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='유닛 게시판 상세정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unitforum_article`
--

LOCK TABLES `unitforum_article` WRITE;
/*!40000 ALTER TABLE `unitforum_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `unitforum_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unitforum_article_hist`
--

DROP TABLE IF EXISTS `unitforum_article_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unitforum_article_hist` (
  `unitforum_article_hist_idx` bigint(20) NOT NULL AUTO_INCREMENT,
  `unitforum_article_idx` bigint(20) unsigned NOT NULL COMMENT '유닛 게시글 순번 (AI)',
  `unitforum_master_idx` int(10) unsigned NOT NULL COMMENT '유닛 게시판 기본정보 번호',
  `world_idx` int(10) unsigned NOT NULL COMMENT '게임서비스 월드번호',
  `lang_code` varchar(10) NOT NULL,
  `class1_code` int(10) unsigned NOT NULL COMMENT '클래스1 순번',
  `class2_code` int(10) unsigned NOT NULL COMMENT '클래스2 순번',
  `account_idx` bigint(20) unsigned NOT NULL COMMENT '계정번호',
  `nickname` varchar(50) NOT NULL COMMENT '(게임내) 대표캐릭터 닉네임',
  `char_grade` varchar(50) NOT NULL COMMENT '(게임내) 대표캐릭터 레벨(lev)/등급(grade)/칭호(honor)',
  `content` varchar(300) NOT NULL COMMENT '게시글 내용',
  `like_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '좋아요 횟수',
  `create_dt` datetime NOT NULL COMMENT '등록일시',
  `work_dt` datetime NOT NULL COMMENT '작업일시 (제재/삭제되어 데이터가 입력된 일시)',
  `work_user` varchar(50) NOT NULL COMMENT '작업자 이름',
  `abuse_type` smallint(5) unsigned DEFAULT NULL COMMENT '(제재로 유입시) 제재사유코드',
  `abuse_desc` varchar(300) DEFAULT NULL COMMENT '(제재로 유입시) 제재사유',
  PRIMARY KEY (`unitforum_article_hist_idx`),
  KEY `idx_unitforum_article_hist_workuser_workdt` (`work_user`,`work_dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='유닛 게시판 이력 (제재,삭제된 글)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unitforum_article_hist`
--

LOCK TABLES `unitforum_article_hist` WRITE;
/*!40000 ALTER TABLE `unitforum_article_hist` DISABLE KEYS */;
/*!40000 ALTER TABLE `unitforum_article_hist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unitforum_class1`
--

DROP TABLE IF EXISTS `unitforum_class1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unitforum_class1` (
  `unitforum_master_idx` int(10) unsigned NOT NULL COMMENT '클래스를 등록한 유닛 게시판 번호',
  `class1_code` varchar(100) NOT NULL COMMENT '클래스1 코드',
  `class1_name` varchar(200) NOT NULL COMMENT '클래스1 명칭',
  `create_dt` datetime NOT NULL COMMENT '등록일시',
  PRIMARY KEY (`unitforum_master_idx`,`class1_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='유닛 게시판별 클래스1';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unitforum_class1`
--

LOCK TABLES `unitforum_class1` WRITE;
/*!40000 ALTER TABLE `unitforum_class1` DISABLE KEYS */;
/*!40000 ALTER TABLE `unitforum_class1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unitforum_class2`
--

DROP TABLE IF EXISTS `unitforum_class2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unitforum_class2` (
  `unitforum_master_idx` int(10) unsigned NOT NULL COMMENT '클래스를 등록한 유닛 게시판 번호',
  `class1_code` varchar(100) NOT NULL COMMENT '클래스1 코드',
  `class2_code` varchar(100) NOT NULL COMMENT '클래스2 코드',
  `class2_name` varchar(200) NOT NULL COMMENT '클래스2 명칭',
  `create_dt` datetime NOT NULL COMMENT '등록일시',
  PRIMARY KEY (`unitforum_master_idx`,`class1_code`,`class2_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='유닛 게시판별 클래스2';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unitforum_class2`
--

LOCK TABLES `unitforum_class2` WRITE;
/*!40000 ALTER TABLE `unitforum_class2` DISABLE KEYS */;
/*!40000 ALTER TABLE `unitforum_class2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unitforum_like_hist`
--

DROP TABLE IF EXISTS `unitforum_like_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unitforum_like_hist` (
  `unitforum_like_hist_idx` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '좋아요 클릭정보 순번 (AI)',
  `unitforum_article_idx` bigint(20) unsigned NOT NULL COMMENT '유닛 게시글 순번',
  `account_idx` bigint(20) unsigned NOT NULL COMMENT '계정번호',
  `create_dt` datetime NOT NULL COMMENT '등록일시',
  PRIMARY KEY (`unitforum_like_hist_idx`),
  KEY `idx_unitforum_like_hist_accountidx_articleidx` (`account_idx`,`unitforum_article_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='유닛 게시판 좋아요 클릭정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unitforum_like_hist`
--

LOCK TABLES `unitforum_like_hist` WRITE;
/*!40000 ALTER TABLE `unitforum_like_hist` DISABLE KEYS */;
/*!40000 ALTER TABLE `unitforum_like_hist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unitforum_master`
--

DROP TABLE IF EXISTS `unitforum_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unitforum_master` (
  `unitforum_master_idx` int(10) unsigned NOT NULL COMMENT '순번(Live - 짝수, QA- 홀수)',
  `ssn` int(10) unsigned NOT NULL COMMENT '게임서비스 번호',
  `create_dt` datetime NOT NULL COMMENT '등록일시',
  `descr` varchar(200) NOT NULL COMMENT '게시판 설명',
  `unit_type` varchar(10) NOT NULL COMMENT '유닛타입(skill, character)',
  `show_yn` varchar(1) NOT NULL DEFAULT 'N' COMMENT '게시판 노출여부 (Y:노출,N:미노출)',
  `view_type` int(10) unsigned NOT NULL COMMENT '뷰 테마 타입',
  PRIMARY KEY (`unitforum_master_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='유닛 게시판 기본정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unitforum_master`
--

LOCK TABLES `unitforum_master` WRITE;
/*!40000 ALTER TABLE `unitforum_master` DISABLE KEYS */;
INSERT INTO `unitforum_master` VALUES (1,1,NOW(),'Equipment','equipment','Y',2),(2,1,NOW(),'Character','character','Y',2);
/*!40000 ALTER TABLE `unitforum_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unitforum_world`
--

DROP TABLE IF EXISTS `unitforum_world`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unitforum_world` (
  `unitforum_master_idx` int(10) unsigned NOT NULL COMMENT '유닛 게시판 기본정보 순번',
  `world_idx` int(10) unsigned NOT NULL COMMENT '게임서비스 월드번호',
  `world_name` varchar(100) NOT NULL COMMENT '게임서비스 월드명',
  `create_dt` datetime NOT NULL COMMENT '등록일시',
  PRIMARY KEY (`unitforum_master_idx`,`world_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='유닛 게시판 월드정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unitforum_world`
--

LOCK TABLES `unitforum_world` WRITE;
/*!40000 ALTER TABLE `unitforum_world` DISABLE KEYS */;
/*!40000 ALTER TABLE `unitforum_world` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'unitforumdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

