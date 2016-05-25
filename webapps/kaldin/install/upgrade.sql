ALTER TABLE `exm_company` 
ADD COLUMN `logoimage` VARCHAR(50) NULL DEFAULT 'logo-blue.png' AFTER `isprofile`,
ADD COLUMN `themeid` INT(1) NULL DEFAULT 0 AFTER `logoimage`;
ALTER TABLE `exm_question` ADD COLUMN `questionurl` VARCHAR(250) NULL  AFTER `date_created` ;
ALTER TABLE `exm_test` ADD COLUMN `videourl` VARCHAR(250) NULL AFTER `exmurl`, ADD COLUMN `examinfofile` VARCHAR(50) NULL AFTER `videourl`;
ALTER TABLE `exm_test` ADD COLUMN `selectedquestions` TEXT NULL AFTER `examinfofile`;
ALTER TABLE `exm_exam` ADD COLUMN `multiplepublicexam` INT(1) DEFAULT 1 NULL COMMENT '0=No , 1=Yes' AFTER `sendresultemail`;

/****28th Dec 2015***/

ALTER TABLE `exm_test` 
ADD COLUMN `testtype` INT(1) NULL DEFAULT 0 COMMENT '' AFTER `selectedquestions`;
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

