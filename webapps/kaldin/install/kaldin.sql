DROP TABLE IF EXISTS `email_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_settings` (
  `host` varchar(100) DEFAULT NULL,
  `port` int(7) DEFAULT NULL,
  `mail_from` varchar(100) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `auth_flag` varchar(6) DEFAULT NULL,
  `contype` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_activity_log` (
  `id` int(40) NOT NULL AUTO_INCREMENT,
  `page` varchar(30) DEFAULT NULL,
  `url` varchar(1500) DEFAULT NULL,
  `session` varchar(500) DEFAULT NULL,
  `ip` varchar(200) DEFAULT NULL,
  `browser` varchar(1500) DEFAULT NULL,
  `referer` varchar(1500) DEFAULT NULL,
  `browserlang` varchar(200) DEFAULT NULL,
  `userid` varchar(25) DEFAULT NULL,
  `dateonly` date DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=387275 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_answers` (
  `answerid` int(5) NOT NULL AUTO_INCREMENT,
  `optionA` mediumtext NOT NULL,
  `optionB` mediumtext NOT NULL,
  `optionC` mediumtext,
  `optionD` mediumtext,
  `optionE` mediumtext,
  `optionF` mediumtext,
  `optionG` mediumtext,
  `answer` varchar(250) NOT NULL DEFAULT '',
  `questionid` int(5) NOT NULL COMMENT 'foreign key',
  PRIMARY KEY (`answerid`),
  KEY `FK_exm_answers` (`questionid`),
  KEY `answerid_index` (`answerid`),
  KEY `answer_index` (`answer`),
  KEY `questionid_index` (`questionid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_candidate` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(2) NOT NULL,
  `email` mediumtext,
  `password` mediumtext,
  `status` int(11) DEFAULT NULL,
  `question` text,
  `answer` text,
  `tech` text,
  `isdeleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  KEY `isdeleted_indx` (`isdeleted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_candidate_academic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_candidate_academic` (
  `academicid` int(11) NOT NULL AUTO_INCREMENT,
  `candidateid` int(11) NOT NULL,
  `qualification` varchar(20) NOT NULL,
  `passingyear` int(4) NOT NULL,
  `percentage` double DEFAULT NULL,
  `university` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`academicid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_candidate_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_candidate_experience` (
  `expid` int(11) NOT NULL AUTO_INCREMENT,
  `candidateid` int(11) NOT NULL,
  `companyname` varchar(20) NOT NULL DEFAULT '',
  `fromdate` date DEFAULT NULL,
  `todate` date DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`expid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_candidate_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_candidate_group` (
  `dummyid` int(11) NOT NULL AUTO_INCREMENT,
  `groupid` int(11) NOT NULL COMMENT 'Refers exm_group',
  `userid` int(11) NOT NULL COMMENT 'Refers exm_candidate',
  PRIMARY KEY (`dummyid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_candidate_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_candidate_profile` (
  `personalid` int(11) NOT NULL AUTO_INCREMENT,
  `candidateid` int(11) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `zipcode` int(10) DEFAULT '0',
  `phoneNumber` bigint(15) DEFAULT NULL,
  `mobilenumber` bigint(15) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`personalid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_candidate_technology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_candidate_technology` (
  `techid` int(11) NOT NULL AUTO_INCREMENT,
  `candidateid` int(11) NOT NULL,
  `technology` varchar(30) NOT NULL DEFAULT '',
  `skills` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`techid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_company` (
  `companyid` int(2) NOT NULL AUTO_INCREMENT,
  `companyname` varchar(255) DEFAULT '',
  `companyurl` varchar(50) DEFAULT '',
  `isactive` int(1) DEFAULT '1',
  `isdeleted` int(1) DEFAULT '0',
  `isprofile` int(1) DEFAULT '0',
  PRIMARY KEY (`companyid`),
  KEY `companyid_index` (`companyid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_company_technology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_company_technology` (
  `ctechid` int(3) NOT NULL AUTO_INCREMENT,
  `companyid` int(2) NOT NULL,
  `technology` text NOT NULL,
  PRIMARY KEY (`ctechid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_country` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ccode` varchar(45) DEFAULT NULL,
  `cname` varchar(100) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_design`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_design` (
  `designid` int(2) NOT NULL AUTO_INCREMENT,
  `companyid` int(2) NOT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `fontsize` int(3) DEFAULT NULL,
  `fontcolor` varchar(20) DEFAULT NULL,
  `fontfaily` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`designid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_errorlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_errorlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intype` varchar(10) DEFAULT NULL COMMENT 'JAVA / JSP',
  `actionname` varchar(250) DEFAULT NULL,
  `exceptiontype` mediumtext,
  `stacktrace` mediumtext,
  `userid` int(11) DEFAULT '0',
  `updatedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_exam` (
  `examid` int(11) NOT NULL AUTO_INCREMENT,
  `examname` varchar(50) DEFAULT NULL,
  `udid` varchar(200) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `description` mediumtext,
  `companyid` int(2) DEFAULT '0',
  `timezoneId` int(11) DEFAULT NULL,
  `iscertificateenabled` int(1) DEFAULT '0' COMMENT '0=disabled , 1=enabled',
  `certificateid` int(11) DEFAULT NULL COMMENT 'Refers exm_certificatetemplate',
  `sendcertificatepdf` int(1) DEFAULT '0' COMMENT '0=No , 1=Yes',
  `sendresultemail` int(1) DEFAULT '0' COMMENT '0=No , 1=Yes',
  PRIMARY KEY (`examid`),
  KEY `examid_index` (`examid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_exam_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_exam_count` (
  `pkid` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(5) NOT NULL,
  `inputdate` date NOT NULL,
  `noofexamsused` int(4) DEFAULT '0',
  `planid` int(4) DEFAULT '0',
  `activeexamcount` int(4) DEFAULT '1' COMMENT '1=Current 0=Old',
  `unableexamcount` int(4) DEFAULT '0',
  `contactuscount` int(4) DEFAULT '0',
  `resumeexamcount` int(4) DEFAULT '0',
  PRIMARY KEY (`pkid`),
  KEY `ID_CompanyId` (`companyid`),
  KEY `ID_InputDate` (`inputdate`),
  KEY `ID_ExamCount` (`noofexamsused`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_exam_tempinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_exam_tempinfo` (
  `tiid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `testid` varchar(6) DEFAULT NULL,
  `examid` int(11) DEFAULT NULL,
  `startime` varchar(30) DEFAULT NULL,
  `endtime` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`tiid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_exam_tempquestans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_exam_tempquestans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionid` int(10) DEFAULT NULL,
  `answer` mediumtext,
  `tiid` int(11) DEFAULT NULL COMMENT 'Refers exm_exam_tempinfo',
  `status` int(2) DEFAULT '0',
  `timetaken` int(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_group` (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(50) DEFAULT NULL,
  `companyid` int(11) DEFAULT NULL COMMENT 'Refer exm_user',
  PRIMARY KEY (`groupid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_level` (
  `levelid` int(2) NOT NULL AUTO_INCREMENT,
  `companyid` int(2) NOT NULL,
  `level` text NOT NULL,
  PRIMARY KEY (`levelid`)
) ENGINE=MyISAM AUTO_INCREMENT=2269 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_mailtemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_mailtemplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mailtype` varchar(50) DEFAULT NULL,
  `mailsubject` varchar(150) DEFAULT NULL,
  `mailcontent` longtext,
  `type` varchar(50) DEFAULT NULL,
  `fromfield` varchar(200) DEFAULT NULL,
  `ccfield` varchar(200) DEFAULT NULL,
  `bccfield` varchar(200) DEFAULT NULL,
  `header` mediumtext,
  `footer` mediumtext,
  `companyid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_question` (
  `questionid` int(5) NOT NULL AUTO_INCREMENT,
  `questiontype` int(1) NOT NULL DEFAULT '0',
  `question` longtext NOT NULL,
  `levelid` int(2) NOT NULL DEFAULT '0',
  `occurance` int(2) DEFAULT '0',
  `showasMCQ` tinyint(1) NOT NULL,
  `topicid` int(3) DEFAULT NULL COMMENT 'foreign key',
  `companyid` int(2) DEFAULT NULL,
  `subjectid` int(2) DEFAULT '0' COMMENT 'Refers exm_subject',
  `questionhint` mediumtext,
  `uid` varchar(200) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`questionid`),
  KEY `uid` (`uid`),
  KEY `questionid_index` (`questionid`),
  KEY `companyid_index` (`companyid`),
  KEY `subjectid_index` (`subjectid`),
  KEY `topicid_index` (`topicid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_result` (
  `resultid` int(5) NOT NULL AUTO_INCREMENT,
  `userid` int(5) NOT NULL,
  `marks` int(4) DEFAULT NULL,
  `remark` text,
  `testid` varchar(6) NOT NULL,
  `examid` int(5) DEFAULT '-1',
  PRIMARY KEY (`resultid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_rights` (
  `role` int(1) NOT NULL DEFAULT '0',
  `companyid` int(2) NOT NULL,
  `moduleA` tinyint(1) NOT NULL DEFAULT '0',
  `moduleB` tinyint(1) NOT NULL DEFAULT '0',
  `moduleC` tinyint(1) NOT NULL DEFAULT '0',
  `moduleD` tinyint(1) NOT NULL DEFAULT '0',
  `moduleE` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `showcandidateresult` int(1) DEFAULT NULL COMMENT '0=No, 1=Yes',
  `summary_details` int(1) DEFAULT NULL COMMENT '0=summary, 1=details',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_state` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sname` varchar(100) DEFAULT NULL,
  `cid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `sid_index` (`sid`),
  KEY `cid_index` (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_subject` (
  `subjectid` int(2) NOT NULL AUTO_INCREMENT,
  `companyid` int(2) NOT NULL,
  `subjectname` text NOT NULL,
  `dateadded` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`subjectid`),
  KEY `subjectid_index` (`subjectid`),
  KEY `companyid_index` (`companyid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_test` (
  `testid` varchar(6) DEFAULT NULL,
  `companyid` int(2) NOT NULL,
  `testname` text,
  `noofquestions` int(3) DEFAULT NULL,
  `duration` int(3) DEFAULT NULL,
  `passingmarks` int(3) DEFAULT NULL,
  `totalmarks` int(4) DEFAULT NULL,
  `negativemarks` int(1) DEFAULT NULL,
  `perquestionmarks` int(2) DEFAULT NULL,
  `levelid` int(1) DEFAULT NULL,
  `comments` mediumtext,
  `exmurl` varchar(50) DEFAULT NULL,
  KEY `testid_indx` (`testid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_test_given`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_test_given` (
  `test_givenid` int(6) NOT NULL AUTO_INCREMENT,
  `testid` varchar(6) NOT NULL,
  `userid` int(5) DEFAULT NULL,
  `testdate` date DEFAULT NULL,
  `examid` int(5) DEFAULT '-1',
  `pdfcertificatename` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`test_givenid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_test_questionanswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_test_questionanswer` (
  `dummyid` int(5) NOT NULL AUTO_INCREMENT,
  `questionid` int(5) DEFAULT NULL,
  `answer` mediumtext,
  `resultid` int(5) DEFAULT NULL,
  PRIMARY KEY (`dummyid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_test_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_test_schedule` (
  `dummyid` int(6) NOT NULL AUTO_INCREMENT,
  `testid` varchar(6) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `companyid` int(2) NOT NULL,
  `mailsendstatus` int(1) DEFAULT '0' COMMENT '0=Not Send, 1=Send ',
  `examid` int(11) DEFAULT '-1',
  `exmurl` varchar(50) DEFAULT NULL,
  `question_sequence` int(1) DEFAULT NULL COMMENT '0 = Sequential, 1=Randomize',
  PRIMARY KEY (`dummyid`),
  KEY `userid_indx` (`userid`),
  KEY `testid_indx` (`testid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_test_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_test_topic` (
  `dummyno` int(11) NOT NULL AUTO_INCREMENT,
  `testid` varchar(6) DEFAULT NULL,
  `topicid` int(3) DEFAULT NULL,
  `countofquestion` int(2) DEFAULT NULL,
  `subjectid` int(2) DEFAULT '0' COMMENT 'Refers exm_subject',
  `levelid` int(2) DEFAULT '0' COMMENT 'Refers exm_level',
  PRIMARY KEY (`dummyno`),
  KEY `testid` (`testid`),
  KEY `topicid` (`topicid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_timezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_timezone` (
  `timezoneid` int(11) NOT NULL AUTO_INCREMENT,
  `timezonename` varchar(255) DEFAULT NULL,
  `gmtoffset` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`timezoneid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_topic` (
  `topicid` int(3) NOT NULL AUTO_INCREMENT,
  `companyid` int(2) NOT NULL,
  `topicname` text NOT NULL,
  `subjectid` int(11) DEFAULT NULL,
  PRIMARY KEY (`topicid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_university`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_university` (
  `universityid` int(4) NOT NULL AUTO_INCREMENT,
  `universityname` varchar(255) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `zip` int(20) NOT NULL,
  PRIMARY KEY (`universityid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_unregisteredusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_unregisteredusers` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `emailId` varchar(200) DEFAULT NULL,
  `companyId` int(11) DEFAULT '0',
  `status` int(1) DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exm_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exm_user` (
  `userid` int(5) NOT NULL AUTO_INCREMENT,
  `companyid` int(2) NOT NULL,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `role` int(1) NOT NULL DEFAULT '0',
  `contactno` varchar(30) DEFAULT NULL,
  `address` longtext,
  `email` text NOT NULL,
  `isdeleted` int(1) DEFAULT '0',
  `timezone` text,
  `Country` text,
  `State` text,
  `City` varchar(20) DEFAULT NULL,
  `planid` int(11) DEFAULT '1' COMMENT 'refers exm_plan',
  `planmodifiedon` datetime DEFAULT NULL,
  PRIMARY KEY (`userid`),
  KEY `userid_index` (`userid`),
  KEY `companyid_index` (`companyid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `fb_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Default Id, and a primary Key',
  `fb_message` mediumtext COMMENT 'Message from user',
  `fb_userIP` varchar(25) DEFAULT NULL COMMENT 'User Ip',
  `fb_browserName` varchar(100) DEFAULT NULL,
  `fb_browserVersion` varchar(100) DEFAULT NULL,
  `fb_os` varchar(100) DEFAULT NULL,
  `fb_refrer` varchar(512) DEFAULT NULL,
  `fb_screen` longtext COMMENT 'Image in String format',
  `fb_timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`fb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
ALTER TABLE `exm_company` ADD COLUMN `logoimage` VARCHAR(50) NULL DEFAULT 'logo-blue.png' AFTER `isprofile`, ADD COLUMN `themeid` INT(1) NULL DEFAULT 0 AFTER `logoimage`;
ALTER TABLE `exm_question` ADD COLUMN `questionurl` VARCHAR(250) NULL  AFTER `date_created` ;
ALTER TABLE `exm_test` ADD COLUMN `videourl` VARCHAR(250) NULL AFTER `exmurl`, ADD COLUMN `examinfofile` VARCHAR(50) NULL AFTER `videourl`;
ALTER TABLE `exm_test` ADD COLUMN `selectedquestions` TEXT NULL AFTER `examinfofile`;
ALTER TABLE `exm_exam` ADD COLUMN `multiplepublicexam` INT(1) DEFAULT 1 NULL COMMENT '0=No , 1=Yes' AFTER `sendresultemail`;
ALTER TABLE `exm_test` ADD COLUMN `testtype` INT(1) NULL DEFAULT 0 COMMENT '' AFTER `selectedquestions`;
ALTER TABLE `exm_test_schedule` ADD COLUMN `starttime` TIME DEFAULT '00:00:00' NULL AFTER `question_sequence`, ADD COLUMN `endtime` TIME DEFAULT '23:59:59' NULL AFTER `starttime`;
ALTER TABLE `exm_exam_count` ADD COLUMN `buynowcount` INT(4) DEFAULT 0 NULL AFTER `resumeexamcount`; 
ALTER TABLE `exm_exam_count` ADD COLUMN `passcount` INT(4) DEFAULT 0 NULL AFTER `buynowcount`, ADD COLUMN `failcount` INT(4) DEFAULT 0 NULL AFTER `passcount`; 
CREATE TABLE `calendar` (
`cdate` DATE NOT NULL DEFAULT '2000-01-01',
`cday` INT(2) UNSIGNED NOT NULL DEFAULT '1',
`cmonth` INT(2) UNSIGNED NOT NULL DEFAULT '1',
`cyear` INT(4) UNSIGNED NOT NULL DEFAULT '2000',
PRIMARY KEY (`cdate`)
);
CREATE TABLE ints (i INTEGER);
INSERT INTO ints VALUES (0) , (1), (2), (3), (4), (5), (6), (7), (8), (9);
INSERT INTO calendar (cdate, cday, cmonth, cyear)
SELECT cal.date AS cdate, DAY(cal.date) AS cday, MONTH(cal.date) AS cmonth, YEAR(cal.date) AS cyear
FROM ( 
SELECT '2013-01-01' + INTERVAL d.i*1000 + c.i* 100 + a.i * 10 + b.i DAY AS DATE 
FROM ints a JOIN ints b JOIN ints c JOIN ints d
ORDER BY d.i*1000 + c.i*100 + a.i*10 + b.i) cal 
WHERE cal.date BETWEEN '2013-01-01' AND '2030-12-31';

