-- ----------------------------
--  View definition for `kj_eidt_test`
-- ----------------------------

drop VIEW if EXISTS `inibalance`;
CREATE VIEW `inibalance`AS 
SELECT
NULL AS missionId,
a.`code`,
a.account,
'2011' AS a1,
'1' AS a2,
'1' AS a3,
'初始' AS classic,
NULL AS num,
'期初建账' AS note,
NULL AS credit,
NULL AS debit,
a.creditAccumulated	AS	ca,
a.debitAccumulated	AS	da,
a.jd AS cord,
a.balance AS remain
FROM
initibalance AS a ;
/**/



drop VIEW if EXISTS kj_eidt_test;
create view  kj_eidt_test
AS
SELECT
a.referencedId,
IF(INSTR('kjan_a-e,kjan_a-f,kjan_abcd,kjan_dtb,kjqt_kjfl00_kjfl',a.billId)>0,'test','kj') AS contentType,
a.missionId,
a.missionLabel AS title,
null AS edit0_file1_url2,
a.file_name AS fileid,
null AS detail,
null AS url,
a.mission_ask,
GROUP_CONCAT(i.title) bjzl
FROM
acc_mission AS a
LEFT JOIN acc_mission_back_information AS i ON a.missionId = i.missionid
LEFT JOIN acc_mission_backbill_1 AS ba ON i.quoteid = ba.missionId
GROUP BY
a.missionId



					UNION

SELECT
a.referencedID,
'edit' AS contentType,
a.unique_id AS missionId,
a.title,
a.edit0_file1_url2,
a.fileID,
a.detail,
a.url,
NULL  AS mission_ask,
NULL bjzl
FROM exp_courseware_cells AS a 

;

-- ----------------------------
--  View definition for `acc_enter_seal_and_role`
-- ----------------------------
DROP VIEW IF EXISTS `acc_enter_seal_and_role`;
create view acc_enter_seal_and_role 
(
	sealID, roleID, seal_name,
	seal_content,
	seal_shape, seal_w, seal_h, seal_color, seal_font,
	is_seal,
	enter, enterSimName, role,
	seal_content_arc,seal_content_arc_font,
	seal_content_bottom,seal_content_bottom_font
) as
select a.sealID, a.roleID, a.seal_name, a.seal_content, a.seal_shape, a.seal_w, a.seal_h, a.seal_color, a.seal_font, '1',
	b.enter, c.enterSimName, b.role,
	seal_content_arc, seal_content_arc_font, 
	seal_content_bottom, seal_content_bottom_font
from acc_enter_seal a, acc_enter_role b, acc_enter c
where a.roleID=b.roleID and b.enter=c.enter
union all 
	select b.roleID, b.roleID, '', b.role, 
		'',0,0,'','','0',
		b.enter, c.enterSimName, b.role,
		'','','',''
	from acc_enter_role b, acc_enter c
	where b.enter=c.enter;


-- ----------------------------
--  View definition for `acc_mission_backkey_sort`
-- ----------------------------

DROP VIEW IF EXISTS `acc_mission_backkey_sort`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `acc_mission_backkey_sort` AS 
#select `bbb`.`Pkid` AS `pkid`,`bbb`.`missionId` AS `missionid`,`bbb`.`mission_title` AS `mission_title`,`bbb`.`mission_pt` AS `mission_pt`,`bbb`.`standard_url` AS `standard_url`,`bbb`.`student_url` AS `student_url`,if((locate('-',`bbb`.`mission_title`) > 1),substr(`bbb`.`mission_title`,(locate('-',`bbb`.`mission_title`) + 1)),`bbb`.`mission_title`) AS `mt`,if((locate('-',`bbb`.`mission_title`) > 0),(substr(`bbb`.`mission_title`,1,(locate('-',`bbb`.`mission_title`) - 1)) + 0),0) AS `m`,`bbb`.`pageNo` AS `pageNo` from `acc_mission_backkey` `bbb` order by if((locate('-',`bbb`.`mission_title`) > 0),(substr(`bbb`.`mission_title`,1,(locate('-',`bbb`.`mission_title`) - 1)) + 0),0);
SELECT
b.Pkid,
b.missionId,
a.title AS mission_title,
b.mission_pt,
b.standard_url,
b.student_url,
a.title AS mt,
a.sort AS m,
b.pageNo,
b.quotemissionid
FROM acc_mission_back_information AS a
LEFT JOIN acc_mission_backkey AS b ON a.quoteid = b.quotemissionid AND a.missionid = b.missionId
WHERE a.type = 'bk';


-- ----------------------------
--  View definition for `acc_mission_seal_detal`
-- ----------------------------
DROP VIEW IF EXISTS `acc_mission_seal_detal`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `acc_mission_seal_detal` AS 
#select `a`.`PKid` AS `PKid`,`a`.`missionId` AS `missionId`,`a`.`seal_id` AS `seal_id`,`a`.`seal_no` AS `seal_no`,`a`.`pro_w_after_seal` AS `pro_w_after_seal`,ifnull(`b`.`is_seal`,'') AS `is_seal`,`a`.`p_write` AS `p_write`,ifnull(`a`.`seal_init`,0) AS `seal_init`,`a`.`seal_pre` AS `seal_pre`,`a`.`seal_pre_err` AS `seal_pre_err`,`b`.`seal_content` AS `seal_content`,`b`.`seal_shape` AS `seal_shape`,`a`.`x` AS `x`,`a`.`y` AS `y`,`b`.`seal_w` AS `w`,`b`.`seal_h` AS `h`,`b`.`seal_color` AS `color`,`b`.`seal_font` AS `font`,`b`.`enter` AS `enter`,`b`.`enterSimName` AS `enterSimName`,`b`.`roleID` AS `roleID`,`b`.`role` AS `role`,`b`.`seal_name` AS `seal_name`,(((((rtrim(`b`.`enterSimName`) + ' ') + rtrim(`b`.`seal_name`)) + '(') + rtrim(`b`.`role`)) + ')') AS `detalecho`,(case `a`.`p_write` when '1' then '读、写' else '读' end) AS `p_write_echo`,`a`.`can_read_pageList` AS `can_read_pageList`,ifnull(`a`.`pageId`,1) AS `pageId`,`b`.`seal_content_arc` AS `seal_content_arc`,`b`.`seal_content_arc_font` AS `seal_content_arc_font`,`b`.`seal_content_bottom` AS `seal_content_bottom`,`b`.`seal_content_bottom_font` AS `seal_content_bottom_font` from (`acc_mission_seal` `a` join `acc_enter_seal_and_role` `b`) where (`a`.`seal_id` = `b`.`sealID`);
select 
a.PKid AS PKid,
a.missionId AS missionId,
a.seal_id AS seal_id,
a.seal_no AS seal_no,
IFNULL(a.pro_w_after_seal,'') AS pro_w_after_seal,
ifnull(b.is_seal,'') AS is_seal,
a.p_write AS p_write,
ifnull(a.seal_init,0) AS seal_init,
IFNULL(a.seal_pre,'') AS seal_pre,
IFNULL(a.seal_pre_err,1) AS seal_pre_err,
b.seal_content AS seal_content,
b.seal_shape AS seal_shape,
IFNULL(a.x,0) AS x,
IFNULL(a.y,0) AS y,
b.seal_w AS w,
b.seal_h AS h,
b.seal_color AS color,
b.seal_font AS font,
b.enter AS enter,
b.enterSimName AS enterSimName,
b.roleID AS roleID,
b.role AS role,
b.seal_name AS seal_name,
(((((rtrim(b.enterSimName) + ' ') + rtrim(b.seal_name)) + '(') + rtrim(b.role)) + ')') AS detalecho,
(case a.p_write when '1' then '读、写' else '读' end) AS p_write_echo,
a.can_read_pageList AS can_read_pageList,
ifnull(a.pageId,1) AS pageId,
IFNULL(b.seal_content_arc,'') AS seal_content_arc,
IFNULL(b.seal_content_arc_font,'') AS seal_content_arc_font,
IFNULL(b.seal_content_bottom,'') AS seal_content_bottom,
IFNULL(b.seal_content_bottom_font,'') AS seal_content_bottom_font,
a.vstatu
from (acc_mission_seal a join acc_enter_seal_and_role b) 
where (a.seal_id = b.sealID) ;


-- ----------------------------
--  View definition for `acc_referencedid_roles`
-- ----------------------------
drop view if EXISTS  acc_referencedid_roles ;
CREATE view acc_referencedid_roles as
SELECT
a.referencedId AS referencedId,
a.missionId AS missionId,
b.seal_no AS seal_no,
b.PKid AS PKid,
b.seal_id AS seal_id,
b.p_write AS p_write,
CAST(GROUP_CONCAT(distinct b.pageId ORDER BY b.pageId) AS char )AS pageId,
GROUP_CONCAT( DISTINCT IF(c.seal_name = 'none', '操作', c.seal_name) ) AS seal_name,
IFNULL(d.role_pass,0) AS role_pass,
IFNULL(d.is_role_pass,0) AS is_role_pass,
d.role AS role,
d.roleID AS roleID,
d.role_img_url AS role_img_url,
e.enter AS enter,
e.enterSimName AS enterSimName,
e.enterName AS enterName,
a.difficulty_level AS difficulty_level
from ((((`acc_mission` `a` left join `acc_mission_seal` `b` on((`a`.`missionId` = `b`.`missionId`))) left join `acc_enter_seal` `c` on((`c`.`sealID` = `b`.`seal_id`))) left join `acc_enter_role` `d` on((`d`.`roleID` = `c`.`roleID`))) left join `acc_enter` `e` on((`e`.`enter` = `d`.`enter`)))
where (`c`.`seal_name` is not null)
GROUP BY
a.missionId,
b.seal_no,
c.roleID
order by `a`.`missionId`,`b`.`seal_no`
;

-- 
-- -- ----------------------------
-- --  View definition for `backkeyinfo`(删除content）
-- -- ----------------------------
-- DROP VIEW IF EXISTS `backkeyinfo`;
-- CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `backkeyinfo` AS 
-- select `d`.`Pkid` AS `pkid`,`e`.`expID` AS `expid`,`d`.`missionId` AS `acc_missionid`,substring_index(substring_index(`d`.`standard_url`,'=',-(3)),'&',1) AS `missionId`,concat(substring_index(`a`.`node_No`,'.',1),'章',substring_index(`a`.`node_No`,'.',-(1)),'节',`b`.`sortNum`,'单元',cast(`c`.`step_label` as char charset utf8),'题') AS `zjinfo`,`e`.`mission_result` AS `last_result` from ((((`exp_courses_node` `a` join `exp_node_content` `b`) join `acc_mission` `c`) join `acc_mission_backkey` `d`) join `acc_1` `e`) where ((`a`.`node_Id` = `b`.`node_Id`) and (`b`.`contentNo` = `c`.`referencedId`) and (`c`.`missionId` = substring_index(substring_index(`d`.`standard_url`,'=',-(3)),'&',1)) and (`e`.`missionId` = substring_index(substring_index(`d`.`standard_url`,'=',-(3)),'&',1)));
-- 

-- ----------------------------
--  View definition for `exp_courses_node_content_info`
-- ----------------------------

drop VIEW if EXISTS exp_courses_node_content_info;
create view  exp_courses_node_content_info
AS
SELECT
a1.node_courseNo,
a.contentNo, 
IF(a.contentType = 'kj',b1.missionId,b2.unique_id) AS missionId,
CAST(CONCAT_WS('.',a1.node_No,a.typesort) AS CHAR) AS `CODE`,
a.typesort,
a.contentType,
IF(a.contentType = 'kj' AND FIND_IN_SET(b1.billId,'kjan_a-e,kjan_a-f,kjan_abcd,kjan_dtb,kjqt_kjfl00_kjfl'),'test', a.contentType) AS N,
IF(a.contentType = 'kj',b1.referencedId,b2.referencedID) AS referencedID,
IF(a.title IS NOT NULL ,a.title ,IFNULL(IF(a.contentType = 'kj',b1.missionLabel,b2.title),'')) AS title,
b2.fileID AS fileURL,
b2.edit0_file1_url2,
b2.url,
b2.detail,
"说明" AS file_detail,
IF(a.contentType = 'edit' AND b3.fileName IS NULL ,'wenzi.pdf', b3.fileName) AS fileName
FROM
exp_courses_node_content AS a
INNER JOIN exp_courses_node AS a1 ON a.contentNo = a1.contentNo
LEFT JOIN acc_mission AS b1 ON a.contentType = 'kj' AND a.missionid = b1.missionId
LEFT JOIN exp_courseware_cells AS b2 ON a.contentType = 'edit' AND a.missionid = b2.unique_id
LEFT JOIN mysq1_schema.media_library AS b3 ON a.contentType = 'edit' AND b2.unique_id = b3.missionID
WHERE
a.contentType = 'edit' AND
b2.unique_id IS NOT NULL OR
a.contentType = 'kj' AND
b1.missionId IS NOT NULL 
;
-- ----------------------------
--  View definition for `exp_courses_node_content_info_stu`
-- ----------------------------

drop VIEW if EXISTS exp_courses_node_content_info_stu;
create view  exp_courses_node_content_info_stu
AS
SELECT
a.classNo,
b.node_courseNo,
b.contentNo,
b.missionId,
b.`CODE`,
b.typesort,
b.contentType,
b.referencedID,
b.title,
b.fileURL,
b.edit0_file1_url2,
b.url,
b.detail,
b.file_detail,
b.fileName,
b.n
FROM
exp_experimentclass AS a
INNER JOIN exp_experimentclass_course AS a1 ON a1.classNo = a.classNo
INNER JOIN exp_courses_node_content_info AS b ON a1.courseNo = b.node_courseNo
LEFT JOIN exp_cour_node_cont AS c ON a1.classNo = c.classNo AND b.contentNo = c.contentNo AND b.missionId = c.missionid AND b.typesort = c.typesort
WHERE
c.missionid IS NULL ;


DROP VIEW IF EXISTS acc_n_0_9;
CREATE VIEW acc_n_0_9 
AS
-- acc_1

SELECT
a0.expID,
a0.missionId,
0 AS rowid,
a0.right_a AS right_count
FROM
acc_1 AS a0
WHERE
a0.right_a IS NOT NULL 
 
UNION ALL
-- acc_n
SELECT
a0.expID,
a0.missionId,
a0.rowId,
a0.right_count
FROM
acc_n AS a0
WHERE
a0.right_count IS NOT NULL 

UNION ALL
-- acc_n_1
SELECT
a0.expID,
a0.missionId,
a0.rowId,
a0.right_count
FROM
acc_n_1 AS a0
WHERE
a0.right_count IS NOT NULL 

UNION ALL
-- acc_n_2
SELECT
a0.expID,
a0.missionId,
a0.rowId,
a0.right_count
FROM
acc_n_2 AS a0
WHERE
a0.right_count IS NOT NULL 
UNION ALL

-- acc_n_3
SELECT
a0.expID,
a0.missionId,
a0.rowId,
a0.right_count
FROM
acc_n_3 AS a0
WHERE
a0.right_count IS NOT NULL 

UNION ALL
-- acc_n_4
SELECT
a0.expID,
a0.missionId,
a0.rowId,
a0.right_count
FROM
acc_n_4 AS a0
WHERE
a0.right_count IS NOT NULL 



UNION ALL
-- acc_n_5
SELECT
a0.expID,
a0.missionId,
a0.rowId,
a0.right_count
FROM
acc_n_5 AS a0
WHERE
a0.right_count IS NOT NULL 

UNION ALL
-- acc_n_6
SELECT
a0.expID,
a0.missionId,
a0.rowId,
a0.right_count
FROM
acc_n_6 AS a0
WHERE
a0.right_count IS NOT NULL 

UNION ALL
-- acc_n_7
SELECT
a0.expID,
a0.missionId,
a0.rowId,
a0.right_count
FROM
acc_n_7 AS a0
WHERE
a0.right_count IS NOT NULL 

UNION ALL
-- acc_n_8
SELECT
a0.expID,
a0.missionId,
a0.rowId,
a0.right_count
FROM
acc_n_8 AS a0
WHERE
a0.right_count IS NOT NULL 

UNION ALL
-- acc_n_9
SELECT
a0.expID,
a0.missionId,
a0.rowId,
a0.right_count
FROM
acc_n_9 AS a0
WHERE
a0.right_count IS NOT NULL 
;

DROP VIEW IF EXISTS bill;
CREATE VIEW bill 
AS
SELECT
a.billId ,
Count(a.missionId) AS num,
'rw' AS type
FROM
acc_mission AS a
GROUP BY
a.billId
UNION 
SELECT
a.bill_Id AS billId,
Count(a.missionId) AS num ,
'bj' AS type
FROM
acc_mission_backbill_1 AS a
GROUP BY
a.bill_Id ;


DROP VIEW IF EXISTS bill_1;
CREATE VIEW bill_1
AS
SELECT
a3.courseName,
a3.courseNo,a.missionId,
'-' AS `type`,
CONCAT_WS('.',a2.node_No,a1.typesort) AS `code`,
a.missionLabel,
a.billId
FROM
acc_mission AS a
INNER JOIN exp_courses_node_content AS a1 ON a.missionId = a1.missionid
INNER JOIN exp_courses_node AS a2 ON a1.contentNo = a2.contentNo
INNER JOIN exp_courses AS a3 ON a2.node_courseNo = a3.courseNo
UNION 
SELECT
a3.courseName,
a3.courseNo,
b.missionId,
'└',
CONCAT_WS('.',a2.node_No,a1.typesort,a0.sort),

b.missionLabel,
b.bill_Id
FROM 
acc_mission_back_information AS a0
INNER JOIN acc_mission AS a ON a0.missionid = a.missionId
INNER JOIN exp_courses_node_content AS a1 ON a.missionId = a1.missionid
INNER JOIN exp_courses_node AS a2 ON a1.contentNo = a2.contentNo
INNER JOIN exp_courses AS a3 ON a2.node_courseNo = a3.courseNo
INNER JOIN acc_mission_backbill_1 AS b ON a0.quoteid = b.missionId
WHERE
a0.type = 'bb' 
ORDER BY courseNo,nabc(`CODE`) ;

DROP VIEW IF EXISTS 任务;
CREATE VIEW 任务 AS
SELECT
a.courseNo,
b.node_text,
CONCAT_WS('.',b.node_No,c.typesort) AS `题号`,
c.contentType AS `类`,
d.missionLabel AS `题`,
d.billId,
e.billname,
f.billType,
f.billTypeSay,
d.missionId
FROM
exp_courses AS a
INNER JOIN exp_courses_node AS b ON b.node_courseNo = a.courseNo
INNER JOIN exp_courses_node_content AS c ON c.contentNo = b.contentNo
INNER JOIN acc_mission AS d ON c.missionid = d.missionId
INNER JOIN mysq1_schema.bill_list AS e ON d.billId = e.billId
INNER JOIN mysq1_schema.bill_type AS f ON e.billType = f.billType
WHERE
f.billType = 'kjpz'
ORDER BY
	nabc(concat_ws(
		'.',
		`b`.`node_No`,
		`c`.`typesort`
	)) ASC
;


-- ----------------------------
--  View definition for `ware`
-- ----------------------------
DROP VIEW IF EXISTS `ware`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER  VIEW `ware` AS SELECT
m.useName AS UserId,
m.`schema`,
m.fileName,
m.downlod_num,
m.preview_num,
m.missionID,
m.elementID,
m.title,
m.createtime,
REGEXP_substr(m.fileName,'^.*?\\K\\w+$') AS type,
CASE WHEN n2.courseName  IS NOT NULL THEN n2.courseName
WHEN m.`schema` = DATABASE() THEN 
CASE WHEN DATABASE() = 'qianxue_bill'  THEN '表单帮助' 
WHEN DATABASE() = 'qianxue_business'  THEN '中小企业' 
WHEN DATABASE() = 'qianxue_cb'  THEN '成本' 
WHEN DATABASE() = 'qianxue_cbc'  THEN '商品流通' 
WHEN DATABASE() = 'qianxue_cky'  THEN '财会易' 
WHEN DATABASE() = 'qianxue_cn'  THEN '出纳' 
WHEN DATABASE() = 'qianxue_complex'  THEN '综合实训' 
WHEN DATABASE() = 'qianxue_fx'  THEN '财务分析' 
WHEN DATABASE() = 'qianxue_gl'  THEN '财务管理' 
WHEN DATABASE() = 'qianxue_ifa-complex'  THEN '财务会计 - 综合' 
WHEN DATABASE() = 'qianxue_ifa-single'  THEN '财务会计 - 单项' 
WHEN DATABASE() = 'qianxue_jc'  THEN '基础会计' 
WHEN DATABASE() = 'qianxue_ks'  THEN '考试系统' 
WHEN DATABASE() = 'qianxue_manage'  THEN '管理会计' 
WHEN DATABASE() = 'qianxue_nsch'  THEN '纳税筹划' 
WHEN DATABASE() = 'qianxue_post'  THEN '财务会计 - 分岗' 
WHEN DATABASE() = 'qianxue_senior'  THEN '高级会计' 
WHEN DATABASE() = 'qianxue_sj'  THEN '审计单项' 
WHEN DATABASE() = 'qianxue_sjzh'  THEN '审计综合' 
WHEN DATABASE() = 'qianxue_sw'  THEN '税务会计' 
WHEN DATABASE() = 'qianxue_taxde'  THEN '纳税申报' 
WHEN DATABASE() = 'qianxue_v5'  THEN '虚拟实习' 
WHEN DATABASE() = 'qianxue_yhkj'  THEN '银行会计' 
ELSE '其它' END
ELSE m.`schema`END AS courseName,
CASE WHEN n2.courseNo IS  NOT NULL THEN n2.courseNo
		WHEN m.`schema` = DATABASE() THEN DATABASE()
ELSE m.`schema`
END AS courseNo,
n2.sort,
n.node_No,
c.typesort
FROM
mysq1_schema.media_library AS m
LEFT JOIN exp_courseware_cells AS e ON e.unique_id = m.missionID
LEFT JOIN exp_courses_node_content AS c ON e.unique_id = c.missionid
LEFT JOIN exp_courses_node AS n ON c.contentNo = n.contentNo
LEFT JOIN exp_courses AS n2 ON n.node_courseNo = n2.courseNo
INNER JOIN mysq1_schema.persistence_memory AS p ON m.elementID = p.ElementID ;

-- ----------------------------
--  View definition for `m`
-- ----------------------------
DROP VIEW IF EXISTS `m`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER  VIEW `m` AS 
SELECT a.* ,ll.billname,ll.billtype,CONVERT(ll.fields USING gbk) fields,CAST(ll.json AS CHAR) json
,JSON_EXTRACT(ll.json,'$.a') a字段
,JSON_EXTRACT(ll.json,'$.b[*]') b字段
,keyb
 FROM(
SELECT
m.missionId AS id,
m.missionId,
'kj' type,
0 sort,
m.missionLabel title,
CONCAT_WS('.',n.node_No,c.typesort) code ,
c.contentNo,
n.node_courseNo courseNo,
m.billId,
m.dblob
,m.t1,m.t2,m.t3,m.t4,m.pageNo,mission_ask,missionLabel
FROM
acc_mission AS m 
INNER JOIN exp_courses_node_content AS c ON m.missionid = c.missionid
INNER JOIN exp_courses_node AS n ON c.contentNo = n.contentNo 
UNION ALL
SELECT
bk.missionId,
m.missionId,
'bk',
bk.sort,
m.missionLabel,
CONCAT_WS('.',n.node_No,c.typesort) code ,
c.contentNo,
n.node_courseNo,
m.billId,
m.dblob
,m.t1,m.t2,m.t3,m.t4,m.pageNo,mission_ask,missionLabel
FROM
acc_mission AS m 
LEFT JOIN exp_courses_node_content AS cc ON m.missionid = cc.missionid
left JOIN acc_mission_back_information as bk ON m.missionId = quoteid 
left JOIN exp_courses_node_content AS c ON bk.missionid = c.missionid
left JOIN exp_courses_node AS n ON c.contentNo = n.contentNo
WHERE ISNULL(cc.missionid)
UNION ALL
SELECT
m.missionid AS id,
m.quoteid AS missionid,
m.type,
m.sort,
m.title,
CONCAT_WS('.',n.node_No,c.typesort) code ,
c.contentNo,
n.node_courseNo courseNo,
a.bill_Id AS billid,
a.dblob
,a.t1,a.t2,a.t3,a.t4,m.pageNo
,NULL ,NULL 
FROM
acc_mission_back_information AS m
INNER JOIN acc_mission_backbill_1 AS a ON m.type = 'bb' AND m.quoteid = a.missionId
INNER JOIN exp_courses_node_content AS c ON m.missionid = c.missionid
INNER JOIN exp_courses_node AS n ON c.contentNo = n.contentNo
) AS a 
LEFT JOIN mysq1_schema.bill_list AS ll  ON ll.billId = a.billId 
ORDER BY courseNo,nabc(code),sort 
;
