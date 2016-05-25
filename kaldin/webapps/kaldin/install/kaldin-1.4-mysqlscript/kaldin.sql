DROP TABLE IF EXISTS `email_settings`;
CREATE TABLE `email_settings` (
  `host` varchar(100) DEFAULT NULL,
  `port` int(7) DEFAULT NULL,
  `mail_from` varchar(100) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `auth_flag` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `exm_activity_log`;
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `exm_answers`;
CREATE TABLE `exm_answers` (
  `answerid` int(5) NOT NULL AUTO_INCREMENT,
  `optionA` text NOT NULL,
  `optionB` text NOT NULL,
  `optionC` text,
  `optionD` text,
  `optionE` text,
  `optionF` text,
  `optionG` text,
  `answer` varchar(250) NOT NULL DEFAULT '',
  `questionid` int(5) NOT NULL COMMENT 'foreign key',
  PRIMARY KEY (`answerid`),
  KEY `FK_exm_answers` (`questionid`),
  KEY `answerid_index` (`answerid`),
  KEY `answer_index` (`answer`),
  KEY `questionid_index` (`questionid`)
) ENGINE=MyISAM AUTO_INCREMENT=109150 DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `exm_candidate`;
CREATE TABLE `exm_candidate` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(2) NOT NULL,
  `email` text,
  `password` text,
  `status` int(11) DEFAULT NULL,
  `question` tinytext,
  `answer` tinytext,
  `tech` tinytext,
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `exm_candidate_academic`;
CREATE TABLE `exm_candidate_academic` (
  `academicid` int(11) NOT NULL AUTO_INCREMENT,
  `candidateid` int(11) NOT NULL,
  `qualification` varchar(20) NOT NULL,
  `passingyear` int(4) NOT NULL,
  `percentage` double DEFAULT NULL,
  `university` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`academicid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `exm_candidate_experience`;
CREATE TABLE `exm_candidate_experience` (
  `expid` int(11) NOT NULL AUTO_INCREMENT,
  `candidateid` int(11) NOT NULL,
  `companyname` varchar(20) NOT NULL DEFAULT '',
  `fromdate` date DEFAULT NULL,
  `todate` date DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`expid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `exm_candidate_group`;
CREATE TABLE `exm_candidate_group` (
  `dummyid` int(11) NOT NULL AUTO_INCREMENT,
  `groupid` int(11) NOT NULL COMMENT 'Refers exm_group',
  `userid` int(11) NOT NULL COMMENT 'Refers exm_candidate',
  PRIMARY KEY (`dummyid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `exm_candidate_profile`;
CREATE TABLE `exm_candidate_profile` (
  `personalid` int(11) NOT NULL AUTO_INCREMENT,
  `candidateid` int(11) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address1` varchar(100) NOT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(20) NOT NULL,
  `country` varchar(40) DEFAULT NULL,
  `zipcode` int(10) DEFAULT '0',
  `phoneNumber` bigint(15) NOT NULL DEFAULT '0',
  `mobilenumber` bigint(15) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  PRIMARY KEY (`personalid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `exm_candidate_technology`;
CREATE TABLE `exm_candidate_technology` (
  `techid` int(11) NOT NULL AUTO_INCREMENT,
  `candidateid` int(11) NOT NULL,
  `technology` varchar(30) NOT NULL DEFAULT '',
  `skills` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`techid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `exm_company`;
CREATE TABLE `exm_company` (
  `companyid` int(2) NOT NULL AUTO_INCREMENT,
  `companyname` varchar(20) DEFAULT '',
  `companyurl` varchar(50) DEFAULT '',
  `isactive` int(1) DEFAULT '1',
  `isdeleted` int(1) DEFAULT '0',
  `isprofile` int(1) DEFAULT '0',
  PRIMARY KEY (`companyid`),
  KEY `companyid_index` (`companyid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `exm_company_technology`;
CREATE TABLE `exm_company_technology` (
  `ctechid` int(3) NOT NULL AUTO_INCREMENT,
  `companyid` int(2) NOT NULL,
  `technology` tinytext NOT NULL,
  PRIMARY KEY (`ctechid`)
) ENGINE=MyISAM AUTO_INCREMENT=383 DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `exm_country`;
CREATE TABLE `exm_country` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ccode` varchar(45) DEFAULT NULL,
  `cname` varchar(100) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=253 DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `exm_design`;
CREATE TABLE `exm_design` (
  `designid` int(2) NOT NULL AUTO_INCREMENT,
  `companyid` int(2) NOT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `fontsize` int(3) DEFAULT NULL,
  `fontcolor` varchar(20) DEFAULT NULL,
  `fontfaily` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`designid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `exm_errorlog`;
CREATE TABLE `exm_errorlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intype` varchar(10) DEFAULT NULL COMMENT 'JAVA / JSP',
  `actionname` varchar(250) DEFAULT NULL,
  `exceptiontype` text,
  `stacktrace` text,
  `userid` int(11) DEFAULT '0',
  `updatedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `exm_exam`;
CREATE TABLE `exm_exam` (
  `examid` int(11) NOT NULL AUTO_INCREMENT,
  `examname` varchar(50) DEFAULT NULL,
  `udid` varchar(200) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `description` text,
  `companyid` int(2) DEFAULT '0',
  PRIMARY KEY (`examid`),
  KEY `examid_index` (`examid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `exm_group`;
CREATE TABLE `exm_group` (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(50) DEFAULT NULL,
  `companyid` int(11) DEFAULT NULL COMMENT 'Refer exm_user',
  PRIMARY KEY (`groupid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `exm_level`;
CREATE TABLE `exm_level` (
  `levelid` int(2) NOT NULL AUTO_INCREMENT,
  `companyid` int(2) NOT NULL,
  `level` tinytext NOT NULL,
  PRIMARY KEY (`levelid`)
) ENGINE=MyISAM AUTO_INCREMENT=391 DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `exm_mailtemplate`;
CREATE TABLE `exm_mailtemplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mailtype` varchar(50) DEFAULT NULL,
  `mailsubject` varchar(150) DEFAULT NULL,
  `mailcontent` longtext,
  `type` varchar(50) DEFAULT NULL,
  `fromfield` varchar(200) DEFAULT NULL,
  `ccfield` varchar(200) DEFAULT NULL,
  `bccfield` varchar(200) DEFAULT NULL,
  `header` text,
  `footer` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `exm_question`;
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
  `questionhint` text,
  `uid` varchar(200) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`questionid`),
  KEY `uid` (`uid`),
  KEY `questionid_index` (`questionid`),
  KEY `companyid_index` (`companyid`),
  KEY `subjectid_index` (`subjectid`),
  KEY `topicid_index` (`topicid`)
) ENGINE=MyISAM AUTO_INCREMENT=109422 DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `exm_result`;
CREATE TABLE `exm_result` (
  `resultid` int(5) NOT NULL AUTO_INCREMENT,
  `userid` int(5) NOT NULL,
  `marks` int(4) DEFAULT NULL,
  `remark` tinytext,
  `testid` varchar(6) NOT NULL,
  `examid` int(5) DEFAULT '-1',
  PRIMARY KEY (`resultid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `exm_rights`;
CREATE TABLE `exm_rights` (
  `role` int(1) NOT NULL DEFAULT '0',
  `companyid` int(2) NOT NULL,
  `moduleA` tinyint(1) NOT NULL DEFAULT '0',
  `moduleB` tinyint(1) NOT NULL DEFAULT '0',
  `moduleC` tinyint(1) NOT NULL DEFAULT '0',
  `moduleD` tinyint(1) NOT NULL DEFAULT '0',
  `moduleE` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `exm_settings`;
CREATE TABLE `exm_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `showcandidateresult` int(1) DEFAULT NULL COMMENT '0=No, 1=Yes',
  `summary_details` int(1) DEFAULT NULL COMMENT '0=summary, 1=details',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `exm_state`;
CREATE TABLE `exm_state` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sname` varchar(100) DEFAULT NULL,
  `cid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `sid_index` (`sid`),
  KEY `cid_index` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=4390 DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `exm_subject`;
CREATE TABLE `exm_subject` (
  `subjectid` int(2) NOT NULL AUTO_INCREMENT,
  `companyid` int(2) NOT NULL,
  `subjectname` tinytext NOT NULL,
  `dateadded` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`subjectid`),
  KEY `subjectid_index` (`subjectid`),
  KEY `companyid_index` (`companyid`)
) ENGINE=MyISAM AUTO_INCREMENT=3223 DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `exm_test`;
CREATE TABLE `exm_test` (
  `testid` varchar(6) DEFAULT NULL,
  `companyid` int(2) NOT NULL,
  `testname` tinytext,
  `noofquestions` int(3) DEFAULT NULL,
  `duration` int(3) DEFAULT NULL,
  `passingmarks` int(3) DEFAULT NULL,
  `totalmarks` int(4) DEFAULT NULL,
  `negativemarks` int(1) DEFAULT NULL,
  `perquestionmarks` int(2) DEFAULT NULL,
  `levelid` int(1) DEFAULT NULL,
  `comments` text,
  `exmurl` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `exm_test_given`;
CREATE TABLE `exm_test_given` (
  `test_givenid` int(6) NOT NULL AUTO_INCREMENT,
  `testid` varchar(6) NOT NULL,
  `userid` int(5) DEFAULT NULL,
  `testdate` date DEFAULT NULL,
  `examid` int(5) DEFAULT '-1',
  PRIMARY KEY (`test_givenid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `exm_test_questionanswer`;
CREATE TABLE `exm_test_questionanswer` (
  `dummyid` int(5) NOT NULL AUTO_INCREMENT,
  `questionid` int(5) DEFAULT NULL,
  `answer` text,
  `resultid` int(5) DEFAULT NULL,
  PRIMARY KEY (`dummyid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `exm_test_schedule`;
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
  PRIMARY KEY (`dummyid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `exm_test_topic`;
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `exm_topic`;
CREATE TABLE `exm_topic` (
  `topicid` int(3) NOT NULL AUTO_INCREMENT,
  `companyid` int(2) NOT NULL,
  `topicname` tinytext NOT NULL,
  `subjectid` int(11) DEFAULT NULL,
  PRIMARY KEY (`topicid`)
) ENGINE=MyISAM AUTO_INCREMENT=272 DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `exm_university`;
CREATE TABLE `exm_university` (
  `universityid` int(4) NOT NULL AUTO_INCREMENT,
  `universityname` varchar(255) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `zip` int(20) NOT NULL,
  PRIMARY KEY (`universityid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `exm_unregisteredusers`;
CREATE TABLE `exm_unregisteredusers` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `emailId` varchar(200) DEFAULT NULL,
  `companyId` int(11) DEFAULT '0',
  `status` int(1) DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `exm_user`;
CREATE TABLE `exm_user` (
  `userid` int(5) NOT NULL AUTO_INCREMENT,
  `companyid` int(2) NOT NULL,
  `firstname` tinytext NOT NULL,
  `lastname` tinytext NOT NULL,
  `username` tinytext NOT NULL,
  `password` tinytext NOT NULL,
  `role` int(1) NOT NULL DEFAULT '0',
  `contactno` varchar(30) DEFAULT NULL,
  `address` longtext,
  `email` tinytext NOT NULL,
  `isdeleted` int(1) DEFAULT '0',
  `timezone` tinytext,
  `Country` tinytext,
  `State` tinytext,
  `City` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  KEY `userid_index` (`userid`),
  KEY `companyid_index` (`companyid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `fb_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Default Id, and a primary Key',
  `fb_message` text COMMENT 'Message from user',
  `fb_userIP` varchar(25) DEFAULT NULL COMMENT 'User Ip',
  `fb_browserName` varchar(100) DEFAULT NULL,
  `fb_browserVersion` varchar(100) DEFAULT NULL,
  `fb_os` varchar(100) DEFAULT NULL,
  `fb_refrer` varchar(512) DEFAULT NULL,
  `fb_screen` longtext COMMENT 'Image in String format',
  `fb_timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`fb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

