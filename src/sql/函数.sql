/*
MARIADB Backup
Source Server Version: 10.6.5
Source Database: tmp
Date: 2023/4/24 19:14:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Procedure definition for `2`
-- ----------------------------
DROP PROCEDURE IF EXISTS `2`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `2`(IN `p` blob)
p2:BEGIN
	#Routine body goes here...

	DECLARE `p2` BLOB DEFAULT j0(`p`,'p2'); DECLARE `funcid` VARCHAR(60) DEFAULT j0(`p2`,'funcid');DECLARE `b` MEDIUMBLOB DEFAULT NULL;
	DECLARE `k` VARCHAR(200) DEFAULT j0(p2,'k');DECLARE `blist` VARCHAR(100) default NULL;


  DECLARE CONTINUE HANDLER FOR  SQLSTATE '23000', SQLSTATE	'42000'	, SQLSTATE	'42S22'	bl:BEGIN CALL `Audit_3`(COLUMN_create(

	'm',CONCAT_WS(':','Error P2 ',j0(`p2`,'funcid')),'SQL',@p2_body,'pp',`p`

	));END; 

/*
CALL Audit_3(COLUMN_create('m',CONCAT_WS(' : ','P2 ' ,j0(`p`,'funcid')),'SQL','Record Parameters','pp',`p`));COMMIT;
LEAVE p2;
*/

	IF IFNULL(`p2`,'')= '' THEN CALL Error('p :no p2 or courseNo');	ELSE SET @sql_body = NULL;END IF;



	SET `b` = r9(`funcid`), @p2_body := NULL,
			@P1	=	j0(p,"p1"),
			@p2_body = COLUMN_get(b,'sql'AS CHAR);

 	IF IFNULL(@p2_body,'') = '' THEN  CALL `Audit_3`(COLUMN_create(	'm',CONCAT_WS(':','Error P2 ',j0(`p2`,'funcid')),'SQL',CONCAT_WS('',j0(`p2`,'funcid'),' no sql'),'pp',`p`

	));LEAVE p2;END IF;

	CASE 
		WHEN @p2_body REGEXP '(?im)^\\s*+delete' THEN	SET @p2_body = r5(@p2_body,p);

	ELSE

			SET	`blist` = NULLIF(COLUMN_list(b),'');

			IF k REGEXP '\\w+' THEN BEGIN
				DECLARE `r` VARCHAR(200) DEFAULT 
				CONCAT('(?is)("\\d+":\\{"',replace(k,',','":"(?:\\\\.|[^"])*"\\K((?:,"(?:\\\\.|[^"])*":"(?:\\\\.|[^"])*")+?)(?=,"'),'))');

				SET @k := REGEXP_substr(@p1,`R`),
						@k := REGEXP_REPLACE(@k,r('`kv-v`'),'\\1\\2:""'),
						@k = CONCAT('\\1',@k),
						r = CONCAT('(?is)("\\d+":\\{"',replace(k,',','":"(?:\\\\.|[^"])*"(?=,"'),'))');


				SET	@p1 = REGEXP_replace(@p1,r,@k),
						@k = NULL;

			END; END IF;

			SET @P1	:=	CONCAT_WS(' ',"SELECT",REGEXP_replace(REGEXP_replace(@p1,r('`kvP`'),'\\1\\3\\4\\6'),'(?<=")\\}(?=")','UNION ALL \nSELECT ')),
					@P1	:=	CONCAT_WS('',REGEXP_replace(REGEXP_SUBSTR(@P1,r('`aline`')) ,r('`kv`'),'\\4 AS \\2 ') -- head
														,REGEXP_replace(REGEXP_replace(@P1,r('`aline`'),''),r('`kv-k`'),'\\1') -- other
													),
					@p1 = REGEXP_replace(REGEXP_REPLACE(@p1,'\\}$',''),'(?im)(?<=^|,)""(?=(?:\\s+AS\\s+[^\\n\\r]*?)?(?:,|$))','NULL');

					CASE	WHEN @p2_body REGEXP '(?is)^\\s*select(.*?)from(.*?)(?=where\\s+|$)' AND `funcid` REGEXP '(?i)UPDATE' THEN
									SET @p2_body = REGEXP_replace(@p2_body,'(?is)^\\s*SELECT(.*?)from(.*?)(?=where\\s+|$)','update \\2\nSET \\1');
									SET	@p2_body = REGEXP_replace(@p2_body,'(?ims)^((?:`?\\w+`?\\.)?[\\w`]+)\\s*,\\s*?([\\n\\r]+^\\s*`?\\w)','\\1 = \\2');

								WHEN @p2_body REGEXP '(?i)^\\s*insert'  THEN
									SET @kfield  = REGEXP_REPLACE(REGEXP_substr(p,'(?s)(?<="p1":{"\\d":\\{)(?:"(?:\\\\.|[^"])*":"(?:\\\\.|[^"])*",?)*(?=\\})')
																											,'(?s)"((?:\\\\.|[^"])*)":"(?:\\\\.|[^"])*"','\\1');


									SET @k	=	REGEXP_replace(REGEXP_substr(@p2_body,'(?ims)^\\s*insert\\s+into\\s*\\w+\\(\\s*\\K.*?(?=,f`|\\))')
																						,'(?<!`)(\\b\\w+)\\b(?!`)','`\\1` AS `\\1`');
									SET	@k	=	REGEXP_replace(CONCAT('\\1', r5(@k,p2) ,','),'(?i)null','""');

									SET	@p1 =	REGEXP_REPLACE(@p1,'(?ims)^(\\s*SELECT\\s+)',@k) ;

									SET @p2_body = REGEXP_REPLACE(@p2_body,'f`kfield`',@`kfield`);

						ELSE SET @p1 = @p1 ;

					END CASE;
/*
		*/

			SET @p2_body = r5(@p2_body,CONCAT_WS(',',p2,'"p1":"`p1`"'));


			IF @p2_body REGEXP '(?ims)^\\s*\\-\\- +\\-\\-' THEN BEGIN 
			DECLARE `op` BLOB DEFAULT NULL ;DECLARE i INT(2) DEFAULT 0;
			DECLARE `mr` BLOB DEFAULT '(?is)^(.+?(?=(?:,[\\n\\r]+\\-\\-\\s+\\-)|$))([,\\-\\r\\n ]*)';
					SET @p2_body1 = REGEXP_replace(REGEXP_substr(@p2_body,'(?ism)^.+(?=^\\s*set)'),'"`p1`"',@p1),
							@p2_body2 = REGEXP_substr(@p2_body,'(?is)(?<=[\\n\\r])\\s*set\\K.*?(?=[\\n\\r]+\\s*where|$)'),
							@p2_body3 = REGEXP_substr(@p2_body,'(?isXx)(?<=[\\n\\r])where.*?$');
		-- SELECT @p2_body,QUOTE(@p2_body2),QUOTE(mr);

					p2l:LOOP

						SET `op` = REGEXP_REPLACE(REGEXP_substr(@p2_body2,`mr`),`mr`,'\\1');

						IF `op` ='' THEN LEAVE p2l;END IF;
						SET 	@p2_body2		=  REGEXP_REPLACE(@p2_body2,`mr`,'');
						SET @`op` = CAST(CONCAT_WS('\n',@p2_body1,'SET',`op`,@p2_body3)AS CHAR);

						PREPARE p2_stmt from  @`op`;	EXECUTE p2_stmt ;	
					END LOOP;

					DEALLOCATE PREPARE p2_stmt ;
					LEAVE p2;

			END; END IF;
			SET @p2_body =  REGEXP_replace(@p2_body,'"`p1`"',@p1);

	END CASE;

	
	
		IF CAST(@p2_body AS CHAR) IS NULL THEN SET @p2_body = CONVERT(@p2_body USING gbk);END IF;
	
-- SELECT CAST(@p2_body AS CHAR),@p1 ,CAST(REGEXP_replace(COLUMN_get(b,'sql'AS CHAR),'`p1`',@p1)AS CHAR) AS `SQL`;LEAVE p2;


	PREPARE p2_stmt from  @p2_body;	EXECUTE p2_stmt ;	SELECT ROW_COUNT();	DEALLOCATE PREPARE p2_stmt ;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `2page`
-- ----------------------------
DROP FUNCTION IF EXISTS `2page`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `2page`(`p` blob) RETURNS varchar(8) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
l:BEGIN
	#Routine body goes here...
	DECLARE `pageno` VARCHAR(8) DEFAULT j0(p,'pageno');
	DECLARE `max_page` VARCHAR(2000) DEFAULT j0(p,'max_page');

/*
start TRANSACTION;
SET @DBLOB = p;
CALL Audit_2('2page',quotej(p),@dblob);COMMIT;
LEAVE l;
*/

	RETURN 	CASE 
						WHEN IFNULL(`pageno`,'')=0 THEN RPAD(1,`max_page`,1)
						WHEN `pageno` = '1' THEN RPAD(1,`max_page`,0)
						WHEN `pageno` REGEXP '^[01]+$' THEN SUBSTR(`pageno`,1,`max_page`)
-- 						WHEN `pageno` REGEXP '^[1-8](,[1-8])+$' THEN
						ELSE RPAD(LPAD(1,`pageno`,0),`max_page`,0) 
					END ;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `3in1`
-- ----------------------------
DROP PROCEDURE IF EXISTS `3in1`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3in1`(IN `funcid` varchar(100),IN `key_names` varchar(100),IN `key_values` varchar(200),IN `field_names` longtext,IN `field_values` longtext,in `rowids` varchar(300), dblob blob)
    DETERMINISTIC
`l`:BEGIN

	DECLARE rownum varchar(300);	DECLARE IS5 VARCHAR(1) DEFAULT 0;	DECLARE i INT(3);  DECLARE ir INT(3);	DECLARE ia INT(3);	DECLARE mid1 varchar(60) DEFAULT NULL;

	DECLARE 对比 text DEFAULT
					CONCAT_WS(' ',
						"CASE WHEN ??? IS NULL OR ??? REGEXP '^null$'",
						"THEN NULL\nWHEN ???? REGEXP ??? THEN IF( ??? REGEXP ",
						QUOTE('\\Q(?#\\E'),",NULL,'#00FF00')\n" ,
						"ELSE '#FF9999' END AS colB??\n");

	DECLARE b保存 text DEFAULT  REGEXP_replace(REGEXP_replace(REGEXP_replace(对比,
																			'#FF9999','0'),
																			'#00FF00','1'),
																			'colB','ERR_B');
	DECLARE b计算 text DEFAULT  REGEXP_replace(REGEXP_replace(b保存,
																					"(?im)null$|'0'|,\\Knull(?=,)",0),
																					'(?im)as\\s*[\\w_?]+\\s*$','');
	DECLARE a计算 text DEFAULT  
					CONCAT_WS(' ',
						"ERR_A1 = CASE WHEN ??? IS NULL OR ??? REGEXP '^null$'",
						"THEN NULL\nWHEN ???? REGEXP ??? THEN IF( ??? REGEXP ",
						QUOTE('\\Q(?#\\E'),",NULL,'#00FF00')\n" ,
						"ELSE '#FF9999' END\n");
	
  DECLARE CONTINUE HANDLER FOR  SQLSTATE '23000', SQLSTATE	'42000'	, SQLSTATE	'42S22' , SQLSTATE	'HY000'-- ,SQLSTATE	'22007'
	BEGIN GET DIAGNOSTICS CONDITION 1 @`sqlstate` = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;SET  @`sqlstate` = JSON_OBJECT('sqlstate',@`sqlstate`,'errno',@errno,'text',@text);
				SET @`errsql` = @3in1_body;
				SET @funcid = CONCAT_WS(' ','Error: ', ' 3in1' ,`funcid`,ELT(`funcid`,'','对比','保存','提示' , '？5')),
				@pp =CONCAT_WS(',',quote(`funcid`),quote( `key_names`),quote( `key_values`),quote( `field_names`),quote( `field_values`),quote( `rowids` ),quote( dblob));
				CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp,'SQL',@`errsql`,'err',@`sqlstate`));
	END;

START TRANSACTION;
				SET @funcid = CONCAT_WS(' ', ' 3in1' ,`funcid`,ELT(`funcid`,'','对比','保存','提示' , '？5')),
				@pp =CONCAT_WS(',',quote(`funcid`),quote( `key_names`),quote( `key_values`),quote( `field_names`),quote( `field_values`),quote( `rowids` ),quote( dblob));
INSERT INTO plogs (Function_Name,parameter) VALUES (@funcid,@pp);
#CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp));COMMIT;

/*,'l','1'*/


   SET @missionid = null,@a_t = null,@a_n= 0,@b_total =0,@b_r_total=0;     SET @missionid = Fetch_Set(key_values,2,'\''),				@EXPID = Fetch_Set(key_values,1,'\''),			  @a_fnz = NULL,@3in1_body = '',				rownum = NULL,				@db_b = NULL;

	IF IFNULL(@missionid,'') = '' OR IFNULL(@expid,'')='' THEN 		CALL Audit('3in1',				CAST(CONCAT_WS('-','expid',IFNULL(@expid,'null'),'missionid',IFNULL(@missionid,'null')) AS CHAR),`funcid`,				key_names,key_values,field_names,field_values,rowids);		SELECT NULL AS `expidmissioniderror`; 		LEAVE `l`; 	END IF;

	CASE 	WHEN `funcid` = '6' THEN

				CALL Fetch_Set_values(field_names,'a',@field_names_1);-- 取得字r段名
						 CALL Fetch_Set_values(field_values,'0',@field_values_1);
-- SELECT @field_names_1,@field_values_1 ;   LEAVE `l`;
						 CALL Temp_Func_2(CONCAT_WS('',
"IF((@b :=",
	"CASE	WHEN a1.init_?? = 1 THEN b1.?? ",
				"WHEN a0.init_?? = 1 THEN b0.?? ",
				"WHEN IFNULL(c0.??,'') <> '' THEN c0.?? ",
			"ELSE  ???",
	"END) =''",
",NULL,@b) AS  ?? "),@field_names_1,@field_values_1,NULL,@one);

						 SET @3in1_body = CONCAT("SELECT\n",@ONE,"\n",
"FROM acc_mission AS a1
LEFT JOIN acc_mission AS a0 ON a1.behind_missionId = a0.missionId
LEFT JOIN acc_standard_1 AS b0 ON a0.missionId = b0.missionId
LEFT JOIN acc_standard_1 AS b1 ON a1.missionId = b1.missionId
LEFT JOIN acc_1 AS c0 ON b0.missionId = c0.missionId AND c0.expID = ",QUOTE(@expID),
"\nWHERE a1.missionId = ",QUOTE(@missionid));	
-- SELECT CAST(@3in1_body as CHAR) ;   LEAVE `l`;

		EXECUTE immediate @3in1_body;


			WHEN `funcid` = '5' THEN
			label5:BEGIN

				CASE 
						WHEN rowids REGEXP '^[0]{1}(,[1-9][0-9]{0,}){1,}$' THEN
								SET rownum= SUBSTR(rowids,3);
						WHEN rowids REGEXP '^[1-9]{1}(,[1-9][0-9]{0,}){0,}$' THEN
								SET rownum = rowids;
					ELSE 
	-- 						SET @3in1_body ="SELECT NULL as `label5B1`";

						SET rowids =CONCAT_WS(':','rowids',rowids);

-- 	 					SIGNAL SQLSTATE 'HY000' SET MYSQL_ERRNO ='553' , MESSAGE_TEXT = rowids;
--  						CALL audit('3IN1',CONCAT_WS(':',IFNULL(`funcid`,'label5B1'),'ROWIDS ERROR:',QUOTE(rowids)),`funcid`,key_names,key_values,field_names,field_values,rowids);
						LEAVE label5; -- rowids 出错  

				END CASE;	

				label5A:BEGIN

					CALL Fetch_Set_values(field_names,'a',@field_names_1);-- 取得字r段名
					CALL Fetch_Set_values(field_values,'0',@field_values_1);

          IF IFNULL(@field_names_1,'') NOT REGEXP 
							'^\'(a[1-9][0-9]{0,1}[0]{0,1}){1,}\'(,\'(a[1-9][0-9]{0,1}[0]{0,1})*\')*$' THEN -- 校验A字段 允许为空
							CALL audit(CONCAT_WS(':','3IN1',`funcid`),CONCAT_WS(':','afieldWarning:',@FIELD_NAMES_1),`funcid`,key_names,key_values,field_names,field_values,rowids);
-- 							LEAVE label4a;
							SET @one = ''; 
						ELSE 

-- SELECT @field_names_1,@field_values_1 ;   LEAVE `l`;
						 CALL Temp_Func_2(CONCAT_WS('',
"IF((@b :=",
	"CASE	WHEN a1.init_?? = 1 THEN b1.?? ",
				"WHEN a0.init_?? = 1 THEN b0.?? ",
				"WHEN IFNULL(c0.??,'') <> '' THEN c0.?? ",
			"ELSE  ???",
	"END) =''",
",NULL,@b) AS  ?? "),@field_names_1,@field_values_1,NULL,@one);

						 SET @3in1_body = CONCAT("SELECT\n",@ONE,"\n",
"FROM acc_mission AS a1
LEFT JOIN acc_mission AS a0 ON a1.behind_missionId = a0.missionId
LEFT JOIN acc_standard_1 AS b0 ON a0.missionId = b0.missionId
LEFT JOIN acc_standard_1 AS b1 ON a1.missionId = b1.missionId
LEFT JOIN acc_1 AS c0 ON b0.missionId = c0.missionId AND c0.expID = ",QUOTE(@expID),
"\nWHERE a1.missionId = ",QUOTE(@missionid));	
-- SELECT CAST(@3in1_body as CHAR) ;   LEAVE `l`;

						EXECUTE immediate @3in1_body;

 					END IF;	

				END LABEL5A; -- 处理A字段

				Label5B:BEGIN

					CALL Fetch_Set_values(field_names,'b',@field_names_1);


					IF @FIELD_NAMES_1 NOT REGEXP '^\'(B[1-9][0-9]{0,1})\'(,\'B[1-9][0-9]{0,1}\'){0,}$'   THEN
						  SET @3in1_body = "SELECT NULL as `label4B1FEILEDNAMESeeror`";
							CALL audit('3IN1',CONCAT_WS(':','B1FEILEDNAMESeeror:',QUOTE(@FIELD_NAMES_1)),`funcid`,key_names,key_values,field_names,field_values,rowids);
							LEAVE label5b;
					END IF; -- 校验B字段建

					SET i = 1;

          SET @a_b_row = rownum , @3in1_body = '';

					CALL Fetch_Set_P0(@a_b_row,1,ir);

-- SELECT ir,@a_b_row,@field_names_1; LEAVE `l`;
					fetch_recode_s:LOOP

						SET @a = FIND_IN_SET(ir,@a_row); 

-- SELECT CAST(CONCAT_WS(',',QUOTE(@a_value),QUOTE(ia),QUOTE(@a_value_1)) AS CHAR);
						SET @a = FIND_IN_SET(ir,rownum);
						IF @a != 0 THEN 
								CALL Fetch_Set_values(field_values,ir,@field_values_1);
							ELSE
								SET @field_values_1 = NULL;
						END IF;


						CALL Temp_Func_2(" ??? AS ??",@field_names_1,@field_values_1,NULL,@one);
						SET	@3in1_body =CAST(CONCAT(@3in1_body
									,"SELECT  ",QUOTE(@expid)," AS expid,",
													QUOTE(@missionid)," AS missionid ,",
															@one,',',ir," AS rowNo \n"
																	)AS CHAR);
						SET i = i + 1;
						CALL Fetch_Set_P0(@a_b_row,i,ir);
						IF ir IS NULL THEN 	 LEAVE fetch_recode_s; END IF; -- SELECT  @3in1_body,rownum,i,ir,ia;
						SET @3in1_body = CONCAT_WS('\tunion\n',@3in1_body,'');

					END LOOP;

				 CALL Temp_Func_2(CONCAT_WS('',
"IF((@b :=",
	"CASE	WHEN a1.init_?? = 1 THEN b1.?? ",
				"WHEN a0.init_?? = 1 THEN b0.?? ",
				"WHEN IFNULL(c0.??,'') <> IFNULL(c1.??,'') THEN c0.?? ",
			"ELSE  c0.?? ",
	"END) =''",
",NULL,@b) AS  ?? "),@field_names_1,@field_values_1,NULL,@one);

					 SET @3in1_body = CONCAT("SELECT\nb1.rowNo,",@ONE,"\n",
"FROM acc_mission AS a1
LEFT JOIN acc_mission AS a0 ON a1.behind_missionId = a0.missionId 
LEFT JOIN acc_standard_n AS b1 ON a1.missionId = b1.missionId
LEFT JOIN acc_standard_n AS b0 ON a0.missionId = b0.missionId AND b1.rowNo = b0.rowNo
LEFT JOIN ",expid2b(@expID)," AS c0 ON b0.missionId = c0.missionId AND b0.rowNo = c0.rowNo
LEFT JOIN (\n",@3in1_body,"\n) AS c1 ON b1.missionId = c1.missionId AND b1.rowNo = c1.rowNo
WHERE a1.missionId = ",QUOTE(@missionid));	

-- SELECT @3in1_body,@field_names_1; LEAVE `l`;

				END label5B;
			END label5;

			WHEN `funcid` IS NULL THEN
				 SET @3in1_body = "SELECT NULL as `1`";
				 CALL audit('3IN1',IFNULL(`funcid`,'`funcid` IS NULL'),`funcid` ,key_names,key_values,field_names,field_values,rowids);


			WHEN `funcid` = '2'  THEN 

			LABEL1:BEGIN
				IF IFNULL(rowids,'') ='' THEN	SET rowids ='1';	END IF;
				CASE 		WHEN rowids REGEXP '^[0]{1}(,[1-9][0-9]{0,}){1,}$' THEN	SET rownum= SUBSTR(rowids,3);
								WHEN rowids REGEXP '^[1-9]{1}(,[1-9][0-9]{0,}){0,}$' THEN SET rownum = rowids;
					ELSE	LEAVE `l`; -- rowids 出错  
				END CASE;	-- 取得B记录行 rownum

					SET @a_fds = NULL,@a_row  = NULL;

					CALL generate_one_en(@missionid,rownum,@a_fields,@a_row,@a_value); 

					IF @a_row IS NULL OR @a_value IS NULL THEN  SELECT NULL AS brecord;		LEAVE `l`;	END IF;

					CALL Fetch_Set_values(field_names,'rowId',@field_names_1);-- 取得字r段名

					IF @FIELD_NAMES_1 NOT REGEXP '^\'(B[1-9][0-9]{0,1})\'(,\'B[1-9][0-9]{0,1}\'){0,}$'   THEN
						  SET @3in1_body = "SELECT NULL as `label4B1FEILEDNAMESeeror`";
							CALL audit('3IN1',CONCAT_WS(':','B1FEILEDNAMESeeror:',QUOTE(@FIELD_NAMES_1)),`funcid`,key_names,key_values,field_names,field_values,rowids);
							LEAVE `l`;
					END IF; -- 校验B字段建

					SET  
							i = 1;

          SET @a_b_row = CONCAT_WS(',',rownum,@a_row),
							@a_b_row = Fielter_Set(@a_b_row);
					CALL Fetch_Set_P0(@a_b_row,1,ir);


					fetch_recode:LOOP
						SET @a = FIND_IN_SET(ir,rownum);
						IF @a != 0 THEN 
								CALL Fetch_Set_values(field_values,ir,@field_values_1);
							ELSE
								SET @field_values_1 = NULL;
						END IF;


						SET ia := Fetch_elt(ir,@a_row), 
								@a_value_1 := Fetch_y_1(ia,@a_value);

						SET	@3in1_body =CAST(CONCAT(@3in1_body
									,"SELECT  ",ir," AS rowNo \n"
																	)AS CHAR);
						SET @one =NULL;

						CALL Temp_Func_3(
															对比
															,NULL,
															"",
															"",
															'','b',
															@a_fields,@a_value_1,@field_names_1,@field_values_1,@one);

 						SET  @3in1_body = CONCAT_WS('',@3in1_body,',',IFNULL(@one,0),"'' AS rowinno");

						SET i = i + 1;
						CALL Fetch_Set_P0(@a_b_row,i,ir);
						IF ir IS NULL THEN 	 LEAVE fetch_recode; END IF;
						SET @3in1_body = CONCAT_WS('\nunion\n',@3in1_body,'');


					END LOOP;

			END LABEL1;

			WHEN `funcid` = '4' OR `funcid` ='3' OR `funcid` ='7' THEN
			label4:BEGIN

				SET @a_fields = NULL;
				IF `funcid` <> '7' THEN 

					SET @db_b = expid2b(@expid),
							@db_a = "acc_1";

				ELSE

					 SET 	@db_b = 'acc_b',
								@db_a = 'acc_a',
								mid1 = preg_capture('/(?<=_).+$/',@missionId),
								@missionId = preg_capture('/^.+?(?=_|$)/',@missionId);
				END IF;

				SET @3in1_body = "";
					SET @sb = CONCAT_WS('',"DELETE a.* FROM ",@db_b," AS A \n",
							"WHERE a.expid =",QUOTE(@expid)," AND a.missionid =", QUOTE(@missionid),
								CONCAT(" AND a.missionid1 =", quote_d(mid1)));

	
					EXECUTE immediate @sb;

				label4B:	BEGIN -- 处理 B字段		
				CASE 
						WHEN rowids REGEXP '^[0]{1}(,[1-9][0-9]{0,}){1,}$' THEN
								SET rownum= SUBSTR(rowids,3);
						WHEN rowids REGEXP '^[1-9]{1}(,[1-9][0-9]{0,}){0,}$' THEN
								SET rownum = rowids;
					ELSE 

							LEAVE label4B; -- rowids 出错 

				END CASE;	-- 取得B记录行 rownum

				IF `funcid` <> '5' THEN
-- SELECT @missionid,rownum,@a_fields,@a_row,@a_value;LEAVE l;
					CALL generate_one_en(@missionid,rownum,@a_fields,@a_row,@a_value); 

				END IF;


					CALL Fetch_Set_values(field_names,'b',@field_names_1);-- 取得字r段名


					IF @FIELD_NAMES_1 NOT REGEXP '^\'(B[1-9][0-9]{0,1})\'(,\'B[1-9][0-9]{0,1}\'){0,}$'   THEN
						  SET @3in1_body = "SELECT NULL as `label4B1FEILEDNAMESeeror`";
							CALL audit('3IN1',CONCAT_WS(':','B1FEILEDNAMESeeror:',QUOTE(@FIELD_NAMES_1)),`funcid`,key_names,key_values,field_names,field_values,rowids);
							LEAVE label4b;
					END IF; -- 校验B字段建


					SET i = 1;

          SET @a_b_row = CONCAT_WS(',',rownum,@a_row),
							@a_b_row = Fielter_Set(@a_b_row);
					CALL Fetch_Set_P0(@a_b_row,1,ir);


					fetch_recode:LOOP

						SET ia := Fetch_elt(ir,@a_row), 
								@a_value_1 := Fetch_y_1(ia,@a_value);

						SET @a = FIND_IN_SET(ir,rownum);

						IF @a != 0 THEN 
								CALL Fetch_Set_values(field_values,ir,@field_values_1);
							ELSE
								SET @field_values_1 = NULL;
						END IF;


						CALL Temp_Func_2(" ??? AS ??",@field_names_1,@field_values_1,NULL,@one);
-- SELECT @one;
						SET	@3in1_body =CONCAT_WS('',@3in1_body
									,"SELECT  ",QUOTE(@expid)," ,", -- " AS expid,",
													QUOTE(@missionid)," ,",-- " AS missionid ,",
											IF(mid1,CONCAT(QUOTE(mid1)," ,"),NULL),
															ir," AS rowNo,",
															@one,','," \n");
						SET @one =NULL;

						CALL Temp_Func_3(
-- 															" ???? REGEXP ??? AS ERR_B??" --         1
															b保存
															,NULL,-- 2
															"@b_r_total := ",-- 3
-- 															"IFNULL(???? REGEXP ??? ,0)",-- 4

															b计算,
															'+','b',-- 5
															@a_fields,@a_value_1,@field_names_1,@field_values_1,@one);-- 6

						SET  @3in1_body = CONCAT_WS('',@3in1_body,IFNULL(@one,0),",@b_total := IFNULL(@b_total,0)+ IFNULL(@b_r_total,0)");

						SET i = i + 1;
						CALL Fetch_Set_P0(@a_b_row,i,ir);
						IF ir IS NULL THEN 	 LEAVE fetch_recode; END IF; -- SELECT  @3in1_body,rownum,i,ir,ia;
						SET @3in1_body = CONCAT_WS('\nunion\n',@3in1_body,'');
					END LOOP;

					SET @3in1_body = CONCAT_ws('',"INSERT INTO ",@db_b,
									"(expid,missionid,",
								IF(mid1 IS NULL,NULL,'missionid1,'),"\n",
									"rowNo," ,
									REPLACE(@field_names_1,'\'',''),
									CONCAT(',',REPLACE_set_0(@a_fields,'err_b')),",right_count,ERROR_count\n)\n",
									@3in1_body,';');


          IF @3in1_body IS NOT NULL THEN

							EXECUTE IMMEDIATE  REGEXP_REPLACE(REGEXP_substr(@3in1_body,'(?i)select\\s+\\K\'(?:\\\\.|[^\'])+\'\\s*,\\s*\'(?:\\\\.|[^\'])+\'')
							,"('[^']+')\\s*,\\s*('[^']+')",'SELECT 1 INTO @b FROM acc_1 AS a WHERE a.expID = \\1 AND  a.missionId = \\2');

							IF FOUND_ROWS()=0 THEN
							EXECUTE IMMEDIATE REGEXP_REPLACE(REGEXP_substr(@3in1_body,'(?i)select\\s+\\K\'(?:\\\\.|[^\'])+\'\\s*,\\s*\'(?:\\\\.|[^\'])+\'')
							,"('[^']+')\\s*,\\s*('[^']+')",'INSERT INTO ACC_1(expID ,missionId)VALUES (\\1, \\2)');
							END IF;
-- SELECT @3in1_body,'0Y';-- LEAVE l
							EXECUTE immediate @3in1_body;

					END IF;
				END label4B;-- 处理 B字段


				SET @A_S = NULL;
		-- 处理 A字段
				label4A:BEGIN

					SET @3in1_body = NULL,
							@statu_value = NULL,
							@statu_name = NULL,
							@3in1_body = CONCAT_WS('',"SELECT b.expID,a.classNo INTO @statu_value ,@statu_name\nFROM exp_experimentclassstudent AS a\nLEFT JOIN ",
																@db_a," AS b ON a.expNo = b.expID AND b.missionId = ",QUOTE(@missionid),
																CONCAT(" AND b.missionid1 =", quote_d(mid1)),				
																"\nWHERE a.expNo = ", QUOTE(@expid)); 
-- 


					EXECUTE immediate @3in1_body;

		 			IF  @statu_value IS NULL THEN
							SET @3in1_body = CONCAT_WS('',"INSERT ",@db_a,"(EXPID,MISSIONID",
																	IF(mid1 IS NULL,NULL,",missionId1,billid"),")\n",
																						"VALUES(",QUOTE(@expid),',',QUOTE(@missionid),
																		CONCAT(',',IF(mid1 IS NULL,NULL,QUOTE(mid1)),',',QUOTE('jzpz_bjzyfl')),
																")");

							EXECUTE immediate  @3in1_body;
					END IF;

					SET @3in1_body = "SET \n" ;
					CALL Fetch_Set_values(field_names,'a',@field_names_1);-- 取得r字段名

          IF IFNULL(@field_names_1,'') NOT REGEXP 
							'^\'(a[1-9][0-9]{0,1}[0]{0,1}){1,}\'(,\'(a[1-9][0-9]{0,1}[0]{0,1})*\')*$' THEN -- 校验A字段 允许为空

							CALL audit(CONCAT_WS(':','3IN1',`funcid`),CONCAT_WS(':','afieldWarning:',@FIELD_NAMES_1),`funcid`,key_names,key_values,field_names,field_values,rowids);

							SET @one = ''; 
						ELSE 
						 CALL Fetch_Set_values(field_values,'0',@field_values_1);

						 CALL Temp_Func_2("?? := ??? \n",@field_names_1,@field_values_1,NULL,@one);

 					END IF;	

						SET @3in1_body = CONCAT(@3in1_body,@ONE,IF(IFNULL(@ONE,'')='' ,'',','));	


					CALL generate_one_en(@missionid,'0',@a_fields,@a_row,@a_value);
-- SELECT b计算,B保存;
					IF IFNULL(@a_fields,'') !='' THEN 

								CALL Fetch_Set_values(@a_value,'0',@a_values_1);

								CALL Temp_Func_3(
 													"ERR_A?? = ???? REGEXP ??? ", -- 1
-- 													CONCAT_WS('',"ERR_A?? = \n",b计算),
													NULL,-- 2
													"a.right_count = @right_count := ", -- 3

 													"IFNULL(???? REGEXP ??? ,0)",-- 4
-- 													b计算,
													'+','a',-- 5
													@a_fields,@a_values_1,@field_names_1,@field_values_1,@one);-- 6

								SET @one =CONCAT(@one,'+');
							ELSE 
								SET @one ='';
					END IF;
-- SELECT @one;
					IF @one ='' THEN
						SET @one = CONCAT('a.line  = ',j0(dblob,'line')),
								@one = CONCAT_WS(',',@one, "a.right_count = @right_count := ");
					END IF;

					SET @3in1_body =CAST(
											CONCAT("UPDATE ",@db_a," AS a, (\n",
															"\t\t\t	SELECT \n",
															"\t\t\t\t\t\t a1.classType, \n",
															"\t\t\t\t\t\t IF(IFNULL(b.line_type,0) =0, 0, 1) AS is_line, \n",
															"\t\t\t\t\t\t Count(b1.seal_id) AS shouldSeal, \n",
															"\t\t\t\t\t\t Count(b3.expID) AS overSeal, \n",
															"\t\t\t\t\t\t COUNT(b1.seal_id)-COUNT(b3.expid) AS unSealed, \n",
															"\t\t\t\t\t\t @unS := \n",
															"\t\t\t\t\t\t\t\t CAST(CONCAT_WS('\\n',\n",
															"\t\t\t\t\t\t\t\t\t  CONCAT(IF(IFNULL(b0.max_page,1)=1 ,b0.billname,b0.page_title1),'缺少：（',\n",
															"\t\t\t\t\t\t\t\t\t\t  GROUP_CONCAT(\n",
															"\t\t\t\t\t\t\t\t\t\t\t 	IF((b.pageno = 0 AND b0.max_page >=1 or b.pageno =1) AND b1.pageid = 1 AND b3.expid IS NULL,CONCAT_WS('',b2.seal_name),NULL) \n",
															"\t\t\t\t\t\t\t\t\t\t\t\t 	ORDER BY b1.seal_no) \n",
															"\t\t\t\t\t\t\t\t ,'）'),",
															Temp_Func(CONCAT("\n",
															"\t\t\t\t\t\t\t\t\t CONCAT(b0.page_title??,'缺少：（',\n",
															"\t\t\t\t\t\t\t\t\t\t  GROUP_CONCAT( \n",
															"\t\t\t\t\t\t\t\t\t\t\t 	IF((b.pageno = 0 AND b0.max_page >=?? or b.pageno =??) AND b1.pageid = ?? AND b3.expid IS NULL,CONCAT_WS('',b2.seal_name),NULL) \n",
															"\t\t\t\t\t\t\t\t\t\t\t\t 	ORDER BY b1.seal_no) \n",
															"\t\t\t\t\t\t\t\t  ,'）')"),2,7,NULL),
															"\t\t\t\t\t\t\t\t\t ,IF( Count(b1.seal_id)<>Count(b3.expID),'<p>注：请更换角色，在不同联次，完成签章！</p>',NULL) \n",
															"\t\t\t\t\t\t\t\t  )AS CHAR ) AS uns,\n",
															"\t\t\t\t\t\t IFNULL(a2.read_answer_size,0) as read_answer_size, \n",
															"\t\t\t\t\t\t IFNULL(a2.answerScore,0) as answerScore, \n",
															"\t\t\t\t\t\t IFNULL(a2.resultScore,0) AS resultScore, \n", 
															"\t\t\t\t\t\t a2.pass_score_size, \n",
															"\t\t\t\t\t\t a2.score_seal_size, \n",
															"\t\t\t\t\t\t a2.score_line_size, \n",
															"\t\t\t\t\t\t IFNULL(a2.resultcount,0) as resultcount, \n",
															"\t\t\t\t\t\t @pt33 := IF(b.is_line,a2.score_line_size,0), \n",
															"\t\t\t\t\t\t @pt44 :=a2.resultcount*a2.resultScore, \n",
															"\t\t\t\t\t\t @pt55 :=a2.read_answer_size* a2.answerScore, \n",
															"\t\t\t\t\t\t a2.max_score_size, \n",
															"\t\t\t\t\t\t a2.redo_size \n",
															"\t\t\t	FROM exp_experimentclass AS a1 \n",
															"\t\t\t	INNER JOIN mysq1_schema.exp_difficulty AS a2 ON a1.difficulty_level = a2.difficulty_level \n",
															"\t\t\t	JOIN acc_mission AS b ON b.missionId = ",QUOTE(@missionid)," \n",
															"\t\t\t	INNER JOIN mysq1_schema.bill_list AS b0 ON b.billid = b0.billid \n",
															"\t\t\t LEFT JOIN acc_mission_seal AS b1 ON b1.missionId = ",QUOTE(@missionid)," \n",
															"\t\t\t INNER JOIN acc_enter_seal AS b2 ON b1.seal_id = b2.sealID AND b2.seal_content <> '操作' \n",
															"\t\t\t INNER JOIN acc_enter_role AS b21 ON b21.roleid = b2.roleid \n",
															"\t\t\t LEFT JOIN acc_seal_1 AS b3 ON b3.expID =",QUOTE(@expid)," \n",
															"\t\t\t\t\t\t AND b3.missionId =",QUOTE(@missionid)," \n", 
															"\t\t\t\t\t\t AND b1.pageId = b3.pageId AND b1.seal_id = b3.seal_Id \n",
															"\t\t\t WHERE a1.ClassNo =",QUOTE(@statu_name)," \n",
															"LOCK in SHARE mode",
															"\t\t	) AS b  \n",
														@3in1_body,
														@one,@b_total," ,\n",
														"a.log_count := IFNULL(a.log_count,0)+",IF(`funcid`=4,'1',0)," ,\n",
														"a.already_no_seal = b.overSeal,\n",
														"a.read_ans_size := IF(read_ans_size IS NULL ,0,a.read_ans_size) ,\n",
														"a.error_count = @pt1 :=",REPLACE(@a_s,',','+'),",\n",
 														"a.pt1 = @pt1 := (@pt11 :=(100- IF(IFNULL(b.shouldSeal,0)=0,0,b.score_seal_size) -  b.score_line_size * b.is_line))*IF(IFNULL(@pt1,0) != 0,@right_count/@pt1,1), \n",
														"a.pt2 = @pt2 := (@pt22 :=IF(IFNULL(b.shouldSeal,0)=0,0,b.score_seal_size))*b.overSeal/IF(b.shouldSeal = 0,1,b.shouldSeal), \n",
														"a.pt3 = @pt3 := IF(b.is_line,IF(IFNULL(a.is_line,0),b.score_line_size,0),0), \n",
														"a.pt4 = @pt4 := IF(b.resultcount > IFNULL(a.mission_result,0),a.mission_result,b.resultcount)*b.resultScore  ,\n",
														"a.pt5 = @pt5 := IF(b.read_answer_size>a.read_ans_size, a.read_ans_size ,b.read_answer_size)* b.answerScore ,\n",
														"a.score :=IF(IFNULL(@pt1,0) + IFNULL(@pt2,0) + IFNULL(@pt3,0)  - IFNULL(@pt4,0)  -IFNULL(@pt5,0) <0 ,0, IFNULL(@pt1,0) + IFNULL(@pt2,0) + IFNULL(@pt3,0)  - IFNULL(@pt4,0)  -IFNULL(@pt5,0))\n",
														"WHERE a.missionId =",QUOTE(@missionid)," AND a.expid=",QUOTE(@expid)
												)
											AS CHAR);
--  SELECT @3in1_body,'1';					
					EXECUTE immediate @3in1_body;
					-- 
						
					IF `funcid` <>4 THEN  SET @3in1_body="SELECT 'ok' AS teaa";LEAVE label4;END IF;
					
			IF	DATABASE() REGEXP  '5$' THEN
 -- SELECT CONCAT_WS(',',QUOTE(@expid),QUOTE(@missionid),1); LEAVE `l`;
					CALL v5_autoFlow(@expid,@missionid,1);
					SET IS5=1;
			END IF;


					SET @3in1_body =CONCAT("

SELECT \n",
QUOTE(@expid)," AS expID,",
QUOTE(@missionid)," AS missionId,",
"IFNULL(d.redo_size,0) AS redoSize,
IFNULL(d.max_score_size,0) AS missionMaxScore,
IFNULL(a.score,0) AS missionScore,
IFNULL(a.read_ans_size,0) AS readAnswer,
IFNULL(a.read_ans_size,0) AS number,
CAST(a.log_count AS char) AS logCount,
IFNULL(a.error_count,0) AS error_count,
IFNULL(a.right_count,0) AS RIGHT_COUNT,
@b :=a.score AS tempscore,
@pt44, @pt4,
CAST(CASE WHEN IFNULL(c.CLASSTYPE,0) = 1   THEN CONCAT_WS('',
'<h5><',C.CLASSNAME,'>','<h5>将在：',
TIMEDIFF(c.endtime,NOW()),'后结束！')
WHEN  d.difficulty_level =9 THEN '考试模式，无提示。' 
WHEN a.log_count > d.resultcount THEN '提示次数用完'
ELSE CONCAT_WS('','<h5><',e.node_No,'.',f.typesort,'>',TRIM(g.missionLabel),'（合格率:',
IF(@b =0, 0,IF(ROUND(@b,2)=CEIL(@b),CEIL(@b),ROUND(@b,2))),
'%）</h5>'",
IF(@pt11<>0,CONCAT(",'<p>填空得分( ",@pt11," )：",CEIL(@pt1),"</p>'"),""),"\n",
IF(@pt22<>0,CONCAT(",'<p>签章得分( ",FLOOR(@pt22)," )：",CEIL(@pt2),"</p>'"),""),"\n",
IF(@pt33<>0,CONCAT(",'<p>画线得分( ",@pt33," )：",CEIL(@pt3),"</p>'"),""),"\n",
IF(@pt44<>0 AND @pt4 <> 0,CONCAT(",'<p>对比扣分( -",@pt44," )：-",CEIL(@pt4),"</p>'"),""),"\n",
IF(@pt55<>0 AND @pt5 <> 0,CONCAT(",'<p>查看答案扣分( -",@pt55," )：-",CEIL(@pt5),"</p>'"),""),"\n",
IF(CHAR_LENGTH(@uns) <>0,CONCAT(",'<p>提示：</p>',",QUOTE(@uns)),''),"\n",
")END AS char)AS missionLabel
FROM acc_1 AS a
LEFT JOIN acc_mission AS g ON g.missionId = a.missionId 
LEFT JOIN exp_experimentclassstudent AS b ON a.expID = b.expNo
LEFT JOIN exp_experimentclass AS c ON b.classNo = c.classNo
",IF(IS5,'',"LEFT JOIN exp_experimentclass_course AS c1 ON c1.classNo = c.classNo"),"
LEFT JOIN mysq1_schema.exp_difficulty AS d ON c.difficulty_level = d.difficulty_level
LEFT JOIN exp_courses_node_content AS f ON g.missionId = f.missionid
INNER JOIN exp_courses_node AS e ON  f.contentNo = e.contentNo  AND ",IF(IS5 ,'c','c1'),".courseNo = e.node_courseNo
",	"\nWHERE a.missionId =",QUOTE(@missionid)," AND a.expid=",QUOTE(@expid));
 -- SELECT @3in1_body 		;			
--  SELECT @EXPID,@3in1_body; LEAVE  `l`;
--  LEAVE `l`;
				END label4A;-- 处理 A字段,';'
			END label4;


	END CASE;
/*
	IF IFNULL(@3in1_body,'')= '' THEN
		SET @3in1_body ="SELECT NULL as `Elabel400`";
		CALL audit('3IN1',CONCAT_WS(':',IFNULL(`funcid`,'400'),'something ERROR:',QUOTE(rowids)),`funcid`,key_names,key_values,field_names,field_values,rowids);
	END IF;
*/-- SELECT CAST(@3in1_body as CHAR) ;-- LEAVE `l`;--  

		EXECUTE immediate  @3in1_body;
-- select '1','2';
--   SELECT @3in1_body; LEAVE `l`;
-- SELECT null ;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `3in1_old`
-- ----------------------------
DROP PROCEDURE IF EXISTS `3in1_old`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3in1_old`(IN `funcid` varchar(100),IN `key_names` varchar(100),IN `key_values` varchar(200),IN `field_names` longtext,IN `field_values` longtext,in `rowids` varchar(300), dblob blob)
    DETERMINISTIC
`l`:BEGIN

	DECLARE rownum varchar(300);	DECLARE IS5 VARCHAR(1) DEFAULT 0;	DECLARE i INT(3);  DECLARE ir INT(3);	DECLARE ia INT(3);	DECLARE mid1 varchar(60) DEFAULT NULL;

  DECLARE CONTINUE HANDLER FOR  SQLSTATE '23000', SQLSTATE	'42000'	, SQLSTATE	'42S22' , SQLSTATE	'HY000'-- ,SQLSTATE	'22007'
	BEGIN GET DIAGNOSTICS CONDITION 1 @`sqlstate` = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;SET  @`sqlstate` = JSON_OBJECT('sqlstate',@`sqlstate`,'errno',@errno,'text',@text);
				SET @`errsql` = @3in1_body;
				SET @funcid = CONCAT_WS(' ','Error: ', ' 3in1' ,`funcid`,ELT(`funcid`,'','对比','保存','提示' , '？5')),
				@pp =CONCAT_WS(',',quote(`funcid`),quote( `key_names`),quote( `key_values`),quote( `field_names`),quote( `field_values`),quote( `rowids` ),quote( dblob));
				CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp,'SQL',@`errsql`,'err',@`sqlstate`));
	END;

START TRANSACTION;
				SET @funcid = CONCAT_WS(' ', ' 3in1' ,`funcid`,ELT(`funcid`,'','对比','保存','提示' , '？5')),
				@pp =CONCAT_WS(',',quote(`funcid`),quote( `key_names`),quote( `key_values`),quote( `field_names`),quote( `field_values`),quote( `rowids` ),quote( dblob));
INSERT INTO plogs (Function_Name,parameter) VALUES (@funcid,@pp);
#CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp));COMMIT;

/*,'l','1'*/


   SET @missionid = null,@a_t = null,@a_n= 0,@b_total =0,@b_r_total=0;     SET @missionid = Fetch_Set(key_values,2,'\''),				@EXPID = Fetch_Set(key_values,1,'\''),			  @a_fnz = NULL,@3in1_body = '',				rownum = NULL,				@db_b = NULL;

	IF IFNULL(@missionid,'') = '' OR IFNULL(@expid,'')='' THEN 		CALL Audit('3in1',				CAST(CONCAT_WS('-','expid',IFNULL(@expid,'null'),'missionid',IFNULL(@missionid,'null')) AS CHAR),`funcid`,				key_names,key_values,field_names,field_values,rowids);		SELECT NULL AS `expidmissioniderror`; 		LEAVE `l`; 	END IF;

	CASE 	WHEN `funcid` = '6' THEN

				CALL Fetch_Set_values(field_names,'a',@field_names_1);-- 取得字r段名
						 CALL Fetch_Set_values(field_values,'0',@field_values_1);
-- SELECT @field_names_1,@field_values_1 ;   LEAVE `l`;
						 CALL Temp_Func_2(CONCAT_WS('',
"IF((@b :=",
	"CASE	WHEN a1.init_?? = 1 THEN b1.?? ",
				"WHEN a0.init_?? = 1 THEN b0.?? ",
				"WHEN IFNULL(c0.??,'') <> '' THEN c0.?? ",
			"ELSE  ???",
	"END) =''",
",NULL,@b) AS  ?? "),@field_names_1,@field_values_1,NULL,@one);

						 SET @3in1_body = CONCAT("SELECT\n",@ONE,"\n",
"FROM acc_mission AS a1
LEFT JOIN acc_mission AS a0 ON a1.behind_missionId = a0.missionId
LEFT JOIN acc_standard_1 AS b0 ON a0.missionId = b0.missionId
LEFT JOIN acc_standard_1 AS b1 ON a1.missionId = b1.missionId
LEFT JOIN acc_1 AS c0 ON b0.missionId = c0.missionId AND c0.expID = ",QUOTE(@expID),
"\nWHERE a1.missionId = ",QUOTE(@missionid));	
-- SELECT CAST(@3in1_body as CHAR) ;   LEAVE `l`;

		EXECUTE immediate @3in1_body;


			WHEN `funcid` = '5' THEN
			label5:BEGIN

				CASE 
						WHEN rowids REGEXP '^[0]{1}(,[1-9][0-9]{0,}){1,}$' THEN
								SET rownum= SUBSTR(rowids,3);
						WHEN rowids REGEXP '^[1-9]{1}(,[1-9][0-9]{0,}){0,}$' THEN
								SET rownum = rowids;
					ELSE 
	-- 						SET @3in1_body ="SELECT NULL as `label5B1`";

						SET rowids =CONCAT_WS(':','rowids',rowids);

-- 	 					SIGNAL SQLSTATE 'HY000' SET MYSQL_ERRNO ='553' , MESSAGE_TEXT = rowids;
--  						CALL audit('3IN1',CONCAT_WS(':',IFNULL(`funcid`,'label5B1'),'ROWIDS ERROR:',QUOTE(rowids)),`funcid`,key_names,key_values,field_names,field_values,rowids);
						LEAVE label5; -- rowids 出错  

				END CASE;	

				label5A:BEGIN

					CALL Fetch_Set_values(field_names,'a',@field_names_1);-- 取得字r段名
					CALL Fetch_Set_values(field_values,'0',@field_values_1);

          IF IFNULL(@field_names_1,'') NOT REGEXP 
							'^\'(a[1-9][0-9]{0,1}[0]{0,1}){1,}\'(,\'(a[1-9][0-9]{0,1}[0]{0,1})*\')*$' THEN -- 校验A字段 允许为空
							CALL audit(CONCAT_WS(':','3IN1',`funcid`),CONCAT_WS(':','afieldWarning:',@FIELD_NAMES_1),`funcid`,key_names,key_values,field_names,field_values,rowids);
-- 							LEAVE label4a;
							SET @one = ''; 
						ELSE 

-- SELECT @field_names_1,@field_values_1 ;   LEAVE `l`;
						 CALL Temp_Func_2(CONCAT_WS('',
"IF((@b :=",
	"CASE	WHEN a1.init_?? = 1 THEN b1.?? ",
				"WHEN a0.init_?? = 1 THEN b0.?? ",
				"WHEN IFNULL(c0.??,'') <> '' THEN c0.?? ",
			"ELSE  ???",
	"END) =''",
",NULL,@b) AS  ?? "),@field_names_1,@field_values_1,NULL,@one);

						 SET @3in1_body = CONCAT("SELECT\n",@ONE,"\n",
"FROM acc_mission AS a1
LEFT JOIN acc_mission AS a0 ON a1.behind_missionId = a0.missionId
LEFT JOIN acc_standard_1 AS b0 ON a0.missionId = b0.missionId
LEFT JOIN acc_standard_1 AS b1 ON a1.missionId = b1.missionId
LEFT JOIN acc_1 AS c0 ON b0.missionId = c0.missionId AND c0.expID = ",QUOTE(@expID),
"\nWHERE a1.missionId = ",QUOTE(@missionid));	
-- SELECT CAST(@3in1_body as CHAR) ;   LEAVE `l`;

						EXECUTE immediate @3in1_body;

 					END IF;	

				END LABEL5A; -- 处理A字段

				Label5B:BEGIN

					CALL Fetch_Set_values(field_names,'b',@field_names_1);


					IF @FIELD_NAMES_1 NOT REGEXP '^\'(B[1-9][0-9]{0,1})\'(,\'B[1-9][0-9]{0,1}\'){0,}$'   THEN
						  SET @3in1_body = "SELECT NULL as `label4B1FEILEDNAMESeeror`";
							CALL audit('3IN1',CONCAT_WS(':','B1FEILEDNAMESeeror:',QUOTE(@FIELD_NAMES_1)),`funcid`,key_names,key_values,field_names,field_values,rowids);
							LEAVE label5b;
					END IF; -- 校验B字段建

					SET i = 1;

          SET @a_b_row = rownum , @3in1_body = '';

					CALL Fetch_Set_P0(@a_b_row,1,ir);

-- SELECT ir,@a_b_row,@field_names_1; LEAVE `l`;
					fetch_recode_s:LOOP

						SET @a = FIND_IN_SET(ir,@a_row); 

-- SELECT CAST(CONCAT_WS(',',QUOTE(@a_value),QUOTE(ia),QUOTE(@a_value_1)) AS CHAR);
						SET @a = FIND_IN_SET(ir,rownum);
						IF @a != 0 THEN 
								CALL Fetch_Set_values(field_values,ir,@field_values_1);
							ELSE
								SET @field_values_1 = NULL;
						END IF;


						CALL Temp_Func_2(" ??? AS ??",@field_names_1,@field_values_1,NULL,@one);
						SET	@3in1_body =CAST(CONCAT(@3in1_body
									,"SELECT  ",QUOTE(@expid)," AS expid,",
													QUOTE(@missionid)," AS missionid ,",
															@one,',',ir," AS rowNo \n"
																	)AS CHAR);
						SET i = i + 1;
						CALL Fetch_Set_P0(@a_b_row,i,ir);
						IF ir IS NULL THEN 	 LEAVE fetch_recode_s; END IF; -- SELECT  @3in1_body,rownum,i,ir,ia;
						SET @3in1_body = CONCAT_WS('\tunion\n',@3in1_body,'');

					END LOOP;

				 CALL Temp_Func_2(CONCAT_WS('',
"IF((@b :=",
	"CASE	WHEN a1.init_?? = 1 THEN b1.?? ",
				"WHEN a0.init_?? = 1 THEN b0.?? ",
				"WHEN IFNULL(c0.??,'') <> IFNULL(c1.??,'') THEN c0.?? ",
			"ELSE  c0.?? ",
	"END) =''",
",NULL,@b) AS  ?? "),@field_names_1,@field_values_1,NULL,@one);

					 SET @3in1_body = CONCAT("SELECT\nb1.rowNo,",@ONE,"\n",
"FROM acc_mission AS a1
LEFT JOIN acc_mission AS a0 ON a1.behind_missionId = a0.missionId 
LEFT JOIN acc_standard_n AS b1 ON a1.missionId = b1.missionId
LEFT JOIN acc_standard_n AS b0 ON a0.missionId = b0.missionId AND b1.rowNo = b0.rowNo
LEFT JOIN ",expid2b(@expID)," AS c0 ON b0.missionId = c0.missionId AND b0.rowNo = c0.rowNo
LEFT JOIN (\n",@3in1_body,"\n) AS c1 ON b1.missionId = c1.missionId AND b1.rowNo = c1.rowNo
WHERE a1.missionId = ",QUOTE(@missionid));	

-- SELECT @3in1_body,@field_names_1; LEAVE `l`;

				END label5B;
			END label5;

			WHEN `funcid` IS NULL THEN
				 SET @3in1_body = "SELECT NULL as `1`";
				 CALL audit('3IN1',IFNULL(`funcid`,'`funcid` IS NULL'),`funcid` ,key_names,key_values,field_names,field_values,rowids);


			WHEN `funcid` = '2'  THEN 

			LABEL1:BEGIN
				IF IFNULL(rowids,'') ='' THEN	SET rowids ='1';	END IF;
				CASE 		WHEN rowids REGEXP '^[0]{1}(,[1-9][0-9]{0,}){1,}$' THEN	SET rownum= SUBSTR(rowids,3);
								WHEN rowids REGEXP '^[1-9]{1}(,[1-9][0-9]{0,}){0,}$' THEN SET rownum = rowids;
					ELSE	LEAVE `l`; -- rowids 出错  
				END CASE;	-- 取得B记录行 rownum

					SET @a_fds = NULL,@a_row  = NULL;

					CALL generate_one_en(@missionid,rownum,@a_fields,@a_row,@a_value); 

					IF @a_row IS NULL OR @a_value IS NULL THEN  SELECT NULL AS brecord;		LEAVE `l`;	END IF;

					CALL Fetch_Set_values(field_names,'rowId',@field_names_1);-- 取得字r段名

					IF @FIELD_NAMES_1 NOT REGEXP '^\'(B[1-9][0-9]{0,1})\'(,\'B[1-9][0-9]{0,1}\'){0,}$'   THEN
						  SET @3in1_body = "SELECT NULL as `label4B1FEILEDNAMESeeror`";
							CALL audit('3IN1',CONCAT_WS(':','B1FEILEDNAMESeeror:',QUOTE(@FIELD_NAMES_1)),`funcid`,key_names,key_values,field_names,field_values,rowids);
							LEAVE `l`;
					END IF; -- 校验B字段建

					SET  
							i = 1;

          SET @a_b_row = CONCAT_WS(',',rownum,@a_row),
							@a_b_row = Fielter_Set(@a_b_row);
					CALL Fetch_Set_P0(@a_b_row,1,ir);


					fetch_recode:LOOP
						SET @a = FIND_IN_SET(ir,rownum);
						IF @a != 0 THEN 
								CALL Fetch_Set_values(field_values,ir,@field_values_1);
							ELSE
								SET @field_values_1 = NULL;
						END IF;


						SET ia := Fetch_elt(ir,@a_row), 
								@a_value_1 := Fetch_y_1(ia,@a_value);

						SET	@3in1_body =CAST(CONCAT(@3in1_body
									,"SELECT  ",ir," AS rowNo \n"
																	)AS CHAR);
						SET @one =NULL;

						CALL Temp_Func_3(CONCAT_WS('',"CASE WHEN ??? IS NULL OR ??? REGEXP '^null$'  THEN NULL WHEN ???? REGEXP ??? THEN IF( ??? REGEXP ",QUOTE('\\Q(?#\\E'),",NULL,'#00FF00') ELSE '#FF9999' END AS colB??"),NULL,"",
															"",'','b',@a_fields,@a_value_1,@field_names_1,@field_values_1,@one);

 						SET  @3in1_body = CONCAT_WS('',@3in1_body,',',IFNULL(@one,0),"'' AS rowinno");

						SET i = i + 1;
						CALL Fetch_Set_P0(@a_b_row,i,ir);
						IF ir IS NULL THEN 	 LEAVE fetch_recode; END IF;
						SET @3in1_body = CONCAT_WS('\nunion\n',@3in1_body,'');


					END LOOP;

			END LABEL1;

			WHEN `funcid` = '4' OR `funcid` ='3' OR `funcid` ='7' THEN
			label4:BEGIN

				SET @a_fields = NULL;
				IF `funcid` <> '7' THEN 

					SET @db_b = expid2b(@expid),
							@db_a = "acc_1";

				ELSE

					 SET 	@db_b = 'acc_b',
								@db_a = 'acc_a',
								mid1 = preg_capture('/(?<=_).+$/',@missionId),
								@missionId = preg_capture('/^.+?(?=_|$)/',@missionId);
				END IF;

				SET @3in1_body = "";
					SET @sb = CONCAT_WS('',"DELETE a.* FROM ",@db_b," AS A \n",
							"WHERE a.expid =",QUOTE(@expid)," AND a.missionid =", QUOTE(@missionid),
								CONCAT(" AND a.missionid1 =", quote_d(mid1)));

	
					EXECUTE immediate @sb;

				label4B:	BEGIN -- 处理 B字段		
				CASE 
						WHEN rowids REGEXP '^[0]{1}(,[1-9][0-9]{0,}){1,}$' THEN
								SET rownum= SUBSTR(rowids,3);
						WHEN rowids REGEXP '^[1-9]{1}(,[1-9][0-9]{0,}){0,}$' THEN
								SET rownum = rowids;
					ELSE 

							LEAVE label4B; -- rowids 出错 

				END CASE;	-- 取得B记录行 rownum

				IF `funcid` <> '5' THEN
-- SELECT @missionid,rownum,@a_fields,@a_row,@a_value;LEAVE l;
					CALL generate_one_en(@missionid,rownum,@a_fields,@a_row,@a_value); 

				END IF;


					CALL Fetch_Set_values(field_names,'b',@field_names_1);-- 取得字r段名


					IF @FIELD_NAMES_1 NOT REGEXP '^\'(B[1-9][0-9]{0,1})\'(,\'B[1-9][0-9]{0,1}\'){0,}$'   THEN
						  SET @3in1_body = "SELECT NULL as `label4B1FEILEDNAMESeeror`";
							CALL audit('3IN1',CONCAT_WS(':','B1FEILEDNAMESeeror:',QUOTE(@FIELD_NAMES_1)),`funcid`,key_names,key_values,field_names,field_values,rowids);
							LEAVE label4b;
					END IF; -- 校验B字段建


					SET i = 1;

          SET @a_b_row = CONCAT_WS(',',rownum,@a_row),
							@a_b_row = Fielter_Set(@a_b_row);
					CALL Fetch_Set_P0(@a_b_row,1,ir);


					fetch_recode:LOOP

						SET ia := Fetch_elt(ir,@a_row), 
								@a_value_1 := Fetch_y_1(ia,@a_value);

						SET @a = FIND_IN_SET(ir,rownum);

						IF @a != 0 THEN 
								CALL Fetch_Set_values(field_values,ir,@field_values_1);
							ELSE
								SET @field_values_1 = NULL;
						END IF;


						CALL Temp_Func_2(" ??? AS ??",@field_names_1,@field_values_1,NULL,@one);
-- SELECT @one;
						SET	@3in1_body =CONCAT_WS('',@3in1_body
									,"SELECT  ",QUOTE(@expid)," ,", -- " AS expid,",
													QUOTE(@missionid)," ,",-- " AS missionid ,",
											IF(mid1,CONCAT(QUOTE(mid1)," ,"),NULL),
															ir," AS rowNo,",
															@one,','," \n");
						SET @one =NULL;

						CALL Temp_Func_3(" ???? REGEXP ??? AS ERR_B??",NULL,"@b_r_total := ",
															"IFNULL(???? REGEXP ??? ,0)",'+','b',@a_fields,@a_value_1,@field_names_1,@field_values_1,@one);

						SET  @3in1_body = CONCAT_WS('',@3in1_body,IFNULL(@one,0),",@b_total := IFNULL(@b_total,0)+ IFNULL(@b_r_total,0)");

						SET i = i + 1;
						CALL Fetch_Set_P0(@a_b_row,i,ir);
						IF ir IS NULL THEN 	 LEAVE fetch_recode; END IF; -- SELECT  @3in1_body,rownum,i,ir,ia;
						SET @3in1_body = CONCAT_WS('\nunion\n',@3in1_body,'');
					END LOOP;

					SET @3in1_body = CONCAT_ws('',"INSERT INTO ",@db_b,
									"(expid,missionid,",
								IF(mid1 IS NULL,NULL,'missionid1,'),"\n",
									"rowNo," ,
									REPLACE(@field_names_1,'\'',''),
									CONCAT(',',REPLACE_set_0(@a_fields,'err_b')),",right_count,ERROR_count\n)\n",
									@3in1_body,';');


          IF @3in1_body IS NOT NULL THEN

							EXECUTE IMMEDIATE  REGEXP_REPLACE(REGEXP_substr(@3in1_body,'(?i)select\\s+\\K\'(?:\\\\.|[^\'])+\'\\s*,\\s*\'(?:\\\\.|[^\'])+\'')
							,"('[^']+')\\s*,\\s*('[^']+')",'SELECT 1 INTO @b FROM acc_1 AS a WHERE a.expID = \\1 AND  a.missionId = \\2');

							IF FOUND_ROWS()=0 THEN
							EXECUTE IMMEDIATE REGEXP_REPLACE(REGEXP_substr(@3in1_body,'(?i)select\\s+\\K\'(?:\\\\.|[^\'])+\'\\s*,\\s*\'(?:\\\\.|[^\'])+\'')
							,"('[^']+')\\s*,\\s*('[^']+')",'INSERT INTO ACC_1(expID ,missionId)VALUES (\\1, \\2)');
							END IF;
-- SELECT @3in1_body;LEAVE l;
							EXECUTE immediate @3in1_body;

					END IF;
				END label4B;-- 处理 B字段


				SET @A_S = NULL;
		-- 处理 A字段
				label4A:BEGIN

					SET @3in1_body = NULL,
							@statu_value = NULL,
							@statu_name = NULL,
							@3in1_body = CONCAT_WS('',"SELECT b.expID,a.classNo INTO @statu_value ,@statu_name\nFROM exp_experimentclassstudent AS a\nLEFT JOIN ",
																@db_a," AS b ON a.expNo = b.expID AND b.missionId = ",QUOTE(@missionid),
																CONCAT(" AND b.missionid1 =", quote_d(mid1)),				
																"\nWHERE a.expNo = ", QUOTE(@expid)); 


					EXECUTE immediate @3in1_body;

		 			IF  @statu_value IS NULL THEN
							SET @3in1_body = CONCAT_WS('',"INSERT ",@db_a,"(EXPID,MISSIONID",
																	IF(mid1 IS NULL,NULL,",missionId1,billid"),")\n",
																						"VALUES(",QUOTE(@expid),',',QUOTE(@missionid),
																		CONCAT(',',IF(mid1 IS NULL,NULL,QUOTE(mid1)),',',QUOTE('jzpz_bjzyfl')),
																")");

							EXECUTE immediate  @3in1_body;
					END IF;

					SET @3in1_body = "SET \n" ;
					CALL Fetch_Set_values(field_names,'a',@field_names_1);-- 取得r字段名

          IF IFNULL(@field_names_1,'') NOT REGEXP 
							'^\'(a[1-9][0-9]{0,1}[0]{0,1}){1,}\'(,\'(a[1-9][0-9]{0,1}[0]{0,1})*\')*$' THEN -- 校验A字段 允许为空

							CALL audit(CONCAT_WS(':','3IN1',`funcid`),CONCAT_WS(':','afieldWarning:',@FIELD_NAMES_1),`funcid`,key_names,key_values,field_names,field_values,rowids);

							SET @one = ''; 
						ELSE 
						 CALL Fetch_Set_values(field_values,'0',@field_values_1);

						 CALL Temp_Func_2("?? := ??? \n",@field_names_1,@field_values_1,NULL,@one);

 					END IF;	

						SET @3in1_body = CONCAT(@3in1_body,@ONE,IF(IFNULL(@ONE,'')='' ,'',','));	


					CALL generate_one_en(@missionid,'0',@a_fields,@a_row,@a_value);

					IF IFNULL(@a_fields,'') !='' THEN 

								CALL Fetch_Set_values(@a_value,'0',@a_values_1);

								CALL Temp_Func_3("ERR_A?? = ???? REGEXP ??? ",NULL,"a.right_count = @right_count := ",
																	"IFNULL(???? REGEXP ??? ,0)",'+','a',@a_fields,@a_values_1,@field_names_1,@field_values_1,@one);

								SET @one =CONCAT(@one,'+');
							ELSE 
								SET @one ='';
					END IF;

					IF @one ='' THEN
						SET @one = CONCAT('a.line  = ',j0(dblob,'line')),
								@one = CONCAT_WS(',',@one, "a.right_count = @right_count := ");
					END IF;

					SET @3in1_body =CAST(
											CONCAT("UPDATE ",@db_a," AS a, (\n",
															"\t\t\t	SELECT \n",
															"\t\t\t\t\t\t a1.classType, \n",
															"\t\t\t\t\t\t IF(IFNULL(b.line_type,0) =0, 0, 1) AS is_line, \n",
															"\t\t\t\t\t\t Count(b1.seal_id) AS shouldSeal, \n",
															"\t\t\t\t\t\t Count(b3.expID) AS overSeal, \n",
															"\t\t\t\t\t\t COUNT(b1.seal_id)-COUNT(b3.expid) AS unSealed, \n",
															"\t\t\t\t\t\t @unS := \n",
															"\t\t\t\t\t\t\t\t CAST(CONCAT_WS('\\n',\n",
															"\t\t\t\t\t\t\t\t\t  CONCAT(IF(IFNULL(b0.max_page,1)=1 ,b0.billname,b0.page_title1),'缺少：（',\n",
															"\t\t\t\t\t\t\t\t\t\t  GROUP_CONCAT(\n",
															"\t\t\t\t\t\t\t\t\t\t\t 	IF((b.pageno = 0 AND b0.max_page >=1 or b.pageno =1) AND b1.pageid = 1 AND b3.expid IS NULL,CONCAT_WS('',b2.seal_name),NULL) \n",
															"\t\t\t\t\t\t\t\t\t\t\t\t 	ORDER BY b1.seal_no) \n",
															"\t\t\t\t\t\t\t\t ,'）'),",
															Temp_Func(CONCAT("\n",
															"\t\t\t\t\t\t\t\t\t CONCAT(b0.page_title??,'缺少：（',\n",
															"\t\t\t\t\t\t\t\t\t\t  GROUP_CONCAT( \n",
															"\t\t\t\t\t\t\t\t\t\t\t 	IF((b.pageno = 0 AND b0.max_page >=?? or b.pageno =??) AND b1.pageid = ?? AND b3.expid IS NULL,CONCAT_WS('',b2.seal_name),NULL) \n",
															"\t\t\t\t\t\t\t\t\t\t\t\t 	ORDER BY b1.seal_no) \n",
															"\t\t\t\t\t\t\t\t  ,'）')"),2,7,NULL),
															"\t\t\t\t\t\t\t\t\t ,IF( Count(b1.seal_id)<>Count(b3.expID),'<p>注：请更换角色，在不同联次，完成签章！</p>',NULL) \n",
															"\t\t\t\t\t\t\t\t  )AS CHAR ) AS uns,\n",
															"\t\t\t\t\t\t IFNULL(a2.read_answer_size,0) as read_answer_size, \n",
															"\t\t\t\t\t\t IFNULL(a2.answerScore,0) as answerScore, \n",
															"\t\t\t\t\t\t IFNULL(a2.resultScore,0) AS resultScore, \n", 
															"\t\t\t\t\t\t a2.pass_score_size, \n",
															"\t\t\t\t\t\t a2.score_seal_size, \n",
															"\t\t\t\t\t\t a2.score_line_size, \n",
															"\t\t\t\t\t\t IFNULL(a2.resultcount,0) as resultcount, \n",
															"\t\t\t\t\t\t @pt33 := IF(b.is_line,a2.score_line_size,0), \n",
															"\t\t\t\t\t\t @pt44 :=a2.resultcount*a2.resultScore, \n",
															"\t\t\t\t\t\t @pt55 :=a2.read_answer_size* a2.answerScore, \n",
															"\t\t\t\t\t\t a2.max_score_size, \n",
															"\t\t\t\t\t\t a2.redo_size \n",
															"\t\t\t	FROM exp_experimentclass AS a1 \n",
															"\t\t\t	INNER JOIN mysq1_schema.exp_difficulty AS a2 ON a1.difficulty_level = a2.difficulty_level \n",
															"\t\t\t	JOIN acc_mission AS b ON b.missionId = ",QUOTE(@missionid)," \n",
															"\t\t\t	INNER JOIN mysq1_schema.bill_list AS b0 ON b.billid = b0.billid \n",
															"\t\t\t LEFT JOIN acc_mission_seal AS b1 ON b1.missionId = ",QUOTE(@missionid)," \n",
															"\t\t\t INNER JOIN acc_enter_seal AS b2 ON b1.seal_id = b2.sealID AND b2.seal_content <> '操作' \n",
															"\t\t\t INNER JOIN acc_enter_role AS b21 ON b21.roleid = b2.roleid \n",
															"\t\t\t LEFT JOIN acc_seal_1 AS b3 ON b3.expID =",QUOTE(@expid)," \n",
															"\t\t\t\t\t\t AND b3.missionId =",QUOTE(@missionid)," \n", 
															"\t\t\t\t\t\t AND b1.pageId = b3.pageId AND b1.seal_id = b3.seal_Id \n",
															"\t\t\t WHERE a1.ClassNo =",QUOTE(@statu_name)," \n",
															"LOCK in SHARE mode",
															"\t\t	) AS b  \n",
														@3in1_body,
														@one,@b_total," ,\n",
														"a.log_count := IFNULL(a.log_count,0)+",IF(`funcid`=4,'1',0)," ,\n",
														"a.already_no_seal = b.overSeal,\n",
														"a.read_ans_size := IF(read_ans_size IS NULL ,0,a.read_ans_size) ,\n",
														"a.error_count = @pt1 :=",REPLACE(@a_s,',','+'),",\n",
 														"a.pt1 = @pt1 := (@pt11 :=(100- IF(IFNULL(b.shouldSeal,0)=0,0,b.score_seal_size) -  b.score_line_size * b.is_line))*IF(IFNULL(@pt1,0) != 0,@right_count/@pt1,1), \n",
														"a.pt2 = @pt2 := (@pt22 :=IF(IFNULL(b.shouldSeal,0)=0,0,b.score_seal_size))*b.overSeal/IF(b.shouldSeal = 0,1,b.shouldSeal), \n",
														"a.pt3 = @pt3 := IF(b.is_line,IF(IFNULL(a.is_line,0),b.score_line_size,0),0), \n",
														"a.pt4 = @pt4 := IF(b.resultcount > IFNULL(a.mission_result,0),a.mission_result,b.resultcount)*b.resultScore  ,\n",
														"a.pt5 = @pt5 := IF(b.read_answer_size>a.read_ans_size, a.read_ans_size ,b.read_answer_size)* b.answerScore ,\n",
														"a.score :=IF(IFNULL(@pt1,0) + IFNULL(@pt2,0) + IFNULL(@pt3,0)  - IFNULL(@pt4,0)  -IFNULL(@pt5,0) <0 ,0, IFNULL(@pt1,0) + IFNULL(@pt2,0) + IFNULL(@pt3,0)  - IFNULL(@pt4,0)  -IFNULL(@pt5,0))\n",
														"WHERE a.missionId =",QUOTE(@missionid)," AND a.expid=",QUOTE(@expid)
												)
											AS CHAR);
		
					EXECUTE immediate @3in1_body;
					-- 
						
					IF `funcid` <>4 THEN  SET @3in1_body="SELECT 'ok' AS teaa";LEAVE label4;END IF;
					
			IF	DATABASE() REGEXP  '5$' THEN
 -- SELECT CONCAT_WS(',',QUOTE(@expid),QUOTE(@missionid),1); LEAVE `l`;
					CALL v5_autoFlow(@expid,@missionid,1);
					SET IS5=1;
			END IF;


					SET @3in1_body =CONCAT("

SELECT \n",
QUOTE(@expid)," AS expID,",
QUOTE(@missionid)," AS missionId,",
"IFNULL(d.redo_size,0) AS redoSize,
IFNULL(d.max_score_size,0) AS missionMaxScore,
IFNULL(a.score,0) AS missionScore,
IFNULL(a.read_ans_size,0) AS readAnswer,
IFNULL(a.read_ans_size,0) AS number,
CAST(a.log_count AS char) AS logCount,
IFNULL(a.error_count,0) AS error_count,
IFNULL(a.right_count,0) AS RIGHT_COUNT,
@b :=a.score AS tempscore,
@pt44, @pt4,
CAST(CASE WHEN IFNULL(c.CLASSTYPE,0) = 1   THEN CONCAT_WS('',
'<h5><',C.CLASSNAME,'>','<h5>将在：',
TIMEDIFF(c.endtime,NOW()),'后结束！')
WHEN  d.difficulty_level =9 THEN '考试模式，无提示。' 
WHEN a.log_count > d.resultcount THEN '提示次数用完'
ELSE CONCAT_WS('','<h5><',e.node_No,'.',f.typesort,'>',TRIM(g.missionLabel),'（合格率:',
IF(@b =0, 0,IF(ROUND(@b,2)=CEIL(@b),CEIL(@b),ROUND(@b,2))),
'%）</h5>'",
IF(@pt11<>0,CONCAT(",'<p>填空得分( ",@pt11," )：",CEIL(@pt1),"</p>'"),""),"\n",
IF(@pt22<>0,CONCAT(",'<p>签章得分( ",FLOOR(@pt22)," )：",CEIL(@pt2),"</p>'"),""),"\n",
IF(@pt33<>0,CONCAT(",'<p>画线得分( ",@pt33," )：",CEIL(@pt3),"</p>'"),""),"\n",
IF(@pt44<>0 AND @pt4 <> 0,CONCAT(",'<p>对比扣分( -",@pt44," )：-",CEIL(@pt4),"</p>'"),""),"\n",
IF(@pt55<>0 AND @pt5 <> 0,CONCAT(",'<p>查看答案扣分( -",@pt55," )：-",CEIL(@pt5),"</p>'"),""),"\n",
IF(CHAR_LENGTH(@uns) <>0,CONCAT(",'<p>提示：</p>',",QUOTE(@uns)),''),"\n",
")END AS char)AS missionLabel
FROM acc_1 AS a
LEFT JOIN acc_mission AS g ON g.missionId = a.missionId 
LEFT JOIN exp_experimentclassstudent AS b ON a.expID = b.expNo
LEFT JOIN exp_experimentclass AS c ON b.classNo = c.classNo
",IF(IS5,'',"LEFT JOIN exp_experimentclass_course AS c1 ON c1.classNo = c.classNo"),"
LEFT JOIN mysq1_schema.exp_difficulty AS d ON c.difficulty_level = d.difficulty_level
LEFT JOIN exp_courses_node_content AS f ON g.missionId = f.missionid
INNER JOIN exp_courses_node AS e ON  f.contentNo = e.contentNo  AND ",IF(IS5 ,'c','c1'),".courseNo = e.node_courseNo
",	"\nWHERE a.missionId =",QUOTE(@missionid)," AND a.expid=",QUOTE(@expid));
 -- SELECT @3in1_body 		;			
--  SELECT @EXPID,@3in1_body; LEAVE  `l`;
--  LEAVE `l`;
				END label4A;-- 处理 A字段,';'
			END label4;


	END CASE;
/*
	IF IFNULL(@3in1_body,'')= '' THEN
		SET @3in1_body ="SELECT NULL as `Elabel400`";
		CALL audit('3IN1',CONCAT_WS(':',IFNULL(`funcid`,'400'),'something ERROR:',QUOTE(rowids)),`funcid`,key_names,key_values,field_names,field_values,rowids);
	END IF;
*/-- SELECT CAST(@3in1_body as CHAR) ;LEAVE `l`;--  

		EXECUTE immediate  @3in1_body;
-- select '1','2';
--   SELECT @3in1_body; LEAVE `l`;
-- SELECT null ;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `a`
-- ----------------------------
DROP FUNCTION IF EXISTS `a`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `a`(`p` tinyint) RETURNS float
    DETERMINISTIC
BEGIN
	#Routine body goes here...

	RETURN 0;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `a+`
-- ----------------------------
DROP FUNCTION IF EXISTS `a+`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `a+`(`a` longtext,`b` longtext) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	DECLARE i INT(5) DEFAULT 0; 
 DECLARE len INT(5) DEFAULT json_length(a) ;
 DECLARE rs LONGTEXT DEFAULT NULL ;
IF IFNULL(a,'')='' OR IFNULL(b,'')='' THEN RETURN IF(CONCAT_WS('',a,b)='',NULL,CONCAT_WS('',a,b));END IF;
	l:LOOP
		IF i > len THEN LEAVE l; END if;
	SET	rs = CONCAT_WS(',',rs,json_merge(json_query(a,CONCAT('$[',i,']')),json_query(b,CONCAT('$[',i,']'))))
			,i= i+1;

	END LOOP;
	RETURN CONCAT('[',rs,']') ;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `ab`
-- ----------------------------
DROP FUNCTION IF EXISTS `ab`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `ab`(`ab` varchar(20000),`init` varchar(20000),`blur` varchar(1200)) RETURNS text CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN

 DECLARE `e` TINYTEXT DEFAULT '\\[\\]\\-(){}.*?+$';DECLARE `rep` VARCHAR(200) DEFAULT '\\\\\\1';
  DECLARE CONTINUE HANDLER FOR  SQLSTATE '21S01', SQLSTATE '23000', SQLSTATE	'42000'	, SQLSTATE	'42S22' , SQLSTATE	'HY000'-- ,SQLSTATE	'22007'

-- INSERT plogs(Function_Name,summary,parameter) value('ab ',CONCAT_WS(' ',@errno ,@text),CONCAT_WS(',',json_quote(`ab`) ,json_quote(IFNULL(`init`,'NULL')) ,json_quote(`blur`)));

	SET `e` = CONCAT_WS('','((?<!\\\\)[',`e`,']|\\\\(?![',`e`,']))'),`ab` = TRIM(`ab`),`blur` = TRIM(`blur`);

	SET `ab` = REGEXP_replace(IF(IFNULL(`ab`,'') REGEXP '^\\s*$',NULL,preg_replace('/(?=\\(|\\)|\\*)/','\\\\',`ab`)),'(?!\\\\)(\\+)','\\\\\\\\\\1'),
			`init` = REGEXP_replace(IF(IFNULL(`init` ,'') REGEXP '^\\s*$',NULL,'1'),'(?!\\\\)(\\+)','\\\\\\\\\\1'),
			`blur` = REGEXP_replace(IF(IFNULL(`blur` ,'')  REGEXP '^\\s*$',NULL,PREG_REPLACE('/\\s/','\\s+',`blur`)),'(?!\\\\)(\\+)','\\\\\\\\\\1');
	SET @oab =`ab`;
	



	CASE		WHEN `init` = 1 		THEN  RETURN NULL;
					WHEN IFNULL(`ab`,'')='' AND  IFNULL(`init`,'') ='' THEN RETURN NULL;
					WHEN `blur` REGEXP '\\*{4}'THEN SET `init` = CONCAT_WS('','^(?:\\s*|',REGEXP_substr(`blur`,'(?<=\\*{4})\\d*(\\.\\d+)?'),')$');
          WHEN `blur` LIKE '*%' THEN  RETURN '[[:alnum:]]+';
					WHEN `blur` REGEXP '(?i)\\{y(?:md\\}?)?|@@' THEN
								CASE	WHEN IFNULL(`ab`,'') = '' THEN SET `ab` = '^\\d{1,4}$';
											WHEN	`ab` REGEXP '^(?:0|零|〇).$' THEN  SET	`init` = REGEXP_SUBSTR(`ab`,'(?<=0|零|〇).$');
											WHEN	`ab` REGEXP '^.$' THEN SET	`init` = CONCAT('(?:0|零|〇)',`ab`);
									ELSE SET `init` = REGEXP_SUBSTR(`ab`,'.{2}$');
								END CASE ;
					WHEN `blur` REGEXP '^\\s*\\={2}\\s*$' THEN	SET 	`ab` = CONCAT('^',REGEXP_replace(`ab`,e,`rep`),'$');
					WHEN `blur` REGEXP '=[\\^!]' THEN  
							SET `init` = REGEXP_replace(REGEXP_replace(REGEXP_replace(`blur`,`e`,`rep`),'=[\\^!]','|'),'^\\||\\$','');
							SET `init` = CONCAT_WS('','^(?!.*?(?:',`init`,'))');
							SET `ab` = CONCAT_WS('',`init`,REGEXP_replace(`ab`,e,`rep`)),`init` = NULL;
					WHEN `ab` is NULL THEN   
								CASE	WHEN `blur` is null THEN RETURN NULL;
									ELSE SET `ab` = '^[[:space:]]*$',`init` = b2r(`blur`,null);
								END CASE;
					WHEN `blur` REGEXP '#{2}' THEN
								SET `init` = REGEXP_SUBSTR(`blur`,'(?<=#{2})(\\-|￥|\\$)?\\d+(\\.\\d+)');
								IF IFNULL(`init`,'') = '' THEN 	SET `ab` = Is_amount(`ab`);
								ELSE SET `init` = Is_amount(`init`); END IF;

					WHEN `blur` is null THEN RETURN Is_amount(`ab`);
					WHEN `blur` REGEXP '\\(\\?#REGEXP\\)' THEN 
								
								SET  `ab` = CONCAT_WS('|',ab,REGEXP_REPLACE(`blur`,'\\(\\?#REGEXP\\)',''));
					WHEN substr(@tb_:=b2r(`blur`,`ab`),1,2)='^[' THEN SET `ab` = Is_amount(`ab`),`init` = @tb_;
			ELSE SET `init` =@tb_;
	END  CASE; 

  SET `ab` = CONCAT_WS('|',if(IFNULL(`ab`,'')='',NULL,`ab`),if(IFNULL(`init`,'')='',NULL,`init`));

	IF  IFNULL(@oab,'')='' AND `ab` <> '' AND '' REGEXP `ab` AND `blur` REGEXP CONCAT(REPEAT('#',4),'|',REPEAT('=',4)) THEN
			SET `ab` = CONCAT(`ab`,'(?#',REGEXP_substr(`blur`,CONCAT(REPEAT('#',4),'|',REPEAT('=',4))),')');
	END IF;
	RETURN 	`ab`;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `accsl`
-- ----------------------------
DROP PROCEDURE IF EXISTS `accsl`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `accsl`(`account` varchar(200),`date` date)
asll:BEGIN
	#Routine body goes here...
/*
START TRANSACTION;
CALL Audit_1('accsl',CONCAT_WS(',',QUOTE(`account`),QUOTE(`date`)),'ok');COMMIT;

LEAVE asll;

*/

	SET @`code` = NULL,
			@`code` = preg_capture('/^\\d*/',`account` ),
			@`account1` = NULL, 
			@`account1` = preg_capture('/^([0-9]+\\s*)*(.+?)(?=$| \\- )/',`account`,2) ,
			@`account2` = NULL, 
			@`account2` = preg_capture('/(?<= \\- ).+$/',`account`);
-- SELECT c(@`account2`),c(@`account1`);
  IF	IFNULL(@`code`,'') = '' OR CONCAT_WS('',@`account2`,@`account1`) = ''THEN 
			SELECT 'no code' ;LEAVE asll;
  END IF;
	
-- SELECT CAST(@`code` AS CHAR);
	SET @stmtbody = CONCAT_WS('',"DELETE a.* FROM mxz AS a WHERE ",  
								"a.`code` = ",QUOTE(@`code`)," AND " ,
									"a.`year` = ",QUOTE(YEAR(`date`)));

	PREPARE stmt from  @stmtbody ;
	EXECUTE stmt ;

	
	SET @stmtbody = CONCAT_WS('',"REPLACE INTO mxz (missionId,`code`,account,DATE,`year`,`month`,`day`,classic,note,credit,debit)
SELECT
a.missionId,",
QUOTE(@`code`),
",\n",
"CONCAT_WS(' - ',c.b2,IF(IFNULL(c.b3,'') = '',NULL,c.b3)) AS account,
@tdate := DATE(CONCAT_WS('-',b.a1,b.a2,b.a3)) AS DATE,
YEAR(@tdate) AS `year`,
MONTH(@tdate) AS `month`,
day(@tdate) AS `day`,
CONCAT_WS(' - ',IF(IFNULL(b.a4,'')='','记',b.a4),b.a5) AS classic,
IF(c.rowNo <> 1,c1.b1,c.b1) AS note,
IF(c.b4/100 <> 0,c.b4/100,NULL) AS credit,
IF(c.b5/100 <> 0,c.b5/100,NULL)  AS debit
FROM 
qianxue_sjzh.acc_mission AS a
INNER JOIN qianxue_sjzh.exp_courses_node_content AS a1 ON a.missionId = a1.missionid
INNER JOIN qianxue_sjzh.exp_courses_node AS a2 ON a1.contentNo = a2.contentNo
INNER JOIN qianxue_sjzh.acc_standard_1 AS b ON b.missionId = a.missionId
INNER JOIN mysq1_schema.bill_list AS a3 ON a.billId = a3.billId
INNER JOIN qianxue_sjzh.acc_standard_n AS c ON c.missionId = a.missionId
LEFT JOIN qianxue_sjzh.acc_standard_n AS c1 ON c.rowNo <> 1 AND c1.rowNo =1 AND  c1.missionId = a.missionId
WHERE
a2.node_courseNo = 'sj-2' AND
a.billId LIKE 'kjpz_jzpz00_ty%' AND
b.a1 = ",QUOTE(YEAR(`date`))," AND \n",
"c.b2 = ",QUOTE(@`account1`),
IF(@`account2` IS NOT NULL ,CONCAT_WS(''," AND c.b3 = ",QUOTE(@`account2`)),NULL),
" AND\nIFNULL(c.b2,'') <> ''
ORDER BY  DATE(CONCAT_WS('-',b.a1,b.a2,b.a3))")
;

-- SELECT c(@stmtbody) ; LEAVE asll;
	PREPARE stmt from  @stmtbody;
	EXECUTE stmt ;
DEALLOCATE PREPARE stmt;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `accslgl`
-- ----------------------------
DROP PROCEDURE IF EXISTS `accslgl`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `accslgl`(IN `funcid` varchar(60) ,IN `p` longtext)
    READS SQL DATA
accslgl:BEGIN
/*
0	总分类账-科目表
1 明细账-科目表
2 科目汇总表
3 明细账
4 总分类账 
6 报表项目明细 
7 经济业务 
8 期初余额
9 科目代码表
*/
	DECLARE i INT DEFAULT 1;
DECLARE EXIT HANDLER FOR  SQLSTATE '23000', SQLSTATE	'42000'	, SQLSTATE	'42S22'	, SQLSTATE	'HY000'-- , SQLSTATE	'22007'
		bl:BEGIN	GET DIAGNOSTICS CONDITION 1 @`sqlstate` = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;SET  @`sqlstate` = JSON_OBJECT('sqlstate',@`sqlstate`,'errno',@errno,'text',@text);
		SET @`errsql` = @stmtbody;SET @funcid :=  NULL,
				@funcid = CONCAT_WS(' ','Error：',REGEXP_substr("0	总分类账-科目表\n1 明细账-科目表\n2 科目汇总表\n3 明细账\n4 总分类账 \n6 报表项目明细 \n7 经济业务 \n8 期初余额\n9 科目代码表",CONCAT_WS('','(?ism)^\\s*' ,`funcid` ,'\\s*[^\\d\\s]+'))
										,' Accslgl'),
				@pp = CONCAT_WS(',',QUOTE(`funcid`),QUOTE(`p`));
		CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp,'SQL',@`errsql`,'err',@`sqlstate`,'l',1));
END;/* */

start TRANSACTION;
SET @funcid :=NULL,
		@funcid = CONCAT_WS(' ',REGEXP_substr("0	总分类账-科目表\n1 明细账-科目表\n2 科目汇总表\n3 明细账\n4 总分类账 \n6 报表项目明细 \n7 经济业务 \n8 期初余额\n9 科目代码表",CONCAT_WS('','(?ism)^\\s*' ,`funcid` ,'\\s*[^\\d\\s]+'))

                ,' Accslgl'),
		@pp = CONCAT_WS(',',QUOTE(`funcid`),QUOTE(`p`));
-- CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp));COMMIT;

	SET		@stmtbody = NULL;

	CASE	WHEN funcid = '10' THEN
				BEGIN
						DECLARE `courseNo` VARCHAR(60) DEFAULT j2(`p`,'courseNO');

	SET @stmtbody =  r5(R4('10acc'),`p`);
-- SELECT @stmtbody;	 LEAVE accslgl;	
				END;
-- SELECT 'ok',@b11_body;LEAVE accslgl;
			WHEN funcid = '9' THEN
						SET  @`limit` = NULL;
						SET		@`limit` = CONCAT('LIMIT ',IF(@`limit` := j0(`p`,"LIMIT" )IS NOT NULL,@`limit`, IF((@sn := CONCAT_WS(',',j5(`p`,"start"),j5(`p`,"number")))='' ,NULL,@sn))),
									@bnote = NULL,
									@`WHERE` = CONCAT_WS(' AND\n',CONCAT("b0.category LIKE  ",quotd(j5(`p`,'category'))),
																							 CONCAT('a.courseNo =', j3(`p`,"courseNo")),
																							 CONCAT("CONCAT_WS('',a.`code`,a.account,a.yefx,a.fsefx,a.note) REGEXP ", quotd(j5(`p`,'searchVal'))));

						IF @`where` = '' THEN SELECT "NO WHERE ";LEAVE accslgl; end IF;
		
						SET		@stmtbody = CONCAT_WS('\n',	"SELECT\na.id,\na.`code`,\nTRIM(a.account) AS account,\na.yefx,\na.fsefx,\na.note,\n(c(@bnote := IF(IFNULL(b.note,'')='',@bnote,b.note))) AS account_title,\nb0.category,\nb0.note AS category_title","FROM\naccountcode AS a\nLEFT JOIN mysq1_schema.account AS b ON a.`code` = b.`code`\nLEFT JOIN mysq1_schema.accountcode_category AS b0 ON SUBSTR(a.`code`,1,1)= b0.`code`"),
									@bnote = j0(`p`,"codefield") ;

						
							CASE 
									WHEN IFNULL(@bnote,'') = '' THEN
											SET @stmtbody = @stmtbody ;
									WHEN @bnote = 'b2' THEN
											SET @`WHERE` = CONCAT_WS(' AND\n',@`WHERE`, 'CHAR_LENGTH(a.`code`) <=4');
									WHEN @bnote = 'b3' THEN 
											SET @stmtbody = CONCAT_WS('\n',@stmtbody,"INNER JOIN accountcode AS c ON CHAR_LENGTH(c.`code`) <= 4 AND a.`code` LIKE  CONCAT(c.`code`,'%') "),
													@`WHERE` = CONCAT_WS(' AND\n',@`WHERE`, 'CHAR_LENGTH(a.`code`) >4',CONCAT("c.`account` LIKE ",QUOTEj(CONCAT('%',j5( `p`,"b2"),'%'))));
							END CASE;


						SET		@stmtbody = CONCAT_WS('\n',@stmtbody,CONCAT('Where ',IF(IFNULL(@`WHERE`,'') = '',NULL,@`WHERE`)),"ORDER BY a.`code`",@`limit`);


			WHEN funcid = '8' THEN

						SET @stmtbody = r5(COLUMN_get(R8("qcye"),'sql'AS CHAR),p);		
	 					SET	@stmtbody = CAST(CONCAT_WS('',@stmtbody,CONCAT("\nLIMIT ",j0(`p`, "start"),',',j0(`p` ,"number")))AS CHAR);

			WHEN funcid = '0' OR  funcid = '1'  THEN

					SET @stmtbody = CONCAT_WS('\n',	R4('kemudaim')),
							@`WHERE` = CONCAT_WS(' AND\n',CONCAT('a.courseNo =', j3(`p`,"courseNo")),CONCAT('a.enter =', j3(`p`,"enter")));
					SET @stmtbody = CONCAT_WS('\n',@stmtbody,CONCAT("WHERE " ,@`WHERE`));

					IF funcid = '0' THEN 
						SET @stmtbody = CONCAT_WS('	AND\n',@stmtbody, "CHAR_LENGTH(a.`code`)<=4");
					END IF;


			WHEN funcid = '2' THEN 

					SET @mo = json_extra(`p`,'a2');
					SET @stmtbody = CONCAT_WS('',"SELECT CONCAT_WS('',a.k2,' ',a.k3) AS account,money(a.k1) AS credit,money(a.k4) AS debit,a.k5 AS mo\n",
					"FROM temp_km AS a ",CONCAT("WHERE a.k5 =",@mo),"\n",
					"ORDER BY IF(a.k2 REGEXP '^[0-9]',a.k2,'hj')\n");

			WHEN funcid = '3' OR funcid = '4' THEN
			BEGIN DECLARE period VARCHAR(30) DEFAULT j0(p,"period");DECLARE i INT(5) DEFAULT 1;
				SET @a1 := NULL, @a2 = NULL,@p2 := `p`;

				IF IFNULL(period,'') ='' THEN
								SET @a1 = json_extra(`p`,'a1'),@a2 = json_extra(`p`,'a2');
					ELSE	SET @a1 = REGEXP_substr(period,'^.*?(?=\\-|$)'),@a2 = REGEXP_substr(period,'(?<=\\-).*?$');

				END IF;
-- '3','{"period":"2007-01","a3":"1","expid":"","stu_name":"tt","courseNo":"ifa_1";"account":"1001	库存现金"}'

				SET			@account = json_extra(`p`,'account');

					SET @`code`= REGEXP_substr(j0(`p`,'account'),'^[^\\s]+(?=\\s)'),
							@`where` := CONCAT_WS(' AND\n'
,CONCAT("a.`code` LIKE ",QUOTE(CONCAT_WS('',@`code`,"%")))
,CONCAT('courseNo = ',j3(`p`,'courseNo'))
,CONCAT('expid = ',j3(`p`,'expid'))
),
@`where` = CONCAT_WS(' ','where',@`where`);



					SET	@stmtbody = CONCAT_WS('',		"SELECT a.missionId , a.`code` AS `code` , a.account,\n",
																					"			@tdate := DATE(CONCAT_WS('-',a.a1,a.a2,a.a3)) AS DATE,CONCAT_WS(' - ',a.classic,a.num) AS  classic,a.note,\n",
																					"			FORMAT(a.debit,2) AS debit,FORMAT(a.credit,2) AS credit,money(SUM(@da := IFNULL(a.da,0)	+	IFNULL(a.debit	,0))) AS da,money(SUM(@ca :=	IFNULL(a.ca,0)	+	IFNULL(a.credit	,0))) AS ca,\n",
																					"			a.cord,money(ABS(@remain := IFNULL(a.remain,0)*IF(a.cord = '借',1,-1))) AS remain,\n",
																					"			money(@bda := 0) AS bda, money(@bca := 0) AS bca,\n",
																					"			LPAD('1',2,0) AS `month`\n",
																					"FROM inibalance AS a\n"
																					,@`where`
																							),
							@sb_mo = CONCAT_WS('',	"SELECT  a.missionId,a.`code`,a.`code1`AS account,\n",
																			"			@tdate := COLUMN_get(a.acc_b,'date' AS DATE) AS `DATE`,CONCAT_WS(' - ',IF(IFNULL(b.a4,'') ='','记', b.a4),b.a5) AS classic,COLUMN_get(a.acc_b,0 AS char) AS note,\n",
																			"			money(a.b4) AS debit, money(a.b5) AS credit,\n",
																			"			money(@da :=	IFNULL(@da,0) + IFNULL(a.b4,0)) AS da,money(@ca :=  IFNULL(@ca,0) + IFNULL(a.b5,0)) AS ca,\n",
																			"			@fx := IF((@re:= @remain + @da -@ca) > 0 ,'借',IF(@re < 0,'贷','平'))	AS cord,money(ABS(@re)) AS remain,\n",
																			"			money(@bda := IF(@mo <> b.a2 +0 ,0,IFNULL(@bda,0)) + IFNULL(a.b4,0)) AS bda,money(@bca := IF(@mo <> b.a2+0,0,@bca) + IFNULL(a.b5,0)) AS bca,\n",
																			"			LPAD(@mo := IF(IFNULL(@mo,0) <> b.a2+0,b.a2,@mo),2,0) AS `month`\n",
																			"FROM acc_standard_n AS a INNER JOIN acc_standard_1 AS b ON b.missionid = a.missionid\n",
																			"WHERE a.`code` LIKE ",QUOTE(CONCAT_WS('',@`code`,"%"))," AND  b.a1 = ",@a1),
							@sb_moe = CONCAT_WS('',
																		"SELECT	NULL AS missionId,NULL AS `code`,NULL AS account,\n","@tdate := DATE(LAST_DAY(@tdate)) AS DATE,NULL	AS  classic,\n",
																		"				'本期合计'	AS	note,money(@bda) AS debit,money(@bca) AS credit,money(@da) AS da,money(@ca) AS ca,\n",
																		"				@fx	AS cord,money(ABS(@re)) AS remain,money(@bda),money(@bca),\n",
																		"				LPAD(MONTH(@tdate),2,0) AS `month`",
																		"\nUNION ALL\n",
																		"SELECT	NULL AS missionId,NULL AS `code`,NULL AS account,DATE(LAST_DAY(@tdate)) AS DATE,NULL	AS  classic,\n",
																		"				'本年累计'	AS	note,FORMAT(@da,2) AS debit,money(@ca) AS credit,FORMAT(@da,2) AS da,FORMAT(@ca,2) AS ca,\n",
																		"				@fx	AS cord,money(ABS(@re)) AS remain,money(@bda),money(@bca),\n",
																		"				LPAD(MONTH(@tdate),2,0) AS `month`\n"),
							@sb_mob = CONCAT_WS('',"SELECT	NULL AS missionId,NULL AS `code`,NULL AS account,DATE_ADD(LAST_DAY(@tdate),INTERVAL 1 DAY) AS DATE,NULL	AS  classic,\n",
																		"				'期初'	AS	note,NULL AS debit,NULL AS credit,NULL AS da,NULL AS ca,\n",
																		"				@fx	AS cord,money(ABS(@re)) AS remain,NULL AS bda,NULL bca,\n",
																		"				LPAD(MONTH(DATE_ADD(LAST_DAY(@tdate),INTERVAL 1 DAY)),2,0) AS `month`\n");

					SET @fileter = ') AS a WHERE a.`month` ';

					CASE  
							WHEN @a2 = '1' THEN
									SET	i = @a2 ,
											@fileter = CONCAT_WS('= ',@fileter,@a2);
							WHEN @a2 REGEXP '全' THEN
									SET	i = 1 ,@a2 =12,@fileter = CONCAT_WS('<= ',@fileter,@a2);
						ELSE 	SET	@stmtbody = CONCAT_WS('',@stmtbody,'\nUNION All\n' , @sb_mo,"\t\tAND b.a2 < " ,@a2
													,'\nUNION All\n' ,@sb_mob),
											i = @a2,@fileter = CONCAT_WS('= ',@fileter,@a2);
 					END CASE;

					l1:LOOP 
					SET	@stmtbody = CONCAT_WS('',@stmtbody,'\nUNION All\n' , @sb_mo,"\t\tAND b.a2 = " ,i,'\nUNION All\n' ,@sb_moe),
							i = i + 1 ;
						IF i > @a2 THEN 
								SET @stmtbody = CONCAT_WS('\n','SELECT a.* FROM(',@stmtbody,@fileter);
								LEAVE l1;
						END IF;
					END LOOP;

				IF funcid = '4' THEN
					SET @stmtbody = CONCAT_WS('',@stmtbody," AND  a.missionId IS NULL");
				END IF;

-- 				SET @bca := 0.00,@bda = 0.00,@ca =0.00, @da =0.00,@mo = 0;

-- SELECT @stmtbody;
				PREPARE accslgl_stmt from  @stmtbody;	EXECUTE accslgl_stmt ;DEALLOCATE PREPARE accslgl_stmt ; LEAVE accslgl;

			END;

			WHEN	funcid = '7' THEN
				BEGIN
					DECLARE `i` VARCHAR(5) DEFAULT NULL;

					SET i =IF(IFNULL(j0(`p` ,"expid"),'') = '',NULL,1);

	 				SET @stmtbody = r5(R4('jjywlb-repair'),j0("keyword",`p`));
	 				PREPARE stmt from  @stmtbody; EXECUTE stmt ;

					SET  `p` = @stmtbody;
					

					SELECT  @stmtbody :=CONCAT_WS(',','序号10,日期15,业务摘要40,文件附件20',CONCAT(IF(i ='','操作','状态'),16)) AS tmp,
									@stmtbody := CONCAT('','{',REGEXP_replace(@stmtbody,'(?m)(?<=,|^)(.*?)(\\d+)','"\\1":"\\2"'),'}') AS f;		
          SET  @stmtbody =  r6(R4(CONCAT_WS('','jjywlb',IF(i IS NOT NULL,'stu',''))),`p`);

				END;
			WHEN  funcid = '6' THEN 
				SET @stmtbody = CONCAT_WS('',	"SELECT a.b1 \nFROM acc_standard_n AS a\nWHERE a.missionId = 'qianxue-15123115081130306' AND preg_rlike('/:|：|合计|总计/',a.b1) =0 ");
			WHEN  funcid = '10' THEN 

					BEGIN
							DECLARE `p2` BLOB DEFAULT j0(`p`,'p2');
							DECLARE `SQL` VARCHAR(20) DEFAULT j0(`p2`,'sql');
							IF p2 IS NULL OR  ((@enter := j0(p2,'enter') )OR (@courseNO := j0(p2,'courseNO')))  IS NULL THEN CALL Error("no p2 OR (enter OR courseNO)");END IF;

						CASE 
									WHEN IFNULL(`SQL`,'') = '' OR `SQL` REGEXP '(?i)select'  THEN 
											IF IFNULL(@enter,"") <> '' THEN
															SET @stmtbody = CONCAT_WS('\t',R4("qyxx-1"),QUOTE(@enter));
												ELSE  SET @stmtbody = CONCAT_WS('\t',R4("qyxx-2"),QUOTE(@courseNO));

											END IF;

									WHEN `SQL` REGEXP 'update' THEN 
												SET	@stmtbody := CONCAT_WS(',',jj(p2 ,'billid'),jj(p2 ,'option'),jj(p2,'people'),j0(`p`,'p1')),
														@stmtbody := REGEXP_replace(@stmtbody,r('`kv`'),'\\1,\\4'),
														@stmtbody := CONCAT_WS('\n',"UPDATE acc_enter AS a ","SET a.dblob = ",CONCAT_WS('','column_create(',@stmtbody,')'),
																				CONCAT("WHERE a.enter = ",QUOTE(@enter)));
							ELSE CALL Error(" Error");
						END CASE;
					END ;
			WHEN  funcid = '11' THEN
				BEGIN 

				SELECT NULL INTO  @b11_body FROM information_schema.`TABLES` AS a WHERE a.TABLE_SCHEMA = DATABASE() AND a.TABLE_NAME = 'period';

				IF FOUND_ROWS() = 0 THEN SET @b11_body = r4('createperiod');EXECUTE IMMEDIATE @b11_body ;END IF;

				EXECUTE IMMEDIATE "SELECT a.period INTO @b11_body FROM period AS a LIMIT 1";


				IF FOUND_ROWS() = 0 THEN
					SET @b11_body = r5(r4('scperiod'),`p`);
-- sELECT 'ok',@b11_body;
					EXECUTE IMMEDIATE @b11_body;
				END IF;

				LEAVE accslgl;

				END;
		else SELECT CONCAT("SOMEthing wrong, OR NO funcid ON ",QUOTE(`funcid`));
	END case;

  CASE WHEN  CHARSET(@stmtbody) = 'binary' THEN SET @stmtbody = CONVERT(@stmtbody USING gbk);
			 WHEN CAST(@stmtbody AS CHAR ) IS NULL THEN SET @stmtbody = CONVERT(@stmtbody USING gbk);
			ELSE SET @stmtbody = @stmtbody;
	END CASE;
-- SELECT @stmtbody; LEAVE accslgl;
	PREPARE accslgl_stmt from  @stmtbody;	EXECUTE accslgl_stmt ;	DEALLOCATE PREPARE accslgl_stmt ;

END accslgl
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Audit`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Audit`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Audit`(IN `NAME_` longtext,IN `Summary` longtext,IN `statu` longtext,IN `key_names` longtext,IN `key_values` longtext,IN `field_names` longtext,IN `field_values` longtext,in `rowids` longtext)
Auditlavel:BEGIN
	SET @vaule = NULL,

		@vaule = CONCAT("INSERT INTO plogs(Summary,statu,expid,missionid
							,a_t,key_names,key_values,field_names,field_values,rowids,Function_Name)
										VALUES(",QUOTE(Summary),',',QUOTE(statu),
										',',QUOTE(Fetch_Set(key_values,1,'\'')),
										',',QUOTE(Fetch_Set(key_values,2,'\'')),
										',',QUOTE(rowids),
										',',QUOTE(key_names),
										',',QUOTE(key_values),
										',',QUOTE(field_names),
										',',QUOTE(field_values),
										',',QUOTE(rowids),
										',',QUOTE(NAME_),")");
-- SELECT @vaule ;LEAVE Auditlavel;

PREPARE stmt FROM @vaule ;
EXECUTE stmt ;
DEALLOCATE PREPARE stmt;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Audit_1`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Audit_1`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Audit_1`(IN `NAME_` varchar(80),IN `Summary` longtext,IN `statu` longtext)
Auditlavel:BEGIN

-- start TRANSACTION ;
	SET @vaule = NULL,

		@vaule = CONCAT("INSERT INTO plogs(Function_Name,Summary,statu)
										VALUES(",QUOTE(NAME_),",",QUOTE(Summary),",",QUOTE(statu),")");--
--  SELECT @vaule ;LEAVE Auditlavel;

PREPARE stmt FROM @vaule ;
EXECUTE stmt ;
DEALLOCATE PREPARE stmt;
-- COMMIT;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Audit_2`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Audit_2`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Audit_2`(IN `NAME_` varchar(80),IN `Summary` longtext,INout `dblob` longblob)
Auditlavel:BEGIN

-- start TRANSACTION ;
	SET @vaule = NULL,
	 		@DBLOB =DBLOB,

		@vaule = CONCAT("INSERT INTO plogs(Function_Name,Summary,parameters)
										VALUES(",QUOTE(NAME_),",",if(`Summary` IS NULL AND dblob IS NOT NULL,QUOTE(dblob),QUOTE(Summary)),",?)");--
-- SELECT @vaule ;LEAVE Auditlavel;
PREPARE stmt FROM @vaule ;
EXECUTE stmt USING @DBLOB;
DEALLOCATE PREPARE stmt;
-- COMMIT;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Audit_3`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Audit_3`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Audit_3`(IN `p` longblob)
`l`:BEGIN	DECLARE err BLOB DEFAULT NULL/**/ ;DECLARE eno INT DEFAULT 0;

 -- INSERT INTO plogs (Function_Name,parameter) VALUES ('audio_3',CAST(IF(COLUMN_CHECK(p) ,COLUMN_json(p),p)as char));COMMIT;
 
 -- SELECT CONCAT_WS('','INTO plogs (Function_Name,parameter) VALUES (',REGEXP_replace(CAST(JSON_EXTRACT(IF(COLUMN_CHECK(p) ,COLUMN_json(p),p),'$.*') AS char),'^\\[|]$',''),')');

	IF JSON_VALID(p) THEN  	SET @am = CONCAT_WS('','set @am = COLUMN_create(',REGEXP_replace(p,'(?s).*?("(?3)"):("((?:\\\\.|[^"])+)")(?:(,)|})','\\1,\\2\\4'),')'); EXECUTE IMMEDIATE @am; SET p = @am;  END IF ;

	START TRANSACTION;
	IF ! COLUMN_check(p) THEN INSERT INTO	plogs(Function_Name,summary,parameter)VALUE('`l`','',`p`); END IF;
   -- json_value(COLUMN_get(@A,'err' AS CHAR),'$.errno');
	SET err = CONVERT(REPLACE(column_get(p,'err'AS BINARY),'\\','`')USING ascii),@am = NULL;
	SET @am = CONCAT_WS('   ',COLUMN_get(p,'m' AS CHAR )
							,IF(IFNULL(column_get(`p`,'l' AS CHAR),'') = '' ,NULL,CONCAT_WS(': ','Level',column_get(`p`,'l' AS CHAR)))),
			@aparameter =column_get(p,'pp' AS CHAR ),
			@`summ` := column_get(p,'summ' AS CHAR ),
			@`summ` =IF(IFNULL(err,'') = '' AND IFNULL(@`summ`,'') = '','记录参数',CONCAT_WS(',',@`summ`,CONCAT_WS(' - ',json_value(err,'$.errno'),json_value(err,'$.text')))),
			@`SQL` = NULLIF(COLUMN_get(p,'SQL'AS CHAR),'');
IF IF(COLUMN_EXISTS(p,'记录'),COLUMN_get(p,'记录'AS INT),1) THEN 
	UPDATE plogs AS a SET 			a.number = IFNULL(a.number,0) +1, a.summary = @`summ`,		a.parameter = @`aparameter`,a.`sql`=@`SQL`,a.dblob = COLUMN_get(p ,'dblob' AS BINARY )
	WHERE a.Function_Name = @am AND a.`function_name` = @am AND IF(IFNULL(column_get(`p`,'l' AS CHAR),'') = '' ,1, a.parameter = @`aparameter`);
 
	IF ROW_COUNT() = 0 THEN 				
		INSERT INTO	plogs(Function_Name,summary,parameter,`SQL`,number,dblob) VALUE(@`am`,@`summ`,@aparameter,@`SQL`,1,COLUMN_get(p ,'dblob' AS BINARY ));
	END IF;	
END if;
	SET @am = NULL, @`aparameter` = NULL , @`summ` = NULL;

	COMMIT;

	IF IFNULL(err,'') <> '' AND !IFNULL(column_get(p,'继续执行' AS CHAR),'0')=1 THEN 
			SET  eno =  json_value(err,'$.errno'),
					err= IFNULL(CONCAT(SUBSTR(json_value(err,'$.text'),1,120),' ...'),'');
SELECT err;COMMIT;
			SIGNAL SQLSTATE 'HY000' SET MYSQL_ERRNO =eno , MESSAGE_TEXT = err;
	END IF;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `b`
-- ----------------------------
DROP PROCEDURE IF EXISTS `b`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `b`(b longblob)
    MODIFIES SQL DATA
    DETERMINISTIC
bl:BEGIN
	#Routine body goes here...

	DECLARE p2 VARCHAR(2000) DEFAULT j0(b,'p2');
/*
start TRANSACTION;
SET @DBLOB = b;
CALL Audit_2('b',quotej(b),@dblob );COMMIT;
LEAVE bl;*/
	IF IFNULL(p2,'') = '' THEN LEAVE bl;END IF;
	BEGIN

		DECLARE `funid` VARCHAR(1) DEFAULT NULL ;
		DECLARE `billid` VARCHAR(30) DEFAULT NULL ;
 
		SET `funid` = j0(p2,'funid'), `billid` = j0(p2,'billid');
	CASE
			WHEN `funid` = 1 THEN 

			SET	@excl = NULL;
			SELECT a.excl INTO @excl FROM `mysq1_schema`.bill_list AS a WHERE a.billId = `billId` AND a.excl IS NOT NULL;	
 			IF @excl IS  NULL THEN   CALL error('excl is null');LEAVE bl; END IF;

			IF IFNULL(@stmt1 :=COLUMN_get(@excl,'REPAIR' AS CHAR ),'') <> '' THEN 
					SET  @stmt1 = r5(@stmt1,QUOTE(CONCAT('"p2"',':{',p2,'}')));

					PREPARE stmt2 FROM @stmt1;	EXECUTE stmt2;
				SET `p2` = @stmt1;
			END IF;

			BEGIN

				DECLARE `field` VARCHAR(2000) DEFAULT REPLACE(column_get(@excl,'field' AS CHAR),'`','');
				DECLARE `kfield` VARCHAR(2000) DEFAULT column_get(@excl,'kfield' AS CHAR);
				DECLARE `dfield` VARCHAR(2000) DEFAULT NULL;

				DECLARE `number` VARCHAR(5) DEFAULT Eltm(0,`field`);
				DECLARE `kn` VARCHAR(5) DEFAULT eltm(0,`kfield`);
				DECLARE `dn` VARCHAR(5) DEFAULT NULL;

				DECLARE `WHERE` VARCHAR(2000) DEFAULT CONCAT_WS(' AND ',CONCAT('a.',Fetch_Elt(1,`kfield`),' = ',quotd(j5(p2,Fetch_Elt(1,`kfield`)))),									CONCAT('a.',Fetch_Elt(2,`kfield`),' = ',quotd(j5(p2,Fetch_Elt(2,`kfield`)))),									CONCAT('a.',Fetch_Elt(3,`kfield`),' = ',quotd(j5(p2,Fetch_Elt(3,`kfield`)))));
				DECLARE `v4k` VARCHAR(2000) DEFAULT Eltm(`kn`,CONCAT_WS(',',quotn(j0(p2,Fetch_Elt(1,`kfield`))),quotn(j0(p2,Fetch_Elt(2,`kfield`))),quotn(j0(p2,Fetch_Elt(3,`kfield`)))));


 				IF `WHERE` ='' OR  IFNULL(`billid`,'') = '' THEN CALL error('no key or billid'); END IF;

 					SET @stmt2 = COLUMN_get(@excl,'del' AS CHAR);

					IF @stmt2 REGEXP '(?is)\\bwhere\\s+.+' THEN
							SET	@stmt2 = r5(@stmt2,`p2`);
						ELSE
							SET	@stmt2 = CONCAT_WS('\n',@stmt2,CONCAT('where ',`where`));
					END IF;

					IF @stmt2 REGEXP '(?is)\\bwhere\\s+.+' THEN

							PREPARE stmt2 FROM @stmt2;EXECUTE stmt2; 
						ELSE CALL error('del no where');
					END IF;


					SET @stmt2 = REPLACE(jen(b,"p1"),'\t',',');


					SET `dfield` = REGEXP_substr(@stmt2,r('aline'));
					CASE 
						WHEN `number` > Eltm(0,`dfield`)+`kn` THEN
							 SET	`field` = eltm(Eltm(0,`dfield`)+`kn`,`field`),
										`number` = Eltm(0,`dfield`)+`kn`,
										`dfield` = NULL ;
						WHEN `number` < Eltm(0,`dfield`)+`kn` THEN
							 SET	`dfield` = eltm(kn-number+1,`dfield`);
						ELSE SET `dfield` = NULL;
					END CASE;

					SET `dn`=`number`-`kn`-1;


					SET @r = CONCAT_WS('\n'
,CONCAT_WS('\t','^[^\\n]+[\\n\\r]')
,CONCAT_WS('\t','(?m)(,|^)([^\\n\\r,"\\\']*)(?=,|\\n|\\r|$)','\\1"\\2"')
,IF(`dfield` IS NULL,'',CONCAT_WS('\n'
	,CONCAT_WS('\t',
		CONCAT_WS('','(?m)^((?:(?:(?:"(?:\\\\.|[^"])*")|(?:\'(?:\\\\.|[^\'])*\'))?(?:[,\\n\\r]|$)){',`dn`,'})'),
		CONCAT_WS('','\\1column_create(@i:=0,',QUOTE(`dfield`),','))
 	,CONCAT_WS('\t','(?im)(?<![10])((,)(?:(?:"((?:\\\\.|[^"])*)")|(?:\'((?:\\\\.|[^\'])*)\')?))(?=(?1)*(?=\\ns|$))','\\2@i:=@i+1,"\\3\\4"')
))
,CONCAT_WS('\t','replace','""','null')
,CONCAT_WS('\t','(((?:"(?:\\\\.|[^"])*")|(?:\'(?:\\\\.|[^\'])*\')|(?:[^,\\n\\r]*))(?:,(?2))*?)([\\n\\r]+)',CONCAT_WS('','\\1',IF(`dfield` IS NULL,' ',')'),'UNION \\3SELECT ',`v4k`,','))
/**/
),
--  					@stmt2 = f2(@r,@stmt2);
				@stmt2 =	CONCAT('SELECT ',`v4k`,',',f2(@r,@stmt2),IF(dfield IS NULL,' ',')'));

				SET @stmt2 :=	CONCAT_WS(' UNION\n',CONCAT_WS('\t','SELECT',REGEXP_replace(`field`,r('4elt2'),'NULL AS \\1\\2')),@stmt2),
						@stmt2 = CONCAT_WS('','SELECT a.* FROM (\n',@stmt2,'\n)AS a WHERE ',`WHERE`);
/**/

-- SELECT @stmt2;LEAVE bl;
				CASE
						WHEN IFNULL((@a := COLUMN_get(@excl,'inss' AS CHAR)),'') <> ''THEN
							DROP TABLE IF EXISTS pza;
							SET @stmt2 = CONCAT_WS('\n',"CREATE TABLE pza as" ,@stmt2);

							PREPARE stmt2 FROM @stmt2;					EXECUTE stmt2;

							SET @stmt2 = 'pza';
							BEGIN
										DECLARE `i` VARCHAR(5) DEFAULT 1;
										SET @inss = COLUMN_get(@excl,'inss' AS BINARY);
										l:LOOP 

											SET @stmt1 = REGEXP_REPLACE(COLUMN_get(@inss,i AS CHAR),'(?-i)(?<=\\t)a(?=\\taS\\ta)', IF(@stmt2 REGEXP '^\\w+$',@stmt2,CONCAT('(',@stmt2,')')));

											IF @stmt1 IS NULL THEN LEAVE l;END IF;

											IF @stmt1 REGEXP '^\t\t' THEN 
												SET @stmt1 = r5(@stmt1,p2);
											END IF;		

 -- IF i = 3 THEN SELECT p2 , COLUMN_get(@inss,i AS CHAR),c(@stmt1);LEAVE bl; END IF;
											PREPARE stmt2 FROM @stmt1;					EXECUTE stmt2; 

											SET i:=i+1;
										END LOOP;
							END;

					WHEN IFNULL((@a := COLUMN_get(@excl,'ins' AS CHAR)),'') <> '' THEN

							SET @stmt2 = CONCAT_WS('',@a,`field`,")\n",@stmt2);

							PREPARE stmt2 FROM @stmt2;					EXECUTE stmt2; 	

					ELSE CALL error('no ins s ');LEAVE bl;
				END CASE;

				BEGIN
					DECLARE `i` VARCHAR(5) DEFAULT 1;
					SET @afinss = COLUMN_get(@excl,'afinss' AS BINARY);

					IF @afinss IS NULL THEN LEAVE bl;END IF;

					afl:LOOP 
						SET @stmt1 = COLUMN_get(@afinss,i AS CHAR);
							IF @stmt1 IS NULL THEN LEAVE afl;END IF;
-- SELECT @stmt1,c(@afinss);-- LEAVE bl;
							PREPARE stmt2 FROM @stmt1;					EXECUTE stmt2; 
							SET i:=i+1;
					END LOOP;

				END;

			END;
		ELSE SELECT NULL;
	END CASE;
-- SELECT @stmt2;LEAVE bl;
-- LEAVE bl;
-- 	DEALLOCATE PREPARE stmt2;
				END;	
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `b2`
-- ----------------------------
DROP PROCEDURE IF EXISTS `b2`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `b2`(b longblob)
    MODIFIES SQL DATA
    DETERMINISTIC
bl:BEGIN
	#Routine body goes here...

	DECLARE p2 VARCHAR(2000) DEFAULT j0(b,'p2');
/*
start TRANSACTION;
SET @DBLOB = b;
CALL Audit_2('b2',quotej(b),@dblob );COMMIT;
LEAVE bl;*/

SELECT 

@k := 't_flow_question_task' AS `keywod`
,@r0 := COLUMN_create(1,column_create(1, CONCAT('(?ims)(^',@rhead,@k,'\\(.*?(?<=values\\()',r('4elt5'),'(?:,(?&f))*\\).*?</sql>[\\n\\r]+)|.'),2,'\\1')) AS `REG0`
,@a0 :=f(@r0,@a) AS `抓数据`
,@a0 
,@f :=CONCAT_WS('',REGEXP_substr(@a0,'^.+?\\(\\K(.+?)(?=\\)valu)'),'')AS `oFIELDs`,@r1 :=  NULL
 -- COLUMN_create(1,@r11 := COLUMN_create(1,CONCAT('(?m)((?:',r('4elt'), ',){3})((?:(?&f),){11})((?:(?&f),){4})(.*?(?=[\\r\\n]+|$))'),2,CONCAT('\\1\\4\\3\\5'))) 
AS r1 ,@f := f(@r1,@f)AS `2FIELDS` 
,CONCAT('(?m)((?:',r('4elt'), ',){3})((?:(?&f),){11})((?:(?&f),){4})(.*?(?=[\\r\\n]+|$))')
,@`ttable` := '' ,@`tfields` := IF(IFNULL(@`ttable`,'') ='', @f,CONCAT(
'' -- 'missionId,missionLabel,mission_ask,need_input_a,need_input_b,need_seal,is_line'
,',dblob')) as tfields
,@n := Eltm(0,@`tfields`) AS `tn`,@sn := Eltm(0,@`f`) AS `sn`,@dn := IF(@n = @sn,NULL,@sn - @n+1) AS `dn`,@`dfield` := IF(@`dn` IS NULL ,NULL,Eltm(-@n+1,@f)) AS `dfields`
,CONCAT('(?i)(?:[^\'"\\r\\n]+values\\((?=[\'"]))|(?:\\s*\\]\\]></sql>)')
,@r := COLUMN_create(
1,COLUMN_create(1,CONCAT_WS('','(?i)(?:[^\'"\\r\\n]+values\\((?=[\'"]))|(?:',IF(@`dn` IS NULL,@`dn`,'\\('),'\\s*\\]\\]></sql>)')) 
 
,20,COLUMN_create( 1,CONCAT('(?ism)',r('4elt3'),'((?:,(?&f)){',@dn,'}\\))([\\n\\r]*)'),2,CONCAT('\\1,column_create(@i:=0,',QUOTE(@`dfield`),'\\2\\3'))
,30,COLUMN_create(1,CONCAT(r('4elt5'),'(?=(?:\,(?&f)){0,',@dn-1,'}\\))'),2,'@i:=@i+1,\\3\\1')
/*,50,COLUMN_create(1,"'\\s*'",2,'null')-- 賦值 NULL
-- ,6,COLUMN_create(1,CONCAT('(?m)^',r('4elt')),2,"concat(\\1,' 1')")
,70,COLUMN_create(1,CONCAT('([\\n\\r]+(?!$))',r('4elt5')),2,'union\\1select \\2')*/
) REG
,@a2 := f(@r,@a0) AS result
-- 生成sql
,CONCAT_WS(';\n',CONCAT_WS('\n'  ,IF(IFNULL(@`ttable`,'') <> '', CONCAT_WS(' ',"REPLACE INTO",@`ttable`,"(",@`tfields`,")"), IF((SELECT  a.TABLE_SCHEMA FROM information_schema.`TABLES` AS a WHERE a.TABLE_SCHEMA = DATABASE() AND a.TABLE_NAME = @k) IS NULL  ,CONCAT_WS(' ',"CREATE TABLE",@k,'AS') 	,CONCAT_WS(' ',"REPLACE INTO",@k,CONCAT('(',@`tfields`,')')))),"SELECT a.* FROM(SELECT a.* FROM(",CONCAT_WS(' ',"SELECT	",REGEXP_REPLACE(@`tfields`,CONCAT(r('4elt3'),'(?=,|$)'),'NULL AS \\1'),"UNION" )  ,CONCAT("SELECT	",@a2)  ,CONCAT_WS(' ',") AS a WHERE" ,CONCAT("a.",Eltm(1,@`tfields`)),"IS NOT NULL) AS a"))) AS `SQL`

;

-- PREPARE stmt2 FROM @stmt1;					EXECUTE stmt2; 
	
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `b2j`
-- ----------------------------
DROP FUNCTION IF EXISTS `b2j`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `b2j`(`d` mediumtext) RETURNS mediumtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	DECLARE `r` VARCHAR(500) DEFAULT CONCAT('(?:(?<=^)(?:("(?:\\\\.|[^"])+"):("(?:\\\\.|[^"])*"),?\\s?))');
	DECLARE `c` VARCHAR(500) DEFAULT NULL;
	DECLARE `l` VARCHAR(10) DEFAULT 1;
	DECLARE `k` VARCHAR(100) DEFAULT NULL;
	DECLARE `one` BLOB DEFAULT NULL;

	IF 	IFNULL(`d`,'') = '' THEN RETURN NULL; END IF;

	SET @d = NULL,@c = NULL,@`one` = NULL;

	OrLa1:LOOP
			SET `c`  = NULL, `c`  = REGEXP_SUBSTR(d,'(?<=^)"\\w+"(?=:")');
			IF IFNULL(`c` ,'') ='' THEN LEAVE OrLa1;END IF;
		
			SET `one` = IF(`one` IS NOT NULL ,COLUMN_add(`one`,REGEXP_substr(`c`,'\\w+'),""),COLUMN_create(REGEXP_substr(`c`,'\\w+'),"")),
					@d = CONCAT_WS('\n',@d,REGEXP_replace(d,CONCAT('(',`c` ,':"(?:\\\\.|[^"])*",?)|(?:"\\w+":"(?:\\\\.|[^"])*",?)'),'\\1')),
					d = REGEXP_replace(d,CONCAT('(',`c` ,':"(?:\\\\.|[^"])*",?)'),'');

	END LOOP;


	SET d = NULL;

	OrLa2:LOOP

			SET @`c`  = NULL, @`c`  = REGEXP_replace(@d,'(?<=^|\\s)("\\w+":"(?:\\\\.|[^"])*",?)|(?:"\\w+":"(?:\\\\.|[^"])*",?)','\\1');

			IF IFNULL(@`c` ,'') ='' THEN LEAVE OrLa2;END IF;

			SET @`one` = `one`,
					@`d`  = REGEXP_replace(@d,'(?<=^|\\s)("\\w+":"(?:\\\\.|[^"])*",?\\s?)','');
			
/*IF `l` =2 THEN
RETURN  @`d`;		
END IF;*/
			OrLa3:LOOP
				SET `k`	= REGEXP_substr(@`c`,`r`); 

				IF IFNULL(k,'') = '' THEN LEAVE OrLa3; END IF;

				SET @`c` = REGEXP_replace(@`c`,`r`,''),@`v` = NULL,@`v` = UnQ(REGEXP_replace(`k`,`r`,'\\2'));

				IF @`v` = '' THEN  ITERATE OrLa3;END IF;

				SET @`one` = COLUMN_add(@`one`,UnQ(REGEXP_replace(`k`,`r`,'\\1')),@`v`);

			END LOOP;

			SET `d` = CONCAT_WS(',',`d`,CONCAT(quotd(`l`),':',COLUMN_json(@`one`))),
					`l` = `l`+1;

	END LOOP;
	

	RETURN CONCAT('{',`d`,'}');

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `b2jr`
-- ----------------------------
DROP FUNCTION IF EXISTS `b2jr`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `b2jr`(`d` mediumblob) RETURNS mediumtext CHARSET utf8mb3
    NO SQL
BEGIN
	#Routine body goes here...
	DECLARE `r0` VARCHAR(500) DEFAULT '(?iJx)(?<k1>"\\w+")(:"(?:\\\\.|[^"])*")';
	DECLARE `r` VARCHAR(500) DEFAULT '(?:^,)?(?:((?iJx),?"b1":"(?:\\\\.|[^"])*")|((?:,?"\\w+")(?::"(?:\\\\.|[^"])*")))(?:,$)?';
	DECLARE `count` VARCHAR(5) DEFAULT 1;
	DECLARE `c0` VARCHAR(5) DEFAULT NULL;
	DECLARE `res`	mediumtext DEFAULT NULL;
	DECLARE `res0`mediumtext DEFAULT NULL;
	DECLARE `res1`mediumtext DEFAULT NULL;


	CASE	
		WHEN `d` IS NULL THEN RETURN NULL ;
		WHEN `d` = '' THEN RETURN '' ;
		WHEN `d` REGEXP '<div|name=[ab]' THEN
			SET `d` := c(filter1(REG2('`Dom2kw`'),`d`));
		WHEN `d` REGEXP '"b":{' THEN 
			SET `d` = j0(`d`,'b');
			
		ELSE SET @ok = 'ok';
	END CASE;


-- RETURN r;
	label:LOOP
				SET `res0` = REGEXP_substr(`d`,`r0`);

				IF `res0` = '' THEN LEAVE label;END IF;

				SET	`r` =  CONCAT(REGEXP_replace(`res0`,`r0`,'\\1')),
						`r` =  CONCAT('(?:^,)?(?:((?iJx),?',`r`,':"(?:\\\\.|[^"])*")|((?:,?"\\w+")(?::"(?:\\\\.|[^"])*")))(?:,$)?'),
						`res` = CONCAT_WS(',',`res`,filter1(CONCAT(`r`,'\t\\1'),`d`)),
						`d` = filter1(CONCAT(`r`,'\t\\2'),`d`)
;
-- IF `count` = 4 THEN RETURN `res` ; END  IF;
	
			SET	`count` = `count` + 1;

	END LOOP;

	RETURN `res`;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `b2r`
-- ----------------------------
DROP FUNCTION IF EXISTS `b2r`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `b2r`(`field_br` varchar(400),field_ varchar(5000)) RETURNS varchar(5000) CHARSET utf8mb3
    NO SQL
BEGIN
	#Routine body goes here...
-- CREATEtime 2012-12-30 
-- GBK/GB2312编码：[x80-xff>]+ 或 [xa1-xff]+
-- UTF-8编码：[x{4e00}-x{9fa5}]+/u 
-- blur FIELD translate to REGEXP
-- 
--  == TO |
	
		DECLARE result_ VARCHAR(200);
		DECLARE _frag VARCHAR(120);
		DECLARE _idf1 VARCHAR(6);
 		DECLARE _idf2 VARCHAR(6);
		DECLARE v1 VARCHAR(20);
		DECLARE v2 VARCHAR(20);
		DECLARE nece VARCHAR(500);




		CASE 
				WHEN  IFNULL(field_br,'') = '' THEN 
					IF IFNULL(field_br,'') = '' THEN
							CASE 
								 WHEN field_ REGEXP '^(0?[1-9]|1[0-2])$' THEN
									RETURN '^(0?[1-9]|1[0-2])$';
								 WHEN field_  REGEXP '^((0?[1-9])|((1|2)[0-9])|30|31)$' THEN
									RETURN  '^((0?[1-9])|((1|2)[0-9])|30|31)$';

								ELSE RETURN NULL;
							END CASE ;
					END IF;

				WHEN  SUBSTR(field_br,1,1) = '*' THEN
					RETURN '[[:alnum:]]' ;
			ELSE	SET field_br = TRIM(field_br);
		END CASE 	;	

		SET field_br = preg_replace('/(?=\\(|\\)|\\*)/','\\\\',field_br);

		SET result_ = '',
				_frag = '',
				_idf1 = '', _idf2 = '',
-- 	           				   
				nece ='==,||,&&,##￥,^^';

-- == ,||,  
-- &&,
		SET	field_br = REPLACE(field_br,'//','||'),
				field_br = TRIM(field_br),
				field_  = TRIM(field_), 
-- 				field_br = REPLACE(FIELD_br,'||====','===='),
				field_br = REPLACE(field_br,'====','^^');
-- 				field_br = REPLACE(field_br,'&&','.*');
				



		IF FIND_IN_SET(SUBSTR(field_br,1,2),nece)=0 THEN
				SET field_br = concat('??',field_br);
		END IF;

		SET field_br = replace(field_br,'??','||');
	-- RETURN  CONCAT_WS(' ','field_br:',field_br,'result_:',result_,' ','_frag:',_frag,' ','_idf1:',_idf1 ,' ','_idf2',_idf2,'@x',@x);

		CASE
				WHEN field_ IS  NULL THEN
					SET field_ = '^[[:space:]]*$';
				WHEN field_ REGEXP '^[[:space:]]*$'THEN
					SET field_ ='^[[:space:]]*$' ;
				ELSE 
					SET field_ = CONCAT('^',field_,'$');
		END CASE;

		REPEAT

			SET _idf1 = SUBSTR(field_br ,1,2),
					field_br = substr(field_br,3); 
 
			SET v1 = 0 ;

			label1: LOOP
					SET v1 = v1+1,
							_idf2 = substr(field_br,v1,2);

					CASE 
							WHEN _idf2 ='&&' THEN
								SET _frag = CONCAT(_frag,'.*'),
										v1 = v1 +1;
							WHEN FIND_IN_SET(_idf2,nece) THEN
								 SET v1 = v1-1;	
								 leave label1;
							WHEN v1 >length(field_br) THEN 

									LEAVE label1;
							ELSE set _frag = CONCAT(_frag,SUBSTR(field_br,v1,1));
					END CASE;
			end loop label1;

			SET @X = FIND_IN_SET(_idf1,nece) ;

			CASE
					WHEN _frag != '' AND _idf1 = '==' THEN

							SET  _frag = CONCAT('^[[:space:]]*',_frag,'[[:space:]]*$'),
										result_ = CONCAT(result_,'|',_frag);

					WHEN  _frag !='' AND _idf1 = '||' THEN  
							SET result_ =CONCAT(result_,'|',_frag);

					WHEN _frag =''  AND _idf1 = '^^' THEN 
							SET result_ = CONCAT(result_,'|','^[[:space:]]*$'); 
					WHEN _frag !=''  AND _idf1 = '^^' THEN 
							SET result_ = CONCAT(result_,'|','^',_frag ,'*$'); 
					WHEN _frag !=  ''  AND _idf1 = '&&' THEN
							SET result_ = CONCAT(result_,'|',_frag);
					ELSE SET  _idf2 = '';

			END CASE ;
-- rETURN  CONCAT_WS(',',field_br,'result_:',result_,' ','_frag:',_frag,' ','_idf1:',_idf1 ,' ','_idf2',_idf2);
			SET _frag ='',
					field_br = substr(field_br,v1+1);

		UNTIL field_br = ''	
		END REPEAT ;

-- 	RETURN  result_;

 		IF result_ REGEXP '^\\|'  THEN
			SET result_ = SUBSTR(result_,2);
		END IF;
		SET result_ = replace(replace(result_,'||','|'),'.*.*','.*');
		SET result_ = replace(result_,'(|','(');
		SET result_ = PREG_REPLACE('/\\|$/','',result_) ;
	RETURN  result_;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `busy`
-- ----------------------------
DROP PROCEDURE IF EXISTS `busy`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `busy`(IN `p` varchar(200))
busyl:BEGIN
	#Routine body goes here...
/*
其他按照 视图 数据库字段 
expid,coursno,node_no,contentno , seacher{}
功能 id
	7 经济业务 
'{"id":"7","classNo":"EXP17032712533136485","contentNo":"","courseNo":"business-1","expId":"17051813230548093327","searchs":"","stuNo":"s01","limit":"0,20"}'
*/
	DECLARE `id` VARCHAR(5) DEFAULT  j0(p,'id');
	DECLARE expId VARCHAR(60) DEFAULT j3(p,"expId");

  DECLARE CONTINUE HANDLER FOR  SQLSTATE '23000', SQLSTATE	'42000'	, SQLSTATE	'42S22'
	BEGIN GET DIAGNOSTICS CONDITION 1 @`sqlstate` = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;SET  @`sqlstate` = JSON_OBJECT('sqlstate',@`sqlstate`,'errno',@errno,'text',@text);
			 	SET @funcid := `id`;-- @funcid = (SELECT CONCAT_WS(', ',a.note,CONCAT_WS('',UPPER(SUBSTR(a.`name`,1,1)),LOWER(substr(a.`name`,2))),a.id) FROM mysq1_schema.qs AS a WHERE a.`name` = `funcid`);
				CALL `Audit_3`(COLUMN_create('m',CONCAT_WS(' ','Error: ',@funcid, ' busy' ),'err',@`sqlstate`,'SQL',@`p1_body`,'pp',QUOTE(`p`)));
	END;

/*
start TRANSACTION;
SET @DBLOB = p;
CALL Audit_2('busy',quotej(p),@dblob );COMMIT;
LEAVE bl;*/

	SET @s1=NULL,@s2 = NULL,@s20 = NULL,@s3 = NULL,@s4 = NULL,
			@manu = NULL;


	CASE
		WHEN IFNULL(expid,'') <> '' OR `id` = 7 THEN 

			SET @s1 := r9('missionG') ,
					@s = CONVERT(R5(COLUMN_get(@s1,'isgroup'AS CHAR),p)USING gbk);

			EXECUTE IMMEDIATE @s;

			IF @s IS NOT NULL THEN


				SET @s = CONVERT(R5(COLUMN_get(@s1,'sql'AS CHAR),p)USING gbk);
-- SELECT @s;
			IF j0(p,'(?i)limit') <> '' THEN SET @s  = REGEXP_REPLACE(@s,'(?im)^"(\\d+\\s*(?:,\\s*\\d+)?)"','LIMIT \\1');END IF;

-- SELECT @s;LEAVE busyl;
				EXECUTE IMMEDIATE @s;LEAVE busyl;
			END IF;

			BEGIN
				DECLARE `classNo` VARCHAR(60) DEFAULT j3(p,'classNo');
				IF `classNo` IS NULL OR `expid` IS NULL THEN SELECT '7';LEAVE busyl; END IF;
				SET @s2 = 'exp_experimentclassstudent AS a\nINNER JOIN exp_experimentclass AS a0 ON a.classNo = a0.classNo\nINNER JOIN exp_experimentclass_course AS a1 ON a1.classNo = a0.classNo\nINNER JOIN exp_courses AS b0 ON a1.courseNo = b0.courseNo',
						@s20 = 'LEFT JOIN exp_cour_node_cont AS b20 ON b20.contentNo = b2.contentNo AND b20.typesort = b2.typesort AND b20.missionid = b2.missionid AND b20.classNo = a1.classNo AND b20.courseNo = a1.courseNo',
						@s3 = CONCAT_WS('\tAND\n',CONCAT('a.expNo = ',expId),CONCAT('a.classNo = ',`classNo`),'b20.classNo IS NULL'),
						@manu = 1;
			END;


		
	 ELSE  SET @s2='exp_courses AS b0';
	END case;

	BEGIN
		DECLARE s0 VARCHAR(1000) DEFAULT "CONCAT_WS('.',b1.node_No,b2.typesort) AS `CODE`,\nb2.typesort,\nIF(b2.title IS NOT NULL ,b2.title ,IFNULL(IF(b2.contentType = 'kj',b3.missionLabel,b4.title),'')) AS title,\nIF(b2.contentType = 'kj' AND FIND_IN_SET(b3.billId,'kjan_a-e,kjan_a-f,kjan_abcd,kjan_dtb,kjqt_kjfl00_kjfl'),'test',b2.contentType)  AS contentType";
		DECLARE s1 VARCHAR(1000) DEFAULT "b1.node_courseNo,\nb1.contentNo,\nb2.missionid,\nIF(b2.contentType = 'kj' AND FIND_IN_SET(b3.billId,'kjan_a-e,kjan_a-f,kjan_abcd,kjan_dtb,kjqt_kjfl00_kjfl'),'test',b2.contentType)  AS N,\nIF(b2.contentType = 'kj',b3.referencedId,b4.referencedID) AS referencedID,\nb4.fileID AS fileURL,\nb4.edit0_file1_url2,\nb4.url,\nb4.detail,\n'说明' AS file_detail,\nIF(b2.contentType = 'edit' AND b5.fileName IS NULL ,'wenzi.pdf', b5.fileName) AS fileName,\n@y := COLUMN_CREATE('excel',IF(b30.excel IS NULL,NULL,1),'ff',COLUMN_get(b30.Fmoney,'ff' AS CHAR),'CODE', IF(b0.img_url  = 'complex_main' AND B30.BILLID IN ('kjpz_jzpz00_ty(zd)'),1,NULL),'NOm',@manu) AS tmp1,\nCOLUMN_json(@y) AS dblob";
		DECLARE s2 VARCHAR(1000) DEFAULT "INNER JOIN exp_courses_node AS b1 ON b1.node_courseNo = b0.courseNo\nINNER JOIN exp_courses_node_content AS b2 ON b2.contentNo = b1.contentNo";
		DECLARE s20 VARCHAR(1000) DEFAULT "LEFT JOIN acc_mission AS b3 ON b2.contentType = 'kj' AND b2.missionid = b3.missionId\nLEFT JOIN  `mysq1_schema`.bill_list AS b30 ON b2.contentType = 'kj' AND b3.billid =  b30.billid\nLEFT JOIN exp_courseware_cells AS b4 ON b2.missionid = b4.unique_id\nLEFT JOIN mysq1_schema.media_library AS b5 ON b2.contentType = 'edit' AND b4.unique_id = b5.missionID";
    DECLARE s3 VARCHAR(1000) DEFAULT CONCAT_WS('\tAND\n',CONCAT('b1.node_courseNo = ',j3(p,'courseNo')),CONCAT('b1.contentNo = ',j3(p,"contentNo")),CONCAT('b2.contentType = ',j3(p,'contentType')));
		
		IF  IFNULL(j0(`p`,"backInfo"),'') = 'bk' THEN
				SET s20 = "LEFT JOIN acc_mission_back_information AS b25 ON b2.contentType = 'kj' AND b25.type = 'bk' AND b2.missionid = b25.missionid\nLEFT JOIN acc_mission AS b3 ON b2.contentType = 'kj' AND b2.missionid = b3.missionId OR b25.quoteid = b3.missionId\nLEFT JOIN  `mysq1_schema`.bill_list AS b30 ON b2.contentType = 'kj' AND b3.billid =  b30.billid\nLEFT JOIN exp_courseware_cells AS b4 ON b2.missionid = b4.unique_id\nLEFT JOIN mysq1_schema.media_library AS b5 ON b2.contentType = 'edit' AND b4.unique_id = b5.missionID",
             s0 = "CONCAT_WS('.',b1.node_No,b2.typesort) AS `CODE`,\n@sort := IF(b25.quoteid = b3.missionId,b25.sort,NULL)AS sort,\n CONCAT_WS('.',b2.typesort,@sort) AS typesort,\nIF(b25.quoteid = b3.missionId,b3.missionlabel,IF(b2.title IS NOT NULL ,b2.title ,IFNULL(IF(b2.contentType = 'kj',b3.missionLabel,b4.title),''))) AS title,\nIF(b2.contentType = 'kj' AND FIND_IN_SET(b3.billId,'kjan_a-e,kjan_a-f,kjan_abcd,kjan_dtb,kjqt_kjfl00_kjfl'),'test',IF(b25.quoteid = b3.missionId,'bk',b2.contentType))  AS contentType",
						@s4 ="ORDER BY CONCAT_WS('.',b1.node_No,b2.typesort,IF(b25.quoteid = b3.missionId,b25.sort,NULL))" ;

		END IF;

		SET @s = NULL,
				@s1 = CONCAT_WS(',',s0,s1) ;
		SET @s = CONCAT_WS('\n','SELECT',@s1,'FROM',@s2,s2,@s20,s20,'WHERE',CONCAT_WS('\tAND\n',s3,@s3),@s4,CONCAT('LIMIT ',j0(`P`,'LIMIT')));
-- SELECT s0,s3 ,c(@s); LEAVE busyl;
		PREPARE s FROM @s;		EXECUTE s ;		DEALLOCATE PREPARE s;
	END;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `c`
-- ----------------------------
DROP FUNCTION IF EXISTS `c`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `c`(`p` longblob) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN 	DECLARE `rs` LONGTEXT DEFAULT NULL;DECLARE `v` LONGTEXT DEFAULT null;DECLARE `i` INT(5) DEFAULT 0;
DECLARE r TINYTEXT DEFAULT '(?:[一-鿆]+\\s*)++';

RETURN p;
	`l`:LOOP

	IF `p` NOT REGEXP r OR i > 100 THEN LEAVE `l`;END IF;

	SET  	rs = CONCAT_WS('',rs,REGEXP_substr(p,CONCAT_WS('','(?ms)^.*?(?!',r,')'))),
				p = REGEXP_REPLACE(p,CONCAT_WS('','(?ms)^.*?(?!',r,')'),'');

	SET		v = REGEXP_substr(p,CONCAT_WS('','(?ms)^',r));


	SET 	v=CASE 
						WHEN CONVERT(v USING gbk) = v THEN CONVERT(v USING gbk)
						ELSE CONVERT(v USING utf8)
					END,
				p = REGEXP_replace(p,CONCAT_WS('','(?ms)^',r),'')

			;



	SET `rs` = CONCAT_WS('',`rs`,v);
RETURN rs;
SET i= i+1;
	END LOOP;
	

	RETURN CONCAT_WS('',rs,p);
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `cabc`
-- ----------------------------
DROP FUNCTION IF EXISTS `cabc`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `cabc`(`num` varchar(50)) RETURNS varchar(100) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN 
	declare  resu varchar(100);
	declare p varchar(10);

	if num is null or  num = ''  then 
		return 'xxxx';
	end if ;
	
	set resu ='' ,
		num =  concat(cast(num as char ), '.')  ;
	
	repeat 
	 	set p = substring_index( num , '.' , 1) , 
			resu =concat( resu, lpad( p , 4, '0')),
			p = concat( p , '.' ) ,
			num = substring( num,instr(num , '.' )+1 );
	
	until  instr( num , '.' ) <= 0 end repeat ;

	RETURN  resu   ;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `calcuscore`
-- ----------------------------
DROP FUNCTION IF EXISTS `calcuscore`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcuscore`(`classno` varchar(20),expno varchar(200)) RETURNS varchar(200) CHARSET utf8mb3
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
-- 121220100222901204618
/*
INSERT plogs( Function_Name,summary)
SELECT 'calcuscore',CONCAT_WS(',',QUOTE(`classno`),QUOTE(`expno`));
*/

			CASE 
				WHEN  IFNULL(expno,'') <> '' AND COLUMN_check(expno) THEN
						SET @classno = IFNULL(COLUMN_get(expno,'classno'AS CHAR),''),
								@keyword = IFNULL(COLUMN_get(expno,'keyword'AS CHAR),''),
								@expno = IFNULL(COLUMN_get(expno,'expno'AS CHAR),'');
						DROP TEMPORARY TABLE IF EXISTS cur1;

CREATE TEMPORARY TABLE cur1 AS
SELECT
a.expNo,
COUNT(e2.missionid) AS total,
Sum((@score := e.score)) AS score,
Sum(e.read_ans_size) AS read_ans_size,
Sum(e.mission_result) AS mission_result,
Sum(e.log_count) AS log_count,
Count(e.score) AS done,
Sum(@score BETWEEN 0 AND 59) AS bad,
Sum(@score BETWEEN 60 AND 79) AS good,
Sum(@score BETWEEN 80 AND 89) AS better,
Sum(@score BETWEEN 90 AND 200) AS perfect,
a.statu
FROM exp_experimentclassstudent as a
INNER JOIN exp_experimentclass AS b ON  a.classNo = b.classNo
LEFT JOIN exp_experimentclass_course AS b1 ON  b1.classNo = b.classNo
LEFT join mysq1_schema.exp_classstudent as c on a.studentNo = c.stuNo
LEFT join mysq1_schema.exp_class as d on c.classno = d.classNo
INNER JOIN exp_courses_node AS e1 ON e1.node_courseNo = b1.courseNo
INNER JOIN exp_courses_node_content AS e2 ON  e2.contentNo = e1.contentNo
INNER JOIN acc_mission as a3 ON e2.missionid = a3.missionId
LEFT JOIN exp_cour_node_cont AS a2 ON IF(@classno ='',1,a2.classNo = @classno) AND  a2.courseNo = b1.courseNo AND a2.missionid =  e2.missionid 
LEFT JOIN acc_1 AS e ON a.expNo = e.expID AND e.missionId = e2.missionid
where  IF(@classno ='',1,a.classNo = @classno)-- 'EXP17032712533136485'
AND  a.statu IS NOT NULL  
AND SUBDATE(NOW(),INTERVAL 1 MINUTE)>a.stamptime
AND a2.classNo IS NULL 
AND CASE 
when @keyword='' then 1
when CONCAT_WS('',d.classNo,d.className) REGEXP @keyword  then 1
when concat(c.stu_name,a.studentNo) REGEXP @keyword  then 1 
ELSE 0
end  
GROUP BY a.expno;

					UPDATE exp_experimentclassstudent as a 
					INNER JOIN cur1 as b	ON a.expNo = b.expNo																																						
								set 
										a.missionscore = ROUND(b.score / b.total,2) ,
										a.score1 = b.score,
										a.read_ans_size = b.read_ans_size,
										a.mission_result = b.mission_result,
										a.log_count = b.log_count,
										a.nodone = b.total - ifnull(b.done ,0) ,
										a.done = b.done,
										a.missionbad = b.bad ,
										a.missiongood = b.good,
										a.missionbetter = b.better,
										a.missionperfect = b.perfect,
										a.mission_result = b.total,
										a.statu = null 
					where a.expNo = b.expNo  ;


					DROP TEMPORARY TABLE IF EXISTS cur1;
					RETURN FOUND_ROWS();



							
				WHEN  classno IS NOT NULL THEN 
							SET @classno = classno, @expno = '';

				WHEN  expno IS NOT NULL THEN

							set @expno = expno ,@statu = NULL;
							
							SELECT  
										a.classno ,a.statu into @classno,@statu
							FROM exp_experimentclassstudent AS a 
							WHERE  a.expno = @expno;
							if @statu IS NULL OR @classno IS NULL then 
								 RETURN concat('1-','operration cancel,','Deal---Exp',IFNULL(expno, 'null'),'-ClassNo:',IFNULL(@classno,'NULL'));
							end if ;

				ELSE 
							set  	@classno = '' ,
										@expno = '';
							

		end case ;
-- filter
							SELECT  
										a.classno into @x
							FROM exp_experimentclassstudent AS a 
							WHERE a.statu is not NULL  AND 
										instr(a.expno , @expno)AND 
										instr(a.classno , @classno)
							LIMIT 1;
		if FOUND_ROWS() = 0 then 
				return concat('2-','operration cancel,','Deal---Exp',IFNULL(expno, 'null'),'-ClaNo:',IFNULL(@classno,'NULL'));
		end if ;
RETURN @classno;
-- calcu  score 
DROP TEMPORARY TABLE IF EXISTS cur1;
CREATE TEMPORARY TABLE cur1
AS
SELECT
a.expNo,
COUNT(e2.missionid) AS total,
Sum((@score := e.score)) AS score,
Sum(e.read_ans_size) AS read_ans_size,
Sum(e.mission_result) AS mission_result,
Sum(e.log_count) AS log_count,
Count(e.score) AS done,
Sum(@score BETWEEN 0 AND 59) AS bad,
Sum(@score BETWEEN 60 AND 79) AS good,
Sum(@score BETWEEN 80 AND 89) AS better,
Sum(@score BETWEEN 90 AND 200) AS perfect,
a.statu
FROM exp_experimentclassstudent as a
INNER JOIN exp_experimentclass AS b ON a.classNo = b.classNo
LEFT JOIN exp_experimentclass_course AS b1 ON b1.classNo = b.classNo
LEFT join mysq1_schema.exp_classstudent as c on a.studentNo = c.stuNo
LEFT join mysq1_schema.exp_class as d on c.classno = d.classNo
INNER JOIN exp_courses_node AS e1 ON e1.node_courseNo = b1.courseNo
INNER JOIN exp_courses_node_content AS e2 ON  e2.contentNo = e1.contentNo
INNER JOIN acc_mission as a3 ON e2.missionid = a3.missionId
LEFT JOIN exp_cour_node_cont AS a2 ON IF(@classno ='',1,a2.classNo = @classno) AND  a2.courseNo = b1.courseNo AND a2.missionid =  e2.missionid 
LEFT JOIN acc_1 AS e ON a.expNo = e.expID AND e.missionId = e2.missionid
where  a2.classNo IS NULL AND  IF(@classno ='',1,a.classNo = @classno) AND -- 'EXP17032712533136485'
a.statu is not NULL  and
case 
when @keyword='' then 1
when CONCAT_WS('',d.classNo,d.className) REGEXP @keyword  then 1
when concat(c.stu_name,a.studentNo) REGEXP @keyword  then 1 
else 0
end  
GROUP BY a.expno;

		UPDATE exp_experimentclassstudent as a ,cur1 as b																																										
					set 
							a.missionscore = ROUND(b.score / b.total,2) ,
							a.score1 = b.score,
							a.read_ans_size = b.read_ans_size,
							a.mission_result = b.mission_result,
							a.log_count = b.log_count,
							a.nodone = b.total - ifnull(b.done ,0) ,
							a.done = b.done,
							a.missionbad = b.bad ,
							a.missiongood = b.good,
							a.missionbetter = b.better,
							a.missionperfect = b.perfect,
a.mission_result = b.total,
							a.statu = null 
		where a.expNo = b.expNo  ;

		if FOUND_ROWS() = 0 OR  (@classno is null and  expno )then 
				return concat('3-RecS:',FOUND_ROWS(),'Deal--Exp',IFNULL(expno, 'null'),'--ClaNo:',IFNULL(@classno,'NULL'));
		end if ;

DROP TEMPORARY TABLE IF EXISTS cur1;

   
   


-- sort
    SELECT b.classno into @x
		FROM exp_experimentclass as b
    WHERE b.statu IS NOT NULL AND instr(b.classno , @classno)
		limit 1 ;

		if FOUND_ROWS() = 0 then 
				return concat('4-RecS:',FOUND_ROWS(),'--Exp',IFNULL(expno, 'null'),'Deal--ClaNo:',IFNULL(@classno,'NULL'));
		end if ;
		set @offset1 = 0,@tscore =-99,@clasno = 'avg';


CREATE TEMPORARY TABLE cur1
AS
							SELECT
										@offset1 :=if(a.score1 is null ,null , if(a.classno = @clasno , if( a.score1 = @tscore, @offset1, @offset1 + 1 ) ,1) )   as rowid1 ,
										@clasno := if(a.classno = @clasno ,@clasno ,a.classNo) as classno ,
										a.expNo,
										@tscore := if(ifnull(a.score1,0) = @tscore, @tscore, ifnull(a.score1,0)) as score 
							FROM(
							SELECT
									a.score1 ,
										a.missionscore,
										A.CLASSNO,
										a.expno
							from exp_experimentclassstudent as a 
							INNER JOIN  exp_experimentclass as b on a.classno= b.classno 
							WHERE b.statu IS NOT NULL AND instr(a.classno , @classno)
										) AS A
							order by a.classno , case when a.missionscore is null then 1 else 0 end aSC ,a.missionscore DESC ;

			UPDATE exp_experimentclassstudent as a, cur1 as  b 
			set a.rowNo = b.rowid1
			WHERE a.expno = b.expno ;

  UPDATE exp_experimentclass as a
		set a.statu = null
	WHERE a.statu is not NULL  AND instr(a.classno , @classno);

RETURN  concat('5-DealRecS',FOUND_ROWS()) ;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `changeOrder`
-- ----------------------------
DROP FUNCTION IF EXISTS `changeOrder`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `changeOrder`(`k` tinytext, `a`  tinytext,`b`  tinytext,`av` longtext,`bv` longtext) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...

	DECLARE y TINYINT DEFAULT 0 ;DECLARE x TINYINT DEFAULT 0;
	DECLARE r LONGTEXT DEFAULT NULL;DECLARE rs LONGTEXT DEFAULT NULL;

  IF k IS NULL AND  a IS NULL AND b IS NULL OR NOT PREG_RLIKE('/^\\w+(,\\w+)*$/',CONCAT_WS(',',k,a,b))  THEN
		RETURN a;
	END IF;


	SET av = Fetch_Sub(k,av);
	IF av IS NULL OR preg_rlike('/^(?<F>\"\\\'\\d\\\',NULL(,NULL)*\")(,\\g<F>)*$/',av) THEN RETURN a;END IF;
	SET bv = Fetch_Sub(k,bv);
	IF bv IS NULL OR preg_rlike('/^(?<F>\"\\\'\\d\\\',NULL(,NULL)*\")(,\\g<F>)*$/',bv)THEN RETURN a;END IF;

	y:LOOP
		SET y = y + 1;

		IF IFNULL(Fetch_Elt(y,a),'') =''  THEN LEAVE y; END IF; 
		SET	r = Fetch_y(y,bv);

		CASE


				WHEN r_com_arr(r,av) IS NOT NULL THEN

					SET r = r_com_arr(r,av),
							av = preg_replace (CONCAT('/,?\\Q',r,'\\E/'),'',av,1) ,
							av = IF(LEFT(av,1)=',',SUBSTR(av,2),av),
							r = preg_capture('/^\"\\\'(\\w+)\\\'/',r,1),
							a = preg_replace(CONCAT('/(?<=^|,)',r,'+(?=$|,)/'),'0',a,1),
							x = preg_capture(CONCAT('/(?<=^|,)',r,'+(?=$|,)/'),rs);

					IF	x IS NOT NULL THEN
							SET x = preg_capture('/(?<=^|0,)[1-9]\\d*(?=$|,)/',a);
						ELSE SET x ='0';
					END IF;

					SET	rs = preg_replace(CONCAT('/(?<=^|,)',r,'+(?=$|,)/'),x,rs,1),
							rs = IF( r IS NULL,rs, CONCAT_WS(',',rs,r));


			ELSE 
		SET  r = preg_capture('/(?<=^|0,)[1-9]\\d*(?=$|,)/',a);


				IF r IS NULL THEN LEAVE y; END IF;
				SET rs = CONCAT_WS(',',rs,r),
						a = preg_replace(CONCAT('/(?<=^|,)',r,'+(?=$|,)/'),'0',a,1) ;

		END CASE;

	END LOOP y;

	
	IF LEFT(rs,1) = ',' THEN SET rs = SUBSTR(rs,2); END IF;
   
	RETURN rs;
   
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `clearj`
-- ----------------------------
DROP FUNCTION IF EXISTS `clearj`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `clearj`(`v` blob) RETURNS text CHARSET utf8mb3
    DETERMINISTIC
BEGIN
	#Routine body goes here...

	RETURN preg_replace('/((?>"((?:[^\\\\"]|\\\\.)*)"))|([:,{}])|[\\s]/','$1$3',v) ;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `count`
-- ----------------------------
DROP FUNCTION IF EXISTS `count`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `count`(`p` TINYINT) RETURNS tinyint(4)
    DETERMINISTIC
BEGIN
/*
  SET p  = CASE WHEN p IS NULL THEN 0  
				     ELSE p 
						END ;*/

	RETURN p ;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `counts`
-- ----------------------------
DROP FUNCTION IF EXISTS `counts`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `counts`(`p` TINYblob) RETURNS tinyblob
    DETERMINISTIC
BEGIN

  SET p  = CASE WHEN p IS NULL THEN 0  
				     ELSE p 
						END ;

	RETURN p +1 ;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `cutmpcourse`
-- ----------------------------
DROP PROCEDURE IF EXISTS `cutmpcourse`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `cutmpcourse`(IN `period` varchar(20))
BEGIN

/*
INSERT plogs( Function_Name,summary)
SELECT 'cutmpcourse',CONCAT_WS(',',QUOTE(`period` ),NULL);
*/

CALL Error('调用不存在的函数 ');
set @period = period ,
	@a := 1;
	if time(period ) != 0 then 
		select subdate( now() ,INTERVAL @period  DAY_SECOND) > updatetime into @a from  tmpcourse limit 1;

	end if ;

	if  @a  then 

			drop  table   if exists  tmpcourse ;
			create  table tmpcourse
			as
					SELECT
						a.sort,
						a.courseNo,
						a.courseName,
						CONCAT(b.node_No,'.',c.typesort) AS `no`,
						
						e.node_Id AS char_id,
						e.node_No AS char_no,
						e.node_text AS char_title,
						b.node_Id,
						b.node_No,
						b.node_text,
						c.contentNo,
						b.node_type,
						d.missionId,
						d.missionLabel,
						c.typesort AS step_label,
						d.billId,
						d1.billType,
						NOW() as updatetime 
					FROM
						exp_courses AS a
						LEFT JOIN exp_courses_node AS b ON a.courseNo = b.node_courseNo
						LEFT JOIN exp_courses_node_content AS c ON b.contentNo = c.contentNo
						LEFT JOIN acc_mission AS d ON c.missionid = d.missionId
						LEFT JOIN mysq1_schema.bill_list AS d1 ON d.billId = d1.billId
						LEFT JOIN exp_courses_node AS e ON e.node_isChapter+ 0= 1 AND b.node_courseNo = e.node_courseNo AND SUBSTRING_INDEX(b.node_No,'.',1) = e.node_No
						WHERE
						c.contentType = 'kj'
					GROUP BY
						a.courseNo,
						nabc(b.node_No),
						c.typesort;

					alter table tmpcourse 
						add id  int(5) unsigned not null auto_increment FIRST  ,
						add primary key (id) ,
						add cid varchar(100) after id,
						MODIFY COLUMN `courseno`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' AFTER `sort`,
						MODIFY COLUMN `courseName`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `courseno`;

				update  tmpcourse 
					set cid = concat(cabc(sort) ,cabc(no) );

			
					set @a = now();

					update exp_experimentclass as a
						set	a.cycle = if(a.cycle <= 0 ,10,a.cycle),
							a.period =  (UNIX_TIMESTAMP( a.endtime )-UNIX_TIMESTAMP(a.starttime))/a.cycle
							-- updatetime = @a 
;
			
					update exp_experimentclass as a
						set a.step = case 	
									when @a<a.starttime then 0
									when  @a < a.endtime then 

										ceil((UNIX_TIMESTAMP(@a)- UNIX_TIMESTAMP(a.starttime)) / a.period )

									else   
										ceil((UNIX_TIMESTAMP(a.endtime)- UNIX_TIMESTAMP(a.starttime)) / a.period ) 							 
									end   ;

		

		
				drop table if exists tmpexpcourse;
				create  table tmpexpcourse 
				as
				select 
					right(a.classNo, 4)  as csort, a.classNo , a.className,a.starttime ,a.endTime,a.period ,	a.step ,a.cycle ,
					case when  now()> a.endTime then '已结束'
						when now() > a.starttime then '进行中'
						else  '未开始'
					end as stat, concat(right(a.classNo, 4) ,b.cid) as ccid,
					b.*
				from  exp_experimentclass as a
				left join tmpcourse as b  on a.courseNo = b.courseNo 
				left join exp_teaching_control as c on a.classNo = c.classNo and b.contentNo = c.contentNo
				where  c.contentNo is null ;

				alter table tmpexpcourse 
					add idd int(5) unsigned not null auto_increment FIRST  ,
					add primary key (idd) ,
					MODIFY COLUMN `classNo`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `idd`,
					MODIFY COLUMN `className`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `classNo`;

				ALTER TABLE `tmpexpcourse`
				ADD UNIQUE INDEX `missionid_classno` USING BTREE (`classNo`, `missionId`) ;


		
				update exp_experimentclass as a, (
					select 
						classno as id , count(*) as num
					from tmpexpcourse
					group by classno 
					) as b 
					set 	a.mission_total = b.num
				where a.classno = b.id ;	
	end if ;


END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `d`
-- ----------------------------
DROP FUNCTION IF EXISTS `d`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `d`(`d` varchar(100)) RETURNS decimal(10,2)
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...

	RETURN REGEXP_replace(d,'￥|,','');
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `dom2j`
-- ----------------------------
DROP FUNCTION IF EXISTS `dom2j`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `dom2j`(`d` mediumblob) RETURNS mediumtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	DECLARE `0` VARCHAR(2000) DEFAULT NULL;
	DECLARE `r` VARCHAR(1000) DEFAULT '^"`[0123]`":["{]';

	IF d REGEXP `r` THEN

		CASE	WHEN `d` REGEXP '^"`[0]`":["{]' THEN
						SET `0` = CONCAT('"`0`":{',j0(`d`,"`0`"),'}');
					WHEN d REGEXP '^"`[1]`":["{]' THEN
						SET `0` = CONCAT('"`1`":',j2(`d`,"`1`"));
					WHEN d REGEXP '^"`[2]`":["{]' THEN
						SET `0` = CONCAT('"`2`":',j2(`d`,"`2`"));
					WHEN d REGEXP '^"`3`":["{]' THEN

						SET `0` = CONCAT(	'"`3`":',j2(`d`,"`3`"));
-- 															'"`3`":'
			ELSE SET `0` = NULL ; -- CONCAT('"`0`":{',j0(`d`,"`2`"),'}');
		END CASE;

		IF `0` IS NOT NULL THEN SET	`d` = REGEXP_REPLACE(`d`,CONCAT('(?:,?(?:"(?&c)":)',r('`json1`'),'\s*)*'),''); END IF;

	END IF;

	IF 	IFNULL(`d`,'') = '' THEN RETURN NULL; END IF;

	SET `d` = f2(REG2('`Dom2kwn`'),`d`);

	IF `0` IS NOT NULL AND IFNULL(j0(`0`,'`1`'),'') <> '' THEN

			SET	d = f2(j0(`0`,'`1`'),d);

	END IF;

	SET	`d` = CONCAT_WS(','
	 						,if(`d` REGEXP '"a\\d{1,3}"'  ,CONCAT('"a":{',filter1(REG2('`geta`'),`d`),'}'),NULL)
							,if(`d` REGEXP '"b\\d{1,3}"'  ,CONCAT('"b":',b2j(filter1(REG2('`getb`'),`d`)),''),NULL)
	 						,if(`d` REGEXP '"t\\d{1,3}"'  ,CONCAT('"t":{',filter1(REG2('`gett`'),`d`),'}'),NULL)
						);
	SET		`d` = filter1(r('`,`\t'),`d`);

	IF `0` IS NOT NULL AND IFNULL(j0(`0`,'`2`'),'') <> '' THEN
			SET d = f2(j0(`0`,'`2`'),`d`);
	END IF;

-- RETURN  QUOTE(j0(`0`,'`3`'));
	IF `0` IS NOT NULL AND IFNULL(j0(`0`,'`3`'),'') <> '' THEN
-- RETURN QUOTE(j0(`0`,'`3`'));
			SET d = f2(j0(`0`,'`3`'),`d`);
	END IF;
	RETURN `d`;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `e`
-- ----------------------------
DROP FUNCTION IF EXISTS `e`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `e`(`p` longblob) RETURNS longblob
    NO SQL
    DETERMINISTIC
BEGIN
  DECLARE  path TINYTEXT DEFAULT NULL;	DECLARE  rs LONGBLOB DEFAULT NULL;    
DECLARE  r varchar(100)  DEFAULT '\\b\\w:((?:/+[^/]*+)+)'; 
DECLARE  r1 varchar(100)  DEFAULT CONCAT_WS('','(?s)^.*?(?=',r,'|$)');
DECLARE  r2 varchar(100)  DEFAULT CONCAT_WS('','(?s)^.*?(',r,'|$)');


	IF IFNULL(p,'') = '' THEN RETURN  p ;END  IF; 

	
l:LOOp

	IF p NOT REGEXP r OR IFNULL(p,'')='' THEN LEAVE l;  END IF;
	SET path= REGEXP_substr(p,r);
	SET path = REGEXP_replace(cast(path  AS CHAR),'(?-U)/+','\\\\');
-- RETURN path;
	set	rs = CONCAT_WS('',rs,REGEXP_substr(p,r1),path),
			p = REGEXP_replace(p,r2,'');


END LOOP;
	SET p= CONCAT_WS('',rs,p);

--  RETURN p;
	RETURN (SELECT SYS_eval(CONVERT(cast(p AS CHAR )USING gbk)));
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `e0`
-- ----------------------------
DROP FUNCTION IF EXISTS `e0`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `e0`(`p` longblob) RETURNS varchar(100) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	DECLARE  rs  LONGBLOB DEFAULT NULL; DECLARE  i  LONGBLOB DEFAULT 0; DECLARE  r TINYTEXT DEFAULT '([\\\'"])(?:(?=\\\\).{2}|(?:(?!\\g1|\\\\).)++)*?\\g1';
	SET i = REGEXP_inSTR(p,r); 

	IF i >0   THEN
		SET	rs  := REGEXP_substr(p,r)
				,p = substr(p,i,i+lenght(rs))
				,i = REGEXP_inSTR(p,r);
		IF i>0 THEN
			SELECT JSON_UNQUOTE(rs) INTO  DUMPFILE 'c:/dsdd.js';-- JSON_UNQUOTE(REGEXP_substr(p,r)) ;
		END IF;
					
	END IF;

	RETURN RS ;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Eltm`
-- ----------------------------
DROP FUNCTION IF EXISTS `Eltm`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `Eltm`(`i` varchar(200),`v` longtext) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	DECLARE r TINYTEXT DEFAULT '\\s*(?<c>(?:(?:"(?:\\\\.|[^"])*")|(?:\'(?:\\\\.|[^\'])*\')|(?:`[^`]*`)|(?:[^,"\'`]*))*)';
	DECLARE d VARCHAR(1) DEFAULT ',';
 
   CASE 
				WHEN i NOT REGEXP '^\\s*\\-?\\d+\\s*$' THEN 
						CASE 
								WHEN i REGEXP '^0.+' THEN 
									SET i = REGEXP_replace(i,'^0','');
									CASE	WHEN v REGEXP CONCAT('^',r,'[^,]*?',i) THEN RETURN 1;
												WHEN v REGEXP CONCAT('^',r,'.*?',i) THEN RETURN CHAR_LENGTH(REGEXP_replace(REGEXP_substr(v,CONCAT('^',r,'(?:,(?1))*(?=,.*?',i,')')),CONCAT(r,'(,|$)'),'\\2'))+2;
										ELSE RETURN NULL;
									END CASE;
								WHEN i REGEXP '(^\\s*-)' THEN 
									SET i := REGEXP_replace(i,'(^\\s*-)','')/*;SET */ ,r = CONCAT('(?s)^(?&c)(,',r,CONCAT(')*?(?=,',i,')')),i=-1;
							ELSE	SET r = CONCAT('(?s)^(?&c)(,',r,CONCAT(')*?(?=,',i,')')),i=1;
						END CASE;
				WHEN IFNULL(i,0) = 0   THEN RETURN CHAR_LENGTH(REGEXP_replace(v,CONCAT(r,'(,|$)'),'\\2'))+1;
				WHEN ABS(i) =1 THEN SET r = CONCAT('(?s)^',r);
 				WHEN ABS(i) =2 THEN SET r = CONCAT('(?s)^(?&c)\\s*,',r);
			ELSE 	SET r = CONCAT('(?s)^\\s*(?&c)\\s*(?:,\\s*(?&c)){',ABS(i)-2,'}\\s*,',r);
   END CASE;

-- RETURN  QUOTE(CONCAT(r,'(?:,|$)'));
	RETURN IF( i>0,REGEXP_substr(v,r),REGEXP_replace(v,CONCAT(r,'(?:,|$)'),''));

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Eltn`
-- ----------------------------
DROP FUNCTION IF EXISTS `Eltn`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `Eltn`(`k` TINYBLOB,`v` longblob) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	DECLARE i INT(5) DEFAULT NULL;
	DECLARE `ak` TINYBLOB DEFAULT NULL;


	SET `ak` = column_get(v ,0 AS CHAR);

	IF `k` IS NOT NULL  THEN
			SET i = FIND_IN_SET(`k`,`ak`);

-- RETURN i;
			IF IFNULL(i,0 ) <> 0 THEN
					SET `v` = column_get(`v`,i AS CHAR);
				ELSE SET `v` = NULL;
			END IF;

	END IF;

	RETURN `v`;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `env`
-- ----------------------------
DROP FUNCTION IF EXISTS `env`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `env`(p LONGBLOB,action blob) RETURNS longblob
    DETERMINISTIC
BEGIN
	DECLARE
		path,r,id,id1,id2,`mod` TINYTEXT DEFAULT NULL;
	DECLARE
		次数 int(5) DEFAULT 0;
		

	多个动作:WHILE  次数=0  DO
		SET 次数 = 1;
		CASE
				WHEN action  REGEXP  @szy:='^\\s*(?:2|p(?:ath)?|l(?:oad)?)' THEN
					SET action = NULL; 
		 ELSE 
					SET action = NULL; 
		END case;
	END while 多个动作;


	RETURN p;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Error`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Error`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Error`(IN `m` longtext)
BEGIN
	#Routine body goes here...

		SIGNAL SQLSTATE 'HY000' SET MESSAGE_TEXT =  m; 
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `exetime`
-- ----------------------------
DROP FUNCTION IF EXISTS `exetime`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `exetime`(`开始时间` BLOB) RETURNS blob
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...

	RETURN CASE 
					WHEN   IFNULL(开始时间 ,'') = '' THEN sysdate(6)
					else  (TIMESTAMPDIFF(MICROSECOND,`开始时间`,SYSDATE(6)))/1000000
				END ;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `expid2b`
-- ----------------------------
DROP FUNCTION IF EXISTS `expid2b`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `expid2b`(`expid` varchar(60)) RETURNS varchar(20) CHARSET utf8mb3
    DETERMINISTIC
BEGIN
	
  if RIGHT(expid,1) = 0 THEN
			set expid = 'acc_n';
	ELSE set expid = CONCAT('acc_n_',RIGHT(expid,1));
	end IF;
	RETURN expid;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `expscore`
-- ----------------------------
DROP PROCEDURE IF EXISTS `expscore`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `expscore`(IN `expno` varchar(20))
BEGIN
  case  when expno+0 = 1  then
				select 
					a.classNo ,
					b.className,  s0 as s00 ,
					round(if(stunum = 0 , 0,(stunum - s0_10 - s10_20 - s20_30 - s30_40 - s40_50- s60_70 - s70_80 - s80_90 - s90_100)/stunum*100 ),2) as s0per , 
					round(if(stunum = 0 , 0,stunum - s0_10 - s10_20 - s20_30 - s30_40 - s40_50- s60_70 - s70_80 - s80_90 - s90_100 ),2) as s0,
					round(if(stunum = 0 , 0,a.s0_10/stunum*100 ),2) as s0_10per,s0_10,
					round(if(stunum = 0 , 0,a.s10_20/stunum*100 ),2) as s10_20per,s10_20,
					round(if(stunum = 0 , 0,a.s20_30/stunum*100 ),2) as s20_30per,s20_30,
					round(if(stunum = 0 , 0,a.s30_40/stunum*100 ),2) as s30_40per,s30_40,
					round(if(stunum = 0 , 0,a.s40_50/stunum*100 ),2) as s40_50per,s40_50,
					round(if(stunum = 0 , 0,a.s50_60/stunum*100 ),2) as s50_60per,s50_60 ,
					round(if(stunum = 0 , 0,a.s60_70/stunum*100 ),2) as s60_70per,s60_70 ,
					round(if(stunum = 0 , 0,a.s70_80/stunum*100 ),2) as s70_80per,s70_80,
					round(if(stunum = 0 , 0,a.s80_90/stunum*100 ),2) as s80_90per,s80_90,
					round(if(stunum = 0 , 0,a.s90_100/stunum*100 ),2) as s90_100per,s90_100,
					stunum 
				from ( 
					
					select
						a.classNo,
						sum( if(a.score +0 = 0 ,1,0) )  as s0 ,
						sum(if(a.score+0>0 and a.score+0<10,1,0 ) )as s0_10,
						sum(if(a.score+0>=10 and a.score+0<20,1,0 ) )as s10_20,
						sum(if(a.score+0>=20 and a.score+0<30,1,0 ) )as s20_30,
						sum(if(a.score+0>=30 and a.score+0<40,1,0 ) )as s30_40,
						sum(if(a.score+0>=40 and a.score+0<50,1,0 ) )as s40_50,
						sum(if(a.score+0>=50 and a.score+0<60,1,0)) as s50_60,
						sum(if(a.score+0>=60 and a.score+0<70,1,0)) as s60_70,
						sum(if(a.score+0>=70 and a.score+0<80,1,0)) as s70_80,
						sum(if(a.score+0>=80 and a.score+0<90,1,0)) as s80_90,
						sum(if(a.score+0>=90 and a.score+0<100,1,0)) as s90_100
						from(
						
								SELECT
									a.classNo,
									a.expNo as expid ,
									a.missionscore as score
								FROM 		exp_experimentclassstudent AS a

							) as  a
						
						group by  a.classNo
					
					) as a
				left join (
					select 
						a.classNo,
						a.className,
						count(b.expNo) as stunum
					FROM exp_experimentclass AS a
					Left Join exp_experimentclassstudent AS b ON a.classNo = b.classNo
					group by a.classNo  

					) as b 	on a.classno = b.classno 
;
	when  expno =  2 then
					select 
						a.classNo ,
						b.className,  s0 as s00 ,
						round(if(stunum = 0 , 0,(stunum - s0_10 - s10_20 - s20_30 - s30_40 - s40_50- s60_70 - s70_80 - s80_90 - s90_100)/stunum*100 ),2) as s0per , 
						round(if(stunum = 0 , 0,stunum - s0_10 - s10_20 - s20_30 - s30_40 - s40_50- s60_70 - s70_80 - s80_90 - s90_100 ),2) as s0,
						round(if(stunum = 0 , 0,a.s0_10/stunum*100 ),2) as s0_10per,s0_10,
						round(if(stunum = 0 , 0,a.s10_20/stunum*100 ),2) as s10_20per,s10_20,
						round(if(stunum = 0 , 0,a.s20_30/stunum*100 ),2) as s20_30per,s20_30,
						round(if(stunum = 0 , 0,a.s30_40/stunum*100 ),2) as s30_40per,s30_40,
						round(if(stunum = 0 , 0,a.s40_50/stunum*100 ),2) as s40_50per,s40_50,
						round(if(stunum = 0 , 0, a.s50_60/stunum*100 ),2) as s50_60per,s50_60 ,
						round(if(stunum = 0 , 0, a.s60_70/stunum*100 ),2) as s60_70per,s60_70 ,
						round(if(stunum = 0 , 0, a.s70_80/stunum*100 ),2) as s70_80per,s70_80,
						round(if(stunum = 0 , 0, a.s80_90/stunum*100 ),2) as s80_90per,s80_90,
						round(if(stunum = 0 , 0, a.s90_100/stunum*100 ),2) as s90_100per,s90_100,
						stunum 
					from ( 
						
							
							select
								a.classno, 
								sum( if(a.comppercent = 0 ,1,0) )  as s0 ,
								sum(if(a.comppercent>0 and a.comppercent<10,1,0 ) )as s0_10,
								sum(if(a.comppercent>10 and a.comppercent<20,1,0 ) )as s10_20,
								sum(if(a.comppercent>20 and a.comppercent<30,1,0 ) )as s20_30,
								sum(if(a.comppercent>30 and a.comppercent<40,1,0 ) )as s30_40,
								sum(if(a.comppercent>40 and a.comppercent<50,1,0 ) )as s40_50,
								sum(if(a.comppercent>=50 and a.comppercent<60,1,0)) as s50_60,
								sum(if(a.comppercent>=60 and a.comppercent<70,1,0)) as s60_70,
								sum(if(a.comppercent>=70 and a.comppercent<80,1,0)) as s70_80,
								sum(if(a.comppercent>=80 and a.comppercent<90,1,0)) as s80_90,
								sum(if(a.comppercent>=90 and a.comppercent<100,1,0)) as s90_100
							from ( 
								
								SELECT

									a.classNo,
									b.expid,
									if(mission_total = 0 , 0, count(a.pass_score_size  <= b.score or b.log_count >= a.redo_size) /mission_total * 100 )AS comppercent,
									if(mission_total = 0 , 0, count(a.pass_score_size  <= b.score or b.log_count >= a.redo_size) ) as comp 
								FROM ( 
									
									select
										a.classno, mission_total ,
										b.pass_score_size  , b.redo_size
									from exp_experimentclass  as a  
									left join mysq1_schema.exp_difficulty as b on b.difficulty_level  =  a.difficulty_level
									

									)AS a
								LEFT JOIN exp_experimentclassstudent as c ON a.classNo = c.classNo
								Left Join acc_1 AS b ON b.expid = c.expNo
								
								group by a.classNo ,b.expid
								
								)  as  a 

							group by  a.classNo
							

						) as a
					left join (
						select 
							a.classNo,
							a.className,
							count(b.expNo) as stunum
						FROM exp_experimentclass AS a
						Left Join exp_experimentclassstudent AS b ON a.classNo = b.classNo
						group by a.classNo  

						) as b 	on a.classno = b.classno 
				;
	when  expno =  3  then
					drop TEMPORARY table if EXISTS cur1 ;
					CREATE TEMPORARY table cur1 as 
					SELECT
					b.classNo,
					d1.billId,
					d1.billType,
					Count(a.expID) as num
					FROM acc_1 AS a
					INNER JOIN exp_experimentclassstudent AS b ON a.expID = b.expNo
					INNER JOIN exp_experimentclass AS b1 ON b.classNo = b1.classNo
					INNER JOIN exp_experimentclass_course AS b2 ON b1.classNo = b2.classNo
					INNER JOIN exp_courses_node AS c1 ON b2.courseNo = c1.node_courseNo
					INNER JOIN exp_courses_node_content AS c2 ON c2.contentNo = c1.contentNo AND a.missionId = c2.missionid
					INNER JOIN acc_mission AS d ON c2.missionid = d.missionId
					INNER JOIN mysq1_schema.bill_list AS d1 ON d.billId = d1.billId
					WHERE
					a.score < 60
					GROUP BY
					b.classNo,
					d1.billId;

					drop TEMPORARY table if EXISTS cur2 ;
					CREATE TEMPORARY table cur2 as 
							SELECT
							a.classNo,
							a.className,
							b.billType,
							b.billTypeSay,
							ifnull(Sum(c.num),0) as num
							FROM
							exp_experimentclass AS a
							JOIN mysq1_schema.bill_type AS b
							LEFT JOIN cur1 AS c ON a.classNo = c.classNo AND b.billType = c.billtype
							GROUP BY
							a.classNo,
							b.billType;

					drop TEMPORARY table if EXISTS  cur3 ;
					create TEMPORARY table cur3 as 
					select a.* ,ifnull(round(a.num/b.numm*100,1),0) as numm
					from  cur2 as a 
					left join (
					select  classno,sum(num) as numm from cur1 group by classno 
					) as b on  a.classno = b.classno ;

					select ifnull(sum(num),1)  
					into @a 
					from cur1;


					select * from cur3
					UNION all 
					select  
					'avg',
					className,
					billType,
					billTypeSay,
					sum(num) ,
					ifnull(round(sum(num)/@a*100,1),0) 
					from cur2
					group by 
					billtype ;


					drop TEMPORARY table if EXISTS  cur3 ;
					drop TEMPORARY table if EXISTS cur1 ;
					drop TEMPORARY table if EXISTS cur2 ;


when  expno = 4  then
					drop TEMPORARY table if EXISTS cur1 ;
					CREATE TEMPORARY table cur1 as 
					SELECT
					b.classNo,
					d1.billId,
					d1.billType,
					Count(a.expID) as num
					FROM acc_1 AS a
					INNER JOIN exp_experimentclassstudent AS b ON a.expID = b.expNo
					INNER JOIN exp_experimentclass AS b1 ON b.classNo = b1.classNo
					INNER JOIN exp_experimentclass_course AS b2 ON b2.classNo = b1.classNo
					INNER JOIN exp_courses_node AS c1 ON b1.courseNo = c1.node_courseNo
					INNER JOIN exp_courses_node_content AS c2 ON c2.contentNo = c1.contentNo AND a.missionId = c2.missionid
					INNER JOIN acc_mission AS d ON c2.missionid = d.missionId
					INNER JOIN mysq1_schema.bill_list AS d1 ON d.billId = d1.billId
					WHERE
					a.score < 60
					GROUP BY
					b.classNo,
					d1.billId;

					drop TEMPORARY table if EXISTS cur2 ;
					CREATE TEMPORARY table cur2 as 
						SELECT
						a.classNo,
						a.className,
						b.billType,
						b.billTypeSay,
						ifnull(Sum(c.num),0) as num
						FROM
						exp_experimentclass AS a
						JOIN mysq1_schema.bill_type AS b
						LEFT JOIN cur1 AS c ON a.classNo = c.classNo AND b.billType = c.billtype
						GROUP BY
						a.classNo,
						b.billType;

					drop TEMPORARY table if EXISTS  cur3 ;
					create TEMPORARY table cur3 as 
					select a.* ,ifnull(round(a.num/b.numm*100,1),0) as numm
					from  cur2 as a 
					left join (
					select  classno,sum(num) as numm from cur1 group by classno 
					) as b on  a.classno = b.classno ;

					select ifnull(sum(num),1)  
					into @a 
					from cur1;


					select * from cur3
					UNION all 
					select  
					'avg',
					className,
					billType,
					billTypeSay,
					sum(num) ,
					ifnull(round(sum(num)/@a*100,1),0) 
					from cur2
					group by 
					billtype ;


					drop TEMPORARY table if EXISTS  cur3 ;
					drop TEMPORARY table if EXISTS cur1 ;
					drop TEMPORARY table if EXISTS cur2 ;
	else  select null; 
end case;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `f`
-- ----------------------------
DROP FUNCTION IF EXISTS `f`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f`(`p` LONGBLOB, k text ) RETURNS longblob
    DETERMINISTIC
p : BEGIN#Routine body goes here...
	DECLARE `rs`,`ts`,		`jrs`,	`抓拍`,`trs`  LONGBLOB DEFAULT NULL;
	DECLARE addr,		`计数器`,		`计数` INT ( 5 ) DEFAULT 0;
	DECLARE `次数`,		`取队列` INT ( 11 ) DEFAULT NULL;
	DECLARE `arr`,调试 TEXT DEFAULT NULL;
	DECLARE `r` TEXT DEFAULT '^\\[?((".+"|[\\d\\-]+)(?:,(?-1))*+)\\]?(?)(.*?)$';
	DECLARE	i VARCHAR ( 100 ) DEFAULT 0;
	DECLARE	`t` VARCHAR ( 20 ) DEFAULT NULL;
	DECLARE	`kword`,tracer   VARCHAR ( 200 ) DEFAULT NULL;
	DECLARE	`l` INT ( 5 ) DEFAULT 23;
	DECLARE		`jl` VARCHAR ( 100 ) DEFAULT -1;
	

	DECLARE callf  CONDITION FOR 666;
	DECLARE CONTINUE HANDLER FOR callf
	BEGIN
	DECLARE fn TINYTEXT DEFAULT NULL;
	GET DIAGNOSTICS CONDITION 1 fn = MESSAGE_TEXT;

								set trs  = IF(fn = 'f_else',f_else(JSON_ARRAY(p,rs)),f_react(JSON_ARRAY(p,rs)));

								CASE WHEN  json_valid(trs) && JSON_EXTRACT(trs,'$.RETURNED_SQLSTATE') is NOT NULL || JSON_EXISTS(trs,'$.tiaoShi') THEN 
													SET 调试 = JSON_value(trs,'$.tiaoShi');

													SET @RETURNED_SQLSTATE = CONCAT('f_else',json_value(trs,'$.RETURNED_SQLSTATE')),
															@MYSQL_ERRNO =  json_value(trs,'$.MYSQL_ERRNO'),
															@MESSAGE_TEXT = json_value(trs,'$.MESSAGE_TEXT');

													RETURN _s(json_array(@MYSQL_ERRNO,@MESSAGE_TEXT));
											WHEN   json_valid(trs) && JSON_EXISTS(trs, '$.p') THEN

												 SET p = IF(JSON_EXISTS(trs, '$.p'),json_value(trs,'$.p'),trs),
														 rs = CAST(IF(JSON_EXISTS(trs, '$.rs'),json_value(trs,'$.rs'),rs) AS CHAR);
											
									ELSE  

												SET p = trs, rs ='["f_else","未处理"]';
												
								END  case;	
	SET @状态 =state(@状态,0);
	

	END;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '22001',SQLSTATE '23000',		SQLSTATE '42000',		SQLSTATE '42S22',		SQLSTATE 'HY000',SQLSTATE	'22007'

		bl : BEGIN
			GET DIAGNOSTICS CONDITION 1 @`sqlstate` = RETURNED_SQLSTATE,
			@errno = MYSQL_ERRNO,
			@TEXT = MESSAGE_TEXT;
	
		SET @`sqlstate` = JSON_OBJECT( 'sqlstate', @`sqlstate`, 'errno', @errno, 'text', @TEXT );
		RETURN CONCAT_WS( '\n'
		,CASE WHEN 调试 IS NULL THEN CONCAT(@errno,',',@TEXT)
		      else 调试 END
		,CONCAT(@RETURNED_SQLSTATE, @TEXT)
		,CONCAT(@`sqlstate`)
		
	,CONCAT('K=',K), CONCAT('arr=',arr),CONCAT('i=',i), CONCAT( "计数器=",计数器), CONCAT( "计数:",计数), CONCAT( "当前表达式 : ", @当前表达式 ), CONCAT( "抓拍",抓拍) );
		
	END bl;
SET @状态 = state('{"fn":"state"}',0);

	IF k IS NULL ||  k REGEXP'^\\s*$' THEN RETURN p; END IF;
		SET @f专用 =null;
		SET @f专用 =  '^\\s*([^,\\s]+)(?:[\\s,]+((?-2)(?:[\\s,]+(?-2))*))?\\s*$';

			IF k NOT REGEXP '["\']'  && k REGEXP @f专用 THEN 
					-- RETURN 
					SET k = 	
								REGEXP_replace(REGEXP_replace(
									REGEXP_replace(k,@f专用,'{done:[\\1],k:[\\2],t:2}')
								,'[^\\s,:\\[\\]{}]+','"\\0"') 
								,'[\\s,]+',' , ')
								;

			END IF; 
			

		IF !JSON_VALID(K) THEN

				SET k := REGEXP_replace ( k, o ( '(")?k\\g1(\\s*:\\s*(?&j)),j' ), '"k" \\2}' );

				SET  r := o ( '^\\s*\\{?\\[?((?&v)\\s*)(?:,(?-1))*\\]?(?!:),j' );

				SET  	k = CONCAT(
					'{"done":',
					REGEXP_replace (
						k,
						r,
					CONCAT('[',REGEXP_REPLACE(REGEXP_replace(REGEXP_substr(k,R),'\\]$',''),'(?<!")\\b\\w+','"\\0"') ,']')
					));

			SET  k = REGEXP_REPLACE(K ,'[^}]\\s*$','\\0}');


			SET k =			IF				( JSON_EXISTS( k, '$.t' ) = 0, JSON_MERGE( k, JSON_OBJECT( 't', 2 )), k );


		END IF;


								  SET @RETURNED_SQLSTATE=NULL,
											@MYSQL_ERRNO = null,
											@MESSAGE_TEXT = NULL;

	  IF  p = '0'   THEN SET p = IF( IFNULL(json_value(k,'$.done[0]'),'') != '',  s(json_value(k,'$.done[0]'),0),p); END IF;

		IF 		IFNULL( `p`, '' ) REGEXP '(?-m)^\\s*$' THEN	

			RETURN `p`
		
		;END IF;

		IF json_valid( k ) THEN
			
				SET t = Json_value( k, '$.t' ),
				kword := JSON_value( k, '$.k[0]' ),
				kword = 	IF( kword = 'NULL', NULL, kword );
			
		END IF;



		IF
			json_value( `k`, '$.start' ) IS NOT NULL THEN
				
				SET i = json_value( `k`, '$.start' );
			
		END IF;
	  IF !json_valid(k)  THEN SIGNAL  SQLSTATE 'HY000' SET MYSQL_ERRNO =12345 , MESSAGE_TEXT ='K 不是 有效json';END IF;
		SET `arr` = CAST( JSON_EXTRACT( `k`, '$.done' ) AS CHAR );

		SET 计数器 = 0;

l :LOOP-- 跳出

			
-- IF k REGEXP '^\\[\\s*\\[?"来自"'  THEN SET rs = k , k = "来自"  ; END IF; 


			IF 	`jrs` IS NOT NULL && json_length( `jrs` ) = 0 && json_length( rs ) < 3 THEN 
					SET i = IF ( jl REGEXP '^[\\d\\-\\.]+$', jl + 1, CONCAT_WS( '', jl, '+1' )), jl =-1, jrs = NULL; 
			END IF;
 /* 跳出 屎山代码
IF rs = '["来自", "react"]' then  RETURN -- i REGEXP '^\\d+$' && i >= l + 1 && jrs IS NULL 
							   JSON_LENGTH(rs)<3
									&&(json_value(rs,'$[0]')='来自' || json_length(JSON_EXTRACT(jrs,'$[0]'))<3)
							;END IF;

*/


			CASE 
			
			WHEN i REGEXP '^\\d+$' && i >= l + 1 && jrs IS NULL 
							||   JSON_LENGTH(rs)<3
							&& (json_value(rs,'$[0]')='来自' || json_length(JSON_EXTRACT(jrs,'$[0]'))<3)

							
					THEN	LEAVE l;
			

			WHEN rs IS NOT NULL && json_length( rs ) > 3 && json_value( Rs, '$[2]' ) = 'done' && IFNULL( json_value( Rs, '$[3]' ), '' )!= '' && json_value( Rs, '$[3]' ) REGEXP '^\\w+$' THEN

					SET i = json_value( Rs, '$[3]' ),
					
					rs = json_remove( rs, '$[2]', '$[2]' );


					IF 	JSON_LENGTH( rs ) > 2 && ( json_value( rs, '$[1]' ) <=> '接' ) = 0 THEN
							
							SET jrs = JSON_MERGE(
								json_array( rs ),
							IF 	( jrs IS NULL, '[]', jrs ));
						
						SET rs = NULL;
						ELSE 
							SET rs = json_REMOVE( rs, '$[0]', '$[0]' );
						
					END IF;
					
					SET 取队列 = 1;
			
			WHEN `jrs` IS NULL && arr IS NOT NULL && json_valid( arr ) THEN
				IF 	JSON_length( arr )> 0 THEN
						
						SET i = JSON_VALUE( arr, '$[0]' ),
						arr = json_REMOVE( arr, '$[0]' );
					
					SET 取队列 = 1;
					ELSE  LEAVE l;
					
				END IF;
				ELSE 

					SET @eee = NULL;
				
			END CASE;


			CASE
			
					WHEN JSON_DEPTH(JSON_EXTRACT(rs ,'$[2]'))>1 THEN	
							SET jrs = JSON_ARRAY_INSERT(jrs,'$[0][2]',JSON_REMOVE(rs,'$[2]'))
									,rs = JSON_EXTRACT(rs,'$[2]');

					
					WHEN 取队列 = 0 && /*`Jl`REGEXP'\\-\\d+' && */`Jl` REGEXP '^\\s*\\-' 	&& ( json_length( `jrs` )> 0 || json_length( rs )< 3 ) THEN
						IF	json_length( rs )< 3 && json_length( `jrs` )> 0 THEN
		
								SET rs = JSON_EXTRACT( jrs, '$[0]' );
							
						END IF;

					SET `rs` = JSON_EXTRACT( `jrs`, '$[0]' ),
					jrs = JSON_REMOVE( jrs, '$[0]' );
					
 					WHEN json_length(rs)<3 && json_length(JSON_EXTRACT(jrs,'$[0]'))>2 THEN 
						SET rs = JSON_EXTRACT(jrs,'$[0][2]'),
								jrs = JSON_remove(jrs,'$[0][2]');

						IF rs IS NULL THEN return _s(json_array(666,'rs 不能为空'));END if;

					WHEN `t` = '1' THEN
					
					SET `ts` = r4b1 (
						json_array(
							i,
						JSON_EXTRACT( `k`, '$.k[*]' )));
					
					WHEN 取队列 = 1 THEN

					CASE
							
							WHEN `t` REGEXP '^(?:react|2)$' THEN

							SET `Ts` = r4b2 (
								json_array(
									i,
								JSON_EXTRACT( `k`, '$.k[*]' )));

						WHEN `t` = '3' THEN
						
						SET `ts` = r4b3 (
							json_array(
								i,
							JSON_EXTRACT( `k`, '$.k[*]' )));
						
						WHEN `t` = '4' THEN
						
						SET `ts` = r4b_json (
							json_array(
								i,
							JSON_EXTRACT( `k`, '$.k[*]' )));
						
						WHEN `t` IN ( 'r4b_time', '`r4b_time`' ) THEN
						
						SET `ts` = r4b_time (
							json_array(
								i,
							JSON_EXTRACT( `k`, '$.k[*]' )));
						
						WHEN `t` = 'r4b_time0' THEN
						
						SET `ts` = r4b_time0 (
							json_array(
								i,
							JSON_EXTRACT( `k`, '$.k[*]' )));
						ELSE 
							SET `ts` = r4b (
								json_array(
									i,
								JSON_EXTRACT( `k`, '$.k[*]' )));
						
					END CASE;
					
					WHEN json_value(k,'$[0]') = '来自' THEN
					SET rs = k;

					ELSE  -- RETURN 	"CONCAT_WS( '____', rs, jrs )"

							RETURN CONCAT_WS( '\n', 'something wrong', 抓拍 );
					
				END CASE;

				SET rs = JSON_MERGE_PRESERVE (
					IFNULL( ts, '[]' ),
				IFNULL( rs, '[]' ));


				SET 取队列 = 0,
				`ts` = NULL;
				CASE
						
						WHEN IFNULL( `rs`, '' )= '' THEN
						
						SET i =
					IF
						( i REGEXP '^\\d+$', i - 1, i );
					LEAVE l;
					ELSE 队列 :
					WHILE
							json_length( `rs` )> 2 && JSON_DEPTH(
							JSON_EXTRACT( `rs`, '$[2]' )) > 1 DO
							
							SET jrs = JSON_MERGE(
								json_array(
								JSON_REMOVE( rs, '$[2]' )),
							IF
							( jrs IS NULL, '[]', jrs )),
							rs = JSON_EXTRACT( rs, '$[2]' );
						
					END WHILE 队列;

					SET jl = i;
					
				END CASE;



				SET 抓拍 = CONCAT_WS(
					'\n',抓拍,
					CONCAT_ws(
						' : ',计数器,
					CONCAT_WS( '____', rs, jrs ))),计数器 = 计数器 + 1;
					

SET @状态 = state(@状态,0);

-- 队列开始
				CASE
						WHEN k IS NULL THEN  RETURN 'k';
						WHEN JSON_LENGTH( rs ) = 2 && JSON_EXTRACT(rs,'$[1]' )  NOT REGEXP '"\\Q(?#抓取\\E' THEN

						ITERATE l;
					
					WHEN json_extract( rs, '$[0]' ) IN ( '"-1"', '"跳"' ) THEN
					
					SET @i = NULL;
					
					WHEN IFNULL( json_value( Rs, '$[2]' ), '' )!= '' && json_value( Rs, '$[2]' ) = 'done' && IFNULL( json_value( Rs, '$[3]' ), '' )!= '' && json_value( Rs, '$[3]' ) REGEXP '^\\w+$' THEN
					ITERATE l;
					
					WHEN json_extract( rs, '$[0]' ) = '-3' THEN
					RETURN 'p';
					
WHEN json_value( `rs`, '$[1]' ) REGEXP '(?i)^(react|多多|c$)' &&( json_length( rs )> 4  || json_extract(rs,'$[2]') REGEXP  '\\Q(?#抓取\\E[^)]*?\\)\\s*\\S+' )THEN

-- ----------------------------------------------------------------------------------------------
SET @auusd8dsuusd8ds := _s(json_array(666,'f_react'));
-- -------------------------------------------------------------------------------------------------


WHEN json_value( `rs`, '$[1]' ) REGEXP '^多(?!多)' THEN
					BEGIN
						DECLARE
							`trs` LONGBLOB DEFAULT NULL;
						DECLARE
							`tr` LONGTEXT DEFAULT NULL;
						IF
							p REGEXP CONVERT ( json_value( `rs`, '$[2]' ) USING gbk ) 
							AND p NOT REGEXP CONVERT ( CONCAT_WS( '', '(?ims)(', json_value( `rs`, '$[2]' ), ').*?(?1)' ) USING gbk ) THEN
								
								SET `trs` = REGEXP_replace (
									p,
									json_value( `rs`, '$[2]' ),
								json_value( `rs`, '$[3]' )),
								`rs` = json_remove( rs, '$[0]', '$[0]', '$[1]' );
							l1 :
							LOOP
								IF
									json_length( `rs` ) <= 1 THEN
										LEAVE l1;
									
								END IF;
								IF
									JSON_VALID(
									JSON_EXTRACT( `rs`, '$[1]' )) 
									AND JSON_EXTRACT( `rs`, '$[1]' ) REGEXP '^\\[' THEN
										
										SET @ddr = CONVERT ( JSON_value( `rs`, '$[1][0]' ) USING gbk ),
										@ddre = CONVERT ( JSON_value( `rs`, '$[1][1]' ) USING gbk ),
										`rs` = json_remove( rs, '$[1]' );
									ELSE 
										SET @ddr = CONVERT ( JSON_value( `rs`, '$[1]' ) USING gbk ),
										@ddre = CONVERT ( JSON_value( `rs`, '$[2]' ) USING gbk ),
										`rs` = json_remove( rs, '$[1]', '$[1]' );
									
								END IF;
								IF
									`trs` REGEXP @ddr THEN
										
										SET `trs` = REGEXP_replace ( `trs`, @ddr, @ddre );
									
								END IF;
								
							END LOOP;
							
							SET p = REGEXP_replace ( p, CONVERT ( json_value( `rs`, '$[0]' ) USING gbk ), `trs` );
							
						END IF;
						
					END;
					
					WHEN json_value( `rs`, '$[1]' )REGEXP '^抓循' THEN
					BEGIN
						DECLARE
							`trs` LONGBLOB DEFAULT NULL;
						DECLARE
							`tr` LONGTEXT DEFAULT NULL;
						IF
							p REGEXP CONVERT ( json_value( `rs`, '$[2]' ) USING gbk ) THEN
								
								SET `trs` = REGEXP_substr (
									p,
								json_value( `rs`, '$[2]' )),
								`rs` = json_remove( rs, '$[0]', '$[0]' );
							l1 :
							LOOP
								IF
									json_length( `rs` ) = 1 THEN
										LEAVE l1;
									
								END IF;
								IF
									`trs` REGEXP CONVERT ( json_value( `rs`, '$[1]' ) USING gbk ) THEN
										
										SET `trs` = REGEXP_replace (
											`trs`,
											CONVERT ( json_value( `rs`, '$[1]' ) USING gbk ),
										CONVERT ( json_value( `rs`, '$[2]' ) USING gbk ));
									ELSE LEAVE l1;
									
								END IF;
								
							END LOOP;
							
							SET p = REGEXP_replace ( p, CONVERT ( json_value( `rs`, '$[0]' ) USING gbk ), `trs` );
							
						END IF;
						
					END;

					ELSE 

--  重要的----------------------------------------------

SET @auusd8dsuusd8ds := _s(json_array(666,'f_else'));
-- --------------------------------------------

		END CASE;

							IF IFNULL( p, '' ) = '' THEN RETURN NULL;END IF;
	
							SET i =IF(
									i REGEXP '^[\\d\\-\\.]+$',
									i + 1,
								CONCAT_WS( '', i, '+1' ));



	END LOOP l;
  SET @状态 =  CONCAT_WS('\n状态1\n',state(@状态,-1),@状态1);

 -- RETURN @状态1;
	RETURN CASE WHEN  p = 'null' THEN NULL 
	ELSE p END;
			
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `f0`
-- ----------------------------
DROP FUNCTION IF EXISTS `f0`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f0`(`k` blob,`t` longblob) RETURNS longblob
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...

  IF NOT json_valid(k) THEN
		RETURN filter(`k`,`t`);
	END IF;

	BEGIN DECLARE i INT(5) DEFAULT 0;	DECLARE kp BLOB DEFAULT NULL;	DECLARE k0 BLOB DEFAULT NULL;	DECLARE k1 BLOB DEFAULT NULL;	DECLARE k2 VARCHAR(1000) DEFAULT NULL;
	loop1:LOOP

		SET kp = json_query(k,CONCAT('$[',i,']'));

		IF kp IS NULL THEN LEAVE loop1;END IF;


			SET	k2 = json_value(kp,CONCAT('$[',2,']')),
					k1 = json_value(kp,CONCAT('$[',1,']'));
			set	k0 = json_value(kp,CONCAT('$[',0,']'));

SET kp = REGEXP_replace(REGEXP_replace(kp,'(?<=\\Q(?:\\E)KEYS',REGEXP_replace(QUOTE(k1),"^'|'$",'')),'SUBROUTING',REGEXP_replace(QUOTE(k2),"^'|'$",''));

			IF k1 IS NULL THEN SET k1 = ''; END IF;
			
			IF IFNULL(k0,'') != ''  THEN 


				CASE		WHEN k0 REGEXP '^\\s*(?:three|3)' AND IFNULL(k1,'') <> '' AND IFNULL(k2,'') <> ''THEN 


	BEGIN DECLARE result	longblob DEFAULT NULL; DECLARE ops LONGTEXT DEFAULT NULL; DECLARE op LONGBLOB DEFAULT NULL;
-- 	DECLARE r0 BLOB DEFAULT json_value(k,CONCAT('$[',i,'][',2,']');
	DECLARE r1 BLOB DEFAULT json_value(kp,CONCAT('$[',3,']'));
	DECLARE r2 text DEFAULT json_value(kp,CONCAT('$[',4,']'));
	DECLARE r3 text DEFAULT json_value(kp,CONCAT('$[',5,']'));	
	DECLARE r4 text DEFAULT json_value(kp,CONCAT('$[',6,']'));	
	DECLARE rp BLOB DEFAULT json_value(kp,CONCAT('$[',6,']'));	

	SET r2 = CONCAT_WS('','(?isx)^.*?',r2),
			r1 = CONCAT_WS('','(?isx)^.*?',r1);

				loop11:LOOP


					SET result = CONCAT_WS('',result,REGEXP_subStr(T,r1)),
							t = REGEXP_replace(t,r1,'');

					IF t = '' THEN LEAVE loop11;END IF;

					IF t NOT REGEXP r2 THEN LEAVE loop11; END IF;

					SET ops = REGEXP_substr(t,r2),
							t = REGEXP_replace(t,CONCAT('^',r2),'');
					IF ops = '' THEN LEAVE loop11;END IF;
SET @i = 0 ;
					LOOP111:LOOP

							SET		op	=  	REGEXP_SUBSTR(ops,r3),
										ops	=		REGEXP_replace(ops,r3,'');
RETURN op	;
							IF IFNULL(op,'') = ''  THEN LEAVE LOOP111; END IF;

							LOOP112:LOOP
										
										RETURN op	;

							END LOOP;
						

							SET result = CONCAT_WS('',result,REGEXP_replace(CAST(ops AS CHAR),CAST(r3 AS CHAR),CAST(rp AS CHAR)));

					END LOOP;
							
			
				
				END LOOP;SET t=   CONCAT_WS('',result ,t);
	END;	

							WHEN k0 = 'two' AND IFNULL(k1,'') <> '' AND IFNULL(k2,'') <> ''THEN 
	SET k2 = REGEXP_replace(QUOTE(k2),"^'|'$",'');
	BEGIN DECLARE result	longblob DEFAULT NULL; DECLARE ops LONGBLOB DEFAULT NULL;
	DECLARE r1 BLOB DEFAULT json_value(k,CONCAT('$[',i,'][',3,']'));
	DECLARE r2 BLOB DEFAULT json_value(k,CONCAT('$[',i,'][',4,']'));
	DECLARE r3 BLOB DEFAULT json_value(k,CONCAT('$[',i,'][',5,']'));	
	DECLARE rp BLOB DEFAULT json_value(k,CONCAT('$[',i,'][',6,']'));	

				loop2:LOOP


					SET result = CONCAT_WS('',result,REGEXP_subStr(T,r1)),
							t = REGEXP_replace(t,CONCAT('^',r1),'');

					IF t = '' THEN LEAVE loop2;END IF;

					SET ops = REGEXP_substr(t,r2),
							t = REGEXP_replace(t,CONCAT('^',r2),'');

					IF ops = '' THEN LEAVE loop2;END IF;

					SET result = CONCAT_WS('',result,REGEXP_replace(CAST(ops AS CHAR),CAST(r3 AS CHAR),CAST(rp AS CHAR)));
							
			
				
				END LOOP;SET t=   CONCAT_WS('',result ,t);
	END;
						WHEN IFNULL(k1,'') != '' AND   k1 REGEXP 'cap' THEN  
							
								SET @tempt = NULL,
										@tempt =	REGEXP_SUBSTR(t,k0);
								IF IFNULL(@tempt,'') ='' THEN 
										IF k0 = r('body') THEN
											 SET t = t;
											ELSE RETURN t;
										END IF;
									ELSE SET t = @tempt; 
								END IF;
								
								
-- IF i=1 THEN  RETURN k1; END IF;
						WHEN k0 REGEXP '^\\s*(?:\\--|\\{2})\s' THEN
							SET i = i+1;
							ITERATE loop1;
						WHEN k0 REGEXP '^cj' THEN
							CASE 
									WHEN k0 = 'cjg' THEN
										SET t = COLUMN_get(t,k1 AS CHAR);
								ELSE SET t = NULL;
							END CASE;
						WHEN k0 = 'j' THEN
							IF k1 IS NOT NULL THEN

								SET t = j(t,k1);
							END IF;
						WHEN k0 = 'dom2j' THEN
							SET t = dom2j(t);
						WHEN k0 = 'j2v' THEN
							SET t = j2v(t);
						WHEN k0 ='replace' AND IFNULL(CONCAT(k1,k2),'') <> '' THEN
							SET t = REPLACE(t,k1,k2);
						WHEN k0 = 'j1n' THEN
							SET t = j1n(t);
						WHEN k0 = 'b2jr' THEN 

							SET t = b2jr(t);
						WHEN k0 = 'b2j' THEN
							SET t = b2j(t);
						WHEN k0 REGEXP '(?i)(repl)ace\\s*,\\s*sub(str)?' AND CONCAT(k1,k2) IS NOT NULL  THEN

						SET t = REGEXP_replace(t,k2,REGEXP_substr(t,k1)) ;

					ELSE 	

 SET t = REGEXP_REPLACE(t,k0,k1);

				END CASE;
			END IF;


		SET i = i+1;
		ITERATE loop1;
	END loop;END;

	RETURN t;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `f1`
-- ----------------------------
DROP FUNCTION IF EXISTS `f1`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `f1`(`k` blob,`t` mediumblob) RETURNS mediumtext CHARSET utf8mb3
    READS SQL DATA
    DETERMINISTIC
BEGIN
	#Routine body goes here...
  
	RETURN filter(`k`,`t`);
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `f2`
-- ----------------------------
DROP FUNCTION IF EXISTS `f2`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `f2`(`k` blob,`t` mediumblob) RETURNS mediumtext CHARSET utf8mb3
    READS SQL DATA
    DETERMINISTIC
BEGIN
	#Routine body goes here...
  
	RETURN filter2(`k`,`t`);
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `f4b`
-- ----------------------------
DROP FUNCTION IF EXISTS `f4b`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f4b`(`p` longblob,k blob) RETURNS longblob
    DETERMINISTIC
p:BEGIN
	#Routine body goes here...
	DECLARE `rs` LONGTEXT DEFAULT NULL;DECLARE `jrs` LONGTEXT DEFAULT NULL;
	DECLARE `arr` TEXT DEFAULT NULL;
	DECLARE i INT(5) DEFAULT 0;
	DECLARE `l` INT(5) DEFAULT 20;
	DECLARE `jl` INT(5) DEFAULT -1;	
	
	DECLARE `t` VARCHAR(20) DEFAULT NULL;DECLARE `kword` varchar(200) DEFAULT NULL;DECLARE addr  INT(5) DEFAULT 0;
	
/*
	DECLARE CONTINUE HANDLER FOR  SQLSTATE '21S01', SQLSTATE '23000', SQLSTATE	'42000'	, SQLSTATE	'42S22' ,SQLSTATE '21000', SQLSTATE	'HY000'-- ,SQLSTATE	'22007'
	bl:BEGIN GET DIAGNOSTICS CONDITION 1 @`sqlstate` = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;SET  @`sqlstate` = JSON_OBJECT('sqlstate',@`sqlstate`,'errno',@errno,'text',CONCAT(i,@text));

				SET @`errsql` = p,@funcid =  NULL;
				SET @funcid = CONCAT_WS(' ','Error: ',(SELECT CONCAT_WS(', ',a.note,CONCAT_WS('',UPPER(SUBSTR(a.`name`,1,1)),LOWER(substr(a.`name`,2))),a.id) FROM mysq1_schema.qs AS a WHERE a.`name` = `funcid`)
									, ' 执行' ),
				@pp = QUOTE(p);
				CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp,'SQL',@`errsql`,'err',@`sqlstate`,'l',1,"继续执行",'0'));END;


START TRANSACTION;
SET @funcid = CONCAT_WS(' ',(SELECT CONCAT_WS(', ',a.note,CONCAT_WS('',UPPER(SUBSTR(a.`name`,1,1)),LOWER(substr(a.`name`,2))),a.id) FROM mysq1_schema.qs AS a WHERE a.`name` = `funcid`)
							, ' 执行' ),
		@pp = QUOTE(`p`);

CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp));COMMIT;*/
	IF IFNULL(`p`,'') = '' THEN RETURN NULL;END IF; 

	IF json_valid(k) THEN 

		SET t = Json_value(k,'$.t')
       ,kword = JSON_value(k,'$.k[0]');
	end IF ;


IF  json_value(`k`,'$.start') is NOT NULL THEN SET i =  json_value(`k`,'$.start') ; END IF;
 SET `arr` = JSON_EXTRACT(`k`,'$.done') ; 



  l:LOOP

		IF `jrs`is NOT NULL  AND json_length(`jrs`) = 0 THEN SET i= jl+1,jl=-1,jrs = NULL;END if; 

		IF i>=l+1 AND jrs IS NULL THEN LEAVE l;END if;
		
		IF `jrs`is  NULL AND   arr IS NOT NULL  AND json_valid(arr) THEN 
			IF JSON_length(arr)>0 THEN 
				SET i = JSON_VALUE(arr , '$[0]'),arr = json_REMOVE(arr,'$[0]');
				ELSE LEAVE l;
			END IF;
		END IF;


	
		CASE 	
		
					WHEN `Jl` >-1 AND json_length(`jrs`)>0  THEN 
						SET `rs` = JSON_EXTRACT(`jrs`,'$[0]'),jrs=JSON_REMOVE(jrs,'$[0]');

					WHEN `t` = 1 then SET `rs` =   r4b1(json_array(i,JSON_EXTRACT(`k`,'$.k[*]')));
					WHEN `t` REGEXP '^(?:react|2)$' then SET `rs` =   r4b2(json_array(i,JSON_EXTRACT(`k`,'$.k[*]')));
					WHEN `t` = 3 then SET `rs` =   r4b3(json_array(i,JSON_EXTRACT(`k`,'$.k[*]')));
					WHEN `t` = 4 then SET `rs` =   r4b_json(json_array(i,JSON_EXTRACT(`k`,'$.k[*]')));
					
			 ELSE SET `rs` =  r4b(json_array(i,json_value(`k`,'$[0]')));
		END case ;



		IF IFNULL(`rs`,'')='' THEN SET i = i-1;LEAVE l;END IF;

		IF json_length(`rs`)>0 AND JSON_DEPTH(`rs`)=3 AND jl = -1  THEN 

				SET jl= i,jrs=JSON_REMOVE(rs,'$[0]'),`rs` = JSON_EXTRACT(`rs`,'$[0]');

		END if;

		IF json_value(`rs`,'$[2]') = '' THEN RETURN i;END IF;


		CASE 
		WHEN json_extract( rs,'$[0]') IN('"-1"','"跳"') THEN SET @i = null; 
		WHEN json_extract( rs,'$[0]') = '-3' THEN RETURN 'p'; 
		WHEN CONVERT(json_value(`rs`,'$[1]')USING gbk) REGEXP '(?i)^(react|多多|c$)'   THEN BEGIN DECLARE `brs`  LONGBLOB DEFAULT NULL;DECLARE `res`  LONGBLOB DEFAULT NULL;DECLARE `trs`  LONGBLOB DEFAULT NULL;DECLARE `tr` LONGTEXT DEFAULT NULL;


					SET @rr0 := CONVERT(json_value(`rs`,'$[2]')using gbk),`res`= NULL;

					l0:LOOP

							SET addr =  REGEXP_instr(p,@rr0);		

							IF addr <= 0 OR IFNULL(p,'') = '' THEN LEAVE l0;END IF;

							SET `res` := CONCAT_WS('',`res`,substr(p,1,addr-1)),`brs`=json_remove(rs,'$[0]','$[0]')
									,`trs` = REGEXP_substr(p,@rr0);
							-- 移除头


							SET p = SUBSTR(p,addr+LENGTH(trs));
							-- 处理


							BEGIN

								l2:LOOP

												IF json_length(`brs`)<=1 THEN LEAVE l2;END if;

												SET  @rr1 :=CAST(json_value(`brs`,'$[1]') AS CHAR),@rr1s :=CAST(json_value(`brs`,'$[2]') AS CHAR)

														,@`res`=NULL,`brs`  = JSON_REMOVE(`brs`,'$[1]','$[1]');	
/**/

												IF  CAST(`trs` AS CHAR) NOT REGEXP  @rr1 THEN ITERATE l2;END IF;

									l3:loop   
SET @i = 1;
												l4:LOOP 


														SET addr = REGEXP_instr(cast(`trs`AS CHAR),@rr1);



														IF IFNULL(addr,0) <1 THEN LEAVE l4;END IF;
														SET @`res` := CONCAT_WS('',@`res`,substr(cast(`trs`AS CHAR),1,addr-1));
														-- 处

														set tr = REGEXP_substr(CAST(`trs` AS char),@rr1);


														SET trs = substr(CAST(`trs` AS char),addr+char_length(tr)) ;

														CASE 
																 WHEN  @rr1s REGEXP '(?i)`json(:\\w+)?`' THEN 

																	IF IFNULL(@rr1s,'')!='' AND NOT json_valid(@rr1s) THEN

																		SET @rr11 = REGEXP_replace(REGEXP_replace(tr,@rr1,'\\1'),'^:','') ;

																		IF @rr11 ='' THEN SET @rr11 = REGEXP_substr(@rr1s,'(?i)`json:\\K\\w+\\b');
																		END if;

																		SET @rr11 = json_extract(k,CONCAT('$.p.',@rr11));
																	END IF; 

																-- 	,',\\s?(?=[\"}])','\r\n')"
	
																	SET  @rr11 := REGEXP_replace(REGEXP_replace(REGEXP_replace(@rr11,'^\\{|\\}','')
																										,',\\s?(?=["}])','\r\n')
																										,'"((?:(?=\\\\).{2}|(?:(?=[^\\\\"]).))*?)"','\\1')
																			,@rr11 := REGEXP_replace(@rr1s,'(?i)`json:(\\w+)`',@rr11) ;
																			

																	
															ELSE
																SET @rr11 = @rr1s;
														END CASE;


												
													SET tr = REGEXP_replace(tr,REGEXP_replace(@rr1 , '\\Q(?<=\\E[^)]+?\\)|\\Q(?=\\E[^)]+?\\)','') ,@rr11);

												CASE 
															 WHEN  @rr1 REGEXP '(?i)\\Q(?#UPPER)\\E' THEN 

																set tr = UPPER(tr);
																														
															 WHEN  @rr1s REGEXP '(?i)`载入:(.*?)`' THEN 
																	
																			SET @rr11 := REGEXP_substr(tr,'(?i)`载入:\\K(.*?)(?=`)');

																			SET @rr11s := LOAD_FILE(@rr11),@rr11 = IF (@rr11s IS NULL ,CONCAT_WS(' ','无法载入',@rr11), @rr11s);

																			SET tr =  REGEXP_replace(tr,'(?i)`载入:.+?`',@rr11); 
															ELSE SET tr = tr ; 
												END CASE;
														-- 放回
if @rr1 = '(?is)<link[^>]+?(css/bill/(?:[^/"\\\']+/)*+[\\w\\.]+)\\b[^>]*?>e' AND @i = 1 THEN RETURN
tr
;END IF;

														SET  @`res` = CONCAT_WS('',@`res`,tr);
																-- @`@rss` = json_remove(@`@rss`,'$[1]','$[1]'); 



SET @i =@i+1;
												END loop;

											SET `trs` = CAST(CONCAT_WS('',@`res`,trs) AS CHAR),@`res`=NULL;

											IF  IF(json_value(rs,'$[0]')='l3', `trs` NOT REGEXP  @rr1 ,1) THEN 	leave l3;END IF;


									END loop l3;
							END loop;

							END;

							-- 放回

							SET `res` = CONCAT_WS('',`res`,trs);
			
					END loop;

				SET p = CONCAT_WS('',`res`,p);
				

				-- SET i =i +1;ITERATE l;

		END;

	
		 WHEN CONVERT(json_value(`rs`,'$[1]')USING gbk) REGEXP '^多(?!多)'   THEN
					BEGIN DECLARE `trs`  LONGBLOB DEFAULT NULL;DECLARE `tr` LONGTEXT DEFAULT NULL;




				IF p REGEXP  CONVERT(json_value(`rs`,'$[2]')using gbk) AND p NOT REGEXP CONVERT(CONCAT_WS('','(?ims)(',json_value(`rs`,'$[2]'),').*?(?1)')USING gbk)  THEN 


					SET `trs` = REGEXP_replace(p ,json_value(`rs`,'$[2]'),json_value(`rs`,'$[3]')) ,`rs` = json_remove(rs,'$[0]','$[0]','$[1]'); 

					l1:LOOP

						IF json_length(`rs`) <= 1 THEN LEAVE l1;END IF;

					if JSON_VALID(JSON_EXTRACT(`rs`,'$[1]')) AND JSON_EXTRACT(`rs`,'$[1]') REGEXP '^\\[' THEN
							SET @ddr =  CONVERT(JSON_value(`rs`,'$[1][0]')using gbk),@ddre = CONVERT(JSON_value(`rs`,'$[1][1]')using gbk),`rs` = json_remove(rs,'$[1]');
					 ELSE SET @ddr = CONVERT(JSON_value(`rs`,'$[1]')using gbk),@ddre = CONVERT(JSON_value(`rs`,'$[2]')using gbk),`rs` = json_remove(rs,'$[1]','$[1]');
					END if;

						IF `trs` REGEXP @ddr THEN 

							SET `trs` = REGEXP_replace(`trs`,@ddr,@ddre) ;
						END IF;


					END loop;

					SET p = REGEXP_replace(p ,CONVERT(json_value(`rs`,'$[0]') USING gbk),`trs`);
				END IF;

				-- SET i =i +1;ITERATE l;

		END;

		WHEN CONVERT(json_value(`rs`,'$[1]')USING gbk) REGEXP '^抓(?!取)'   THEN BEGIN DECLARE `trs`  LONGBLOB DEFAULT NULL;DECLARE `tr` LONGTEXT DEFAULT NULL;

				IF p REGEXP  CONVERT(json_value(`rs`,'$[2]')using gbk) AND p NOT REGEXP CONVERT(CONCAT_WS('','(?ims)(',json_value(`rs`,'$[2]'),').*?(?1)')USING gbk)  THEN 

 
					SET `trs` = REGEXP_substr(p ,json_value(`rs`,'$[2]')) ,`rs` = json_remove(rs,'$[0]','$[0]');

					l1:LOOP
						IF json_length(`rs`) = 1 THEN LEAVE l1;END IF;

						IF `trs` REGEXP CONVERT(json_value(`rs`,'$[1]')using gbk) THEN 

							SET `trs` = REGEXP_replace(`trs`,CONVERT(json_value(`rs`,'$[1]')using gbk),CONVERT(json_value(`rs`,'$[2]')using gbk)) ;
						END IF;

						SET `rs` = json_remove(rs,'$[1]','$[1]');	

					END loop;

					SET p = REGEXP_replace(p ,CONVERT(json_value(`rs`,'$[0]') USING gbk),`trs`);
				END IF;

		END;
		

		WHEN CONVERT(json_value(`rs`,'$[1]')USING gbk) REGEXP '^抓取' THEN
			
			SET p= REGEXP_replace(p
									,CONCAT_WS('','(?sm)^.*?(',CONVERT(json_value(`rs`,'$[2]')using gbk),').*?(?=(?1)|(?-m)$)')
									,'\\1'
								);

		 ELSE 

		  lend:LOOP 

					IF JSON_LENGTH(`rs`)<3 THEN LEAVE lend; end if;

					SET @rr1 := CONVERT(json_value(`rs`,'$[2]')using gbk),@rr1s := cast(json_value(`rs`,'$[3]')AS CHAR)
					     ,p = REGEXP_replace(p,@rr1,@rr1s)
					 ,rs = JSON_REMOVE(rs,'$[2]','$[2]')
							;

			END LOOP ;

		END case;

		IF p IS NULL OR  p = ''THEN RETURN json_array(i,json_value(`rs`,'$[2]'),json_value(`rs`,'$[3]'));END IF;
		SET  i = i+1;

	END LOOP;


RETURN p;
	RETURN  REGEXP_replace( p ,'<!DOCTYPE[^>]+>',CONCAT_WS('','\\0\n<!--',i,'-->'));

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Fetch`
-- ----------------------------
DROP FUNCTION IF EXISTS `Fetch`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Fetch`(`x` int(5),`y` int(5),`v` longtext) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
   IF NOT IFNULL(x,0) > 0 THEN
			RETURN NULL;
   END IF;

  CASE
		WHEN LEFT(v,1)="\"" THEN 
			SET  v := REPLACE(v,'\\\'',"\'");
		WHEN LEFT(v,1)="\'" THEN 
			SET  v := REPLACE(v,'\\\"',"\"");
    ELSE 
			RETURN NULL;
	END CASE;

  SET v := Fetch_y(y,v);

  SET v := Fetch_x(x,v);


	RETURN v;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Fetch_Elt`
-- ----------------------------
DROP FUNCTION IF EXISTS `Fetch_Elt`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Fetch_Elt`(`i` int(5),`v` longtext) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	DECLARE r LONGTEXT DEFAULT '\\s*\\K(?<c>(?:(?:"(?:\\\\.|[^"])*")|(?:\'(?:\\\\.|[^\'])*\')|(?:`[^`]*`)|(?:[^,"\'`]*))*)';

   CASE 
				WHEN IFNULL(i,0) <= 0   THEN RETURN NULL;
				WHEN i =1 THEN SET r = CONCAT('(?s)^',r);
 				WHEN i =2 THEN SET r = CONCAT('(?s)^(?&c)\\s*,',r);
			ELSE 	SET r = CONCAT('(?s)^\\s*(?&c)\\s*(?:,\\s*(?&c)){',i-2,'}\\s*,',r);
   END CASE;

	SET v =  REGEXP_substr(v,r);

	RETURN IF(IFNULL(v,'') = '',NULL ,v);
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Fetch_Set`
-- ----------------------------
DROP FUNCTION IF EXISTS `Fetch_Set`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `Fetch_Set`(`fieldsValue` varchar(2000),`num` int(3),`sepra` varchar(1)) RETURNS varchar(200) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...

	DECLARE i INT(5) ;
	DECLARE i1 INT(5);
	DECLARE w CHAR(5);
	DECLARE Lenth_ INT(5);

	IF fieldsValue IS NULL OR num IS NULL THEN
		RETURN NULL;
	END IF;

	
	IF sepra IS NULL OR trim(sepra) =',' THEN
		 SET sepra =',',
				fieldsvalue = CONCAT(',',REPLACE(fieldsvalue,',',',,'),',');
	END IF;

	SET i = 1,i1 = 0,w = 0 , Lenth_ = CHAR_LENGTH(fieldsvalue),@word = NULL ;

	label1:LOOP
  
		CASE 
				WHEN i > Lenth_ THEN
					LEAVE label1;
				WHEN SUBSTR(fieldsValue,i,1) = sepra THEN
					SET i1 = 1;
					label2:LOOP
						CASE 
							WHEN SUBSTR(fieldsvalue,i+i1,1) = '\\' THEN
								SET i1 = i1+2;
							WHEN i1+i > Lenth_ THEN
									LEAVE label2;
							WHEN SUBSTR(fieldsvalue,i+i1,1) = sepra THEN
								SET i1 = i1 +1;
									LEAVE label2;
							ELSE SET i1 = i1 + 1;
						END CASE ;
					END LOOP label2;

					SET w = w+1;
					IF w = NUM THEN
							SET @word = substr(fieldsvalue,i+1,i1-2);
							LEAVE label1;
					ELSE 
							SET i= i + i1;
					END IF;

				ELSE 
						SET i = i+1;

		END CASE;
/*
		set i = i+1;

		IF i = 999 then LEAVE label1;END IF;
*/
	END LOOP label1 ;

	RETURN @word;
-- CONCAT(@word,'_',w,'_',i,'_',i1);
-- concat(IFNULL(@word,'null'),'_',i,'_',fieldsvalue,'_',w) ;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Fetch_Set_P`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Fetch_Set_P`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Fetch_Set_P`(in `vstring` longtext,IN `x` int(3),IN `y` int(3))
BEGIN
	#Routine body goes here...
	 DECLARE EXIT  HANDLER FOR  SQLSTATE '42S22'  SET @reuslt =null; 
   DECLARE EXIT  HANDLER FOR SQLSTATE '42000' set @reulst =null;

   SET @results = NULL,@sb = NULL;
	 label1:LOOP

			 CASE
					WHEN x IS NOT NULL THEN 
						SET @sb = CAST(CONCAT("set @results = ELT(",x,",",vstring,")") as char),
									x = NULL;
					WHEN @results IS NOT NULL AND y IS NOT NULL THEN
						SET vstring = QUOTE(@results),
								@sb = CAST(CONCAT("set @results = ELT(",y,",",@results,")") as char),
									y = NULL;
					ELSE 
						LEAVE label1;

			 END CASE;

		 PREPARE stmt FROM @sb;
		 EXECUTE stmt;

	 END LOOP ;

	 DEALLOCATE PREPARE stmt;
 -- 

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Fetch_Set_P0`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Fetch_Set_P0`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Fetch_Set_P0`(in `vstring` longtext,IN `x` int(3),out `results_` longtext)
p0:BEGIN
	#Routine body goes here...
	 DECLARE EXIT  HANDLER FOR  SQLSTATE '42S22' SET results_ =null; 
 	 DECLARE EXIT  HANDLER FOR  SQLSTATE '42000' SET results_ =null; 
-- SELECT vstring NOT REGEXP  '^[[:alnum:]]{1,}(,[[:alnum:]]{1,}){0,}$' ; LEAVE p0;
		CASE 
      WHEN  x IS  NULL THEN  
				LEAVE p0;
			WHEN vstring NOT REGEXP  '^[[:alnum:]]{1,}(,[[:alnum:]]{1,}){0,}$' THEN
				LEAVE p0;			
			ELSE 
				SET @results = NULL,@sb = NULL;
		END CASE;
	 label1:LOOP

			 CASE
					WHEN x IS NOT NULL THEN 
						SET vstring = CONCAT("'",replace(vstring,',','\',\''),"'"),
								@sb = CONCAT("set @results = ELT(",x,",",vstring,")"),
									x = NULL;
					ELSE 
						LEAVE label1;
			 END CASE;

		 PREPARE stmt FROM @sb;
		 EXECUTE stmt;
	 END LOOP ;
	 DEALLOCATE PREPARE stmt;
	SET results_ = @results; 
--   SELECT @results;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Fetch_Set_P1`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Fetch_Set_P1`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Fetch_Set_P1`(in `vstring` longtext,IN `x` int(3),out `results_` longtext)
p1:BEGIN
	#Routine body goes here...
	 DECLARE EXIT  HANDLER FOR  SQLSTATE '42S22'  SET results_ =null; 
 	 DECLARE EXIT  HANDLER FOR  SQLSTATE '42000'  SET results_ =null; 

		CASE 
      WHEN  x IS  NULL THEN  
				LEAVE p1;
/*			WHEN vstring NOT REGEXP  '^[[:alnum:]]{1,}(,[[:alnum:]]{1,}){0,}$' THEN
				LEAVE p1;	
*/			WHEN IFNULL(vstring,'') = '' THEN 
					LEAVE p1;
				ELSE 
				SET @results = NULL,@sb = NULL;
		END CASE;
  SET @results = NULL,@sb = NULL;
	 label1:LOOP

			 CASE
					WHEN x IS NOT NULL THEN 
						SET 	@sb = CONCAT("set @results = ELT(",x,",",vstring,")"),
									x = NULL;

					ELSE 
						LEAVE label1;

			 END CASE;

		 PREPARE stmt FROM @sb;
		 EXECUTE stmt;

	 END LOOP ;

	 DEALLOCATE PREPARE stmt;
--  SELECT @results;
	SET results_ = @results; 
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Fetch_Set_P2`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Fetch_Set_P2`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Fetch_Set_P2`(in `vstring` longtext,IN `x` int(3),IN `y` int(3),out `results_` longtext)
BEGIN
	#Routine body goes here...
	 DECLARE EXIT  HANDLER FOR  SQLSTATE '42S22'  SET results_ =null; 
 	 DECLARE EXIT  HANDLER FOR  SQLSTATE '42000'  SET results_ =null; 
   SET @results = NULL,@sb = NULL;
	 label1:LOOP

			 CASE
					WHEN x IS NOT NULL THEN 
						SET @sb = CONCAT("set @results = ELT(",x,",",vstring,")"),
									x = NULL;
					WHEN @results IS NOT NULL AND y IS NOT NULL THEN
						SET vstring = QUOTE(@results),
								@sb = CONCAT("set @results = ELT(",y,",",@results,")"),
									y = NULL;
					ELSE 
						LEAVE label1;

			 END CASE;

		 PREPARE stmt FROM @sb;
		 EXECUTE stmt;

	 END LOOP ;

	 DEALLOCATE PREPARE stmt;
 -- SELECT @results;
	SET results_ = @results; 
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Fetch_Set_Pop`
-- ----------------------------
DROP FUNCTION IF EXISTS `Fetch_Set_Pop`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `Fetch_Set_Pop`(`fieldsValue` varchar(2000),`num` int(3),`sepra` varchar(1)) RETURNS varchar(2000) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
/*Routine body goes here... 
 1406
*/
	DECLARE i INT(5) ;
	DECLARE i1 INT(5);
	DECLARE w CHAR(5);
	DECLARE Lenth_ INT(5);
	CASE 
		WHEN fieldsValue IS NULL OR num IS NULL THEN
			RETURN NULL;
		WHEN fieldsValue = '' THEN
			RETURN '';
		WHEN num = 0 THEN 
			RETURN fieldsValue ;
		ELSE
			IF sepra IS NULL  THEN
					SET sepra =',',
						fieldsvalue = CONCAT(',',REPLACE(fieldsvalue,',',',,'),','),
						@sepra = NULL;
				ELSE 
					SET @sepra =1;
				END IF;
			SET i = 1,i1 = 0,w = 0 , Lenth_ = CHAR_LENGTH(fieldsvalue),@word = NULL ;			
	END CASE;
	IF NUM*2-1 > Lenth_ THEN
			RETURN TRIM(',' FROM REPLACE(@word,',,',','));
	END IF;
	label1:LOOP
 		CASE 
				WHEN i > Lenth_ THEN
					LEAVE label1;
				WHEN SUBSTR(fieldsValue,i,1) = sepra THEN
					SET i1 = 1;
					label2:LOOP
						CASE 
							WHEN SUBSTR(fieldsvalue,i+i1,1) = '\\' THEN
								SET i1 = i1+2;
							WHEN i1+i > Lenth_ THEN
									LEAVE label2;
							WHEN SUBSTR(fieldsvalue,i+i1,1) = sepra THEN
								SET i1 = i1 +1;
									LEAVE label2;
							ELSE SET i1 = i1 + 1;
						END CASE ;
					END LOOP label2;

					SET w = w+1;
					IF w = NUM THEN

									SET @word = concat(sepra,substr(fieldsvalue,i+1,i1-2),sepra,SUBSTR(fieldsvalue,1,i-1),SUBSTR(fieldsvalue,i+i1+1)),
											@word = REVERSE(@word),
											NUM = CHAR_LENGTH(substring_index(@word,sepra,1)),
											@word = REVERSE(SUBSTR(@word,num+1));

							IF @sepra IS NULL THEN	
								SET @word =  TRIM(',' FROM REPLACE(@word,',,',','));
							END IF;
							LEAVE label1;
					ELSE 
							SET i= i + i1;
					END IF;

				ELSE 
						SET i = i+1;

		END CASE;
/*
		set i = i+1;

		IF i = 999 then LEAVE label1;END IF;
*/
	END LOOP label1 ;

	RETURN @word;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Fetch_Set_values`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Fetch_Set_values`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Fetch_Set_values`(IN `fieldvalues` longtext,in `fields_` varchar(200),OUT `resultvalues` longtext)
BEGIN
	#Routine body goes here...
	DECLARE n INT(2);
	SET n = 1,@results = NULL;

-- 	SELECT @results ,fieldvalues,n,1;
	label1:LOOP
-- SELECT @results ,fieldvalues,n,1;
		CALL Fetch_Set_P(fieldvalues,n,1);
-- SELECT @results;
		CASE 
			WHEN @results = fields_ THEN
				CALL Fetch_Set_P(fieldvalues,n,NULL);

				SET fieldvalues = @results,
		-- 				fieldvalues = Fetch_Set_Pop(fieldvalues,1,'\''),
						resultvalues = SUBSTR(fieldvalues,CHAR_LENGTH(FIELDS_ )+4);
					-- 	resultvalues = SUBSTR(resultvalues,CHAR_LENGTH(resultvalues)+1);
					
				LEAVE label1;
			WHEN @results is NULL THEN 
				LEAVE label1;
			ELSE 
				SET n= n+1;
		END CASE ;
	END LOOP;
-- SELECT resultvalues,n,fieldvalues ;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Fetch_Sub`
-- ----------------------------
DROP FUNCTION IF EXISTS `Fetch_Sub`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Fetch_Sub`(`y` text,`v` longtext) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...

	DECLARE rs LONGTEXT DEFAULT NULL;
	DECLARE r LONGTEXT DEFAULT NULL;
	DECLARE i TINYINT DEFAULT 0 ;	

  IF y IS NULL OR NOT PREG_RLIKE('/^\\w+(,\\w)*$/',y)  THEN
		RETURN NULL;
  END IF;


	CASE
		WHEN LEFT(v,1)="\"" THEN 
			SET  v := REPLACE(v,'\\\'',"\'");
		WHEN LEFT(v,1)="\'" THEN 
			SET v = preg_replace(CONCAT('/\'(?=\\Q\\\'\\E)|(?<=\\Q\\\'\\E)\'/'),'"',v);
    ELSE RETURN NULL;
	END CASE;

 	fs:LOOP 
		
		SET i := i+1,
				r := preg_capture(CONCAT('/(?<=\")(\'',i,'.*?)(?=\",\"\'',i+1,'\')/'),v);
 -- RETURN v;
		IF r IS NULL THEN 
			SET r := preg_capture(CONCAT('/(?<=\")\'',i,'\',(.*?)(?=\"$)/'),v);
		END IF;
		IF r IS NULL THEN  LEAVE fs; END IF;

		SET 
				r :=Fetch_Sub_l(y,r),
 				rs := CONCAT_WS(',',rs,CONCAT('"',r,'"'));

 	END LOOP;

	RETURN rs;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Fetch_Sub_l`
-- ----------------------------
DROP FUNCTION IF EXISTS `Fetch_Sub_l`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Fetch_Sub_l`(`y` text,`v` longtext) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	DECLARE rs LONGTEXT DEFAULT NULL;
	DECLARE r LONGTEXT DEFAULT NULL;
	DECLARE i TINYINT DEFAULT 0 ;	

  IF NOT IFNULL(y,0) >0  THEN
		RETURN NULL;
  END IF;
	SET rs:= QUOTE(preg_capture(CONCAT('/(?<=^\')\\d+(?=\')/'),v));


 	subl:LOOP 
		
		SET i := i+1,
        r := Fetch_Elt(i,y);
		IF r IS NULL THEN LEAVE subl; END IF;

		SET r :=Fetch_x(r,v),
				rs := CONCAT_WS(',',rs,QUOTE(r));
	END LOOP subl;

	RETURN CAST(rs AS CHAR);

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Fetch_x`
-- ----------------------------
DROP FUNCTION IF EXISTS `Fetch_x`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Fetch_x`(`x` int(5),`v` longtext) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	DECLARE rs LONGTEXT DEFAULT NULL;



   IF NOT IFNULL(x,0) > 0 THEN
			RETURN NULL;
   END IF;

  CASE
		WHEN LEFT(v,1)="\"" THEN 
			SET  v := REPLACE(v,'\\\'',"\'");
		WHEN LEFT(v,1)="\'" THEN 
			SET  v := REPLACE(v,'\\\"',"\"");
    ELSE RETURN NULL;
	END CASE;

  SET rs := NULL,
			rs := preg_capture(CONCAT('/(?<=\',\')(.*?)(?=\',\')/'),v,1,x);

	IF rs IS NULL THEN
		SET rs := preg_capture(CONCAT('/(?<=\',\')(.*?)(?=\')/'),v,1,x);
	END IF;
 
	RETURN rs;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Fetch_y`
-- ----------------------------
DROP FUNCTION IF EXISTS `Fetch_y`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Fetch_y`(`y` int(5),`v` longtext) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	DECLARE r LONGTEXT DEFAULT NULL;

  IF NOT IFNULL(y,0) >0  THEN
			RETURN NULL;
  END IF;

  CASE
		WHEN LEFT(v,1)="\"" THEN 
			SET  v := REPLACE(v,"\\\'","\'");
		WHEN LEFT(v,1)="\'" THEN 
			SET  v := REPLACE(v,'\\\"',"\"");
    ELSE RETURN NULL;
	END CASE;

	SET v = REGEXP_substr(v,CONCAT('(?s)\"\'',y,'\',(.*?)(?=,\"\'\\d+\'|$)'));


	RETURN v;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Fetch_y_1`
-- ----------------------------
DROP FUNCTION IF EXISTS `Fetch_y_1`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Fetch_y_1`(`y` int(5),`v` longtext) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
		IF NOT IFNULL(y,0) >0  THEN
			RETURN NULL;
		END IF;

		SET v = Fetch_y(y,v),
				v = REGEXP_SUBSTR(v,'(?s)(?:^"\'\\d+\',)\\K(.*)(?="$)');
		RETURN v;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Fielter_Set`
-- ----------------------------
DROP FUNCTION IF EXISTS `Fielter_Set`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `Fielter_Set`(`vstring` varchar(20000)) RETURNS varchar(400) CHARSET utf8mb3
    NO SQL
BEGIN
	#Routine body goes here...
	DECLARE i INT(5);
	DECLARE results VARCHAR(500);
	DECLARE w VARCHAR(30);

	IF vstring is NULL THEN RETURN NULL; END IF;

	SET i =1,w  =NULL ;
	SET results = SUBSTRING_INDEX(vstring ,',',1),
		  vstring = SUBSTR(vstring, CHAR_LENGTH(results)+2);
	
	label1:LOOP
			SET w = SUBSTRING_INDEX(vstring ,',',1),
					vstring = SUBSTR(vstring, CHAR_LENGTH(w)+2);

			CASE 
					WHEN w = ''  THEN 
							LEAVE label1;
 					WHEN FIND_IN_SET(w,results) = 0 THEN
							SET results =CONCAT(results,',',w);
							ITERATE label1;
					ELSE 
						SET w = ''; 
			END CASE;
	END LOOP;
	RETURN results;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `fileds_update_temp`
-- ----------------------------
DROP FUNCTION IF EXISTS `fileds_update_temp`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fileds_update_temp`(`fieldsName` varchar(400),`fieldsValue` varchar (4000),`sepera` varchar(5)) RETURNS varchar(5000) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
--  return concat(fieldsname,'----',fieldsvalue);
	SET @fields_ = '',@d='';
	IF  
		sepera  IS NULL  THEN 
			SET sepera =','; 
		ELSEIF sepera REGEXP '^[[:alnum:]]+$' THEN
			SET  sepera = CONCAT( ' ',sepera,' ');
	END IF;

  REPEAT
-- 		SET @d = LEFT(fieldsName,1);

		SET 
			@d = SUBSTRING_INDEX(fieldsName,',',1), 
			fieldsName = SUBSTR(fieldsName,CHAR_LENGTH(@d)+1),
			@fields_ = CONCAT(@fields_,@d),
			@d = LEFT(fieldsValue,1);

			IF @d ='\'' then
				SET @vp=1,@char_1 = NULL ;
				fetch_value: LOOP	
					set @vp = @vp+1,
							@char_1 = substr(fieldsvalue,@vp,1);

					CASE 
							WHEN @char_1 = '\\' THEN
								set @vp = @vp + 1;
							WHEN @char_1 = '\'' THEN

								LEAVE fetch_value;
							WHEN LENGTH(@char_1) = 0 THEN
								LEAVE fetch_value;
/*							WHEN @vp=10 then 
								RETURN  @fields_; */
							ELSE ITERATE fetch_value;
			
					END CASE;
					

				END LOOP fetch_value;
				SET @d = substr(fieldsvalue,1,@vp);
			ELSE
				SET @d = 'NULL';
			END IF;
-- RETURN CONCAT(@d,'_',@fields_,'_',substr(fieldsvalue,@vp),'_',CONCAT(@fields_,'=',@d)) ;			
-- skip 后 package char 			
		SET fieldsValue = substr(fieldsvalue,@vp+1),  
					@fields_ = CONCAT(@fields_,'=',@d);


		IF LEFT(fieldsName,1)=',' THEN 
			SET fieldsName = SUBSTR(fieldsName,2);
 			IF LEFT(fieldsValue,1)=',' then 
					SET fieldsValue = SUBSTR(fieldsValue,2),
							@fields_ = CONCAT(@fields_,sepera);
 			END IF;
-- RETURN CONCAT(fieldsname,'_',fieldsvalue);
		END IF;

		UNTIL LENGTH(fieldsName) = 0 or LENGTH(fieldsValue) = 0
	END REPEAT;

 	RETURN replace(@fields_,'dyh','\\\'');
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `fillp`
-- ----------------------------
DROP FUNCTION IF EXISTS `fillp`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fillp`(`a` varchar(1000)) RETURNS varchar(2000) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	DECLARE a1 VARCHAR(5) DEFAULT NULL;
	DECLARE a2 VARCHAR(5) DEFAULT NULL;
	DECLARE i TINYINT(5) DEFAULT 0;

  IF IFNULL(a,'')  =  '' THEN RETURN a; END IF; 
  IF NOT preg_RLIKE('/^(\\d+,?)+$/',a) THEN RETURN a; END IF;

	SET	i = 1,@r = NULL,a2 =c(preg_capture('/[^,]+/',a,0,1));

	SET	@r = CONCAT_WS('',REPEAT('0,',a2-1),a2);
/**/
 l:LOOP

		SET a1 = preg_capture('/[^,]+/',a,0,i),
				i= i+1;

		SET a2 = preg_capture('/[^,]+/',a,0,i);

		IF a2 = a1  THEN LEAVE l; END IF;

		SET @r = CONCAT_WS('',@r,',',REPEAT('0,',a2-a1-1),a2);

	END LOOP;
  

	RETURN @r;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `filter`
-- ----------------------------
DROP FUNCTION IF EXISTS `filter`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `filter`(`k` blob,`t` longblob) RETURNS longtext CHARSET utf8mb3
    READS SQL DATA
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	DECLARE k1 BLOB DEFAULT NULL;
	DECLARE k2 BLOB DEFAULT NULL;
	DECLARE k3 VARCHAR(1000) DEFAULT NULL;
	DECLARE ic VARCHAR(1000) DEFAULT COLUMN_list(k);
	DECLARE i INT(5) DEFAULT 0;
  
	loop1:LOOP
		SET i := i+1, k1 = COLUMN_get(`k`,REPLACE(Fetch_Elt(i,ic),'`','') AS BINARY );
	

		CASE 
				 WHEN k1 IS NULL THEN LEAVE loop1;
				 WHEN NOT  COLUMN_CHECK(k1) THEN 
					 SET	k3 = COLUMN_get(`k`,3 AS CHAR),k2 = COLUMN_get(`k`,2 AS CHAR),k1 = COLUMN_get(`k`,1 AS CHAR),
								ic = NULL;
			ELSE
				SET	k3 = COLUMN_get(k1,3 AS CHAR),k2 = COLUMN_get(k1,2 AS CHAR),k1 = COLUMN_get(k1,1 AS CHAR);
		END CASE;

-- IF i =2 THEN RETURN k2;END if;
		IF IFNULL(k1,'') ='' THEN  ITERATE loop1 ; END IF;

		IF k2 IS NULL THEN SET k2 = ''; END IF;

		CASE
				WHEN IFNULL(k2,'') != '' AND   k2 REGEXP 'cap' THEN  
						
						SET @tempt = NULL,
								@tempt =	REGEXP_SUBSTR(t,k1);
						IF IFNULL(@tempt,'') ='' THEN 
									IF k1 = r('body') THEN
										 SET t = t;
										ELSE RETURN t;
									END IF;
								ELSE SET t = @tempt; 
							END IF;


				WHEN k1 REGEXP '^\\s*(?:\\--|\\{2})\s' THEN
							SET i = i+1;
							ITERATE loop1;
				WHEN k1 REGEXP '^cj' THEN
							CASE 
									WHEN k1 = 'cjg' THEN
										SET t = COLUMN_get(t,k2 AS CHAR);
								ELSE SET t = NULL;
							END CASE;
				WHEN k1 = 'j' THEN
							IF k2 IS NOT NULL THEN

								SET t = j0(t,k2);
							END IF;
				WHEN k1 = 'dom2j' THEN
							SET t = dom2j(t);
				WHEN k1 = 'j2v' THEN
							SET t = j2v(t);
				WHEN k1 ='replace' AND IFNULL(CONCAT(k2,k3),'') <> '' THEN
							SET t = REPLACE(t,k2,k3);
				WHEN k1 = 'j1n' THEN
							SET t = j1n(t);
				WHEN k1 = 'b2jr' THEN 
							SET t = b2jr(t);
				WHEN k1 = 'b2j' THEN
							SET t = b2j(t);
				WHEN k1 REGEXP '(?i)(repl)ace\\s*,\\s*sub(str)?' AND CONCAT(k2,k3) IS NOT NULL  THEN
						SET t = REGEXP_replace(t,k3,REGEXP_substr(t,k2)) ;
			ELSE 
-- RETURN 'ok';
	SET t = REGEXP_REPLACE(t,k1,k2); 

		END CASE;
	END loop;

	RETURN t;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `filter1`
-- ----------------------------
DROP FUNCTION IF EXISTS `filter1`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `filter1`(`k` blob,`t` longblob) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	DECLARE k1 VARCHAR(1000) DEFAULT NULL;
	DECLARE k2 VARCHAR(1000) DEFAULT NULL;
	DECLARE k3 VARCHAR(1000) DEFAULT NULL;
	DECLARE i INT(5) DEFAULT 0;
-- RETURN t;
	loop1:LOOP
		SET k1 = preg_capture(CONCAT('/(?:(?:\\s*.+\\n){',i,'}\\s*)(.+)(?=[\\n]|$)/'),k,1);

		IF k1 IS NULL THEN LEAVE loop1;END IF;

			SET	k3 = preg_capture('/(?:(?:[^\\n\\t]+\\t+)){2}([^\\n\\t]+)/',k1,1),
					k2 = preg_capture('/(?:(?:[^\\n\\t]+\\t+))([^\\n\\t]+)/',k1,1),
					k1 = preg_capture('/([^\\n\\t]+)/',k1);

			IF k2 IS NULL THEN SET k2 = ''; END IF;

			IF IFNULL(k1,'') != ''  THEN
				CASE
						WHEN IFNULL(k2,'') != '' AND   k2 REGEXP 'cap' THEN  

								SET @tempt = NULL,
										@tempt =	REGEXP_SUBSTR(t,k1);
								IF IFNULL(@tempt,'') ='' THEN 
										IF k1 = r('body') THEN
											 SET t = t;
											ELSE RETURN t;
										END IF;
									ELSE SET t = @tempt; 
								END IF;

					ELSE 	SET t = REGEXP_REPLACE(t,k1,k2);  
				END CASE;
			END IF;


		SET i = i+1;
		
		ITERATE loop1;
	END loop;
	RETURN t;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `filter2`
-- ----------------------------
DROP FUNCTION IF EXISTS `filter2`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `filter2`(`k` blob,`t` longblob) RETURNS longblob
    READS SQL DATA
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	DECLARE k1 VARCHAR(1000) DEFAULT NULL;
	DECLARE k2 VARCHAR(1000) DEFAULT NULL;
	DECLARE k3 VARCHAR(1000) DEFAULT NULL;
	DECLARE i INT(5) DEFAULT 0;

	loop1:LOOP
		SET k1 = preg_capture(CONCAT('/(?:(?:\\s*.+[\\n\\r]+){',i,'}\\s*)(.+)(?=[\\n\\r]+|$)/'),k,1);

		IF k1 IS NULL THEN LEAVE loop1;END IF;

			SET	k3 = preg_capture('/(?:(?:[^\\n\\t]+\\t+)){2}([^\\n\\t]+)/',k1,1),
					k2 = preg_capture('/(?:(?:[^\\n\\t]+\\t+))([^\\n\\t]+)/',k1,1),
					k1 = preg_capture('/([^\\n\\t]+)/',k1);

			IF k2 IS NULL THEN SET k2 = ''; END IF;

			IF IFNULL(k1,'') != ''  THEN
				CASE
						WHEN IFNULL(k2,'') != '' AND   k2 REGEXP 'cap' THEN  
							
								SET @tempt = NULL,
										@tempt =	REGEXP_SUBSTR(t,k1);
								IF IFNULL(@tempt,'') ='' THEN 
										IF k1 = r('body') THEN
											 SET t = t;
											ELSE RETURN t;
										END IF;
									ELSE SET t = @tempt; 
								END IF;
								
								
-- IF i=1 THEN  RETURN k2; END IF;
						WHEN k1 REGEXP '^\\s*(?:\\--|\\{2})\s' THEN
							SET i = i+1;
							ITERATE loop1;
						WHEN k1 REGEXP '^cj' THEN
							CASE 
									WHEN k1 = 'cjg' THEN
										SET t = COLUMN_get(t,k2 AS CHAR);
								ELSE SET t = NULL;
							END CASE;
						WHEN k1 = 'j' THEN
							IF k2 IS NOT NULL THEN

								SET t = j0(t,k2);
							END IF;
						WHEN k1 = 'dom2j' THEN
							SET t = dom2j(t);
						WHEN k1 = 'j2v' THEN
							SET t = j2v(t);
						WHEN k1 ='replace' AND IFNULL(CONCAT(k2,k3),'') <> '' THEN
							SET t = REPLACE(t,k2,k3);
						WHEN k1 = 'j1n' THEN
							SET t = j1n(t);
						WHEN k1 = 'b2jr' THEN 

							SET t = b2jr(t);
						WHEN k1 = 'b2j' THEN
							SET t = b2j(t);
						WHEN k1 REGEXP '(?i)(repl)ace\\s*,\\s*sub(str)?' AND CONCAT(k2,k3) IS NOT NULL  THEN

						SET t = REGEXP_replace(t,k3,REGEXP_substr(t,k2)) ;
-- RETURN CONCAT_WS(',',QUOTE(k3),QUOTE(k2));;
					ELSE 	

 SET t = REGEXP_REPLACE(t,k1,k2); 
-- RETURN k1;
				END CASE;
			END IF;

--  RETURN k1;
		SET i = i+1;
		ITERATE loop1;
	END loop;
	RETURN t;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `fini`
-- ----------------------------
DROP FUNCTION IF EXISTS `fini`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fini`(`p` blob) RETURNS blob
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
DECLARE k TINYblob DEFAULT NULL;DECLARE r blob DEFAULT p;DECLARE i INT DEFAULT 0;
	SET r = REGEXP_replace(p,',?"[ab]\\d+":(null|"[^"]?"),?|"b\\d+":|,?}|["{]','')
		,r = REGEXP_replace(r,'b(\\d+)\\[(\\d+)\\]','"\\2":"\\1"')
		,r = CONCAT('{',r,'}')
		
;
    IF NOT json_valid(r) THEN RETURN p;END IF;
SET p = r,k = json_keys(r),r='{}';
l: LOOP
    
		 IF i>=json_length(k) THEN LEAVE l;END IF;
		-- IF i>2 THEN LEAVE l;END IF;
		SET r = JSON_MERGE(r
							,json_object(json_value(k,CONCAT('$[',i,']'))+1,json_extract(p
								,CONCAT('$**.',json_value(k,CONCAT('$[',i,']')))
							))
						)
;SET i=i+1;
END LOOP ;

	RETURN JSON_COMPACT(
REGEXP_replace(REGEXP_replace(REGEXP_replace(r,'("\\d+")(?!:)','\\1:"1"'),'\\[','{'),']','}')
);
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `fkey`
-- ----------------------------
DROP FUNCTION IF EXISTS `fkey`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fkey`(`b` blob) RETURNS blob
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	DECLARE reg BLOB  DEFAULT R('`seafilter`'); DECLARE rep VARCHAR(200) DEFAULT '[a-f47]';

	RETURN REGEXP_replace(b,reg,'');
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `flow`
-- ----------------------------
DROP PROCEDURE IF EXISTS `flow`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `flow`(IN `p` blob)
flowl:BEGIN
	#Routine body goes here...
/*
  0,3 选择岗位;
	2 显示流程
*/
	DECLARE `p2` BLOB DEFAULT j0(`p`,'p2'); DECLARE `funcid` VARCHAR(60) DEFAULT j0(`p2`,'funcid');DECLARE `b` BLOB DEFAULT NULL;

  DECLARE EXIT HANDLER FOR  SQLSTATE '23000', SQLSTATE	'42000' , SQLSTATE	'42S22'	errl:BEGIN CALL `ERRORS`(COLUMN_create(
	'm',CONCAT_WS(':','Error flow',j0(`p2`,'funcid')),'SQL',@`sql_body`,'pp',`p`
	));END;
/*
-- start TRANSACTION;
CALL Audit_3(COLUMN_create('m',CONCAT_WS(':','flow :' ,j0(`p`,'funcid')),'SQL','','pp',`p`));COMMIT;
-- INSERT INTO plogs (Function_Name,parameter) VALUES ('flow',`p`);LEAVE flowl; */



	IF IFNULL(`p2`,'')= '' OR IFNULL(@courseNo := j0(`p`,"courseNo"),'')= '' THEN 
			CALL `ERROR`('sp:no p2 or courseNo');
		ELSE SET @flow_body = NULL;
	END IF;

	CASE 
			WHEN  `funcid` = 0 OR `funcid` = 3 THEN 
			BEGIN

				SET	@flow_body := r4('gangwei'),
						@flow_body = CONVERT(r5( 
IF((@roleids := j0(p,'roleids')) IS  NULL, @flow_body,REGEXP_replace(@flow_body
,@r:='(?is)\\((?=\'enterlis\')(.*?)(?<=CAST\\()(.*?)(?=\\)AS\\s+CHAR\\)as\\sroleli)'
,CONCAT_WS('',"('roleids','",@roleids,"',\\1REGEXP_replace(\\2 ),CONCAT_WS('','(?i)\\\\\\\\s(?=roleid=\"(",@roleids,")\")'),' checked '")
))
,`p`)USING gbk);



			END;


			WHEN `funcid` = 2 THEN 

			SET @flow_body := r5(r4('flowp1$'),''),
		 			@flow_body := CONCAT_WS(''	,"CONCAT_WS('','"
																		,REGEXP_replace(REGEXP_replace(REGEXP_replace(REGEXP_replace(@flow_body
																				,'(?i)(?<=>)(@`.*?`)',@flow_body:=CONCAT("\',regexp_replace(\\1,",QUOTE(CONCAT(REPEAT('\\',2),'n')),",'<br>')",",'"))
 																				,'(?i)(?<=title=)(@`.*?`)',REGEXP_replace(@flow_body,"(?<=',)(.+?)(?=,'$)",'QUOTE(\\1)'))
 	 																			,'(?i)(@`c\\d+`)',"',QUOTE(CONCAT_WS('','c',@`flow`)),'")
																			 	,'(?m)[\\n\\r]+',CONCAT(REPEAT('\\',4),'n'))
																		,"')AS d"),
					@flow_body := CONCAT_WS('\n',REGEXP_replace(r5(r4('newflow$'),p2),'(?im)^(FROM|\\t{2}FROM\\(\\t)(?=\\s+)',CONCAT('\n,',@flow_body,'\n\\1'))),
					@flow_body = CONCAT_WS('\n',"SELECT\nCAST(COLUMN_json(COLUMN_create('processLine',GROUP_CONCAT(a.d SEPARATOR ",QUOTE(R4('flowl$'))
															,")AS CHAR)) AS CHAR)AS dblob","FROM(",@flow_body
															,")AS a")/**/
;

		ELSE CALL Error('flow:someting wrong!');
	END CASE;


-- SELECT  'ok',@flow_body; LEAVE flowl;

	PREPARE flow_stmt from  @flow_body;
	EXECUTE flow_stmt ;
	DEALLOCATE PREPARE flow_stmt ;/**/

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `funcSysLongin`
-- ----------------------------
DROP PROCEDURE IF EXISTS `funcSysLongin`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `funcSysLongin`(IN `func_id` TINYINT (2),IN `userName`  Text,IN `userPassWd` Text)
BEGIN
	#Routine body goes here...
  CALL `mysq1_schema`.`funcSysLongin`(func_id,userName,userPassWd);
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Func_Cnum2num`
-- ----------------------------
DROP FUNCTION IF EXISTS `Func_Cnum2num`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Func_Cnum2num`(`field_` longtext) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	DECLARE result_ LONGTEXT;
	DECLARE i INT(10);
  DECLARE a VARCHAR(1) ;
	SET i= 1,result_='',field_ = TRIM(field_);
	label1:LOOP 
			SET a = SUBSTR(field_,1,1);
			CASE a
					WHEN '１' THEN SET a = '1';
					WHEN '２' THEN SET a = '2';
					WHEN '３' THEN SET a = '3';
					WHEN '４' THEN SET a = '4';
					WHEN '５' THEN SET a = '5';
					WHEN '６' THEN SET a = '6';
					WHEN '７' THEN SET a = '7';
					WHEN '８' THEN SET a = '8'; 
					WHEN '９' THEN SET a = '9';
					WHEN '０' THEN SET a = '0';
					WHEN '（' THEN SET a = '(';
					WHEN '）' THEN SET a = ')';
					WHEN '－' THEN SET a = '-';
					ELSE SET a = a;
			END CASE ;
			SET result_ = CONCAT_WS('',result_,A),
					field_  = SUBSTR(field_,2);
			IF CHAR_LENGTH(field_) = 0 THEN
					LEAVE label1;
			END IF;
	END LOOP;

	RETURN result_;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `func_file_type`
-- ----------------------------
DROP FUNCTION IF EXISTS `func_file_type`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `func_file_type`(`Head_blob` blob) RETURNS text CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	

	DECLARE Result_set TEXT;
	DECLARE wide_P CHAR(11);
	DECLARE high_p CHAR(11);

	SET Result_set = HEX(SUBSTR(Head_blob,1,8));
	CASE 
			WHEN Result_set = '89504E470D0A1A0A' THEN 
				SET wide_p = HEX(SUBSTR(Head_blob,17,4)),
						high_p = HEX(SUBSTR(Head_blob,21,4));
			WHEN Result_set LIKE "474946%" THEN
				SET wide_p = CONCAT(HEX(SUBSTR(Head_blob,8,1)),HEX(SUBSTR(Head_blob,7,1))),
						high_p = CONCAT(HEX(SUBSTR(Head_blob,10,1)),HEX(SUBSTR(Head_blob,9,1))),
						Result_set = HEX(SUBSTR(Result_set,1,3));
			WHEN Result_set LIKE "FFD8%" THEN
				SET wide_p = SUBSTR(HEX(Head_blob),INSTR(HEX(Head_blob),"FFC0")+14,4),
						high_p = SUBSTR(HEX(Head_blob),INSTR(HEX(Head_blob),"FFC0")+10,4),
						Result_set = HEX(SUBSTR(Result_set,1,2));			
		ELSE 
				SET wide_p =NULL,
						high_p =NULL;
	END CASE;
	SET Result_set=
				CONCAT_WS(',',QUOTE(Result_set),
									QUOTE(CONV(wide_p,16,10)),
									QUOTE(CONV(high_p,16,10)));
	RETURN Result_set ;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `func_gener_answer`
-- ----------------------------
DROP PROCEDURE IF EXISTS `func_gener_answer`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `func_gener_answer`()
BEGIN
				SET @answer_stmtbody :=concat("REPLACE INTO answer(missionId,billid,a_t,a_fnz,a_fn,a_n,a_fs,",
							Temp_Func("a??",1,100,NULL),")
							SELECT a.missionId,a.billid,
							0,@g :=CONCAT_WS(',',",
							Temp_Func("IF(ab(b.a??,a.init_a??,c.blur_a??) IS NULL,NULL,'a??')",1,100,','),"),
							CONCAT_WS(',',",
							Temp_Func("IF(ab(b.a??,a.init_a??,c.blur_a??) IS NULL,NULL,IF(LENGTH('??') <2 ,CONCAT('0','??'),'??'))",1,100,','),"),
							func_get_string_count(@g,'a') AS a_n,REPLACE(@g,'a',''),"
							,Temp_Func("ab(b.a??,a.init_a??,c.blur_a??)",1,100,','),"
							FROM acc_mission AS a
							LEFT  JOIN acc_standard_1 AS b ON a.missionId = b.missionId
							LEFT  JOIN acc_standard_blur_1 AS c ON a.missionId = c.missionId
							WHERE  CONCAT_WS(',',",Temp_Func("ab(b.a??,a.init_a??,c.blur_a??)",1,100,','),") != ''");
 
					PREPARE stmt_insert_answer FROM @answer_stmtbody;
					EXECUTE stmt_insert_answer ;
		 
					SET @answer_stmtbody :=concat("REPLACE INTO answer(missionId,billid,a_t,a_fnz,a_fn,a_n,a_fs,",
								Temp_Func("a??",1,50,NULL),")
									SELECT a.missionId,a.billid,b.rowno,@g :=CONCAT_WS(',',",
									Temp_Func("IF(ab(b.b??,a.init_b??,c.blur_b??) IS NULL,NULL,'a??')",1,50,','),"),
									CONCAT_WS(',',",
									Temp_Func("IF(ab(b.b??,a.init_b??,c.blur_b??) IS NULL,NULL,IF(LENGTH('??') <2 ,CONCAT('0','??'),'??'))",1,50,','),"),
									func_get_string_count(@g,'a') AS a_n,REPLACE(@g,'a',''),
									",Temp_Func("ab(b.b??,a.init_b??,c.blur_b??)",1,50,','),"
									FROM acc_mission AS a
									LEFT  JOIN acc_standard_n AS b ON a.missionId = b.missionId
									LEFT  JOIN acc_standard_blur_n AS c ON b.missionId = c.missionId AND b.rowNo = c.rowno
									where  CONCAT_WS(',',",Temp_Func("ab(b.b??,a.init_b??,c.blur_b??)",1,50,','),") != ''");
			 /*SELECT @answer_stmtbody;*/
					PREPARE stmt_insert_answer FROM @answer_stmtbody;
					EXECUTE stmt_insert_answer ;
					DEALLOCATE PREPARE stmt_insert_answer;

					UPDATE acc_mission AS a, (
													SELECT
														a.missionId,
														a.need_input_a,
														a.need_input_b,
														SUM(IF(b.a_t =0,b.a_n,0)) AS a,
														SUM(IF(b.a_t >0 ,b.a_n,0)) AS b
													FROM 	acc_mission AS a
													LEFT JOIN answer AS b ON a.missionId = b.missionId
													GROUP BY a.missionId
													HAVING 
															SUM(IF(b.a_t =0,b.a_n,0)) <> ifnull(a.need_input_a,0)
															OR
															SUM(IF(b.a_t >0 ,b.a_n,0)) <> IFNULL(a.need_input_b,0)
											) AS b
								SET a.need_input_a = a ,a.need_input_b = b
					WHERE a.missionid = b.missionid ;

					UPDATE acc_mission AS a
						SET a.statu =3 ;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `func_get_string_count`
-- ----------------------------
DROP FUNCTION IF EXISTS `func_get_string_count`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `func_get_string_count`(f_str varchar(8000), f_substr varchar(255)) RETURNS int(8)
    NO SQL
    DETERMINISTIC
BEGIN
	declare i int default 0;
	declare remain_str varchar(8000) default '';
	set remain_str = f_str;
	while instr(remain_str,f_substr) > 0
		do
		set i = i + 1;
		set remain_str = substring(remain_str,instr(remain_str,f_substr) + char_length(f_substr));
	end while;
	return i;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Func_Query_Mission`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Func_Query_Mission`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Func_Query_Mission`(IN `keyword` longtext)
BEGIN
SET `keyword` = trim(`keyword`);
SELECT
CONCAT_WS(' : ',d.courseName,c.node_courseNo) AS `课程`,
CONCAT_WS('.',c.node_No,b.typesort) AS `任务编号`,
a.missionId,
a.missionLabel,
e1.billname,
e1.billId,
e2.billTypeSay,
a.mission_ask,
GROUP_CONCAT(a.missionId) AS  bkid
FROM
acc_mission AS a
INNER JOIN exp_courses_node_content AS b ON a.missionId = b.missionid
INNER JOIN exp_courses_node AS c ON b.contentNo = c.contentNo
INNER JOIN exp_courses AS d ON c.node_courseNo = d.courseNo
LEFT JOIN mysq1_schema.bill_list AS e1 ON e1.billId = a.billId
LEFT JOIN mysq1_schema.bill_type AS e2 ON e1.billType = e2.billType
WHERE 
CASE

		WHEN a.missionId  REGEXP  keyword THEN 1
		WHEN CONCAT_WS('.',c.node_No,b.typesort) REGEXP  keyword THEN 1
		WHEN CONCAT_WS(':',c.node_courseNo,d.courseName) REGEXP  keyword THEN 1
		WHEN a.missionLabel  REGEXP  keyword THEN 1
		WHEN a.mission_ask  REGEXP  keyword THEN 1
		WHEN CONCAT_WS('',e1.billname,e1.billId,e2.billTypeSay) REGEXP keyword THEN 1
		ELSE 0
END	

;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Func_Query_Stu`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Func_Query_Stu`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Func_Query_Stu`(`keyword` longtext)
BEGIN
SELECT
a.stuNo,
c.user_password,
a.stu_name,
b.className,
b.classNo,
b.deptNo,
b.teaNo,
b.`status`,
e.classNo,
e.className,
e2.courseNo,
d.expNo
FROM
mysq1_schema.exp_classstudent AS a
INNER JOIN mysq1_schema.exp_class AS b ON a.classNo = b.classNo
INNER JOIN mysq1_schema.sys_user AS c ON a.stu_user_id = c.user_id
LEFT JOIN exp_experimentclassstudent AS d ON a.stuNo = d.studentNo
LEFT JOIN exp_experimentclass AS e ON d.classNo = e.classNo
LEFT JOIN exp_experimentclass_course AS e1 ON e1.classNo = e.classNo
LEFT JOIN exp_courses AS e2 ON e2.courseNo = e1.courseNo
WHERE 
CONCAT_WS(',',a.stuNo ,d.classNo,e.className,d.expNo) REGEXP keyword
;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Fun_Cnum2num`
-- ----------------------------
DROP FUNCTION IF EXISTS `Fun_Cnum2num`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `Fun_Cnum2num`(`field_` longtext) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	DECLARE result_ LONGTEXT;
	DECLARE i INT(10);
  DECLARE a VARCHAR(1) ;
	SET i= 1,result_='',field_ = TRIM(field_);
	label1:LOOP 
			SET a = SUBSTR(field_,1,1);
			CASE a
					WHEN '１' THEN SET a = '1';
					WHEN '２' THEN SET a = '2';
					WHEN '３' THEN SET a = '3';
					WHEN '４' THEN SET a = '4';
					WHEN '５' THEN SET a = '5';
					WHEN '６' THEN SET a = '6';
					WHEN '７' THEN SET a = '7';
					WHEN '８' THEN SET a = '8'; 
					WHEN '９' THEN SET a = '9';
					WHEN '０' THEN SET a = '0';
					WHEN '（' THEN SET a = '(';
					WHEN '）' THEN SET a = ')';
					WHEN '－' THEN SET a = '-';
					ELSE SET a = a;
			END CASE ;
			SET result_ = CONCAT_WS('',result_,A),
					field_  = SUBSTR(field_,2);
			IF CHAR_LENGTH(field_) = 0 THEN
					LEAVE label1;
			END IF;
	END LOOP;

	RETURN result_;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `f_copy1`
-- ----------------------------
DROP FUNCTION IF EXISTS `f_copy1`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_copy1`(`p` longtext,k text) RETURNS longtext CHARSET utf8mb3
    DETERMINISTIC
p:BEGIN
	#Routine body goes here...
	DECLARE `rs` LONGTEXT DEFAULT NULL;DECLARE `jrs` LONGTEXT DEFAULT NULL;
	DECLARE `arr` TEXT DEFAULT NULL;
	DECLARE `r` TEXT DEFAULT '^\\[?(("\\w+"|[\\d\\-]+)(?:,(?-1))*?)]?$';
	DECLARE i VARCHAR(100) DEFAULT 0;
	DECLARE `l` INT(5) DEFAULT 20;
	DECLARE `jl` varchar(100) DEFAULT -1;	
	
	DECLARE `t` VARCHAR(20) DEFAULT NULL;DECLARE `kword` varchar(200) DEFAULT NULL;DECLARE addr  INT(5) DEFAULT 0;
	
/*
	DECLARE CONTINUE HANDLER FOR  SQLSTATE '21S01', SQLSTATE '23000', SQLSTATE	'42000'	, SQLSTATE	'42S22' ,SQLSTATE '21000', SQLSTATE	'HY000'-- ,SQLSTATE	'22007'
	bl:BEGIN GET DIAGNOSTICS CONDITION 1 @`sqlstate` = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;SET  @`sqlstate` = JSON_OBJECT('sqlstate',@`sqlstate`,'errno',@errno,'text',CONCAT(i,@text));

				SET @`errsql` = p,@funcid =  NULL;
				SET @funcid = CONCAT_WS(' ','Error: ',(SELECT CONCAT_WS(', ',a.note,CONCAT_WS('',UPPER(SUBSTR(a.`name`,1,1)),LOWER(substr(a.`name`,2))),a.id) FROM mysq1_schema.qs AS a WHERE a.`name` = `funcid`)
									, ' 执行' ),
				@pp = QUOTE(p);
				CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp,'SQL',@`errsql`,'err',@`sqlstate`,'l',1,"继续执行",'0'));END;


START TRANSACTION;
SET @funcid = CONCAT_WS(' ',(SELECT CONCAT_WS(', ',a.note,CONCAT_WS('',UPPER(SUBSTR(a.`name`,1,1)),LOWER(substr(a.`name`,2))),a.id) FROM mysq1_schema.qs AS a WHERE a.`name` = `funcid`)
							, ' 执行' ),
		@pp = QUOTE(`p`);

CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp));COMMIT;*/
	IF IFNULL(`p`,'') = '' THEN RETURN NULL;END IF; 

/*  IF !json_valid(k) && IFNULL(k,'')!=''  THEN 
   SET k = JSON_OBJECT('k','','t',2,'done',k) ;
 END IF ;
 */
	 IF k REGEXP  r THEN
			SET k := REGEXP_replace(k,r,'\\1'),k=JSON_OBJECT('t',2,'done',JSON_EXTRACT(CONCAT('[',k,']'),'$'));

	 END IF;

	IF json_valid(k) THEN 

		SET t = Json_value(k,'$.t')
       ,kword = JSON_value(k,'$.k[0]');
	end IF ;


 IF  json_value(`k`,'$.start') is NOT NULL THEN SET i =  json_value(`k`,'$.start') ; END IF;
 SET `arr` = CAST(JSON_EXTRACT(`k`,'$.done') AS char) ; 



  l:LOOP

		IF `jrs`is NOT NULL  AND json_length(`jrs`) = 0 THEN SET i= iF(jl REGEXP '^[\\d\\-\\.]+$',jl+1,CONCAT_WS('',jl,'+1')),jl=-1,jrs = NULL;END if; 

		IF i>=l+1 AND jrs IS NULL THEN LEAVE l;END if;

		IF `jrs`is  NULL AND   arr IS NOT NULL  AND json_valid(arr) THEN 
			IF JSON_length(arr)>0 THEN 
				SET i = JSON_VALUE(arr , '$[0]'),arr = json_REMOVE(arr,'$[0]');	
				ELSE LEAVE l;
			END IF;
		END IF;




		CASE 	
		
					WHEN `Jl` >-1 AND json_length(`jrs`)>0  THEN 
						SET `rs` = JSON_EXTRACT(`jrs`,'$[0]'),jrs=JSON_REMOVE(jrs,'$[0]');

					WHEN `t` = 1 then SET `rs` =   r4b1(json_array(i,JSON_EXTRACT(`k`,'$.k[*]')));
					WHEN `t` REGEXP '^(?:react|2)$' then SET `rs` =   r4b2(json_array(i,cast(JSON_EXTRACT(`k`,'$.k[*]')as char)));
					WHEN `t` = 3 then SET `rs` =   r4b3(json_array(i,JSON_EXTRACT(`k`,'$.k[*]')));
					WHEN `t` = 4 then SET `rs` =   r4b_json(json_array(i,JSON_EXTRACT(`k`,'$.k[*]')));
					WHEN `t` in ('r4b_time','`r4b_time`') then SET `rs` =   r4b_time(json_array(i,JSON_EXTRACT(`k`,'$.k[*]')));
					
			 ELSE 	SET `rs` =  r4b(json_array(i,json_value(`k`,'$[0]')));
		END case ;



		IF IFNULL(`rs`,'')='' THEN SET i = i-1;LEAVE l;END IF;

		IF json_length(`rs`)>0 AND JSON_DEPTH(`rs`)=3 AND jl = -1  THEN 

				SET jl= i,jrs=JSON_REMOVE(rs,'$[0]'),`rs` = JSON_EXTRACT(`rs`,'$[0]');

		END if;

		IF json_value(`rs`,'$[2]') = '' THEN RETURN 'i';END IF;



		CASE 
		WHEN json_extract( rs,'$[0]') IN('"-1"','"跳"') THEN SET @i = null; 
		WHEN json_extract( rs,'$[0]') = '-3' THEN RETURN 'p'; 
		WHEN CONVERT(json_value(`rs`,'$[1]')USING gbk) REGEXP '(?i)^(react|多多|c$)'   THEN BEGIN DECLARE `brs`  LONGBLOB DEFAULT NULL;DECLARE `res`  LONGBLOB DEFAULT NULL;DECLARE `trs`  LONGBLOB DEFAULT NULL;DECLARE `tr` LONGTEXT DEFAULT NULL;


					SET @rr0 := cast(json_value(`rs`,'$[2]')as  CHAR),`res`= NULL;
SET @i = 1;
					l0:LOOP

 -- if @i = 1 THEN RETURN  QUOTE(json_value(`rs`,'$[2]'));END IF;	
							SET addr =  REGEXP_instr(CAST(p AS CHAR),@rr0);		
								
							IF addr <= 0 OR IFNULL(p,'') = '' THEN LEAVE l0;END IF;


							SET `res` := CONCAT_WS('',`res`
													,IF(@rr0 REGEXP '\\Q(?#抓取)\\E' ,NULL,substr(p,1,addr-1))
										)
										,`brs`=json_remove(rs,'$[0]','$[0]')
									,`trs` = REGEXP_substr(p  ,@rr0);
							-- 移除头
						


							SET p = SUBSTR(p,addr+char_LENGTH(trs));
							-- 处理
-- f @i = 4 THEN RETURN p;END IF;	
							BEGIN

								l2:LOOP

												IF json_length(`brs`)<=1 THEN LEAVE l2;END if;

												SET  @rr1 :=CAST(json_value(`brs`,'$[1]') AS CHAR),@rr1s :=CAST(json_value(`brs`,'$[2]') AS CHAR)

														,@`res`=NULL,`brs`  = JSON_REMOVE(`brs`,'$[1]','$[1]');	


												IF  CAST(`trs` AS CHAR) NOT REGEXP  @rr1 THEN ITERATE l2;END IF;

									l3:loop   

												l4:LOOP 


														SET addr = REGEXP_instr(cast(`trs`AS CHAR),@rr1);



														IF IFNULL(addr,0) <1 THEN LEAVE l4;END IF;

														SET @`res` := CONCAT_WS('',@`res`
														           ,IF(@rr1 REGEXP '\\Q(?#抓取)\\E' ,NULL, substr(cast(`trs`AS CHAR),1,addr-1))
																			 );
														-- 处

														set tr = REGEXP_substr(CAST(`trs` AS char),@rr1);




														SET trs = substr(CAST(`trs` AS char),addr+char_length(tr)) ;

														CASE 
																 WHEN  @rr1s REGEXP '(?i)`json(:\\w+)?`' THEN 

																	IF IFNULL(@rr1s,'')!='' AND NOT json_valid(@rr1s) THEN

																		SET @rr11 = REGEXP_replace(REGEXP_replace(tr,@rr1,'\\1'),'^:','') ;

																		IF @rr11 ='' THEN SET @rr11 = REGEXP_substr(@rr1s,'(?i)`json:\\K\\w+\\b');
																		END if;

																		SET @rr11 = json_extract(k,CONCAT('$.p.',@rr11));
																	END IF; 

																-- 	,',\\s?(?=[\"}])','\r\n')"
	
																	SET  @rr11 := REGEXP_replace(REGEXP_replace(REGEXP_replace(@rr11,'^\\{|\\}','')
																										,',\\s?(?=["}])','\r\n')
																										,'"((?:(?=\\\\).{2}|(?:(?=[^\\\\"]).))*?)"','\\1')
																			,@rr11 := REGEXP_replace(@rr1s,'(?i)`json:(\\w+)`',@rr11) ;
																			

																	
															ELSE
																SET @rr11 = @rr1s;
														END CASE;


												
													SET tr =  REGEXP_replace(tr,REGEXP_replace(@rr1 , '\\Q(?<=\\E[^)]+?\\)|\\Q(?=\\E[^)]+?\\)','') ,@rr11);

												CASE 
															 WHEN  @rr1 REGEXP '(?i)\\Q(?#UPPER)\\E' THEN 

																set tr = UPPER(tr);
																														
															 WHEN  @rr1s REGEXP '(?i)`载入:(.*?)`' THEN 
																	
																			SET @rr11 := REGEXP_substr(tr,'(?i)`载入:\\K(.*?)(?=`)');

																			SET @rr11s := LOAD_FILE(@rr11),@rr11 = IF (@rr11s IS NULL ,CONCAT_WS(' ','无法载入',@rr11), @rr11s);

																			SET tr =  REGEXP_replace(tr,'(?i)`载入:.+?`',@rr11); 
															ELSE SET tr = tr ; 
												END CASE;
														-- 放回


														SET  @`res` = CONCAT_WS('',@`res`,tr);
																-- @`@rss` = json_remove(@`@rss`,'$[1]','$[1]'); 


SET @i =@i+1;

												END loop;

											SET `trs` = CAST(CONCAT_WS('',@`res`,IF(@rr1 REGEXP '\\Q(?#抓取)\\E' ,NULL,trs)) AS CHAR),@`res`=NULL;


											IF  IF(json_value(rs,'$[0]')='l3', `trs` NOT REGEXP  @rr1 ,1) THEN 	leave l3;END IF;


									END loop l3;

							END loop;

							END;

							-- 放回

							SET `res` = CONCAT_WS('',`res`,trs);

					END loop;

				SET p = CONCAT_WS('',`res`,IF(@rr0 REGEXP '\\Q(?#抓取)\\E' ,NULL,p));
				

				-- SET i =i +1;ITERATE l;

		END;


		 WHEN CONVERT(json_value(`rs`,'$[1]')USING gbk) REGEXP '^多(?!多)'   THEN
					BEGIN DECLARE `trs`  LONGBLOB DEFAULT NULL;DECLARE `tr` LONGTEXT DEFAULT NULL;




				IF p REGEXP  CONVERT(json_value(`rs`,'$[2]')using gbk) AND p NOT REGEXP CONVERT(CONCAT_WS('','(?ims)(',json_value(`rs`,'$[2]'),').*?(?1)')USING gbk)  THEN 


					SET `trs` = REGEXP_replace(p ,json_value(`rs`,'$[2]'),json_value(`rs`,'$[3]')) ,`rs` = json_remove(rs,'$[0]','$[0]','$[1]'); 

					l1:LOOP

						IF json_length(`rs`) <= 1 THEN LEAVE l1;END IF;

					if JSON_VALID(JSON_EXTRACT(`rs`,'$[1]')) AND JSON_EXTRACT(`rs`,'$[1]') REGEXP '^\\[' THEN
							SET @ddr =  CONVERT(JSON_value(`rs`,'$[1][0]')using gbk),@ddre = CONVERT(JSON_value(`rs`,'$[1][1]')using gbk),`rs` = json_remove(rs,'$[1]');
					 ELSE SET @ddr = CONVERT(JSON_value(`rs`,'$[1]')using gbk),@ddre = CONVERT(JSON_value(`rs`,'$[2]')using gbk),`rs` = json_remove(rs,'$[1]','$[1]');
					END if;

						IF `trs` REGEXP @ddr THEN 

							SET `trs` = REGEXP_replace(`trs`,@ddr,@ddre) ;
						END IF;


					END loop;

					SET p = REGEXP_replace(p ,CONVERT(json_value(`rs`,'$[0]') USING gbk),`trs`);
				END IF;

				-- SET i =i +1;ITERATE l;

		END;

		WHEN CONVERT(json_value(`rs`,'$[1]')USING gbk) REGEXP '^抓(?!取)'   THEN BEGIN DECLARE `trs`  LONGBLOB DEFAULT NULL;DECLARE `tr` LONGTEXT DEFAULT NULL;

				IF p REGEXP  CONVERT(json_value(`rs`,'$[2]')using gbk) AND p NOT REGEXP CONVERT(CONCAT_WS('','(?ims)(',json_value(`rs`,'$[2]'),').*?(?1)')USING gbk)  THEN 

 
					SET `trs` = REGEXP_substr(p ,json_value(`rs`,'$[2]')) ,`rs` = json_remove(rs,'$[0]','$[0]');

					l1:LOOP
						IF json_length(`rs`) = 1 THEN LEAVE l1;END IF;

						IF `trs` REGEXP CONVERT(json_value(`rs`,'$[1]')using gbk) THEN 

							SET `trs` = REGEXP_replace(`trs`,CONVERT(json_value(`rs`,'$[1]')using gbk),CONVERT(json_value(`rs`,'$[2]')using gbk)) ;
						END IF;

						SET `rs` = json_remove(rs,'$[1]','$[1]');	

					END loop;

					SET p = REGEXP_replace(p ,CONVERT(json_value(`rs`,'$[0]') USING gbk),`trs`);
				END IF;

		END;
		

		WHEN CONVERT(json_value(`rs`,'$[1]')USING gbk) REGEXP '^抓取' THEN

			SET p= REGEXP_replace(p
									,CONCAT_WS('','(?sm)^.*?(',CONVERT(json_value(`rs`,'$[2]')using gbk),').*?(?=(?1)|(?-m)$)')
									,'\\1'
								);

		 ELSE 

		  lend:LOOP 


					IF JSON_LENGTH(`rs`)<3 THEN LEAVE lend; end if;

					SET @rr1 := cast(json_value(`rs`,'$[2]')AS CHAR),@rr1s := cast(json_value(`rs`,'$[3]')AS CHAR);
-- if json_value(rs,'$[0]')= '生成数组' THEN RETURN @rr1;END IF ;
					SET	 p = REGEXP_replace(p,@rr1,@rr1s)
					 ,rs = JSON_REMOVE(rs,'$[2]','$[2]')
							;

			END LOOP ;

		END case;

		IF IFNULL(p,'') THEN RETURN NULL;END IF;

		SET  i = IF(i REGEXP '^[\\d\\-\\.]+$',i+1,CONCAT_WS('',i,'+1'));

	END LOOP;



RETURN cast(p AS CHAR);
	RETURN  REGEXP_replace( p ,'<!DOCTYPE[^>]+>',CONCAT_WS('','\\0\n<!--',i,'-->'));

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `f_copy2`
-- ----------------------------
DROP FUNCTION IF EXISTS `f_copy2`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_copy2`(`p` LONGText,k text) RETURNS longblob
    DETERMINISTIC
p:BEGIN
	#Routine body goes here...
	DECLARE `rs` LONGTEXT DEFAULT NULL;DECLARE `jrs` LONGTEXT DEFAULT NULL;
	DECLARE `arr` TEXT DEFAULT NULL;
	DECLARE `r` TEXT DEFAULT '^\\[?(("\\w+"|[\\d\\-]+)(?:,(?-1))*?)]?$';
	DECLARE i VARCHAR(100) DEFAULT 0;
	DECLARE `l` INT(5) DEFAULT 20;
	DECLARE `jl` varchar(100) DEFAULT -1;	
	
	DECLARE `t` VARCHAR(20) DEFAULT NULL;DECLARE `kword` varchar(200) DEFAULT NULL;DECLARE addr  INT(5) DEFAULT 0;
	
/*
	DECLARE CONTINUE HANDLER FOR  SQLSTATE '21S01', SQLSTATE '23000', SQLSTATE	'42000'	, SQLSTATE	'42S22' ,SQLSTATE '21000', SQLSTATE	'HY000'-- ,SQLSTATE	'22007'
	bl:BEGIN GET DIAGNOSTICS CONDITION 1 @`sqlstate` = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;SET  @`sqlstate` = JSON_OBJECT('sqlstate',@`sqlstate`,'errno',@errno,'text',CONCAT(i,@text));

				SET @`errsql` = p,@funcid =  NULL;
				SET @funcid = CONCAT_WS(' ','Error: ',(SELECT CONCAT_WS(', ',a.note,CONCAT_WS('',UPPER(SUBSTR(a.`name`,1,1)),LOWER(substr(a.`name`,2))),a.id) FROM mysq1_schema.qs AS a WHERE a.`name` = `funcid`)
									, ' 执行' ),
				@pp = QUOTE(p);
				CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp,'SQL',@`errsql`,'err',@`sqlstate`,'l',1,"继续执行",'0'));END;


START TRANSACTION;
SET @funcid = CONCAT_WS(' ',(SELECT CONCAT_WS(', ',a.note,CONCAT_WS('',UPPER(SUBSTR(a.`name`,1,1)),LOWER(substr(a.`name`,2))),a.id) FROM mysq1_schema.qs AS a WHERE a.`name` = `funcid`)
							, ' 执行' ),
		@pp = QUOTE(`p`);

CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp));COMMIT;*/
	IF IFNULL(`p`,'') = '' THEN RETURN NULL;END IF; 

/*  IF !json_valid(k) && IFNULL(k,'')!=''  THEN 
   SET k = JSON_OBJECT('k','','t',2,'done',k) ;
 END IF ;
 */
	 IF k REGEXP  r THEN
			SET k := REGEXP_replace(k,r,'\\1'),k=JSON_OBJECT('t',2,'done',JSON_EXTRACT(CONCAT('[',k,']'),'$'));

	 END IF;

	IF json_valid(k) THEN 

		SET t = Json_value(k,'$.t')
       ,kword = JSON_value(k,'$.k[0]');
	end IF ;


 IF  json_value(`k`,'$.start') is NOT NULL THEN SET i =  json_value(`k`,'$.start') ; END IF;
 SET `arr` = CAST(JSON_EXTRACT(`k`,'$.done') AS char) ; 



  l:LOOP

		IF `jrs`is NOT NULL  AND json_length(`jrs`) = 0 THEN SET i= iF(jl REGEXP '^[\\d\\-\\.]+$',jl+1,CONCAT_WS('',jl,'+1')),jl=-1,jrs = NULL;END if; 

		IF i>=l+1 AND jrs IS NULL THEN LEAVE l;END if;

		IF `jrs`is  NULL AND   arr IS NOT NULL  AND json_valid(arr) THEN 
			IF JSON_length(arr)>0 THEN 
				SET i = JSON_VALUE(arr , '$[0]'),arr = json_REMOVE(arr,'$[0]');	
				ELSE LEAVE l;
			END IF;
		END IF;




		CASE 	
		
					WHEN `Jl` >-1 AND json_length(`jrs`)>0  THEN 
						SET `rs` = JSON_EXTRACT(`jrs`,'$[0]'),jrs=JSON_REMOVE(jrs,'$[0]');

					WHEN `t` = 1 then SET `rs` =   r4b1(json_array(i,JSON_EXTRACT(`k`,'$.k[*]')));
					WHEN `t` REGEXP '^(?:react|2)$' then SET `rs` =   r4b2(json_array(i,cast(JSON_EXTRACT(`k`,'$.k[*]')as char)));
					WHEN `t` = 3 then SET `rs` =   r4b3(json_array(i,JSON_EXTRACT(`k`,'$.k[*]')));
					WHEN `t` = 4 then SET `rs` =   r4b_json(json_array(i,JSON_EXTRACT(`k`,'$.k[*]')));
					WHEN `t` in ('r4b_time','`r4b_time`') then SET `rs` =   r4b_time(json_array(i,JSON_EXTRACT(`k`,'$.k[*]')));
					
			 ELSE 	SET `rs` =  r4b(json_array(i,json_value(`k`,'$[0]')));
		END case ;



		IF IFNULL(`rs`,'')='' THEN SET i = i-1;LEAVE l;END IF;

		IF json_length(`rs`)>0 AND JSON_DEPTH(`rs`)=3 AND jl = -1  THEN 

				SET jl= i,jrs=JSON_REMOVE(rs,'$[0]'),`rs` = JSON_EXTRACT(`rs`,'$[0]');

		END if;

		IF json_value(`rs`,'$[2]') = '' THEN RETURN 'i';END IF;

RETURN 'rs';

		CASE 
		WHEN json_extract( rs,'$[0]') IN('"-1"','"跳"') THEN SET @i = null; 
		WHEN json_extract( rs,'$[0]') = '-3' THEN RETURN 'p'; 
		WHEN CONVERT(json_value(`rs`,'$[1]')USING gbk) REGEXP '(?i)^(react|多多|c$)'   THEN BEGIN DECLARE `brs`  LONGBLOB DEFAULT NULL;DECLARE `res`  LONGBLOB DEFAULT NULL;DECLARE `trs`  LONGBLOB DEFAULT NULL;DECLARE `tr` LONGTEXT DEFAULT NULL;


					SET @rr0 := cast(json_value(`rs`,'$[2]')as  CHAR),`res`= NULL;

SET @i = 1;
					l0:LOOP

 -- if @i = 1 THEN RETURN  QUOTE(json_value(`rs`,'$[2]'));END IF;	
							SET addr =  REGEXP_instr(CAST(p AS CHAR),@rr0);		
								
							IF addr <= 0 OR IFNULL(p,'') = '' THEN LEAVE l0;END IF;


							SET `res` := CONCAT_WS('',`res`
													,IF(@rr0 REGEXP '\\Q(?#抓取)\\E' ,NULL,substr(p,1,addr-1))
										)
										,`brs`=json_remove(rs,'$[0]','$[0]')
									,`trs` = REGEXP_substr(p  ,@rr0);
							-- 移除头
						


							SET p = SUBSTR(p,addr+char_LENGTH(trs));
							-- 处理
-- f @i = 4 THEN RETURN p;END IF;	
							BEGIN

								l2:LOOP

												IF json_length(`brs`)<=1 THEN LEAVE l2;END if;

												SET  @rr1 :=CAST(json_value(`brs`,'$[1]') AS CHAR),@rr1s :=CAST(json_value(`brs`,'$[2]') AS CHAR)

														,@`res`=NULL,`brs`  = JSON_REMOVE(`brs`,'$[1]','$[1]');	


												IF  CAST(`trs` AS CHAR) NOT REGEXP  @rr1 THEN ITERATE l2;END IF;

									l3:loop   

												l4:LOOP 


														SET addr = REGEXP_instr(cast(`trs`AS CHAR),@rr1);



														IF IFNULL(addr,0) <1 THEN LEAVE l4;END IF;

														SET @`res` := CONCAT_WS('',@`res`
														           ,IF(@rr1 REGEXP '\\Q(?#抓取)\\E' ,NULL, substr(cast(`trs`AS CHAR),1,addr-1))
																			 );
														-- 处

														set tr = REGEXP_substr(CAST(`trs` AS char),@rr1);




														SET trs = substr(CAST(`trs` AS char),addr+char_length(tr)) ;

														CASE 
																 WHEN  @rr1s REGEXP '(?i)`json(:\\w+)?`' THEN 

																	IF IFNULL(@rr1s,'')!='' AND NOT json_valid(@rr1s) THEN

																		SET @rr11 = REGEXP_replace(REGEXP_replace(tr,@rr1,'\\1'),'^:','') ;

																		IF @rr11 ='' THEN SET @rr11 = REGEXP_substr(@rr1s,'(?i)`json:\\K\\w+\\b');
																		END if;

																		SET @rr11 = json_extract(k,CONCAT('$.p.',@rr11));
																	END IF; 

																-- 	,',\\s?(?=[\"}])','\r\n')"
	
																	SET  @rr11 := REGEXP_replace(REGEXP_replace(REGEXP_replace(@rr11,'^\\{|\\}','')
																										,',\\s?(?=["}])','\r\n')
																										,'"((?:(?=\\\\).{2}|(?:(?=[^\\\\"]).))*?)"','\\1')
																			,@rr11 := REGEXP_replace(@rr1s,'(?i)`json:(\\w+)`',@rr11) ;
																			

																	
															ELSE
																SET @rr11 = @rr1s;
														END CASE;


												
													SET tr =  REGEXP_replace(tr,REGEXP_replace(@rr1 , '\\Q(?<=\\E[^)]+?\\)|\\Q(?=\\E[^)]+?\\)','') ,@rr11);

												CASE 
															 WHEN  @rr1 REGEXP '(?i)\\Q(?#UPPER)\\E' THEN 

																set tr = UPPER(tr);
																														
															 WHEN  @rr1s REGEXP '(?i)`载入:(.*?)`' THEN 
																	
																			SET @rr11 := REGEXP_substr(tr,'(?i)`载入:\\K(.*?)(?=`)');

																			SET @rr11s := LOAD_FILE(@rr11),@rr11 = IF (@rr11s IS NULL ,CONCAT_WS(' ','无法载入',@rr11), @rr11s);

																			SET tr =  REGEXP_replace(tr,'(?i)`载入:.+?`',@rr11); 
															ELSE SET tr = tr ; 
												END CASE;
														-- 放回


														SET  @`res` = CONCAT_WS('',@`res`,tr);
																-- @`@rss` = json_remove(@`@rss`,'$[1]','$[1]'); 


SET @i =@i+1;

												END loop;

											SET `trs` = CAST(CONCAT_WS('',@`res`,IF(@rr1 REGEXP '\\Q(?#抓取)\\E' ,NULL,trs)) AS CHAR),@`res`=NULL;


											IF  IF(json_value(rs,'$[0]')='l3', `trs` NOT REGEXP  @rr1 ,1) THEN 	leave l3;END IF;


									END loop l3;

							END loop;

							END;

							-- 放回

							SET `res` = CONCAT_WS('',`res`,trs);

					END loop;

				SET p = CONCAT_WS('',`res`,IF(@rr0 REGEXP '\\Q(?#抓取)\\E' ,NULL,p));
				

				-- SET i =i +1;ITERATE l;

		END;


		 WHEN CONVERT(json_value(`rs`,'$[1]')USING gbk) REGEXP '^多(?!多)'   THEN
					BEGIN DECLARE `trs`  LONGBLOB DEFAULT NULL;DECLARE `tr` LONGTEXT DEFAULT NULL;




				IF p REGEXP  CONVERT(json_value(`rs`,'$[2]')using gbk) AND p NOT REGEXP CONVERT(CONCAT_WS('','(?ims)(',json_value(`rs`,'$[2]'),').*?(?1)')USING gbk)  THEN 


					SET `trs` = REGEXP_replace(p ,json_value(`rs`,'$[2]'),json_value(`rs`,'$[3]')) ,`rs` = json_remove(rs,'$[0]','$[0]','$[1]'); 

					l1:LOOP

						IF json_length(`rs`) <= 1 THEN LEAVE l1;END IF;

					if JSON_VALID(JSON_EXTRACT(`rs`,'$[1]')) AND JSON_EXTRACT(`rs`,'$[1]') REGEXP '^\\[' THEN
							SET @ddr =  CONVERT(JSON_value(`rs`,'$[1][0]')using gbk),@ddre = CONVERT(JSON_value(`rs`,'$[1][1]')using gbk),`rs` = json_remove(rs,'$[1]');
					 ELSE SET @ddr = CONVERT(JSON_value(`rs`,'$[1]')using gbk),@ddre = CONVERT(JSON_value(`rs`,'$[2]')using gbk),`rs` = json_remove(rs,'$[1]','$[1]');
					END if;

						IF `trs` REGEXP @ddr THEN 

							SET `trs` = REGEXP_replace(`trs`,@ddr,@ddre) ;
						END IF;


					END loop;

					SET p = REGEXP_replace(p ,CONVERT(json_value(`rs`,'$[0]') USING gbk),`trs`);
				END IF;

				-- SET i =i +1;ITERATE l;

		END;

		WHEN CONVERT(json_value(`rs`,'$[1]')USING gbk) REGEXP '^抓(?!取)'   THEN BEGIN DECLARE `trs`  LONGBLOB DEFAULT NULL;DECLARE `tr` LONGTEXT DEFAULT NULL;

				IF p REGEXP  CONVERT(json_value(`rs`,'$[2]')using gbk) AND p NOT REGEXP CONVERT(CONCAT_WS('','(?ims)(',json_value(`rs`,'$[2]'),').*?(?1)')USING gbk)  THEN 

 
					SET `trs` = REGEXP_substr(p ,json_value(`rs`,'$[2]')) ,`rs` = json_remove(rs,'$[0]','$[0]');

					l1:LOOP
						IF json_length(`rs`) = 1 THEN LEAVE l1;END IF;

						IF `trs` REGEXP CONVERT(json_value(`rs`,'$[1]')using gbk) THEN 

							SET `trs` = REGEXP_replace(`trs`,CONVERT(json_value(`rs`,'$[1]')using gbk),CONVERT(json_value(`rs`,'$[2]')using gbk)) ;
						END IF;

						SET `rs` = json_remove(rs,'$[1]','$[1]');	

					END loop;

					SET p = REGEXP_replace(p ,CONVERT(json_value(`rs`,'$[0]') USING gbk),`trs`);
				END IF;

		END;
		

		WHEN CONVERT(json_value(`rs`,'$[1]')USING gbk) REGEXP '^抓取' THEN

			SET p= REGEXP_replace(p
									,CONCAT_WS('','(?sm)^.*?(',CONVERT(json_value(`rs`,'$[2]')using gbk),').*?(?=(?1)|(?-m)$)')
									,'\\1'
								);

		 ELSE 

		  lend:LOOP 


					IF JSON_LENGTH(`rs`)<3 THEN LEAVE lend; end if;

					SET @rr1 := cast(json_value(`rs`,'$[2]')AS CHAR),@rr1s := cast(json_value(`rs`,'$[3]')AS CHAR);
-- if json_value(rs,'$[0]')= '生成数组' THEN RETURN @rr1;END IF ;
					SET	 p = REGEXP_replace(p,@rr1,@rr1s)
					 ,rs = JSON_REMOVE(rs,'$[2]','$[2]')
							;

			END LOOP ;

		END case;

		IF IFNULL(p,'') THEN RETURN NULL;END IF;

		SET  i = IF(i REGEXP '^[\\d\\-\\.]+$',i+1,CONCAT_WS('',i,'+1'));

	END LOOP;



RETURN cast(p AS CHAR);
	RETURN  REGEXP_replace( p ,'<!DOCTYPE[^>]+>',CONCAT_WS('','\\0\n<!--',i,'-->'));

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `f_else`
-- ----------------------------
DROP FUNCTION IF EXISTS `f_else`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_else`(`p` LONGBLOB ) RETURNS longblob
    DETERMINISTIC
BEGIN
	DECLARE `kword`  VARCHAR ( 200 ) DEFAULT NULL;
	DECLARE	`计数`,`计数0` INT ( 5 ) DEFAULT 0;
	DECLARE	addr,`次数` INT ( 11 ) DEFAULT NULL;
	DECLARE 	`当前表达式`text  DEFAULT NULL;
	DECLARE 	`当前替换`text  DEFAULT null;
	DECLARE `res`	,	`ts`LONGBLOB DEFAULT NULL;
	DECLARE brs LONGBLOB DEFAULT NULL ;

	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
		bl : BEGIN

			GET DIAGNOSTICS CONDITION 1 @`sqlstat` = RETURNED_SQLSTATE,
			@errno = MYSQL_ERRNO,
			@TEXT = MESSAGE_TEXT;
			SET  @`sqlstate` = CONCAT_WS(',','f_else', @`sqlstat` ,@`sqlstate`);

			RETURN  JSON_MERGE(JSON_OBJECT( 'RETURNED_SQLSTATE', CAST(@`sqlstate` AS CHAR)),JSON_OBJECT( 'MYSQL_ERRNO', @errno, 'MESSAGE_TEXT', @TEXT ));
		END ;

IF IFNULL(p,'')=''  ||  NOT json_valid(p) || JSON_length(p)<2 || JSON_depth(p)<2 THEN RETURN p ; END IF ;

SET  brs = json_value(p,'$[1]');


IF IFNULL(json_value(p,'$[0]'),'')=''  || IFNULL(brs,'') = ''|| NOT json_valid(brs) || JSON_DEPTH(brs)<2 || JSON_length(brs)<2 THEN 
RETURN _s(json_array(1234,'f_react 错误 brs'));
END IF ;
SET  p = 	 json_value(p,'$[0]');
SET @`sqlstate` =null;

SET @状态2 = state(NULL,0);

重要的else :LOOP

						IF json_length(`brs`)<3 || JSON_LENGTH( `brs` )< 4 && 
							IF (json_value(brs,'$[3]')<=>NULL, json_value(brs,'$[2]')  NOT  REGEXP '\\Q(?#抓取\\E[^)]*?\\)\\s*\\S+' ,1) 
							||JSON_DEPTH(JSON_EXTRACT(brs ,'$[2]'))>1 
							THEN
								LEAVE 重要的else;END IF;


						SET `当前表达式` := cast( json_value( `brs`, '$[2]' ) AS CHAR ),
						`当前替换` := cast( json_value( `brs`, '$[3]' ) AS CHAR );

			-- 			IF `当前表达式` = 'done' && `当前替换` IS NOT NULL THEN ITERATE l; 	END IF;

						SET brs = JSON_REMOVE( brs, '$[2]', '$[2]' );

					CASE
								
								WHEN `当前表达式` REGEXP '\\Q(?#抓取\\E[^)]*?\\)\\s*\\S+' 	 THEN
					


	
									SET kword := REGEXP_substr ( `当前表达式`, '\\Q(?#抓取\\E\\K\\d+' ),
									
											brs = IF(当前替换 IS NOT null ,JSON_ARRAY_INSERT(brs, '$[2]', 当前替换),brs);
	
									SET  次数 =
								IF
									(
										kword = '',
									NULL,kword),计数 = 0,
									`res` = NULL;

								SET addr = REGEXP_instr ( p, `当前表达式` );

								抓取 :WHILE addr > 0 && IF (次数 IS NULL, 1,计数 < 次数 ) DO
										
										SET `ts` := REGEXP_substr ( p, `当前表达式` );

									SET `res` = CONCAT_WS( '', res, ts ),
									`p` = substr(
										`p`,
									addr + CHAR_LENGTH( `ts` ));

									SET 计数 = 计数 + 1,
									addr = REGEXP_instr ( p, `当前表达式` );

								END WHILE 抓取;

								SET p = `res`,
								`res` = NULL;

								WHEN `当前表达式` REGEXP '\\Q(?#result2)\\E' 
								AND p REGEXP `当前表达式` THEN
									BEGIN
										DECLARE
											result LONGBLOB DEFAULT NULL;
										result2 :
										LOOP
											IF
												p NOT REGEXP `当前表达式` THEN
													LEAVE result2;
												
											END IF;
											
											SET p = CONCAT_WS(
												',',
												result,
											CONCAT_WS( '', '[', REGEXP_replace ( p, '\\[("\\w+").*?]', '\\1' ), ']' ));
											
										END LOOP;
										
										SET p = result;
										
									END;
									
									WHEN `当前表达式` REGEXP '\\Q(?#result)\\E' 
									AND p REGEXP `当前表达式` THEN
										BEGIN
											DECLARE
												result LONGBLOB DEFAULT NULL;
											
											SET p := REGEXP_replace ( p, '("\\w+")(?:,\\g-1)++', '[\\0]' );
											resultl :
											LOOP
												IF
													p NOT REGEXP '(?<=\\[)("\\w+")(?:,|])' THEN
														LEAVE resultl;
													
												END IF;
												
												SET result = CONCAT_WS(
													',',
													result,
												CONCAT_WS( '', '[', REGEXP_replace ( p, '\\[("\\w+").*?]', '\\1' ), ']' )),
												p = REGEXP_replace ( REGEXP_replace ( REGEXP_replace ( p, '(?<=\\[)("\\w+")(?:,|])', '' ), '\\[,', '' ), ',\\[$', '' );
												
											END LOOP;
											
											SET p = result;
											
										END;
ELSE 

									IF  CHAR_length(`当前表达式` ) = length(`当前表达式` ) THEN 
											SET p = REGEXP_replace ( p, `当前表达式`, `当前替换` );
									ELSE 
											SET p = REGEXP_replace ( CAST( p AS CHAR), `当前表达式`, `当前替换` );
										
									END if;

									END CASE;

						SET 计数0=计数0 + 1;
SET  @状态2 = state(@状态2,0); 
						END LOOP  重要的else	;-- 重要的else			


SET  @状态2 =CONCAT_WS('\np:\n',state(@状态2,-1),p);

	RETURN JSON_OBJECT('p',p,'rs',brs);
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `f_react`
-- ----------------------------
DROP FUNCTION IF EXISTS `f_react`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_react`(p LONGBLOB ) RETURNS longblob
    DETERMINISTIC
BEGIN
	DECLARE 	`rs` text DEFAULT JSON_value(p,'$[1]');



	DECLARE 	`brs`text  DEFAULT NULL;
	DECLARE 	`result`longblob  DEFAULT NULL;
	DECLARE 	`当前表达式` ,	`当前替换` ,调试,rr0  text  DEFAULT NULL;
	DECLARE 	`次数`,addr,num,	`计数器1`,trs计数器 INT ( 5 ) DEFAULT 0;
	DECLARE 	`trs`	,	`res`,`tr`, `ress`,`sqlstate`	 longblob DEFAULT NULL ;


	DECLARE cb  CONDITION FOR 666;
	DECLARE CONTINUE HANDLER FOR cb
BEGIN
-- RETURN 调试(json_extract(brs,'$[1]'));
								set trs  = f_else(JSON_ARRAY(trs,brs));
								
								IF  json_valid(trs) && JSON_EXTRACT(trs,'$.RETURNED_SQLSTATE') is NOT NULL || JSON_EXISTS(trs,'$.tiaoShi') THEN 
									SET 调试 = JSON_value(trs,'$.tiaoShi');
	
								  SET @RETURNED_SQLSTATE = CONCAT('j_react:',json_value(trs,'$.RETURNED_SQLSTATE')),
											@MYSQL_ERRNO =  json_value(trs,'$.MYSQL_ERRNO'),
											@MESSAGE_TEXT = json_value(trs,'$.MESSAGE_TEXT');

									RETURN _S(json_array(@MYSQL_ERRNO,@MESSAGE_TEXT));

								
									ELSE 

									SET p = json_value(trs,'$.p');
									SET	 rs = CAST(IF(JSON_EXISTS(trs, '$.rs'),json_value(trs,'$.rs'),brs) AS CHAR);
								END IF; 
END;

	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
		bl : BEGIN
			GET DIAGNOSTICS CONDITION 1 @`sqlstat` = RETURNED_SQLSTATE,
			@errno = MYSQL_ERRNO,
			@TEXT = MESSAGE_TEXT;
			SET  `sqlstate` = CONCAT_WS('\n', @`sqlstat`,`sqlstate`);
			RETURN  JSON_OBJECT( 'RETURNED_SQLSTATE', `sqlstate`, 'MYSQL_ERRNO', @errno, 'MESSAGE_TEXT', @TEXT ,"计数器",计数器1);

		END ;


	SET @i=1,	`p` = JSON_value(p,'$[0]') ;
	
SET @状态1:=  state(NULL,0);

	SET `rr0` := json_value( cast( `rs` AS CHAR ), '$[2]' ),
	`res` = NULL -- ,`rs` = json_remove(rs,'$[2]')
	,计数器1 = 0
	;
		/*   提升*/
		IF  JSON_DEPTH(rs) >2	then 
				SET rs = rEGEXP_replace(rs ,o(',\\s*\\[\\s*(?&v)(?:(?:\\s*,\\s*)(?&v)){1}|(?&v)\\K\\](?=\\s*[,\\]]) j'),'');
		END IF; 

	l0 :LOOP


		SET addr = REGEXP_instr ( p, `rr0` );


		IF 	addr <= 0 || IFNULL( p, '' ) = '' THEN

				IF ( `rr0` REGEXP '\\Q(?#抓取\\E') THEN  
						SET p = IF(@统计 is null || @统计 ,CONCAT('\n',计数器1),null);
				END IF; 

				LEAVE l0;

		END IF;

		SET `res` := CONCAT_WS( '', `res`, IF ( `rr0` REGEXP '\\Q(?#抓取\\E', NULL, substr( p, 1, addr - 1 )) ),
		`brs` = json_remove( rs, '$[0]', '$[0]' ),
		`trs` = REGEXP_substr ( p, `rr0` );

		SET p = SUBSTR(		p, addr + char_LENGTH( trs )) ,trs计数器=trs计数器+1;
SET @状态1 = state(@状态1,0);

		CASE WHEN json_value( `rs`, '$[1]' ) REGEXP '(?i)^(react|多多|c$)'  THEN 


			l2 :LOOP
SET @tmp = NULL;
				IF	 IF ( `rr0` REGEXP '\\Q(?#抓取\\E', json_length( `brs` )< 1 ,json_length( `brs` )<=1)THEN	LEAVE l2;END IF;

				IF json_length(json_extract( `brs`, '$[1]'))>2 THEN  return _s(json_array(666,'here '));END IF ;

				SET 当前表达式 := CAST( json_value( `brs`, '$[1]' ) AS CHAR ),
				当前替换 := CAST( json_value( `brs`, '$[2]' ) AS CHAR ),
				`ress` = NULL,
				`brs` = JSON_REMOVE( `brs`, '$[1]', '$[1]' );



				IF IFNULL(当前表达式 ,'')='' || `trs` NOT REGEXP 当前表达式  THEN

					CASE 										
								WHEN  当前表达式 REGEXP '^抓取结束$' THEN
											
											SET trs = CONCAT_WS('\n'
											
											,CONCAT_WS('','抓取开始 ',trs,' 抓取结束')
											,result);
											
								WHEN  当前表达式 REGEXP '^抓取开始$' THEN

											SET result  =  trs;
							
				
											ITERATE l2;
					
								WHEN  IFNULL(当前表达式 ,'') = '' THEN
										SET res  =  CONCAT_WS('',res,trs);
										ITERATE l0;
								RETURN		_s(json_array(777,'当前表达式'));
										
								WHEN 当前表达式 REGEXP '\\Q(?#抓取)\\E' THEN

									SET trs = NULL;

								WHEN 当前表达式 REGEXP '\\Q(?#作为参数)\\E' THEN

								SET 当前表达式 = 当前表达式;
								
						ELSE 	SET 当前表达式 = 当前表达式;

					END CASE;

set @i=@i +1;
					ITERATE l2;

				END IF;


				l3 :LOOP

						l4 :LOOP



							SET addr = REGEXP_instr ( `trs`, 当前表达式 );
							
							

							IF IFNULL( addr, 0 ) < 1  THEN LEAVE l4; END IF;

							SET `ress` := CONCAT_WS( '', `ress`, IF (  当前表达式 REGEXP '\\Q(?#抓取)\\E', NULL, substr( `trs`, 1, addr - 1 )) );

							SET `sqlstate` = CONCAT_WS('; ',`sqlstate`,'1 done'); 



							CASE 

										 
											

							
									WHEN  当前替换 REGEXP '`\\?\\d`' THEN

										SET `sqlstate` = CONCAT_WS('; ',`sqlstate`,'3 当前替换'); 
										IF  trs REGEXP o('(?&cyear) date') THEN
											SET num := num(trs),trs = num;
										END IF ;	
										
										SET trs= trs + REGEXP_substr(当前替换,'\\d');

										IF  num IS NOT NULL THEN
											SET trs = num(trs),num = null;
										END IF ;	

									-- RETURN 'trs' ;
								WHEN 当前表达式 REGEXP '\\Q反复应用\\E|\\Q(?#\\E(?:直接)' THEN
									SET `sqlstate` = CONCAT_WS('; ',`sqlstate`,'3 反复应用'); 
									IF '\\Q(?#\\E(?:直接)' THEN
											
											SET `次数` = 1;
										
									END IF;

									直接应用 :LOOP
										IF 	CASE 
												when trs NOT REGEXP 当前表达式  THEN 1
												WHEN 次数 IS NULL THEN 1 
												WHEN 次数 < 1 THEN 1
												ELSE 0  END
												THEN LEAVE 直接应用;	END IF;
														
										SET trs = REGEXP_replace ( trs, 当前表达式, 当前替换 ),
										次数 =
										IF (次数 IS NULL, NULL,次数- 1 );
										
									END LOOP 直接应用;
								
									SET `次数` = NULL;
							-- RETURN trs ;

								WHEN 当前表达式 REGEXP '\\Q分裂数组1\\E' THEN
														SET `sqlstate` = CONCAT_WS('; ',`sqlstate`,'3 Q分裂数组1'); 
									BEGIN
										DECLARE  字段头 TINYTEXT DEFAULT NULL;
										DECLARE 长度 INT ( 11 ) DEFAULT 0;
										DECLARE 字段 TEXT DEFAULT NULL;
										DECLARE 表达式 TINYTEXT DEFAULT NULL;
										DECLARE 中间结果 TEXT DEFAULT NULL;
										DECLARE 结果 TEXT DEFAULT NULL;
										
										SET 长度 := REGEXP_substr ( JSON_SEARCH( trs, 'one', REPLACE ( REGEXP_substr ( trs, '"\\K[abt]\\w+(?=")' ), '"', '' )), '\\d+(?=]"$)' ),
										表达式 = CONCAT_WS( '', '("(?:(?=\\\\).{2}|[^\\\\"])*?"|null|\\-?[\\d+,](?:\\.\\d+)?)(?:,\\s?(?-1)){',长度- 1, '}' );
										
										SET 字段 = REGEXP_replace ( trs, CONCAT( '(?<=^\\[)',表达式, ',?+' ), '' );

										`l5` :LOOP
														IF  IFNULL(字段头, '' )= ''  
															OR ! json_valid(字段头) 
															OR JSON_LENGTH(字段头)< 1 THEN
																
																SET 字段头 = CONCAT( '[', REGEXP_substr ( trs,表达式), ']' );
															
														END IF;
														IF
															IFNULL(字段, '' )= '' 
															OR ! json_valid(字段) 
															OR JSON_LENGTH(字段)< 1 THEN
																LEAVE `l5`;
															
														END IF;

														SET 中间结果 = JSON_MERGE(
															JSON_EXTRACT(字段头, '$[0]' ),
														JSON_EXTRACT(字段, '$[0]' )),字段头 = json_remove(字段头, '$[0]' ),字段 = json_remove(字段, '$[0]' );
														IF
															IFNULL(中间结果, '' )!= '' THEN
																
																SET 结果 = CONCAT_WS(
																',',结果,中间结果);
															
														END IF;

										END LOOP `l5`;
										
										SET tr = 结果,
										trs = 字段;
										
									END;
							ELSE 


								SET `sqlstate` = CONCAT_WS('; ',`sqlstate`,'3 else'); 


								SET tr = REGEXP_substr( `trs`, 当前表达式 );
			

								IF IFNULL( tr, '' )= '' THEN  LEAVE l4; 	END IF;

								SET trs = substr(	`trs`,	addr + char_length( tr ));
								
								SET `sqlstate` = CONCAT_WS('; ',`sqlstate`,'4 else'); 
								

		/*________*/CASE 

								WHEN 当前替换 REGEXP '(?i)`json(:\\w+)?`' THEN  
								IF IFNULL( 当前替换, '' )!= '' AND NOT json_valid( 当前替换 ) THEN
									SET @rr11 = REGEXP_replace ( REGEXP_replace ( tr, 当前表达式, '\\1' ), '^:', '' );
									IF 	@rr11 = '' THEN
											
											SET @rr11 = REGEXP_substr ( 当前替换, '(?i)`json:\\K\\w+\\b' );
										
									END IF;

								SET @rr11 = json_extract(k,CONCAT( '$.p.', @rr11 ));

										END IF;-- 	,',\\s?(?=[\"}])','\r\n')"
										
										SET @rr11 := REGEXP_replace ( REGEXP_replace ( REGEXP_replace ( @rr11, '^\\{|\\}', '' ), ',\\s?(?=["}])', '\r\n' ), '"((?:(?=\\\\).{2}|(?:(?=[^\\\\"]).))*?)"', '\\1' ),
										@rr11 := REGEXP_replace ( 当前替换, '(?i)`json:(\\w+)`', @rr11 );
										
										WHEN 当前表达式 REGEXP '\\Q(?#作为参数\\E\\s+\\w+' THEN
										
										SET brs = REGEXP_replace ( brs, CONCAT( '`参', REGEXP_substr ( 当前表达式, '\\Q(?#作为参数\\E\\s+\\K\\w+' ), '`' ), tr );

										ELSE 

											SET @rr11 = 当前替换;
											SET `sqlstate` = CONCAT_WS('; ',`sqlstate`,'2 done'); 

									END CASE;

									SET tr = REGEXP_replace ( tr, CASE WHEN `rr0` = 当前表达式 THEN REGEXP_replace ( 当前表达式, '\\Q(?<=\\E[^)]+?\\)|\\Q(?=\\E[^)]+?\\)', '' ) ELSE 当前表达式 END, @rr11 );

								CASE

									WHEN 当前表达式 REGEXP '(?i)\\Q(?#\\E(quote)' THEN


									SET tr = JSON_QUOTE(CAST(tr AS CHAR));

									WHEN 当前表达式 REGEXP '(?i)\\Q(?#\\E(UPPER|LOWER)' THEN

									SET tr = IF(当前表达式 REGEXP '(?i)\\Q(?#\\E(UPPER)',UPPER(CAST(tr AS CHAR) ),LOWER(CAST(tr AS CHAR) ));

									WHEN 当前替换 REGEXP '(?i)`载入:(.*?)`' THEN
									
									SET @rr11 := REGEXP_substr ( tr, '(?i)`载入:\\K(.*?)(?=`)' );
									
									SET @rr11s := LOAD_FILE( @rr11 ),
									@rr11 =
									IF
			( @rr11s IS NULL, CONCAT_WS( ' ', '无法载入', @rr11 ), @rr11s );
									
									SET tr = REGEXP_replace ( tr, '(?i)`载入:.+?`', @rr11 );
									ELSE  SET tr = tr;
									
								END CASE;-- 放回

							END CASE;


						SET `ress` = CONCAT_WS( '', `ress`, tr );

					END LOOP;-- l4 LOOP
					
					SET `trs` = CONCAT_WS(
						'',
						`ress`,
						IF	( 当前表达式 REGEXP '\\Q(?#抓取)\\E', NULL, trs )
						
						),
						`ress` = NULL;

					SET 计数器1 = 计数器1 +  1 ;SET @状态1 = state(JSON_MERGE( @状态1,JSON_OBJECT('rs',NULL)),0);

					IF  -- 判断是否循环
							CASE	WHEN 当前表达式 REGEXP '\\Q(?#循环)\\E' && `trs` REGEXP 当前表达式 THEN 0
										ELSE 1  END 
							THEN

							LEAVE l3;
						
					END IF;

				END LOOP l3;-- l3 loop

			END LOOP l2;--  LOOP

			else  

			RETURN _s(json_array('123','空 else'));
			END case;-- IF @hree = 'hree' THEN  	RETURN  CONCAT_WS('_____','hree',brs,jrs);END if; 


				


    SET trs = REGEXP_replace(trs,'trs计数器',trs计数器);
		SET `res` = CONCAT_WS( '', `res`, trs );
	END LOOP l0 ;-- l0
	


	
	SET rs = json_extract(rs,'$[0]','$[1]');
	SET p = CONCAT_WS(	'',`res`, p);-- SET i =i +1;ITERATE l;


-- return state(JSON_MERGE( @状态1,JSON_OBJECT('rs',NULL)),0);
-- RETURN @状态1;

	RETURN JSON_MERGE(json_object('p',p),JSON_OBJECT('rs',rs));
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `generatekey`
-- ----------------------------
DROP FUNCTION IF EXISTS `generatekey`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `generatekey`(`userid` varchar(20),`pkid` int(10)) RETURNS varchar(160) CHARSET utf8mb3
    NO SQL
BEGIN
	
  set @keyword = CONCAT(userid , '-',DATE_FORMAT(NOW(),'%y%m%d%H%i%s'),
									if(pkid is NULL ,RIGHT(RAND(),5),
										 concat(
														pkid, RIGHT(RAND(),5-LENGTH(pkid))
														)
									)
							);
	RETURN @keyword;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Generate_One_En`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Generate_One_En`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Generate_One_En`(IN `missionid_` varchar(60),`rowids` varchar(600),OUT field_names varchar(600),out rownum varchar(400),out `jans` longtext)
la:BEGIN
	
/*
CALL Audit_1('Generate_One_En',
CONCAT_WS(',',QUOTE(`missionid_`),QUOTE(`rowids`),'@a','@b','@c'),NULL);
START TRANSACTION;
				SET @funcid = CONCAT_WS(' ', 'Generate_One_En'),
				@pp =CONCAT_WS(',',QUOTE(`missionid_`) ,QUOTE(`rowids`) , '@field_names' ,'@rownum' ,'@`jans`');
INSERT INTO plogs (Function_Name,parameter) VALUES (@funcid,@pp);
#CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp));COMMIT;
COMMIT;
/*,'l','1'*/


		SET missionid_ = TRIM(missionid_),
				@answer_stmtbody = NULL;

-- SELECT @answer_stmtbody ;LEAVE la;
		CALL Generate_One_En_test(`missionid_`);
-- SELECT @answer_stmtbody ;LEAVE la;
		SET rowids =CONCAT("'",REPLACE(rowids,',',"','"),"'"),
				@a_fnz = NULL,@a_fds =NULL ,@a_billid = NULL ,@a_billtype = NULL,
				@answer_stmtbody = CONCAT(
						"SELECT \n",
						"CAST(GROUP_CONCAT(DISTINCT a.a_fnz SEPARATOR ',') AS CHAR), \n", 
						"a.fds,a.billid,a.billtype\n",
						"INTO @a_fnz,@a_fds,@a_billid , @a_billtype\n",
						"FROM  answer as a \n",
						"WHERE A.MISSIONID =", QUOTE(missionid_),
						IF(FIND_IN_SET("'0'",rowids),"\nAND a.a_t = 0 \n", "\nAND a.a_t > 0 \n"),
						"GROUP BY a.missionId");


		PREPARE stmt from  @answer_stmtbody ;
    EXECUTE stmt;	

		IF @a_fnz IS NULL THEN
			 LEAVE la;
		END IF;


-- SELECT @a_fnz;	
		SET 	@a_fnz = Fielter_Set(@a_fnz),
					@rownnum = NULL,@a_t=NULL,@a_jans=NULL,@a_fds =NULL ,@a_billid = NULL ,@a_billtype = NULL,
					@answer_stmtbody = CONCAT("SELECT  \n",
									"COUNT(a.a_t) as rownum,\n",
									"CAST(GROUP_CONCAT(a.a_t) as char) as a_t,\n",
									"CAST(GROUP_CONCAT(DISTINCT a.a_fs SEPARATOR ',') AS CHAR) \n", 
									" ,CAST(GROUP_CONCAT(\"\\\"\",",
									"CONCAT_WS(',',QUOTE(a.a_t),",
									Temp_Func_C("QUOTE(IF(a.?? is NULL,'null',a.??))",@a_fnz,NULL),"),\"\\\"\" SEPARATOR ',')",
									" AS CHAR) AS jans ,\n",
									"a.fds,a.billid,a.billtype\n",
									"INTO @rownum ,@a_t,@answer_stmtbody ,@a_jans,@a_fds ,@a_billid , @a_billtype\n",
									"FROM  answer as a \n",
									"WHERE A.MISSIONID =", QUOTE(missionid_),
									 IF(FIND_IN_SET("'0'",rowids),"\n AND a.a_t = 0 \n", "\nAND a.a_t > 0 \n"),
									"GROUP BY a.missionId");
-- SELECT @a_fnz;	
		PREPARE stmt from  @answer_stmtbody ;
		SET @answer_stmtbody = NULL,@rownum = NULL;

		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;

		SET	 field_names =REPLACE(@a_fnz,'a',''),
				 rownum = fillp(@a_t),
				 jans = @a_jans;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Generate_One_En_test`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Generate_One_En_test`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Generate_One_En_test`(IN `missionid_` varchar(60))
la:BEGIN

  DECLARE CONTINUE HANDLER FOR  SQLSTATE '23000', SQLSTATE	'42000'	, SQLSTATE	'42S22' , SQLSTATE	'HY000'-- ,SQLSTATE	'22007'
	BEGIN GET DIAGNOSTICS CONDITION 1 @`sqlstate` = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;SET  @`sqlstate` = JSON_OBJECT('sqlstate',@`sqlstate`,'errno',@errno,'text',@text);
				SET @`errsql` = @answer_stmtbody;
				SET @funcid = CONCAT_WS(' ','Error: ', ' Generate_One_En_test' ,`statu`,ELT(`statu`,'','对比','保存','提示' , '？5')),
				@pp =CONCAT_WS(',',quote(`statu`),quote( `key_names`),quote( `key_values`),quote( `field_names`),quote( `field_values`),quote( `rowids` ),quote( dblob));
				CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp,'SQL',@`errsql`,'err',@`sqlstate`));
	END;
/*
START TRANSACTION;
				SET @funcid = CONCAT_WS(' ', ' 3in1' ,`statu`,ELT(`statu`,'','对比','保存','提示' , '？5')),
				@pp =CONCAT_WS(',',quote(`statu`),quote( `key_names`),quote( `key_values`),quote( `field_names`),quote( `field_values`),quote( `rowids` ),quote( dblob));
CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp,'l','1'));COMMIT;
*/

	 	SET @answer_stmtbody = CONCAT_WS('',"SELECT IF(b.missionId is NULL,'', a.statu),
					CAST(CONCAT_WS(',',IFNULL(A.need_input_a,0),IFNULL(A.need_input_b,0)) AS CHAR) 
			INTO @answer_stmtbody,@A_S
			FROM acc_mission AS a 
			LEFT JOIN answer AS b ON a.missionId = b.missionId
			WHERE a.missionId = ",QUOTE(missionid_),"
			GROUP BY a.missionId");
-- SELECT @answer_stmtbody; LEAVE la;
EXECUTE immediate @answer_stmtbody;
		IF FOUND_ROWS() != 0 AND IFNULL(@answer_stmtbody,'') != '3'  THEN

			SET @i = NULL,@bi= NULL;
			DELETE a.* from answer AS a  WHERE a.missionid = missionid_;
			SET @answer_stmtbody :=concat("INSERT INTO answer(missionId,billid,billtype,fds,a_t,a_fnz,a_n,a_fs,",
Temp_Func("a??",1,100,NULL),")
SELECT\n", 

"a.missionId,a.billid,a1.billType,\n",
"CONCAT_WS(',',",
Temp_Func("IF(IFNULL(a.key_b??,'') ='',NULL,'??')",1,50,','),") AS fds ,\n",
"0,@g :=CONCAT_WS(',',",
Temp_Func("IF(ab(b.a??,a.init_a??,c.blur_a??) IS NULL,NULL,'a??')",1,100,','),") AS a_fnz,
func_get_string_count(@g,'a') AS a_n,REPLACE(@g,'a','') AS a_fs,\n",
Temp_Func("ab(b.a??,a.init_a??,c.blur_a??)AS a??",1,100,','),"\n",
"FROM acc_mission AS a
LEFT JOIN `mysq1_schema`.bill_list AS a1 ON a.billId = a1.billId
LEFT  JOIN acc_standard_1 AS b ON a.missionId = b.missionId
LEFT  JOIN acc_standard_blur_1 AS c ON a.missionId = c.missionId
WHERE a.missionid =",QUOTE(missionid_)," AND\n",
"CONCAT_WS(',',",
"IF(@i := IF(CHAR_LENGTH(IFNULL(init_b1,''))>3,1,0),NULL,NULL),\n",
"IF(@bi := IF(@i,init_b1,CONCAT('{',CONCAT_WS(',',",
Temp_Func('IF(IFNULL(init_b??,"")="",NULL,\'"??":"1"\')',1,50,NULL),
"),'}')),NULL,NULL),\n",
Temp_Func("ab(b.a??,a.init_a??,c.blur_a??)",1,100,','),") != ''");
-- SELECT @answer_stmtbody;-- LEAVE la;
					PREPARE stmt_insert_answer FROM @answer_stmtbody;
					EXECUTE stmt_insert_answer ;

			IF  @i IS NULL OR not @i  THEN 
					SET @answer_stmtbody :=concat("INSERT INTO answer(missionId,billid,billType,fds,a_t,a_fnz,a_n,a_fs,",
	Temp_Func("a??",1,50,NULL),"
 -- ,i_fnz,i_fnv
)
SELECT a.missionId,a.billid,a1.billType,\n",
"CONCAT_WS(',',",
Temp_Func("IF(IFNULL(a.key_b??,'') ='',NULL,'??')",1,50,','),") AS fds ,\n",
"b.rowno AS a_t,@g :=CONCAT_WS(',',",
Temp_Func("IF(ab(b.b??,a.init_b??,c.blur_b??) IS NULL,NULL,'a??')",1,50,','),") AS a_fnz,
func_get_string_count(@g,'a') AS a_n,REPLACE(@g,'a','') AS a_fs,
",Temp_Func("ab(b.b??,a.init_b??,c.blur_b??)AS a??",1,50,','),
"\nFROM acc_mission AS a
LEFT JOIN `mysq1_schema`.bill_list AS a1 ON a.billId = a1.billId
LEFT  JOIN acc_standard_n AS b ON a.missionId = b.missionId
LEFT  JOIN acc_standard_blur_n AS c ON b.missionId = c.missionId AND b.rowNo = c.rowno
where a.missionid = ",QUOTE(missionid_)," 
AND CONCAT_WS(',',",
Temp_Func("ab(b.b??,a.init_b??,c.blur_b??)",1,50,','),") != ''");

				ELSE

					SET @answer_stmtbody :=concat("INSERT INTO answer(missionId,billid,billType,fds,a_t,a_fnz,a_n,a_fs,",
	Temp_Func("a??",1,50,NULL),"
 -- ,i_fnz,i_fnv
)
SELECT a.missionId,a.billid,a1.billType,\n",
"CONCAT_WS(',',",
Temp_Func("IF(IFNULL(a.key_b??,'') ='',NULL,'??')",1,50,','),") AS fds ,\n",
"b.rowno AS a_t,@g :=CONCAT_WS(',',",
Temp_Func("IF(@ab?? IS NULL,NULL,'a??')",1,50,','),") AS a_fnz,
func_get_string_count(@g,'a') AS a_n,REPLACE(@g,'a','') AS a_fs,
",Temp_Func("@ab?? AS a??",1,50,','),
"\nFROM acc_mission AS a
LEFT JOIN `mysq1_schema`.bill_list AS a1 ON a.billId = a1.billId
LEFT  JOIN acc_standard_n AS b ON a.missionId = b.missionId
LEFT  JOIN acc_standard_blur_n AS c ON b.missionId = c.missionId AND b.rowNo = c.rowno
where a.missionid = ",QUOTE(missionid_)," AND\n",
"IF1(@bio := je1(@bi,b.rowno)) AND\n",
"CONCAT_WS(',',",
Temp_Func("@ab?? := ab(b.b??,je(@bio,??),c.blur_b??)",1,50,','),") != ''");

					END IF;

-- SELECT @answer_stmtbody;LEAVE la;
					PREPARE stmt_insert_answer FROM @answer_stmtbody;
					EXECUTE stmt_insert_answer ;

					DEALLOCATE PREPARE stmt_insert_answer;

					UPDATE acc_mission AS a,(SELECT  missionid_  AS missionid,
																	IF(b.a_t = 0,b.a_n,0) AS in_a ,Sum(IF(b.a_t>0,b.a_n,0)) AS in_b 
																	FROM answer AS b 
																	WHERE  b.missionId = `missionid_`)AS b
					SET  a.need_input_a = b.in_a ,
							 a.need_input_b = b.in_b ,
							 a.statu  = 3
					WHERE  a.missionId = b.missionid  AND IFNULL(a.statu,'') !='3' ;
 -- SELECT @answer_stmtbody; LEAVE la;

		END IF;

 -- SELECT @answer_stmtbody; LEAVE la;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `gk`
-- ----------------------------
DROP FUNCTION IF EXISTS `gk`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `gk`(`w` varchar(2000)) RETURNS varchar(160) CHARSET utf8mb3
    NO SQL
BEGIN
	CASE
			WHEN Eltm(0,w) =2 THEN
				SET w = CONCAT(LPAD(IFNULL(LEFT(UNIX_TIMESTAMP(DATE(Fetch_Elt(2,w))),8),''),8,'0'),LPAD(Fetch_Elt(3,w)+0,3,'0'));
		ELSE SET w = CONCAT('qianxue-',RIGHT(Fetch_Elt(1,w),4),LPAD(IFNULL(LEFT(UNIX_TIMESTAMP(DATE(Fetch_Elt(2,w))),8),''),8,'0'),LPAD(Fetch_Elt(3,w)+0,3,'0'));
	END CASE;
	RETURN w;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `gkey`
-- ----------------------------
DROP FUNCTION IF EXISTS `gkey`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `gkey`(`userid` varchar(20)) RETURNS varchar(160) CHARSET utf8mb3
    NO SQL
BEGIN
	
  set @keyword = CONCAT(userid , DATE_FORMAT(NOW(),'%y%m%d%H%i%s'),
									RIGHT(RAND(),6));
	RETURN @keyword;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `gkey2`
-- ----------------------------
DROP FUNCTION IF EXISTS `gkey2`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `gkey2`(`b` blob) RETURNS text CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	DECLARE reg BLOB  DEFAULT R('`seafilter`'); DECLARE rep VARCHAR(200) DEFAULT '[a-z]';

	RETURN REGEXP_REPLACE(MD5(REGEXP_replace(b,reg,'')),rep,'');
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `if1`
-- ----------------------------
DROP FUNCTION IF EXISTS `if1`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `if1`(`i` varchar(20000)) RETURNS varchar(1) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...

	RETURN '1';
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `immediate`
-- ----------------------------
DROP FUNCTION IF EXISTS `immediate`;
DELIMITER ;;
CREATE DEFINER=`root`@`::1` FUNCTION `immediate`() RETURNS int(11)
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...

	RETURN 'immediate';
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `inScore`
-- ----------------------------
DROP FUNCTION IF EXISTS `inScore`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `inScore`(`theScore` varchar(30),`themin` varchar(30),`themax` varchar(30)) RETURNS tinyint(1)
    NO SQL
    DETERMINISTIC
BEGIN

   IF  thescore REGEXP '^[0-9]+' then 
				SET @score = CAST(theScore AS DECIMAL(14,8));
				IF  CONCAT(themin ,themax ) REGEXP '^[0-9]+' THEN
						SET  @min =  themin +0.0 ,
									@max = themax + 0.0;
				ELSE RETURN null;
				end if ;
		ELSE RETURN NULL;
	END IF;
	if @min> @max then 
			set @tmp = @min,
					@min = @max,
					@max = @tmp ;
	end if ;
-- 	set thescore = IFNULL(thescore,0);  ^[0-9]+
  RETURN IF(@score >= @min and @score < @max,1,0);
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Is_amount`
-- ----------------------------
DROP FUNCTION IF EXISTS `Is_amount`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Is_amount`(`amount`  varchar(5000)) RETURNS varchar(5000) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	DECLARE front_  text DEFAULT null;
	DECLARE rear_  text DEFAULT null;
	DECLARE frag_  text DEFAULT null;
	DECLARE mins  VARCHAR(1) DEFAULT '';
  SET amount = TRIM(amount);

	CASE

				WHEN amount IS NULL THEN RETURN NULL;

				WHEN amount ='' THEN RETURN '';

				WHEN CHAR_LENGTH(amount) >500 THEN RETURN amount;

				WHEN amount REGEXP '^([-]?(0|[1-9][0-9]{0,2})(\\.[0-9]+)?)$' THEN 
							set frag_ := PREG_CAPTURE('/^[-]?(0|[1-9][0-9]{0,2})(\\.[0-9]+)?$/',`amount`,0);



							SET  		rear_ := IF(frag_/100 REGEXP '[.]','[0-9]*', '([.][0-9]+)?'),
											front_ := CONCAT(frag_/100,rear_,'$'),
											rear_ := IF(frag_*100 REGEXP '[.]','[0-9]*', '([.][0-9]+)?'),
											amount := CONCAT(frag_*100,rear_,'(%|％)?','$'),
											rear_ := IF(frag_ + 0 REGEXP '[.]','[0-9]*', '([.][0-9]+)?'),
											rear_ 	:= CONCAT(frag_ + 0 ,rear_,'(%|％)?','$'),
											amount := CONCAT_WS('|', front_ ,amount ,rear_ ),
											amount := CONCAT('^',amount);
-- REPLACE(amount,'\.','[.]')
				WHEN amount REGEXP '^([-]?(0|[1-9][0-9]{0,2})(\\.[0-9]+)?)(%|％)$' THEN 
							set frag_ = REGEXP_SUBSTR(amount ,'^([-]?(0|[1-9][0-9]{0,2})(\\.[0-9]+)?)(?=[%％]|$)');

		
							SET 	 	rear_ := IF(frag_/100 REGEXP '[.]','[0-9]*', '([.][0-9]+)?'),
											front_ := CONCAT(frag_/100,rear_,'$'),
											rear_ := IF(frag_ + 0 REGEXP '[.]','[0-9]*', '([.][0-9]+)?'),
											rear_ 	:= CONCAT(frag_ + 0 ,rear_,'(%|％)?','$'),
										amount := CONCAT_WS('|',front_ ,rear_ ),
										amount := CONCAT('^',amount)/**/ ;

				WHEN amount REGEXP '^[-]?([0-9](,?[0-9]{3}){0,})+(\\.?[0-9]+)?$' THEN


					IF amount REGEXP  '^\\-' THEN 
							SET mins = '-' ,
									amount =  SUBSTR(amount,2);
					END IF;

					SET amount	= REPLACE(amount,',',''),
							front_	= SUBSTRING_INDEX(amount,'.',1),
							rear_ 	= SUBSTRING_INDEX(amount,'.',-1);

-- RETURN rear_;
					IF rear_ <> front_ THEN 
								IF rear_ = 0 THEN
												SET amount ='([.]0+)?$';
									ELSE	SET amount =CONCAT('[.]',rear_);
								END IF;
						ELSE 
								SET amount = '([.]0+)?$';
					END IF;

					IF front_ = 0 THEN
							SET amount = CONCAT('0',amount);

/**/
					ELSE 
							SET  front_ = REVERSE(front_);


							label1: LOOP

									SET  frag_ = SUBSTR(front_ ,1,3),
											 amount = CONCAT(REVERSE(frag_),amount),
											 front_ =  SUBSTR(front_,4);

									IF  front_  !=  0  THEN 
											SET amount = CONCAT('[,|[:blank:]]?',amount);
											ITERATE label1;
										ELSE 
											LEAVE label1;
									END IF;

							END LOOP label1;

					END IF;				
				
					SET amount = CONCAT('^',mins,amount );
	ELSE SET amount = amount ;
			
	END CASE;

	RETURN  amount ;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `j`
-- ----------------------------
DROP FUNCTION IF EXISTS `j`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `j`(`j` longblob) RETURNS longblob
    NO SQL
    DETERMINISTIC
j : BEGIN
	DECLARE
		`eno` INT ( 10 ) DEFAULT NULL;
	DECLARE
		`err` VARCHAR ( 120 ) DEFAULT NULL;
	DECLARE
		`r0`,
		`r`,
		`r1`,
		`r2`,
		`k`,`mod`
		TEXT DEFAULT CONCAT( '(?(DEFINE)(?ixsm)
			(?<k>"[\\w\\.\\$]+"|(?:\\$\\.)?\\b[\\w]+\\b|`.+`)(?=\\s*:)
			(?<v>(?:"(?s)(?:[^\\\\"]|\\\\.)*" |\\-?\\d+(?:\\.\\d+)?|null|(?&kvs)|(?&a)|(?&k)))
			(?<a>\\[\\s*(?&v)(?:(?:\\s*,\\s*)(?&v))*?\\s*])
			(?<kv>(?&k)\\s*:\\s*(?&v))
			(?<kvs>\\{\\s*(?&kv)(?:\\s*,\\s*(?&kv))*?\\s*})
			(?<j>(?:(?&kvs)|(?&a)))
		)' );
	DECLARE
		`res` LONGBLOB DEFAULT NULL;
		SET `r` := CONCAT( '(?x)^\\s*(?&j)(?=(?:\\s*(?:,\\s*(?:(?&k)|(?&kv)))*?)$)', `r0` );
RETURN  CONCAT('(?ixsm)^(?&v)+$',r0 );
 SET j = IF( CONCAT_WS('','[',j,']') REGEXP CONCAT('(?ixsm)^(?&v)+$',r0 ),CONCAT_WS('','[',j,']') ,j);


	WHILE
			! json_valid( `j` ) && IFNULL(k,'')!='' && `j` REGEXP `r`  DO--  `初始化jk`
			SET -- `r` := CONCAT( '(?x)^\\s*(?&j)(?=(?:\\s*,\\s*(?:(?&k)|(?&kv)))*?$)', `r0` ) ,-- 表达式,-- 	`j` := '[{"撒旦":2,yu:"ol"},"yu",5],78,$.pp,"45p"' 校验字符串,	`j` REGEXP `r` `is`,
			`res` := REGEXP_substr ( `j`, `r` ),--  `取JSON`,
			`k` = substr( `j`, CHAR_length( `res` )+1 ),
			`k` = IF(`k` REGEXP '^\\s*$',NULL,CONCAT( REGEXP_replace ( `k`, '^\\s*,\\s*', '[' ), ']' ));-- `取k`,

			SET `r1` := CONCAT( '(?!")(?&k)(?=\\s*:\\s*(?&v))', `r0` ),-- `表达式1`,	`res` REGEXP `r1` j校验,
			`res` := REGEXP_replace (CAST( `res` AS CHAR), `r1`, '"\\0"' ),-- json_valid( `re s` ) j校验,
			`r2` := CONCAT( '(?&k)(?=\\s*[:,]\\s*(?:(?&k)|&j)])', `r0` ),--  `表达式2`,	`k` REGEXP `r2` KEY校验,
			`k` := REGEXP_replace ( `k`, `r2`, '"\\0"' )-- json_valid( `k` ) -- KEY校验
			;

	END WHILE;

	SET `j` = `res`;
	


	CASE
			
			WHEN  IFNULL( `j`,0 )!=0 && IFNULL( `k`, 0 )!=0 THEN

			SET `j` = `k`;
		
		WHEN  IFNULL( `k`, 0)!=0 && IFNULL( `j`, '') =0 THEN
		
		SET `j` = `res`;
		
		WHEN ! json_valid( `j` ) THEN-- SIGNAL SQLSTATE 'HY000' SET MYSQL_ERRNO =eno , MESSAGE_TEXT = `err`
		
		SET `err` = '无效j',
		`eno` = 1001;
		
		WHEN ! json_valid( `k` ) THEN
		
		SET `err` = '无效k',
		`eno` = 1002;
		ELSE l :
		LOOP
			IF
				! ifnull( `k`, 0 )|| ! json_valid( `k` ) || ! JSON_DEPTH( `k` )> 1 THEN
					LEAVE l;
				
			END IF;
			
			SET `MOD` = JSON_value( `j`, '$[0]' ),
			`k` = json_remove( `j`, '$[0]' );
			CASE
					
					WHEN `mod` REGEXP '(?i)"(?:\\$\\.)?\\w+(?=")' THEN
					
					SET `MOD` := REGEXP_replace ( `mod`, '(?i)"(?:\\$\\.)?\\K\\w+(?=")', '$**.\\0' ),
					`res` = JSON_value( `j`,`MOD` ); ELSE 
					SET `res` = `res`;
				
			END CASE;
			
		END LOOP l;
		
	END CASE;
	RETURN `j`;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `j0`
-- ----------------------------
DROP FUNCTION IF EXISTS `j0`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `j0`(`j` longtext,k varchar(255)) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
DECLARE r text DEFAULT CONCAT( '(?(DEFINE)(?ixsm)
			(?<k>"[\\w\\.\\$]+"|(?:\\$\\.)?\\b[\\w]+\\b|`.+`)(?=\\s*:)
			(?<v>(?:"(?s)(?:[^\\\\"]|\\\\.)*" |\\-?\\d+(?:\\.\\d+)?|null|(?&kvs)|(?&a)))
			(?<a>\\[\\s*(?&v)(?:(?:\\s*,\\s*)(?&v))*?\\s*])
			(?<kv>(?&k)\\s*:\\s*(?&v))
			(?<kvs>\\{\\s*(?&kv)(?:\\s*,\\s*(?&kv))*?\\s*})
			(?<j>(?:(?&kvs)|(?&a)))
		)' );
		
	SET k = REGEXP_replace(k,'^\\s+|\\s+$','');
 	CASE WHEN k IS NULL  THEN 
				RETURN NULL;
			WHEN  k REGEXP '^\\s*_\\w+\\s*' THEN
				SET k = CONCAT('\\w+',k);
	ELSE  SET k = k ;
	END CASE;
	
	
  SET `r` := CONCAT('(?ixsm)"',k,'"\\s*:\\s*\\K(?&v)'
,r 
),
			j = REGEXP_substr(j,`r`)/**/ ;

-- RETURN CONVERT(j USING utf8);
	IF j = '' THEN SET j= NULL;END IF;

  IF json_valid(j) THEN 
		SET j= JSON_UNQUOTE(j); 
		RETURN j;
	END IF;

	IF j REGEXP '^[{]' THEN 
		SET j = REGEXP_REPLACE(j,'^[{]|[}]$',''); 
		ELSE 
 			SET j = REGEXP_REPLACE(j,'^[\'"]|(?<=[^\\\\])\\\\|[\'"]*$','\\1'); 
		RETURN  j;	
	END IF;

	RETURN j;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `j1`
-- ----------------------------
DROP FUNCTION IF EXISTS `j1`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `j1`(`j` longtext,k varchar(255)) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
  SET j = j0(j,k);

	RETURN IF(j IS NULL,'NULL',j);
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `j1n`
-- ----------------------------
DROP FUNCTION IF EXISTS `j1n`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `j1n`(`j` MEDIUMBLOB) RETURNS mediumtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	DECLARE `c` MEDIUMBLOB DEFAULT NULL;
	DECLARE `c0` VARCHAR(5) DEFAULT NULL;
	DECLARE `r` MEDIUMBLOB DEFAULT NULL;		
	DECLARE `r0` VARCHAR(100) DEFAULT '"(\\d+)("(?<kvs>:\\{(?<kv>(?<k>"(?:\\\\.|[^"])*"):(?&k))(?:,(?&kv))*\\}))';	
	DECLARE `i` VARCHAR(5) DEFAULT 2;


	IF IFNULL(j,'') = ''  THEN RETURN NULL; END IF;
	SET `c` = REGEXP_substr(j,r0);

	IF `c` IS NULL THEN RETURN j;	END IF;

	SET `c0` = REGEXP_replace(c,r0,'\\1'),
			`j` = REGEXP_replace(j,'(?<=")(\\d+)(?=":\\{)','\\1-'),
			`r` = CONCAT('\\Q',REGEXP_replace(c,r0,'\\2'),'\\E'),
	 		`j` = REGEXP_replace(j,CONCAT('(?<=\\{")(',c0,'\\-)(?=',r,')'),1),
			`r0` = '"(\\d+\\-)("(?<kvs>:\\{(?<kv>(?<k>"(?:\\\\.|[^"])*"):(?&k))(?:,(?&kv))*\\}))';

	ll:LOOP

		SET `c` = REGEXP_substr(j,CONCAT('(?<=',r,',)',r0));
/*
IF i=13 THEN
RETURN CONCAT('(?<=',r,',)',r0);
END IF;*/
		IF IFNULL(`c`,'') = '' THEN LEAVE ll;END IF;

		SET `c0` = REGEXP_replace(c,r0,'\\1'),
				`j` = REGEXP_replace(j,CONCAT('(?<="',i-1,r,',")(',c0,')(?=',CONCAT('\\Q',REGEXP_replace(c,r0,'\\2'),'\\E'),')'),i),
				`r` = CONCAT('\\Q',REGEXP_replace(c,r0,'\\2'),'\\E'),
				 i = i+1 ;

	END LOOP;

	
   

	RETURN j;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `j2`
-- ----------------------------
DROP FUNCTION IF EXISTS `j2`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `j2`(`j` longblob,k varchar(255)) RETURNS longblob
    NO SQL
BEGIN
	#Routine body goes here...
  SET j = j0(j,k);

	RETURN IF( IFNULL(j,'') =  '','NULL',quotd(j));
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `j2a`
-- ----------------------------
DROP FUNCTION IF EXISTS `j2a`;
DELIMITER ;;
CREATE DEFINER=`root`@`::1` FUNCTION `j2a`(`p` LONGTEXT,`k` TEXT) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN #DECLARE i INT(5) DEFAULT 0;
 

	 CASE 
	 WHEN  JSON_VALID(p)  AND CAST(json_value(p,'$.功能')AS CHAR) = '简单记录' THEN
	
		set k = REGEXP_substr(json_value(p,'$.字段'),'^([^,\\s]+)(?:,[^,\\s]+)*?(?=,\\1,|$)'),
		p = CAST(JSON_SET(p , "$.字段"
		,CONCAT_WS(',',CASE 
				WHEN JSON_VALUE(p, '$.表') REGEXP '(?i)standard_1$' THEN  'missionId'
				WHEN JSON_VALUE(p, '$.表') REGEXP '(?i)backbill_1$' THEN  'missionId'
				WHEN JSON_VALUE(p, '$.表') REGEXP '(?i)standard_n$' THEN  'missionId,rowNo'
				WHEN JSON_VALUE(p, '$.表') REGEXP '(?i)backbill_n$' THEN  'missionId,rowid'
				ELSE NULL END,
				REGEXP_substr(json_value(p,'$.字段'),'^([^,\\s]+)(?:,[^,\\s]+)*?(?=,\\1,|$)'))
		)AS CHAR);

	SET  p = CONCAT_WS(IF(IFNULL(jSON_VALUE(k, '$.链接符') ,'') = '','\t',jSON_VALUE(k, '$.链接符'))
,CONCAT("SELECT")
,CONCAT_WS(',',CONCAT(QUOTE(JSON_VALUE(p, '$.辅助信息')),'AS f')
,JSON_VALUE(p, '$.字段'))
,CONCAT("FROM " , JSON_VALUE(p, '$.表')," AS a ")
,CONCAT("WHERE a.missionId IN (",json_value(p,'$.关键字'),")")
,CONCAT("AND IFNULL(CONCAT_WS('',",k,"),'')!=''")
);
	return p;
	
	
	



	 WHEN  JSON_VALID(k)  AND JSON_VALUE(k,'$[0]') = 'SELECT' THEN
BEGIN  DECLARE i int(5) DEFAULT 0;DECLARE x int(5) DEFAULT 0; DECLARE y int(5) DEFAULT 0;DECLARE `rs` LONGTEXT DEFAULT null;

IF JSON_DEPTH(p) >2  AND JSON_LENGTH(P)>0 THEN SET x = JSON_LENGTH(JSON_QUERY(p, '$[0]')) ,y= JSON_LENGTH(p);

ELSE SET  x = JSON_LENGTH(p),p = CONCAT('[',p,']') ;
END IF;
	SET x = JSON_LENGTH(JSON_QUERY(p, '$[0]')) ,y= JSON_LENGTH(p);

	l1: LOOP
	IF i>=x  THEN 	LEAVE l1; END IF; #RETURN JSON_EXTRACT(p,CONCAT('$[0][',CONCAT(i,''),']'));
	  SET rs  = CONCAT_WS(',',rs 
								,CONCAT_WS(' AS ',JSON_EXTRACT(p,CONCAT('$[0][',CONCAT(i,''),']')),JSON_VALUE(k, CONCAT('$[',i+1,']')))
						),

				i = i+1;

				
	END LOOP l1;
	SET i = 1,
			rs =CONCAT_WS(' ','SELECT',rs);

	l2: LOOP
	IF i>y  THEN 	LEAVE l2; END IF;

	  SET rs = CONCAT_WS(' UNION\n',RS,CONCAT("SELECT ",REGEXP_replace(JSON_query(p, CONCAT('$[1]')),'^\\[|\\]$',''))),
				p = JSON_REMOVE(p,'$[1]'),
				i = i+1;
-- return rs ;
	END LOOP l2;
	
RETURN rs;
END;
	WHEN k REGEXP '(?i)^(?:转|2)(?:arr(?:ay)?|数组)' AND  p REGEXP '[\\w_`,\\s]+' THEN  
		SET p = CONCAT('[',REGEXP_replace(p,'([^\\s,]+)','"\\1"'),"]"); RETURN p;
	WHEN k REGEXP '引号' THEN SET p =  REGEXP_REPLACe(p,'(?<!\\\\)\\\\|(?<!\\\\)"|^[\\[\\{]++|[\\]\\}]++','');
	WHEN k REGEXP 'low' THEN  SET  p = REGEXP_replace(json_KEYS(p),'("[^"]+")','\\1:\\1');set p = REGEXP_replace(p,'^[\\[\\{]++|[\\]\\}]++','');
	RETURN CONCAT('{',p ,'}');
WHEN  k  REGEXP '转变量'THEN  SET p = REGEXP_replace(p,'"([^"]+)":',CONCAT_WS('.',REGEXP_substr(k,'(?<=,)\\s*\\w'),'\\1='));
WHEN k REGEXP '转等式'  THEN  SET p = REGEXP_replace(p,'"([^"]+)"',CONCAT(CONCAT_WS('.','a.\\1='),CONCAT_WS('.','b.\\1')));
WHEN k REGEXP '^\\-?\\d++$'THEN   SET k = REGEXP_substr(k,'\\-?\\d++');
SET k = CONCAT('$[',IF (k <0 , JSON_LENGTH(p )+k,k), ']');
SET p =   JSON_VALUE(p ,k);
 
	ELSE SET p = '错';
END CASE;
RETURN REGEXP_replace(p,'^[\\[\\{]++|[\\]\\}]++','');
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `j2j`
-- ----------------------------
DROP FUNCTION IF EXISTS `j2j`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `j2j`(`j` longblob) RETURNS longtext CHARSET utf8mb3
    DETERMINISTIC
BEGIN
DECLARE res longtext DEFAULT NULL;


	RETURN CASE json_valid(j) AND JSON_DEPTH(j) 
	WHEN 1 THEN  CONCAT_WS('','[',j,']') 
	WHEN 2 THEN j
	WHEN 3 THEN json_extract(j,'$[*][*]') 
	ELSE j END  ;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `j2s`
-- ----------------------------
DROP FUNCTION IF EXISTS `j2s`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `j2s`(`v` longblob,`k` blob) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	DECLARE `KEYs` TEXT DEFAULT NULL;DECLARE `KEY` TINYTEXT DEFAULT NULL;DECLARE `i` INT(5) DEFAULT 0;	DECLARE `l` INT(5) DEFAULT 0;	DECLARE 页面 VARCHAR(200) DEFAULT json_extract(CAST(`k` AS CHAR),'$.页面');	DECLARE `r` TEXT DEFAULT 			'(?ix)(?:(?:"(?:(?=\\\\\).{2}|[^"\\\\]++)*?")|llun|[.\\d\\,\\-]+)\\s*:("[^"]+"),(?=(?:"(?:(?=\\\\\).{2}|[^"\\\\]++)*?"|[^\\]"]++)*?(?=\\g{-1}))';

	DECLARE `排除页面` LONGTEXT DEFAULT json_array('bill/kjdz_cbhzbdl/V3/kjdz_cbhzbdl.jsp');
	DECLARE `不记录页面` LONGTEXT DEFAULT json_array('bill/odot_gdzckp/V3/odot_gdzckp.jsp','bill/odot_tyjsb/V4/odot_tyjsb.jsp');
	DECLARE `替补页面` LONGTEXT DEFAULT CONCAT_WS('','[',CONCAT_WS(','	
,json_object("页面",'bill/odot_gdzckp/V3/odot_gdzckp.jsp','行','10','方向','4')

,json_object("页面",'bill/odsm_clzlt0/V2/odsm_clzlt0.jsp','行','13','方向','2'),json_object("页面",'bill/kjdz_fzscfyfpb_fzscfyfpb/V3/kjdz_fzscfyfpb_fzscfyfpb.jsp','行','26','方向','2')	,json_object("页面",'bill/kjdz_cbhzb_cbhzb/V2/kjdz_cbhzb_cbhzb.jsp','行','14','方向','2')	),']');

	DECLARE `re` LONGTEXT DEFAULT NULL;	DECLARE `kk` LONGTEXT DEFAULT NULL;	DECLARE `v0` LONGTEXT DEFAULT NULL;

	IF IFNULL(@记录参数,'') THEN 
				REPLACE INTO plogs(Function_Name,parameter)
				VALUE('j2s 记录参数',CONCAT_WS('',QUOTE(`v`),QUOTE(`k`)));
	END IF;
SET `KEYS` = json_extract(`k`,'$.键'),`KEY` = json_extract(CAST(`k` AS CHAR),'$.关键字');

	IF IFNULL(v,'')='' THEN IF IFNULL(@调试,'') != '' THEN	REPLACE INTO plogs(Function_Name,parameter) 	VALUES('j2s',CONCAT_WS('__',`v`,`k`));	END IF;
				RETURN  NULL;
	END IF;

	IF !json_valid(`k`)  THEN 				CASE 					WHEN json_valid(CONCAT('{',`k`,'}')) THEN SET `k` = CONCAT('{',`k`,'}'); 					WHEN `k` REGEXP '^([^,"])+(?:,(?1))*?$' THEN SET `k` =  CONCAT_WS('','{"键":[',REGEXP_replace(`k`,'\\s*,\\s*','","'),'"]}');					WHEN `k` REGEXP '^("[^,"]+")(?:,(?1))*?$' THEN SET `k` =  CONCAT_WS('','{"键":[',`k`,'"]}');				ELSE RETURN NULL;			END case;			END IF;

	IF json_valid(`k`) AND json_extract(`k`,'$.键') IS NOT NULL AND json_extract(`k`,'$.键')REGEXP '\\w+(,\\s*\\w+)+'  THEN 
				SET `k` = REGEXP_replace(`k`,'"键":\\s*\\[?".*?"\\]?',CONCAT_WS('','"键":[',REGEXP_replace(REGEXP_replace(json_extract(`k`,'$.键'),',\\s*+','","'),'^\\[|\\]$',''),']'));
	END IF;

	IF `v` REGEXP '"\\w+":' THEN 

		IF IFNULL(json_extract(`k`,'$.键'),'')='' THEN

			SET `k` = json_merge(
				`k`
				,CONCAT_WS('','{"键":',json_keys(CONCAT_WS('','{', REGEXP_substr(`v`,'(("\\w+").*?(?=,\\g2|,?$))'),'}')),'}')
			);
		END IF;



		SET  v  = REGEXP_replace(REGEXP_replace(v,'(?-m),$','')
								,'(("\\w+").*?(?=,\\g2|,?$))','[\\1]');	--  REGEXP_replace(REGEXP_replace(v,'(?-m),$',''),'(("\\w+").*?(?=,\\g2|,?$))','{\\1}');


			IF  ! INSTR(`排除页面`,`页面`) AND REVERSE(v) REGEXP r  THEN 

					CASE WHEN json_unquote(`页面`) = 'bill/kjdz_sjfsmxb_sjfsmxb/V2/kjdz_sjfsmxb_sjfsmxb.jsp' THEN

										SET `v` = REGEXP_replace(REGEXP_replace(`v`
										,'((?!"b11":)"[^"]*?":\\s*(?:"(?:(?=\\\\).{2}|[^\\\\"]+)*?"|[null]+|[\\-"\\.,]+))(?=\\])','\\1,"b11":null')
										,',("b11":\\s*(?:"(?:(?=\\\\).{2}|[^\\\\"]+)*?"|[null]+|[\\-"\\.,]+))(?=\\]$)'
										,CONCAT_WS('','],[',REPEAT('"bb":null',1),REPEAT(',"bb":null',5),',\\1'));
										SET k  = REGEXP_replace(k,'(?<!\\\\)"\\](?=,\\s*"|\\}$)','", "b11\\0');

						ELSE 	SET v = REVERSE(REGEXP_replace(REVERSE(v),r,''));

					END CASE ;

					IF IFNULL(@调试,'') != ''  AND ! INSTR(`不记录页面`,`页面`)  THEN	REPLACE INTO plogs(Function_Name,summary,parameter,parameters) 	VALUE(CONCAT_WS(', ','j2s 重复',json_unquote(页面)),CONCAT_WS(', ',json_value(CAST(`k`  AS CHAR),'$.关键字.missionid'))	,REVERSE(REGEXP_replace(REVERSE(v),CONCAT_WS('','.*?(',r,'|$)'),'\\1'))	,CONCAT_WS('',QUOTE(`v`),QUOTE(`k`)));		END IF;

			END IF;


		SET v  =REGEXP_replace(v ,'"\\w+":\\s*','');

  END IF;



	IF json_depth(v) < 3 OR !json_valid(v) THEN 
			SET v= CONCAT('[',v,']');
			IF json_depth(v) < 3 OR !json_valid(v) THEN 
				RETURN CONCAT_WS(' ','v 错1',v);
			END IF;
	END if; 

	IF json_extract(`k`,'$.表') != '' THEN
	SET `re` = REGEXP_replace(
								REGEXP_replace(json_value(CAST(`k` AS CHAR),'$.表')
									,'(?i)(?:replace|insert)\\s+into\\s+[\\.`\\w_]+'
									,CONCAT('\\0('	,CONCAT_WS(',',json_keys(json_extract(`k`,'$.关键字')),json_extract(`k`,'$.键')),')')
								)
						,'[\\[\\]"]+','');
 END if; 

  SET `re` = CONCAT_WS('',CONCAT_WS('\n',`re`,'select')); 

	IF IFNULL(json_extract(`k`,'$.关键字'),'') !=''  THEN




				SET `k`= 	REGEXP_replace(`k`
					,'("键":\\s*\\[)'
					,CONCAT_WS(''
							,'\\1'
							,REGEXP_replace(json_keys(json_extract(`k`,'$.关键字')),'^\\[|\\]$','')
							,','
						)
					);


				SET		kk =REGEXP_replace(json_extract(`k`,"$.关键字"),'\\{|\\}|"\\w+":','')
							,v = REGEXP_replace(v,'^\\[{2}'
											, CONCAT_WS('','[['
													,kk
													,','
											)
									)
							,kk = REGEXP_replace(kk,'("(@\\w+)\\s*:=)','\\1\\2 + ')
 		 				,v = REGEXP_replace(v,'(?<=\\],)\\s*\\[',CONCAT('[',kk,','))
 ;



	END IF;





  SET `l` = JSON_LENGTH(JSON_extract(`k`,'$.键'))-1 -- json_length(json_query(v,'$[0]'))-1;
			,I = 0;


-- ;

	l:LOOP


		  IF i>l THEN LEAVE l;END IF;
			SET re = CONCAT_WS(IF(i= 0,' ',',')
								,re
								,CONCAT_WS(' AS '
										,IFNULL(json_extract(v,CONCAT('$[0][',i,']')),'NULL')
										,JSON_VALUE(JSON_extract(`k`,'$.键'),CONCAT('$[',i,']'))
								)
						);

	SET i=i+1;
	END LOOP;


	SET i=2; 
  l0:LOOP
			SET v = JSON_REMOVE(v,'$[0]');

			SET `v0` = json_query(v,"$[0]");

		  IF IFNULL(json_length(`v0`),0) =0 THEN LEAVE l0;END IF;

			IF json_length(`v0`) -1 != l THEN 
					SET r=NULL;

					select a.方向 INTO r from json_table(`替补页面`, '$[*]'   columns(  页面  text path '$.页面', 行 text path '$.行', 方向  text path '$.方向'	)) as a	WHERE a.页面 = json_value(CAST(`k` AS CHAR),'$.页面') AND 行 = i ;

					CASE
							WHEN FOUND_ROWS() AND r =2   THEN
							SET `v0` = REGEXP_replace(`v0` ,'(\\]$)', CONCAT_WS('',REPEAT(',null',l-json_length(`v0`)+1),']'));
					
							WHEN FOUND_ROWS() AND r =4   THEN
							SET i= i+1; ITERATE l0;

					ELSE

							IF IFNULL(@调试,'') != 1 THEN  

							REPLACE INTO plogs(Function_Name,summary,parameter,parameters) 
							VALUES(
	 								CONCAT_WS(' ','j2s 长度不等' ,IF(IFNULL(页面,'')!='',json_unquote(页面),'无')) 
									,CONCAT_WS(',','json_object("页面"',页面,'"行"',i,'"方向","???")')
									,CONCAT_WS(', '
													,i
													,json_value(CAST(`k` AS CHAR),'$.关键字.missionid')
													,CONCAT_WS('行',i,CONCAT_WS('/',json_length(`v0`),l))
										)
									,CONCAT_WS('__',`v0`)
							);	
							END IF;

						END CASE;

			END IF;

			SET re = CONCAT_WS(
									CONCAT_WS('',' UNION ALL',IF(IFNULL(@优化,'')!='',@优化,' '), 'SELECT ')
									,re
									,REGEXP_REPLACE(`v0`,'^\\[|\\]$','')
						);

		SET i = i+1;
	END LOOP l0;




	IF   json_extract(`k`,'$.表') REGEXP '(?i)update' THEN
			SET re = CONCAT_WS( IF(IFNULL(@优化,'')!='',@优化,' ')
			,CONCAT_WS(CONCAT_WS('',',',IF(IFNULL(@优化,'')!='',@优化,' '))
					,CONCAT_WS(' ',json_value(CAST(`k` AS CHAR),'$.表'),'as a')
					,CONCAT_WS(IF(IFNULL(@优化,'')!='',@优化,' '),'('
					,REGEXP_replace(re,'(?i-m)^.*?(?m)$\\s*+','')
					,')as b')
			)
			,'SET'
			,REGEXP_replace(`KEYS`,'\\[?"(\\w+)"\\]?','a.\\1 = b.\\1')
			,CONCAT_WS(' ','where',REGEXP_replace(json_keys(`KEY`),'\\[?"([^"]+)"\\]?','a.\\1=b.\\1'))
		);
	END IF;


	IF kk REGEXP "(['\"])(@\\w+\\s*:=.*?)\\g1" THEN
		SET re = REGEXP_replace(re,"(['\"])(@\\w+\\s*:=.*?)\\g1",'\\2');
	END IF;

	SET re = CONCAT(CONCAT_WS(IF(IFNULL(@优化,'')!='',@优化,' ')	,re,json_value(CAST(k AS CHAR),'$.尾')),';');





	RETURN re;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `j2v`
-- ----------------------------
DROP FUNCTION IF EXISTS `j2v`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `j2v`(`j` MEDIUMBLOB) RETURNS mediumblob
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	DECLARE `0` MEDIUMBLOB DEFAULT NULL;
	DECLARE `2` BLOB DEFAULT NULL;
	DECLARE `B` VARCHAR(100)  DEFAULT NULL;
	DECLARE `E` VARCHAR(100)  DEFAULT NULL;

	IF IFNULL(j,'') = '' THEN RETURN NULL; END IF;

	SET `0` = j0(`j`,'`0`'),
			`2` = j0(`j`,'`2`'),
			`B` = IF(IFNULL(j0(`2`,'`B`'),'') = '',"(",j0(`2`,'`B`')),
			`E` = IF(IFNULL(j0(`2`,'`E`'),'') = '' AND `B` = "(",")",j0(`2`,'`E`'));

  IF 	IFNULL(`0`,'') != '' THEN
		SET `j` = j0(j,'`1`');

		IF IFNULL(j0(`2`,"`filter1`"),'') <> '' THEN
-- RETURN 'ok1';
			SET `j` = f2(j0(`2`,"`filter1`"),`j`);RETURN J;
    END IF; 

		SET	`0` = filter1(CONCAT(REG1('`kv-k`'),'\t\\1'),`0`);
	END IF;
	
	IF j REGEXP '^"(?:\\.|[^"])*":\{' THEN
			SET `0` = CONCAT_WS('',`B`,CONCAT_WS(',',`0`,'\\1,\\3'),`E`);
		ELSE 
			SET `0` = CONCAT_WS('',`B`,CONCAT_WS(',',`0`,'\\5'),`E`);
	END IF;

	SET j = filter1(
CONCAT_WS('\n'
,CONCAT(REG1('`kv-k`'),'\t\\1')
,CONCAT(REG1('`+v`'),'\t',`0`)
)
,j);

		IF IFNULL(j0(`2`,"`filter2`"),'') <> '' THEN
-- RETURN 'ok2';
			SET `j` = f2(j0(`2`,"`filter2`"),`j`);RETURN J;
    END IF; 
   

	RETURN j;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `j3`
-- ----------------------------
DROP FUNCTION IF EXISTS `j3`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `j3`(`j` longtext,k varchar(255)) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
  SET j = j0(j,k);

	RETURN IF(IFNULL(j,'') = '',NULL,quotd(j));
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `j5`
-- ----------------------------
DROP FUNCTION IF EXISTS `j5`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `j5`(`j` longtext,k varchar(255)) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
  SET j = j0(j,k);

	RETURN IF(IFNULL(j,'')='',NULL,j);
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `jd`
-- ----------------------------
DROP PROCEDURE IF EXISTS `jd`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `jd`(inout v longblob)
BEGIN
	#Routine body goes here...
		set @dblob = v;
		SET @dblob = CONCAT_WS('',"SET @dblob = column_CREATE('v',",v,")");

		PREPARE stmtv FROM @dblob;					EXECUTE stmtv; 					DEALLOCATE PREPARE stmtv;

SET v := column_get(@dblob,'v' AS CHAR);

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `je`
-- ----------------------------
DROP FUNCTION IF EXISTS `je`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `je`(`j` longtext,k varchar(255)) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	IF j IS NULL THEN RETURN NULL; END IF;
	RETURN json_extra(j,k);
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `je1`
-- ----------------------------
DROP FUNCTION IF EXISTS `je1`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `je1`(`j` longtext, `1` varchar(255)) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	IF j IS NULL OR j = '' THEN RETURN NULL; END IF;

  IF IFNULL(`1`,'') <> ''  THEN
		SET @d = "[\\\"\\\']", 
				@`}`= "[\\}]", 
				@`{`= "[\\{]", 
				j = preg_capture(CONCAT('/(?<=',@d,`1`,@d,':)',@`{`,'(\.+?)',	@`}`,'(?=[,]|}$)/'),j);
	END IF;

	RETURN j;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `je2`
-- ----------------------------
DROP FUNCTION IF EXISTS `je2`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `je2`(`j` longtext, `1` varchar(255), `2` varchar(255)) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	IF IFNULL(j,'')='' THEN RETURN NULL; END IF;

  IF IFNULL(`1`,'') <> ''  THEN
   --  SET preg_capture(CONCAT('/\"',a1.rowNo,'\":{/'),@bi);
		
		SET @d = "[\\\"\\\']", 
				@`}`= "[\\}]", 
				@`{`= "[\\{]", 
				j = preg_capture(CONCAT('/(?<=',@d,`1`,@d,':)',@`{`,'(\.+?)',	@`}`,'(?=[,]|}$)/'),j);
	END IF;

  IF IFNULL(`2`,'') <> ''  THEN
    SET j = json_extra(j,`2`);
	END IF;

	RETURN j;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `jen`
-- ----------------------------
DROP FUNCTION IF EXISTS `jen`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `jen`(`j` longblob,k varchar(255)) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
 	IF k IS NULL  THEN RETURN NULL;END IF;

  SET k = clearj(CONCAT('(?i)(?<=(?:"',k,	'":))','(?J)((?>(?:"(?<c>(?:[^\\\\"]|\\\\.)*)")|(?<a>(?:\\s*)\\{(?:\\s*)(?<c>(?<k>(?:"(?<c>(?:[^\\\\"]|\\\\.)*)")(?:\\s*):(?:\\s*)(?:"(?&c)"|(?&a)))?(?:(?:\\s*),(?:\\s*)(?&k))*)\\})))')),
			j = REGEXP_substr(j,k);

	IF j = '' THEN SET j= NULL;END IF;

	IF j REGEXP '^[{]' THEN 
		SET j = REGEXP_REPLACE(j,'^[{]|[}]$',''); 
		ELSE 
 			SET J= REGEXP_REPLACE(REGEXP_REPLACE(J,'(?i)(?<!\\\\)\\\\t','\t'),'(?i)(?<!\\\\)\\\\[nr]','\n');
 			SET j = REGEXP_REPLACE(j,'^[\'"]|(?<=[^\\\\])\\\\|[\'"]*$','\\1'); 
		RETURN j;	
	END IF;

	RETURN j;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `jj`
-- ----------------------------
DROP FUNCTION IF EXISTS `jj`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `jj`(`j` longblob,k varchar(255)) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
 	IF k IS NULL  THEN RETURN NULL;END IF;

  SET k = CONCAT('(?i)(?:"',k,	'":)','(?J)((?>(?:"(?<c>(?:[^\\\\"]|\\\\.)*)")|(?<a>(?:\\s*)\\{(?:\\s*)(?<c>(?<k>(?:"(?<c>(?:[^\\\\"]|\\\\.)*)")(?:\\s*):(?:\\s*)(?:"(?&c)"|(?&a)))?(?:(?:\\s*),(?:\\s*)(?&k))*)\\})))'),
			j = REGEXP_substr(j,k);

	IF j = '' THEN SET j= NULL;END IF;

	RETURN j;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `jk`
-- ----------------------------
DROP FUNCTION IF EXISTS `jk`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `jk`(`t` tinytext,`k` text,`v` longtext) RETURNS text CHARSET utf8mb3
    NO SQL
BEGIN 
	declare `blob` text DEFAULT NULL;declare `key` VARCHAR(100) DEFAULT NULL;declare i VARCHAR(10) DEFAULT NULL;declare isabt INT(1) DEFAULT 0;declare t0 VARCHAR(10) DEFAULT regexp_substr(`t`,'^\\d');declare res  longblob DEFAULT null;DECLARE `mod` blob DEFAULT null;
	#Routine body goes here...
	DECLARE `模式过滤器` TINYTEXT DEFAULT '\\w+\\K([,+]\\w*.*?)$'; declare `factors` TINYTEXT DEFAULT null;declare `factor` TINYTEXT DEFAULT null;declare `value` TINYTEXT DEFAULT null;
	IF  IFNULL(V,'')='' OR !json_valid(`v`) THEN
		RETURN NULL;
	END if; 


	IF (t NOT REGEXP '^\\d+$' OR length(t)>10) --  AND (k is NULL OR  json_valid(k) ) 
	THEN

		SET  `mod` = REGEXP_substr(t,`模式过滤器`),t= REGEXP_replace(t,`模式过滤器`,'');

		SET  `factors` = REGEXP_substr(`mod`,',\\K.+$'),`mod` = REGEXP_replace(`mod`,',.*$','')
					,`factors` = IF(IFNULL(factors,'')='', NULL,CONCAT('["',REGEXP_replace(factors,'[^"]\\s*\\K,(?!\\s*")','","'),'"]'))  ;

		SET `key` = CASE WHEN k is NOT null AND json_valid(k) AND   k NOT REGEXP '^\\d$' and 0  THEN  REGEXP_substr(JSON_EXTRACT(k,CONCAT('$**.',t)),'\\w+')
										 WHEN LENGTH(K)>100 THEN NULL 
								ELSE k END;
		

		CASE	WHEN  `t` REGEXP 'remove' THEN
						SET	k = CASE  
											WHEN ifnull(k,'') = '' THEN NULL
											WHEN !json_valid(k) THEN json_array(k)
											WHEN json_valid(k) AND JSON_DEPTH(k) = 1  THEN concat('[',k,']')
										else k END 
								,res = v ;

				`l0`:LOOP

						IF IFNULL(k,'')='' OR !json_valid(k) or JSON_LENGTH(k)=0 OR JSON_DEPTH(k)<2 THEN leave `l0`;end IF;
		
						SET `blob` = JSON_EXTRACT(k,'$[0]');


						SET `blob` = JSON_SEARCH(res,'all',json_value(k,'$[0]'))
								,`k` = json_remove(k,'$[0]')
								,i = 0 ;
								
						SET	`blob` = CASE  
											WHEN ifnull(`blob`,'') = '' THEN NULL
											WHEN !json_valid(`blob`) THEN json_array(`blob`)
											WHEN json_valid(`blob`) AND JSON_DEPTH(`blob`) = 1  THEN concat('[',`blob`,']')
										else `blob` END; 
								

						`l1`:loop
								IF IFNULL(`blob`,'')='' OR !json_valid(`blob`) or JSON_LENGTH(`blob`)=0 OR JSON_DEPTH(`blob`)<2 THEN leave `l1`;end IF;

								SET `key` = regexp_replace(json_value(`blob`,'$[0]'),']\\K\\[\\d+]$','');

								SET `key` = CONCAT_WS('',REGEXP_substr(`key`,'^.+?(?=\\d+]$)'),REGEXP_substr(`key`,'\\d+(?=]$)')-i,']') ;

								SET res = json_remove(`res`,`key`)
										,`blob` = json_remove(`blob`,'$[0]')
										,i = i+1;

						END loop;

				END loop;
				WHEN factors REGEXP "赋值" THEN
-- JSON_EXTRACT(v,'$[*][0]'); 



					`l1`:loop

					 IF  IFNULL(k,'') = '' or!json_valid(k) or json_length(k) =0  THEN leave `l1`; END IF;

							SET	`KEY`  :=  JSON_value(k,CONCAT('$[0][',t,']')) 
									,`KEY`  =  CONCAT('','$**.',`KEY`);
									
							SET  `BLOB` =  json_value(v,`KEY`);
	
							SET  `BLOB` =  JSON_EXTRACT(v,`KEY`);



							SET  `BLOB`  = JSON_merge(json_remove(json_extract(k,'$[0]'),CONCAT('$[',t,']')),`BLOB`
														,json_extract(k,CONCAT('$[0][',t,']')));

							SET		`res` = CONCAT_WS(',',res,`BLOB`);
							
							SET k = JSON_REMOVE(k,'$[0]');
					END LOOP;
					SET res = CONCAT('[',res,']');
		
				WHEN JSON_DEPTH(v)>1 AND  ( k IS NULL or k REGEXP '^\\d$') or json_valid(k) AND  k is NOT null AND k NOT REGEXP '^\\d$'THEN

					case 
						WHEN	json_valid(k) AND  k is NOT null AND k NOT REGEXP '^\\d$' THEN 
						
							SET 	`KEY` := REGEXP_substr(JSON_EXTRACT(k,CONCAT('$**.',t)),'\\w+')
										, t = ''
										, v= JSON_EXTRACT(v,CONCAT('$**.',`key`)) 
										, `mod` ='+';

						WHEN  t REGEXP '^all'THEN 
							SET t = '';
						WHEN  k IS null THEN
							SET v = json_extract(v, JSON_UNQUOTE(REGEXP_replace(JSON_SEARCH(v,'one',t),'\\d+(?=]")', REGEXP_substr(JSON_SEARCH(v,'one',t),'\\d+(?=]")')+1))) ; 



						ELSE 

							SET k :=REGEXP_replace(JSON_SEARCH(v, 'all',`t`),'\\d+(?=]")',`key`)
									,k = IF(k is not NULL AND JSON_DEPTH(k) = 1 ,JSON_ARRAY(JSON_EXTRACT(k,'$')),k ) ;
	
					END case; 

						SET  v = IF(json_depth(v) = 1 ,concat('[',v,']'),v); 
SET @i = 0;
					`l1`:loop

					 IF  IF(k is null 
						, IFNULL(v,'')='' or !json_valid(v) or json_length(v) =0
						, IFNULL(v,'')='' or json_length(v) =0 OR !json_valid(k) or json_length(k) =0 ) THEN leave `l1`; END IF;

					 SET `key` := IF(k IS null OR IFNULL(t,'') = '','$[0]', json_value(k,'$[0]'))
								, `value` := JSON_extract(v,`key`);
					SET `factor` = `factors`;

								
					`l2`:loop  

						IF IFNULL(`factors`,'')='' OR !JSON_VALID(factors) OR json_length(`factor`) =0 THEN LEAVE `l2`; END if;

						set `key` = JSON_VALUE(`factor`,'$[0]')
								,`value` = CASE WHEN `key`  REGEXP '\\*[\\d\\.\\-]' THEN s2d(`value`)*s2d(`key`)
																WHEN `key` REGEXP '/[\\d\\.\\-]' THEN s2d(`value`)/s2d(`key`)
																WHEN `key` REGEXP '^\\d$' THEN ROUND(s2d(`value`),2)
 																WHEN `key` REGEXP '^\\+[\\-\\.\\d]+$' THEN s2d(`value`)+s2d(`key`)
 																WHEN `key` REGEXP '^\\-[\\-\\.\\d]+$' THEN s2d(`value`)+s2d(`key`)
											 else `value` END 
								,factor = json_remove(factor,'$[0]'); 


					END loop;

					set res = IF(IFNULL(`mod`,'') REGEXP '\\+'
								,IFNULL(res,0)+ s2d(`value`)
								,JSON_MERGE_preserve(IFNULL(res,'[]')	,	`value`));

					IF k IS null OR ifnull(t,'') = ''THEN
								SET v = json_remove(v,'$[0]');

					ELSE SET k= json_remove(k,'$[0]');
					END IF;
	SET @i = @i +1;					 


					END loop;


			ELSE	

			SET res := JSON_EXTRACT(v ,CONCAt('$**.',`key`));

			IF IFNULL(res,'') !='' AND json_valid(res) THEN   
					SET res := REGEXP_replace(res,'(,)?\\s*null(?(1)|,?)','')
						,res = JSON_value(res,'$[0]');
			END IF ;
		END case;

		RETURN IF(json_valid(res) AND json_depth(res)=2 AND JSON_length(res) = 1,json_value(res,"$[0]"),res)  ;
	END IF;

 IF k  IS null THEN RETURN null;end IF ;
 
  IF k REGEXP '^\\s*(")?\\s*\\w+\\s*(\\s*,\\s*\\w+)*(?(1)\\s*"\\s*)$' THEN
	 SET k:= REGEXP_replace(k,'^\\[?"?|"?]?$','')
	 , k = CONCAT_WS('','["',REGEXP_replace(k,'"?\\s*,\\s*"?','","'),'"]') 
	;
	END IF ;
  IF k REGEXP '^\\[("[abt]\\d+")(?:,\\s*(?-1))*]$' THEN SET  isabt = 1;END IF;
	

	l:LOOP

		IF JSON_length(k) =0 or json_length(`v`)=0 THEN LEAVE l;END IF;

		SET 	`key` :=json_value(k,'$[0]')
					,i = IF(isabt,REGEXP_replace(`key` ,'^\\D*?(?=\\d+$)',''),1)
					,k = JSON_REMOVE(k,'$[0]');

		IF i  REGEXP '^\\d+$' AND i-1>=0 THEN

			SET i = CONCAT_WS('','$[',i-1,']')
 
					,res = CONCAT_WS(',',res,
								CASE WHEN IFNULL(t0,0)=0 THEN JSON_EXTRACT(v,i)
										WHEN t0=1 THEN CONCAT_WS('',json_quote(`key`),':',JSON_EXTRACT(v,i))
										WHEN t0=2 THEN CONCAT_WS('','[',json_quote(`key`),',',JSON_EXTRACT(v,i),']')
								ELSE '"未知"'END
					)
					,v = IF(isabt,v,json_remove(v,'$[0]'))
					;
		END IF;
	END LOOP;
	

	SET `res` = IF(t0=1
	,CONCAT_WS('','{',`res`,'}')
	,CONCAT_WS('','[',`res`,']')
	);

	if length(t) >1 AND json_valid(`res`) THEN
	 SET v = res ,t0 =REGEXP_replace(t,'^\\d',''),res = NULL; 

	CASE WHEN t0 <4 THEN 
			 SET res = (
SELECT
CASE WHEN t0 =0 THEN JSON_ARRAY(@jtv,a.v,a.k)
WHEN t0 =1 THEN JSON_ARRAY(a.k,a.v)
WHEN t0 =2 THEN @jtv
WHEN t0 =3 THEN JSON_MERGE(JSON_ARRAY(@jtv,a.v,a.k),json_extract(v,'$[*][1]'))
END
FROM json_table(v,"$[*]"
COLUMNS(
	k VARCHAR(100) path '$[0]' NULL ON EMPTY,
	v VARCHAR(100) path '$[1]' NULL ON EMPTY
)) AS a
WHERE ifnull(a.v,"")!=""

ORDER BY if((@jtv:= REGEXP_substr(REGEXP_replace(REGEXP_substr(a.v,'\\-?[\\d,\\.]+'),'(?<=\\d),(?=\\d{3})|\\b20[0-2]\\d|\\d{7,}\\b',''),'(?x)\\-?\\d+(?:\\.\\d+)?'))='',0,@jtv+0) DESC 
LIMIT 1
);


	ELSE 
			 SET res = CONCAT_WS('\n'
			 ,'SELECT  JSON_ARRAY(@jtv,a.v,a.k)'
		   ,CONCAT_WS('','FROM json_table(',QUOTE(v),',"$[*]"')
		,"COLUMNS(\n\tk VARCHAR(100) path '$[0]' NULL ON EMPTY,\n\tv VARCHAR(100) path '$[1]' NULL ON EMPTY"
		,")) AS a"
		,CONCAT_WS('','WHERE ifnull(a.v,"")!=""') 
		,CONCAT_WS('',"ORDER BY if((@jtv:= REGEXP_substr(REGEXP_replace(REGEXP_substr(a.v,",QUOTE('\\-?[\\d,\\.]+'),"),",QUOTE('(?<=\\d),(?=\\d{3})|\\b20[0-2]\\d|\\d{7,}\\b'),",''),",QUOTE('(?x)\\-?\\d+(?:\\.\\d+)?'),"))='',0,@jtv+0) DESC \nLIMIT 1")
		);
	END case;
	END IF; 
	
	RETURN `res`;


END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `jk1`
-- ----------------------------
DROP FUNCTION IF EXISTS `jk1`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `jk1`(`k` text,`v` longtext) RETURNS longtext CHARSET utf8mb3
    NO SQL
BEGIN 
	declare `key` VARCHAR(100) DEFAULT NULL;declare i VARCHAR(10) DEFAULT NULL;declare res  longblob DEFAULT null;
	#Routine body goes here...

	IF IFNULL(K,'')=''  OR  IFNULL(V,'')='' OR !json_valid(`v`) THEN
		RETURN NULL;
	END if; 

  IF k REGEXP '^\\s*(")?\\s*\\w+\\s*(\\s*,\\s*\\w+)*(?(1)\\s*"\\s*)$' THEN
	 SET k = CONCAT_WS('','["',REGEXP_replace(k,'\\s*,\\s*','","'),'"]') ;
	END IF ;



	l:LOOP

		IF JSON_length(k) =0  THEN LEAVE l;END IF;

		SET 	`key` :=json_value(k,'$[0]')
					,i = REGEXP_replace(`key` ,'^\\D*?(?=\\d+$)','')
					,k = JSON_REMOVE(k,'$[0]');

		IF i  REGEXP '^\\d+$' AND i-1>=0 THEN
		
			SET i = CONCAT_WS('','$[',i-1,']')
					,res = CONCAT_WS(',',res,CONCAT_WS(':',json_quote(`key`),JSON_EXTRACT(v,i)));
		END IF;


	END LOOP;

	RETURN CONCAT_WS('','[',REGEXP_REPLACE(`res`,'""','null'),']');
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `jkv`
-- ----------------------------
DROP FUNCTION IF EXISTS `jkv`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `jkv`(`k` varchar(100),`i` varchar(20),`v1` varchar(20000),`v2` varchar(20000)) RETURNS varchar(20500) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...

	SET `v1` = IF(`i` ,`v1`,`v2`),
			`v1` = IF(`v1` IS NULL,NULL,QUOTd(`v1`));

	RETURN CONCAT(quotd(`k`),':',v1);

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `jo`
-- ----------------------------
DROP FUNCTION IF EXISTS `jo`;
DELIMITER ;;
CREATE DEFINER=`root`@`::1` FUNCTION `jo`(`k` text,`v` longtext) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...

	RETURN CONCAT_WS(':',JSON_QUOTE(k),JSON_QUOTE(v));
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `js`
-- ----------------------------
DROP FUNCTION IF EXISTS `js`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `js`(p LONGBLOB) RETURNS longblob
    DETERMINISTIC
BEGIN
	DECLARE  k blob DEFAULT  REGEXP_substr(p,'^\\s*@?\\K[^\\.\\s,]+');
	DECLARE  v longblob DEFAULT  REGEXP_substr(p,'[\\s\\.,]\\K[^\\.,\\s]+(?=\\s*$)');

	RETURN 
					CASE	WHEN  IFNULL(p,'') = ''  THEN NULL
								WHEN  IFNULL(k,'') = ''  THEN p
								WHEN  k = 'env'  THEN J0(@env, v) 
								WHEN  k = 'env'  THEN JSON_VALUE(@env, CONCAT('$.',v) )
						ELSE p
					END ;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `json`
-- ----------------------------
DROP FUNCTION IF EXISTS `json`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `json`(`p` blob) RETURNS blob
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...

	RETURN CONCAT(p,'(?(DEFINE)(?ixsm)
		(?<k>"[\\w]+"|\\b[\\w]+\\b|`.+`)(?=\\s*:)
		(?<v>(?:"(?s)(?:[^\\\\"]|\\\\.)*" |\\-?\\d+(?:\\.\\d+)?|null|(?&kvs)|(?&a)))
		(?<a>\\[\\s*(?&v)(?:(?:\\s*,\\s*)(?&v))*?\\s*])
		(?<kv>(?&k)\\s*:\\s*(?&v))
		(?<kvs>\\{\\s*(?&kv)(?:\\s*,\\s*(?&kv))*?\\s*})
		(?<j>(?:(?&kvs)|(?&a)))
	)');
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `json_add`
-- ----------------------------
DROP FUNCTION IF EXISTS `json_add`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `json_add`(`d` longtext,`k` tinytext,`v` mediumtext) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	IF IFNULL(v,'') = '' AND IFNULL(d,'') = '' THEN RETURN NULL; END IF;
	IF IFNULL(`k`,'') = '' THEN RETURN d; END IF;
  SET  d = IF(IFNULL(d,'') = '','{}',d),
			 d = preg_capture('/\.+(?=\\}$)/',d),
			 v = CONCAT_WS(':',QUOTE_d(k),QUOTE_d(v)),
       k = IF(preg_rlike('/(?<=^\\{)\\s*$/',d),'',','),
			 d = CONCAT_WS('',d,k,v,'}');
	RETURN d;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `json_extra`
-- ----------------------------
DROP FUNCTION IF EXISTS `json_extra`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `json_extra`(`j` longtext,k varchar(255)) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
			
	RETURN j0(j,k);
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `jsp2HOC`
-- ----------------------------
DROP FUNCTION IF EXISTS `jsp2HOC`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `jsp2HOC`(`p` blob) RETURNS text CHARSET utf8mb3
    NO SQL
`la`:BEGIN
	#Routine body goes here...
	DECLARE i varchar(100) DEFAULT NULL;DECLARE y INT(5) DEFAULT NULL;
	DECLARE r  text DEFAULT NULL;
	DECLARE c , c0, c1 ,c2 ,c3 TEXT DEFAULT null;
	DECLARE sign VARCHAR(200) DEFAULT NULL;




  IF NOT json_valid(p) THEN RETURN NULL;  END IF;

	SET i = CAST(json_value(p,'$[0]') AS CHAR)
			,`c` :=  JSON_EXTRACT( p,'$[1]')
			,`c0` = IF(c IS NULL ||c= 'NULL',NULL,json_value(p,'$[1][0]'))
			,`c1` = IF(c IS NULL ||c= 'NULL',NULL,json_value(p,'$[1][1]'))
			,`c2` = IF(c IS NULL ||c= 'NULL',NULL,json_value(p,'$[1][2]'))
			,`c3` = IF(c IS NULL ||c= 'NULL',NULL,json_value(p,'$[1][3]'));

	-- SET sign = CONCAT_WS('','<!--',i,'-->\n'); -- 审计


	RETURN o2(
	
  CASE 
	WHEN `i` = 'jsp2HOC' THEN 

	json_array('jsp2HOC',''

			,json_array('1','去注释 等',CONCAT_WS('|'
					,'(?ism)<!DOCTYPE\\s+[^>]*+>'
					,'<%.*?%>'
					,'(?:<!--.*?-->)|(?:/\\*.*?\\*/)'
					,'(?is)\\<style\\s+type\\s*=\\s*[\'"]text/css[\'"]\\s*>\\s*\\<!--(.*)?-->\\s*</style>\\K\\s*'
					,'\\Q${setseals}\\E'
					,'</?\\Ks:'
					,"<\?\\Kbody"
				),''
				,'(?m)^\\s*(?m)$',''
 				,'<(?:meta|link|input|br)[^>]*?[^/]\\s*\\K>','/>'
 				,'<(?:br)[^>/]*?\\K>','/>'

 				,'<script[^>]+?[^/]\\K\\s*>\\s*</script>','/>'

  			,'(?si)<style[^>]*?>.+?</style>','' -- 去style
				
				
				,'(?s)<script[^>]*?[^/]\\s*>.+?</script>',''
				

				
-- 			,'(?m)//.*?$','{/**/}'
 			,'(?s)<html>(.+?)</html>',o(' rcc i')
 			,'占位符',c0
			)

			,json_array('','react -1 驼峰  ','style=(["])(?:(?=\\\\).{2}|(?:(?!\\g1|\\\\).)*?)*?\\g1'
,JSON_ARRAY('','','ii','ii')
 					,'\\w+="\\w+:"',''
 					,';;',';'
 					,'";','"'
 				,'(?#UPPER)\\-([a-z])','\\1'
 				,'(["\'])((?:(?=\\\\).{2}|(?:(?!\\g1|\\\\).)*+)*?)\\g1','{{\\2}}'
 				,':\\s*([\\w_\\#!]++(?:\\s*[^;\\s]++)*)',':"\\1"'
 				,';',','
,';',';'

			)

			,json_array('3','head 处理'
					,'\\Q${pageContext.request.contextPath}\\E','http://localhost/j'
					,'http\\-equiv','httpEquiv'
					,"(?im)^(?:\\s*IMPORT.+?$)*","\\0\import Head from '@docusaurus/Head';"
					,'(\\</?)head','\\1Head'

			)

			,json_array('4','驼峰'
					,'\\bclass(?=\\s*=)','className'
					,'\\bonclick(?=\\s*=)','onClick'
			)

			,json_array('table','  react 处理table '
				,o('<(table)\\s*(?&inner)?>\\K(?&outer)*(?=</\\g1>) es6'),o1('addtbody')

			)
			,json_array('5',' 语法问题',

					o('((?ix)onclick\\s*=\\s*)"\\w+\\s+(\\w+(?&r1));?" es6'),'\\1{(e)=>\\2}'
			)

			,json_array('6','react  table2box',o('<(table)\\s*(?&inner)?>(?&outer)*</\\g1> es6')
				,'(<\)?table','\\1Box'



			)
/**/

)
			ELSE NULL 
  END
	)
;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `jt`
-- ----------------------------
DROP FUNCTION IF EXISTS `jt`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `jt`(`t` varchar(10),`p` longtext,`k` text) RETURNS longtext CHARSET utf8mb3
    NO SQL
BEGIN 
	declare `key` VARCHAR(100) DEFAULT NULL;declare i VARCHAR(10) DEFAULT NULL;declare res  longblob DEFAULT null;
	#Routine body goes here...

	IF !json_valid(`p`) THEN
		RETURN NULL;
	END if; 

SET res = (
SELECT 
k,v,
@v
from json_table(@a,'$[*]'
COLUMNS(
 k VARCHAR(100) path '$[0]' NULL ON EMPTY,
v VARCHAR(100) path '$[1]' NULL ON EMPTY
)
) AS a 
WHERE 
ifnull(v,'')!='' 
ORDER BY 
(@v:= REGEXP_substr(REGEXP_replace(REGEXP_substr(v,'\\-?[\\d,\\.]+'),'(?<=\\d),(?=\\d{3})|\\b20[0-2]\\d\\b',''),'(?x)\\-?\\d+(?:\\.\\d+)?')+0) desc 
LIMIT 1
)
;


	RETURN p;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `ju`
-- ----------------------------
DROP FUNCTION IF EXISTS `ju`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ju`(`j` longblob,`k` varchar(255),`v` longblob) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
 	IF k IS NULL  THEN RETURN NULL;END IF;

  SET k = clearj(CONCAT('(?i)(?<=(?:"',k,	'":))','(?J)((?>(?:"(?<c>(?:[^\\\\"]|\\\\.)*)")|(?<a>(?:\\s*)\\{(?:\\s*)(?<c>(?<k>(?:"(?<c>(?:[^\\\\"]|\\\\.)*)")(?:\\s*):(?:\\s*)(?:"(?&c)"|(?&a)))?(?:(?:\\s*),(?:\\s*)(?&k))*)\\})))')),
			j = REGEXP_replace(j,k,QUOTEj(v));


	RETURN j;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `j_search`
-- ----------------------------
DROP FUNCTION IF EXISTS `j_search`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `j_search`(`j` longblob,`v` blob ) RETURNS text CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	DECLARE  rs text DEFAULT NULL;DECLARE `v0` blob DEFAULT NULL;DECLARE `v1` longblob DEFAULT NULL;DECLARE `v2` blob DEFAULT NULL;DECLARE `format` int(2) DEFAULT NULL;DECLARE `i` int(2) DEFAULT 0;DECLARE `mode`  varchar(10) DEFAULT NULL;
	

 CASE 

		WHEN IFNULL(j,'') = '' OR IFNULL(v,'') = '' OR !json_valid(j) THEN 	SET rs  = nULL;
		WHEN !json_valid(`v`) THEN  		SET RS=NULL; 
	ELSE 

	  IF v REGEXP '\\[\\d+(?=,)' THEN

				SET `mode` = json_value(v,'$[0]'),v =json_remove(v,'$[0]'); 
		END IF;
		
		SET v = REGEXP_replace(cast(v AS CHAR),'(,)?\\s*(null|"0\\.00"|(?<=\\D)0\\.00+(?=\\D))(?(1)|,?)',''),
				v2 = REGEXP_replace(JSON_SEARCH(v,'one','可替代'),'^"|\\[\\d]"','');		

		IF v = '0' OR v ='[]'THEN return  NULL;END IF ;

		IF  v2  is NOT  NULL THEN

				SET v1 := json_remove(JSON_EXTRACT(v, v2),'$[0]')
						,v = json_remove(v, v2);

				set v1 = case JSON_DEpTH(v1)
								WHEN  3 then JSON_EXTRACT(v1 ,'$[*][*]')
								-- WHEN 2 THEN JSON_EXTRACT(v1 ,'$[*]')
								ELSE v1 END ;
		
		end IF;

    SET v1 = IF (v1 IS NOT NULL ,JSON_MERGE(j2j(jSON_EXTRACT(v, '$[1]')),v1),jSON_EXTRACT(v, '$[1]'));

		SET  v = s2j(1,JSON_MERGE(json_extract(v ,'$[0]'),json_merge( 
			IF(v1 is NOT NULL, json_extract(v1,'$'),'null')
			,IF(JSON_REMOVE(JSON_REMOVE(v,'$[0]') ,'$[0]')IS NOT NULL,JSON_REMOVE(JSON_REMOVE(v,'$[0]') ,'$[0]'),'null' )))); 

		SET  v = s2j(1,v)
				,v1 = s2j(1, v1);

		l:loop

				IF  IFNULL(v,'')= ''or !json_valid(v) or  json_valid(v) AND (JSON_LENGTH(`v`)<2 or IFNULL(rs,'')!='' ) THEN LEAVE l;END IF;
				
				SET `v0` = json_value(`v`,'$[1]');
				SET rs  = REGEXP_substr(JSON_SEARCH(REGEXP_replace(j,'(?<=")\\s+',''),'one',CONCAT_WS('','',`v0`)),'[abt]\\d+');

				IF ifnull(rs,'') != '' THEN
					SET `v2` = `v0`; 

				ELSE
					SET `v0` = IF(CAST(`v0` AS CHAR) REGEXP CONVERT('￥?\\-?[\\d,]+(\\.\\d*)?$' USING gbk) AND CAST(`v0` AS CHAR) NOT REGEXP '^\\(\\?'
															,CONCAT_WS('','￥?'
																	,REGEXP_replace(
																	REGEXP_replace(REGEXP_replace(REGEXP_replace(
																				FORMAT(s2d(`v0`),2)
																			,',',',?')

																			,'\\.','.?')
																			,'\\.\\?0*$','(\\0)?')
																			,'\\.\\?[1-9]\\K0+','\\0?')
																			)
											,REGEXP_replace(IF(ifnull(v0,'')!='',CONCAT_WS('','\\s*',`v0`,'\\s*'),v0)
																				,'元|圆','(?:元|圆)')
											
											);

					IF IFNULL(v0,'')= '' THEN SET `v` = json_remove(`v`,'$[1]'); ITERATE `l`;END IF; 

					SET v2 = REGEXP_substr(cast(j as char),IFNULL(CAST(v0 AS CHAR),null)) ,`v0`= CONCAT_WS('','\\w+(?=":\\s*"?',`v0`,')');

					 SET rs = REGEXP_substr(CAST(j AS CHAR) ,CAST(`v0` AS CHAR));

					IF IFNULL(rs,'')= '' AND IFNULL(json_value(`v`,'$[1]'),'')!='' AND cast(json_value(`v`,'$[1]')AS CHAR)REGEXP '^￥?\\-?[\\d,]+(?:\\.\\d*)?$' THEN

						SET `v0` = s2d(json_value(`v`,'$[1]')) + 0.01;

					SET `v0` = IF(CAST(`v0` AS CHAR) REGEXP CONVERT('￥?\\-?[\\d,]+(\\.\\d*)?$' USING gbk) AND CAST(`v0` AS CHAR) NOT REGEXP '^\\(\\?'
															,CONCAT_WS('','￥?'
																	,REGEXP_replace(
																	REGEXP_replace(REGEXP_replace(REGEXP_replace(
																				FORMAT(s2d(`v0`),2)
																			,',',',?')

																			,'\\.','.?')
																			,'\\.\\?0*$','(\\0)?')
																			,'\\.\\?[1-9]\\K0+','\\0?')
																			)
											,`v0`);

					IF v0 IS NULL THEN SET `v` = json_remove(`v`,'$[1]'); ITERATE `l`;END IF; 
					SET v2 = REGEXP_substr(cast(j as char),IFNULL(CAST(v0 AS CHAR),null)) ,`v0`= CONCAT_WS('','\\w+(?=":\\s*"?',`v0`,')');

					 SET rs = REGEXP_substr(CAST(j AS CHAR) ,CAST(`v0` AS CHAR));

					END IF; 
								IF IFNULL(rs,'')= '' AND IFNULL(json_value(`v`,'$[1]'),'')!='' AND cast(json_value(`v`,'$[1]')AS CHAR)REGEXP '^￥?\\-?[\\d,]+(?:\\.\\d*)?$' THEN

						SET `v0` = s2d(json_value(`v`,'$[1]')) - 0.01;

					SET `v0` = IF(CAST(`v0` AS CHAR) REGEXP CONVERT('￥?\\-?[\\d,]+(\\.\\d*)?$' USING gbk) AND CAST(`v0` AS CHAR) NOT REGEXP '^\\(\\?'
															,CONCAT_WS('','￥?'
																	,REGEXP_replace(
																	REGEXP_replace(REGEXP_replace(REGEXP_replace(
																				FORMAT(s2d(`v0`),2)
																			,',',',?')
		-- 																	,'\\.0+(?=\\D|$)','')
																			,'\\.','.?')
																			,'\\.\\?0*$','(\\0)?')
																			,'\\.\\?[1-9]\\K0+','\\0?')
																			)
											,`v0`);

					IF v0 IS NULL THEN SET `v` = json_remove(`v`,'$[1]'); ITERATE `l`;END IF; 
					SET v2 = REGEXP_substr(cast(j as char),IFNULL(CAST(v0 AS CHAR),null)) ,`v0`= CONCAT_WS('','\\w+(?=":\\s*"?',`v0`,')');

					 SET rs = REGEXP_substr(CAST(j AS CHAR) ,CAST(`v0` AS CHAR));

					END IF; 
				END if ;	
				SET `v` = json_remove(`v`,'$[1]'),i= i+1 ;
	
		END loop;

	SET  rs = json_array(json_value(`v`,'$[0]'),rs);
END CASE;

	 IF IFNULL(v2,'')='' OR v2 REGEXP '\\s*null' OR v2 ='0'  OR json_length(rs) =1 OR rs REGEXP '^\\["\\w+"(?:,\\s*(?:null|""))*?]$' OR rs REGEXP '\\[null(,\\s*null)*]' THEN  
	 SET rs = null;
	 else  

	  SET `format`  = CASE 
					WHEN IFNULL(REGEXP_substr(`mode`,'\\d\\K\\d'),'')!='' THEN REGEXP_substr(`mode`,'\\d\\K\\d')
					WHEN IFNULL(`v2` ,'')='' THEN NULL
					WHEN `v2`REGEXP '￥|,' THEN 5
					WHEN `v2`REGEXP '￥' THEN 4
					WHEN `v2`REGEXP '^\\-?\\d+$' THEN 3
			    WHEN`v2`REGEXP '\\,' THEN 2
					WHEN `v2` REGEXP '\\.' THEN 1
				ELSE 0 
			 END;

 SET v1 :=    case  
				WHEN IFNULL(REGEXP_substr(`mode`,'^\\d'),0)=1  AND IFNULL(v2 ,'')!='' AND JSON_LENGTH(v1)>1  THEN  json_value(v1,'$[0]') 
				WHEN IFNULL(REGEXP_substr(`mode`,'^\\d'),0)=2  AND IFNULL(v2 ,'')!='' AND JSON_LENGTH(v1)>2 THEN   json_value(v1,'$[1]') 
				WHEN IFNULL(REGEXP_substr(`mode`,'^\\d'),0)=3  AND IFNULL(v2 ,'')!='' AND JSON_LENGTH(v1)>3 THEN json_value(v1,'$[2]') 
				WHEN IFNULL(v2 ,'')!='' AND  json_length(v1)>0  AND i > json_length(v1) THEN json_value(v1,CONCAT('$[',MOD(i-1,json_length(v1)),']'))
				WHEN IFNULL(REGEXP_substr(`mode`,'^\\d'),0)=9  AND IFNULL(v2 ,'')!='' THEN v2 
 				WHEN  i<=json_length(v1) THEN json_value(v1,CONCAT('$[',i-1,']'))
				ELSE json_value(v1,'$[0]')END;

SET @v7:= null, 
		v1 =  CASE 
					WHEN IFNULL(v1,'')='' THEN NULL
					WHEN `FORMAT` IS NOT NULL  THEN 
					 case 
		 			    WHEN FORMAT = 1 THEN s2d(v1)
		 					WHEN FORMAT = 2 THEN FORMAT(s2d(v1),2)
	 						WHEN FORMAT = 3 THEN replace(s2d(IF(v1 NOT REGEXP '\\.' AND length(v1) != length(v2) AND length(CONCAT_WS('',v1 ,'00'))=  length(v2 ),CONCAT_WS('',v1 ,'00'),v1)),'.','')
	 						WHEN FORMAT = 7 AND if1(@v7 := concat('￥',v1)) THEN 
									case  WHEN length(@v7) > length(v2)  THEN REGEXP_replace(@v7, CONCAT('\\d{',length(@v7)-LENGTH(v2),'}$'),'') 
												WHEN  length(@v7) < length(v2) THEN CONCAT(@v7,REPEAT("0",LENGTH(v2)- length(@v7)))
									ELSE @v7 END 
	 						WHEN FORMAT = 5 THEN CONCAT('￥',FORMAT(s2d(v1),2))
						ELSE v1 END
					else v1 END;

	 set 	   rs = JSON_set(rs,'$[2]',cast(`v1` as char),'$[3]',`format`,'$[4]',cast(`v2` as char)) ;	
	 END if;

 RETURN if(JSON_extract(rs,'$[2]') REGEXP '""' ,null,rs) ;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `j转`
-- ----------------------------
DROP FUNCTION IF EXISTS `j转`;
DELIMITER ;;
CREATE DEFINER=`root`@`::1` FUNCTION `j转`(`p` LONGTEXT,`k` MEDIUMTEXT) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN


	  IF 	 IFNULL(p,'') = '' THEN  RETURN  NULL; END IF;
	
		IF IFNULL(`k`,'') =''THEN return NULL ;END IF; 
					CASE 
							WHEN  `k`  REGEXP  '2键$' THEN  RETURN  REGEXP_replace(REGEXP_replace(p,CONCAT(r('-键'),r('-v')),'\\1'),'^,|,$','');
							WHEN  `k`  REGEXP  '2值$' THEN   
										SET p = REGEXP_replace(p,'"([^"]+)":','')  ; RETURN REGEXP_replace(p,'^,|,$','');
							WHEN `k` REGEXP '(?im)(?:j0(?:son)?[2变]sel(?:ect)|Sql语句)(?=[,"]|$)'THEN
	
									IF NOT JSON_VALID(k) THEN  SET `k` = CONCAT('["',REPLACE(`k`,',','","'),'"]'); END IF;
							BEGIN	DECLARE rs LONGTEXT DEFAULT '[]';DECLARE `c`  VARCHAR(5) DEFAULT JSON_VALUE(`k`, '$[1]') ; 
								

													set p = REGEXP_replace(p,'^,|,$','');
													IF !json_valid(p) THEN SET p = CONCAT('[',REGEXP_replace(p,'("[^"]+":).+?(?:(?=,\\1)|$)','{\\0}'),']');END IF ;#变json 
						
													IF JSON_DEPTH(p)=2 THEN SET p = CONCAT('[',p,']');END IF;

													SET rs = JSON_QUERY(p,'$[0]');
													SET rs = JSON_ARRAY_INSERT(CONCAT('[',rs,']'),'$[1]',concat('SELECT @i:=1 AS ROWno,',REGEXP_replace(REGEXP_REPLACE(rs,'(?i)"((?:(?=\\\\).{2}|[^\\\\"]*+)*?)":\\s*("(?:(?=\\\\).{2}|[^\\\\"]*+)*?"|NULL|[\\d\\.\\-]+)','\\2 AS \\1'),'^[\\{\\[]*+|[\\}\\]]*+$','')))  ;

													SET rs = JSON_set(rs,'$[0]',REGEXP_replace(JSON_COMPACT(json_keys(JSON_QUERY(p, '$[0]'))),'[\\[\\]"]','')); #0值
													SET p= JSON_REMOVE(p,'$[0]');

IF IFNULL(p,'') != 0 then 
													SET p =  CONCAT_WS(CONCAT_WS('',' UNION ALL	',`c`) #拼装 SELECT 
,JSON_value(rs,'$[1]')
,CONCAT("SELECT @i:=@i+1,"
		,IF(JSON_LENGTH(p) > 0
				,REGEXP_replace(
						REGEXP_REPLACE(p,'\\},\\s*\\{(?=")',CONCAT_WS('',' UNION ALL	',`c`,'SELECT @i:=@i+1,'))
						,'^[\\[\\{]+|"([^"]+)":|[\\}\\]]+$','' )
				,NULL)
));	
END IF;

												CASE#update  REPLACE 等  
												WHEN (@p := JSON_value(`k`,'$[2]') ) REGEXP "(?i)^(update|(?:REPLACE\\s*INTO))\\s+[\\w_\\.\`]++"  THEN # REPLACE  
													SET  @p := CONCAT(@p,"(",JSON_VALUE(rs,'$[0]'),")");# 1
														 


l1:BEGIN DECLARE `i` INT(5) DEFAULT 0; DECLARE `q` MEDIUMTEXT DEFAULT  json_value(k,'$[5]'); declare `key` VARCHAR(200) ; DECLARE `value` MEDIUMTEXT; #2,3
declare `okey` VARCHAR(200) ;DECLARE 长度 INT(5) DEFAULT NULL; 


IF IFNULL(`q`,'') != '' THEN  #2 存入rs2,3
SET `q` := CONCAT_WS('','[',JSON_KEYS(`q`),',',JSON_EXTRACT(`q`,'$.*'),',["是3"]]');

l2: LOOP

	IF i > JSON_LENGTH(json_query(`q`,'$[0]'))-1   THEN	LEAVE l2; 	END IF; 

		SET `KEY` =  json_value(`q`,CONCAT('$[0][',i,']')),`value` = JSON_EXTRACT(`q`,CONCAT('$[1][',i,']'));


		CASE WHEN JSON_UNQUOTE(`VALUE`) REGEXP '^自动\\d+$' THEN SET `q` = JSON_ARRAY_APPEND(`q`, '$[2]', `key`);

		ELSE SET `q` = JSON_ARRAY_APPEND(q,"$[2]",CONCAT(`value` ,' AS ', `key`));

		END CASE;
 
  SET i = i+ 1; 
END LOOP l2;

end IF; #2结束

SET `VALUE` = CONCAT('[["',replace(JSON_value(rs, '$[0]'),',','","'),'"]]');
IF  JSON_VALID(`VALUE`) AND JSON_LENGTH(`VALUE`) THEN SET rs = JSON_MERGE(rs, `value`); else SET rs  =  JSON_MERGE(rs, '[["无字段2"]]');end IF;#存入字段2 原字段 okye
SET `value` = concat('[',json_query(q,'$[0]'),']') ; 
IF  JSON_VALID(`VALUE`) AND JSON_LENGTH(`VALUE`) THEN SET rs = JSON_MERGE(rs, `value`); else SET rs  =  JSON_MERGE(rs, '[["无字段3"]]');end IF;#存入字段3 表头  
SET `value` = concat('[',JSON_QUERY(JSON_REMOVE(`q`,'$[2][0]'), '$[2]'),']') ; 
IF  JSON_VALID(`VALUE`) AND JSON_LENGTH(`VALUE`) THEN SET rs = JSON_MERGE(rs, `value`); else SET rs  =  JSON_MERGE(rs, '[["无字段4"]]');end IF;#存入字段4 中间
SET RS = JSON_set(rs,'$[5]',JSON_VALUE(RS,'$[1]'));
SET RS = JSON_SET(rs, '$[1]',0);
IF  ! (JSON_LENGTH(JSON_QUERY(RS, '$[3]'))=1 AND JSON_value(RS, '$[3][0]')  REGEXP '无字段\\d')  THEN 
SET  rs = JSON_SET(rs, '$[1]',JSON_LENGTH(JSON_QUERY(RS, '$[3]'))); END IF;




SET `q` = JSON_COMPACT(json_value(k,'$[6]'));



IF IFNULL(`q`,'') = ''  OR JSON_VALUE(k,'$[6]') = 'null' THEN  SET  q =  CONCAT('{',REGEXP_replace(REGEXP_replace(json_query(rs,'$[2]'),'("[^"]+")','\\1:null'),'^\\[|\\]$',''),'}'); end IF;

#3
SET `q` := CONCAT_WS('','[',JSON_KEYS(`q`),',',JSON_EXTRACT(`q`,'$.*'),']');

SET 长度 =  (SELECT MAX(a) FROM (SELECT JSON_LENGTH(json_query(`q`,'$[1]')) as a union SELECT JSON_LENGTH(json_query(rs,'$[2]')))AS a);

SET i = 0;
l3: LOOP

		IF i >= 长度   THEN	LEAVE l3; 	END IF; 
		SET `oKEY` =  json_value(`rs`,CONCAT('$[2][',i,']')),
				`KEY` =  json_value(`q`,CONCAT('$[0][',i,']')),`value` = JSON_UNQUOTE(JSON_value(`q`,CONCAT('$[1][',i,']')));

		CASE #处理key  {"oKEY": "a5", "`KEY`": "a5", "`value`": "null"}
				WHEN IFNULL(`KEY`,'') = ''   THEN SET rs = JSON_ARRAY_APPEND(rs, '$[3]',`okey`);SET rs = JSON_ARRAY_APPEND(rs, '$[4]',`okey`);
			
				WHEN IFNULL(`KEY`,'') != ''	 THEN SET rs = JSON_ARRAY_APPEND(rs, '$[3]',`key`); 


						CASE #处理value 
								WHEN  IFNULL(`value`,'') = '' OR `value` ='NULL' OR `value` =  `key` THEN    SET rs = JSON_ARRAY_APPEND(rs, '$[4]'
																					,IF(`key` <=> `okey`,`okey`, CONCAT_WS(' AS ',IFNULL(`okey`,'NULL') ,`key`)));

								ELSE   SET rs = JSON_ARRAY_APPEND(rs, '$[4]', CONCAT_WS(' AS ',`value`,`key`));

						END CASE;

		  ELSE return '错误#3' ;
		END case;	

	  SET i = i+ 1; 
END LOOP l3;

END;

SET p = 
CONCAT_WS(c
,CONCAT_WS(c
,CONCAT('SELECT ' ,'b.*',' FROM(')
,CONCAT('SELECT ' ,j2a(JSON_QUERY(rs, '$[4]'),'引号')),' FROM('
,CONCAT_WS(c,CONCAT_WS(CONCAT(' UNION ',c),JSON_value(rs, '$[5]'),JSON_EXTRACT(p, '$[*]')))
,' ) AS b ) AS b ')
);

										CASE  WHEN  `k`  REGEXP "(?i)update" THEN # 拼装语句

SET p = cONCAT_WS(c
 	,CONCAT(JSON_VALUE(k, '$[2]'),' AS a INNER JOIN (')#表头
	,CONCAT_WS('c',p)#链接
,CONCAT(')AS B ON ', j2a(JSON_KEYS(JSON_VALUE(k,'$[5]'))  ,'转等式,a,b'))
 ,CONCAT('SET ',j2a(JSON_EXTRACT(rs,'$[3]')  ,'转等式,a,b'))#核心2
,CONCAT('WHERE ',j2a(JSON_VALUE(k,'$[5]'),'转变量,b'))

 );


										ELSE #replace 

SET  p = CONCAT_WS(c
	,CONCAT(JSON_VALUE(k, '$[2]'),'(',REGEXP_replace(JSON_QUERY(rs, '$[3]'),'^\\[|\\]$|(?<!\\\\)"',''),')')#表头
	,p
);

 
										END CASE; # 拼装语句
										
SET rs = JSON_SET(rs, '$[5]',p);
SET  p = rs;
												WHEN  @p  REGEXP "(?i)^\\s*update" THEN # UPDATE
															SET  @p := IF( @p NOT REGEXP '\\s+As\\s+\\w',CONCAT(@p," AS a"),@p) 
,@p := CONCAT(
CONCAT_WS(c
		,@p
	,CONCAT('INNER JOIN(',p,') as b ')
	,CONCAT('ON ',JSON_VALUE(k,'$[3]'),'=',JSON_QUOTE(JSON_VALUE(k,'$[4]'))) 
	,CONCAT('SET ',REGEXP_replace(JSON_VALUE(rs,'$[0]'),'([^,\\s]+)(,|$)','a.\\1=b.\\1\\2'))) 
	,';'
);
														SET  p = @p,@p=NULL;

		 
													ELSE SET p  =  p;
												END CASE;

SET rs = JSON_SET(rs,'$[1]',p);

													RETURN  rs ;
						  END; 
						ELSE RETURN CONCAT_WS(':', '没有此功能');

					END CASE;



		
	RETURN p ;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `kv`
-- ----------------------------
DROP FUNCTION IF EXISTS `kv`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `kv`(`j` blob,`k` varchar(100),`v` blob) RETURNS mediumtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	SET `j` = CASE 
				WHEN `j` IS NULL THEN '{'
				WHEN `j` =''  THEN '{'
				WHEN (@`j` := preg_capture('/^(\\s*)(\\{.*)\\}(?R1)$/',`j`,2)) !="" THEN CONCAT(@`j`,',')
			ELSE '{' END;
	SET `v` = CASE 
					WHEN preg_rlike(R('json'),`v`) THEN `v`
					WHEN preg_rlike(R('json'),quotj(`v`)) THEN quotj(`v`)
			ELSE quotn(v)

		END;
	RETURN CONCAT(`j`,quotn(k),':',`v`,'}');
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `kv0`
-- ----------------------------
DROP FUNCTION IF EXISTS `kv0`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `kv0`(`k` varchar(100),`v` blob,`i` varchar(10)) RETURNS mediumtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	CASE
			WHEN `i`IS NULL OR `i`=0 THEN	SET v = CONCAT(quotn(k),':',quotn(v));
			WHEN `i` = 1 THEN 
				CASE WHEN k REGEXP  '^[[:digit:]]*$' THEN
					SET v = CONCAT(quotn(k),':{"v":',quotn(v),"}");
				ELSE SET v = CONCAT(quotn(k),':',quotn(v));
				END CASE;

		ELSE SET v = NULL;
	END CASE;

	RETURN v;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `lm`
-- ----------------------------
DROP FUNCTION IF EXISTS `lm`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `lm`(`p` longblob) RETURNS longblob
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
IF ISNULL(P) THEN RETURN NULL;END IF;
SET @pp = CAST(p AS CHAR);
RETURN CASE  WHEN  @pp != p THEN P 
		ELSE CONVERT(@pp USING gbk)
END ;
	RETURN @pp;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `longin`
-- ----------------------------
DROP PROCEDURE IF EXISTS `longin`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `longin`(IN `func_id` TINYINT (2) , IN `userName`  Text , IN `userPassWd` Text, IN `LongIp`  varchar(50))
BEGIN
	#Routine body goes here...
/* func_id
	0 -  取信息,"0",null,null,null
	1 -  username,pasword md5;
  2 -  phonename,PASSWORD;
	3 -  email，password；
*/

-- INSERT INTO plogs (Function_Name,parameter) VALUES ('longin',CONCAT_WS(',',QUOTE(`func_id`), QUOTE(`userName`),QUOTE(`userPassWd`),QUOTE(`LongIp`)));

  CALL `mysq1_schema`.`funcSysLongin`(func_id,userName,userPassWd,LongIp,DATABASE());

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `m`
-- ----------------------------
DROP FUNCTION IF EXISTS `m`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `m`(`id` varchar(100)) RETURNS varchar(100) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	RETURN REGEXP_substr(`id`,'^.*?(?=\\s)');
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `m2c`
-- ----------------------------
DROP FUNCTION IF EXISTS `m2c`;
DELIMITER ;;
CREATE DEFINER=`root`@`::1` FUNCTION `m2c`(MONEY VARCHAR(200)) RETURNS varchar(200) CHARSET utf8mb3
    DETERMINISTIC
BEGIN

DECLARE  RESULT      VARCHAR(100); -- 返回字符串
DECLARE  NUM_ROUND   VARCHAR(100); -- 转换数字为小数点后2位的字符(正数)
DECLARE  NUM_LEFT    VARCHAR(100); -- 小数点左边的数字
DECLARE  NUM_RIGHT   VARCHAR(2); -- 小数点右边的数字
DECLARE  STR1        VARCHAR(10); -- 数字大写
DECLARE  STR2        VARCHAR(16); -- 数字位数(从低至高)
DECLARE  NUM_PRE     INT; -- 前一位上的数字
DECLARE  NUM_CURRENT INT; -- 当前位上的数字
DECLARE  NUM_COUNT   INT; -- 当前数字位数
DECLARE  NUM1        INT;
DECLARE  负数        varchar(10) DEFAULT '';
SET  money = REGEXP_replace(money,'^\\s*￥|,','');

IF IFNULL(money,'') ='' THEN RETURN NULL; END IF; -- 转换数字为null时返回null
IF money<0 THEN SET 负数 = '（负数）' ,money = AbS( money);END IF;
SET	MONEY=CONVERT(MONEY,DECIMAL(14,2));
SET NUM_ROUND=CONCAT(MONEY, '');
SET STR1='零壹贰叁肆伍陆柒捌玖'; 
SET STR2='元拾佰仟万拾佰仟亿拾佰仟万拾佰仟';
SET NUM_PRE=1;
SET NUM_COUNT=0;
SET NUM_LEFT=FLOOR(MONEY);
SET NUM_RIGHT=REPLACE(NUM_ROUND,CONCAT(NUM_LEFT,'.'),'');

IF MONEY IS NULL THEN SET RESULT=NULL; END IF; -- 转换数字为null时返回null

IF LENGTH(NUM_LEFT)>=8 THEN SET NUM1=CAST(SUBSTR(NUM_LEFT, -8, 4) AS SIGNED);
ELSEIF LENGTH(NUM_LEFT)>4 THEN	SET NUM1=CAST(SUBSTR(NUM_LEFT, -LENGTH(NUM_LEFT), LENGTH(NUM_LEFT)-4) AS SIGNED);
ELSE SET NUM1=CAST(SUBSTR(NUM_LEFT, 1, 4) AS SIGNED);
END IF;

IF LENGTH(NUM_LEFT) > 16 THEN SET RESULT='**********';
END IF; -- 数字整数部分超过16位时

 -- 采用从低至高的算法，先处理小数点右边的数字
IF LENGTH(NUM_RIGHT) = 2 THEN
   IF CAST(SUBSTR(NUM_RIGHT, 1, 1) AS SIGNED) = 0 THEN
      SET RESULT = CONCAT('零' ,
                SUBSTR(STR1, CAST(SUBSTR(NUM_RIGHT, 2, 1) AS SIGNED) + 1, 1) , '分');
   ELSE
      SET RESULT = CONCAT(SUBSTR(STR1, CAST(SUBSTR(NUM_RIGHT, 1, 1) AS SIGNED) + 1, 1) , '角' ,
                SUBSTR(STR1, CAST(SUBSTR(NUM_RIGHT, 2, 1) AS SIGNED) + 1, 1) , '分');
   END IF;
ELSE 
   IF LENGTH(NUM_RIGHT) = 1 THEN
	SET RESULT = CONCAT(SUBSTR(STR1, CAST(SUBSTR(NUM_RIGHT, 1, 1) AS SIGNED) + 1, 1) , '角整');
   ELSE
        SET RESULT = '整';
   END IF;
END IF;

-- 再处理小数点左边的数字
myloop:LOOP
SET NUM_COUNT=NUM_COUNT+1; -- 当前数字位数
SET NUM_CURRENT=CAST(SUBSTR(NUM_LEFT, LENGTH(NUM_LEFT)-NUM_COUNT+1, 1) AS SIGNED);
IF  NUM_CURRENT > 0 THEN SET RESULT=CONCAT(SUBSTR(STR1, NUM_CURRENT + 1, 1) ,
                SUBSTR(STR2, NUM_COUNT, 1) , RESULT);
ELSE
    IF NUM_COUNT = 5 THEN
       IF MOD(NUM_COUNT - 1, 4) = 0 AND NUM1 <> 0 THEN SET RESULT = CONCAT(SUBSTR(STR2, NUM_COUNT, 1) , RESULT); SET NUM_PRE = 0;
       END IF;
    ELSE
       IF MOD(NUM_COUNT - 1, 4) = 0 THEN SET RESULT  = CONCAT(SUBSTR(STR2, NUM_COUNT, 1) , RESULT); SET  NUM_PRE = 0; -- 元、万,亿前不准加零
       END IF;
    END IF;
    IF NUM_PRE > 0 OR LENGTH(NUM_LEFT) = 1 THEN
        -- 上一位数字不为0或只有个位时
        SET RESULT = CONCAT(SUBSTR(STR1, NUM_CURRENT + 1, 1) , RESULT);
    END IF;
END IF;
SET NUM_PRE = NUM_CURRENT;
IF NUM_COUNT>=LENGTH(NUM_LEFT) THEN LEAVE myloop;
END IF;
END LOOP myloop; 
IF MONEY < 0 THEN
    -- 转换数字是负数时
    SET RESULT =CONCAT( '负' , RESULT);
END IF;
 SET RESULT=REPLACE(RESULT,'零零分','整');
 SET RESULT=REPLACE(RESULT,'零分','整');
 SET RESULT=REPLACE(RESULT,'元整','元整');
RETURN CONCAT_ws('',负数,RESULT);
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `manu_blob`
-- ----------------------------
DROP PROCEDURE IF EXISTS `manu_blob`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `manu_blob`(IN `blobfunID` varchar(2),IN `keyname` text,IN `keyvalue` longtext, IN `dBlob` mediumblob,fieldsname text)
INSERT_blob:BEGIN
START TRANSACTION;
		CALL audit_1('MANU_BOLB-1',
								CONCAT_WS(',',QUOTE(`blobfunID`),QUOTE(`dBlob`)),
								dblob);
COMMIT;
/**/ 
CALL `mysq1_schema`.`manu_blob`(blobfunID,keyname,keyvalue,dBlob,fieldsname); 
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `manu_content`
-- ----------------------------
DROP PROCEDURE IF EXISTS `manu_content`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manu_content`(IN `Fun_id` varchar(20), IN `key_value` longtext, IN `dBlob`  LONGBLOB)
blol:BEGIN
	#Routine body goes here...
/*
	CALL Audit_2('manu_ware_1',
						CONCAT_WS(',',QUOTE(Fun_id), QUOTE(`key_value`)),DBLOB);

LEAVE blol;
  */
	CALL `mysq1_schema`.`manu_content`(DATABASE(),`Fun_id`, `key_value` ,`dBlob`);
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `manu_ware`
-- ----------------------------
DROP PROCEDURE IF EXISTS `manu_ware`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manu_ware`(IN `funcid` varchar(20), IN `p` longblob, IN `dBlob`  LONGBLOB)
manu_ware:BEGIN
	#Routine body goes here...
  DECLARE CONTINUE HANDLER FOR  /*SQLSTATE 'HY000',*/  SQLSTATE '23000', SQLSTATE	'42000'	, SQLSTATE	'42S22'	
	bl:BEGIN 
		GET DIAGNOSTICS CONDITION 1 @`sqlstate` = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;SET  @`sqlstate` = JSON_OBJECT('sqlstate',@`sqlstate`,'errno',@errno,'text',@text);
		SET @funcid = CONCAT_WS(' ','Error：', 'anu_ware',`funcid` );
		CALL `Audit_3`(COLUMN_create('m',CONCAT_WS(' ',@funcid),'err',@`sqlstate`,'SQL',@stmtbody,'pp',CONCAT_WS(',',QUOTE(`funcid`),QUOTE(`p`)),'dblob',dblob
	));END; 


start TRANSACTION;
SET @funcid = CONCAT_WS(' ','manu_ware ',`funcid` );
CALL Audit_3(COLUMN_create('m',CONCAT_WS(' : ',@funcid),'pp',CONCAT_WS(',',QUOTE(`funcid`),QUOTE(`p`)),'dblob',dblob));COMMIT;/*
LEAVE manu_ware;
*//*
	IF json_valid(p) AND IFNULL(json_value(`p`,dblob),'') = '' AND dblob IS NOT NULL THEN
		 SET `p` = json_compact(json_insert(`p`,'$.dblob',to_base64(dblob))),
					dblob = NULL;
	END IF;
*/
	CALL `mysq1_schema`.`manu_ware`(DATABASE(),`funcid`, `p` ,`dBlob`);
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `mid`
-- ----------------------------
DROP FUNCTION IF EXISTS `mid`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `mid`(`id` varchar(100)) RETURNS varchar(100) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...

	RETURN '';
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `money`
-- ----------------------------
DROP FUNCTION IF EXISTS `money`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `money`(`money` varchar(60)) RETURNS varchar(60) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	SET `money` = 
				CASE WHEN `money` IS NULL OR `money` =0 THEN NULL
					ELSE FORMAT(`money`,2) END;
						
	RETURN  `money`;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `muti_chart_min_node`
-- ----------------------------
DROP PROCEDURE IF EXISTS `muti_chart_min_node`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `muti_chart_min_node`( in v_course_no varchar(100),in v_class_no varchar(100),in v_stu_no varchar(100))
BEGIN

-- 1、获取实验及该用户的账户信息
	SET @dyn_sql = CONCAT('select exp.classNo,exp.className,exp.classType,exp_p.studentNo,exp_p.expNo from exp_experimentclass exp ',
	'INNER JOIN exp_experimentclassstudent exp_p on exp.classNo=exp_p.classNo ' ,
	'and exp_p.classNo=\'',v_class_no,'\' and exp_p.studentNo=\'',v_stu_no,'\'');
  PREPARE stmt_sql FROM @dyn_sql;   
  EXECUTE stmt_sql;

-- 2、课程编号获取所有一级节点及一节节点的最小叶子结点
	SET @dyn_sql = CONCAT('SELECT ecd.node_No,ecd.node_text,zmnode.w_contentNo,zmnode.w_node_text from exp_courses_node ecd ',
	'LEFT JOIN ( ',
	-- 章下的最小内容节点
	'select SUBSTRING_INDEX(w.node_No,\'.\',1) as r_node_No,w.contentNo as w_contentNo,w.node_text as w_node_text from exp_courses_node w where w.node_courseNo=\'',v_course_no,'\' and w.node_No in ',
	'(SELECT min(node_No) m_node_No from ',
	'(SELECT SUBSTRING_INDEX(e.node_No,\'.\',1) as r_node_No,e.node_No from exp_courses_node e where e.node_courseNo=\'',v_course_no,'\' and e.contentNo in',
	'(SELECT DISTINCT contentNo from exp_cour_node_cont where classNo=\'',v_class_no,'\')',
	') mnode group by r_node_No ',
	') )zmnode on zmnode.r_node_No=ecd.node_No ',
	'where ecd.node_courseNo=\'',v_course_no,'\' and ecd.node_No in ( ',
	'SELECT DISTINCT SUBSTRING_INDEX(e.node_No,\'.\',1) from exp_courses_node e where e.node_courseNo=\'',v_course_no,'\' and e.contentNo in ',
	'(SELECT DISTINCT contentNo from exp_cour_node_cont where classNo=\'',v_class_no,'\'))', 
	'ORDER BY ecd.node_No');
  -- SELECT @dyn_sql;
  PREPARE stmt_sql FROM @dyn_sql;   
  EXECUTE stmt_sql;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `muti_courses2exp`
-- ----------------------------
DROP PROCEDURE IF EXISTS `muti_courses2exp`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `muti_courses2exp`(in v_course_nos_condition longtext,in v_classNo varchar(100),in v_courseNo varchar(100),in v_type integer)
c2e:BEGIN
-- 处理思路：形成最新的任务数据
-- 1、删除该实验当前的所有任务数据
-- 2、添加新课程任务数据
-- 	DECLARE CONTINUE HANDLER FOR  SQLSTATE '23000' BEGIN END;
/*
	CALL Audit_2('muti_courses2exp',
						CONCAT_WS(',',QUOTE(v_course_nos_condition),QUOTE(v_classNo),QUOTE(v_courseNo),QUOTE(v_type)),@a);
 COMMIT;

LEAVE c4e; 
-- 1、课程节点*/

-- 2、添加新课程任务数据

	SET @a = NULL,
			@a = DATABASE();

	IF @a NOT REGEXP 'taxde$' THEN 

		CASE
			when v_type = 0 THEN
					DELETE a.* FROM exp_experimentclass_course AS a WHERE a.classNo = v_classNo;
		
					SET v_course_nos_condition = REPLACE(v_course_nos_condition,',',CONCAT('),(',QUOTE(v_classNo),',')),
							@dyn_sql = CONCAT_WS('',"INSERT exp_experimentclass_course (classNo,courseNo)\n",
																			"VALUES(",QUOTE(v_classNo),',',v_course_nos_condition,")" );


		 ELSE SET @dyn_sql = "something wrong";
		END CASE;
			

-- SELECT 	@dyn_sql;LEAVE c2e;
    PREPARE stmt_sql FROM @dyn_sql;   
    EXECUTE stmt_sql;

		LEAVE c2e;
	END IF;
/*
*/



 if v_type=0 then
    -- 1、删除不在所选课程中的所有节点
    SET @dyn_sql = CONCAT('delete from exp_cour_node_cont where classNo=\'',v_classNo,
     '\' and not exists (select * from exp_courses_node_content where exp_courses_node_content.contentNo=exp_cour_node_cont.contentNo and exp_courses_node_content.typesort=exp_cour_node_cont.typesort ',
     ' and exp_courses_node_content.missionid=exp_cour_node_cont.missionid and exp_courses_node_content.contentType=exp_cour_node_cont.contentType and exp_courses_node_content.contentNo in (select distinct contentNo from ',
     ' exp_courses_node where node_courseNo in (',v_course_nos_condition,')))');
--  SELECT @dyn_sql;
    PREPARE stmt_sql FROM @dyn_sql;   
    EXECUTE stmt_sql;

    -- 2、迁入所选节点下，而未在当然实验中的节点数据
    -- 2.1 总量，所选节点下的数据
    -- 2.2 去除量，已有部分（通过该实验下已有课程节点粒度来判断）
    SET @dyn_sql = CONCAT('insert into exp_cour_node_cont (classNo,contentNo,typesort,missionid,contentType,sort,paramId,contentReferenced,isShow,log_study_proc,fileURL,createdInXxTask,isShotCut,shotCutFrom_ContentId,isProcess,statu)',
     ' select distinct \'',v_classNo,'\' as classNo,contentNo,typesort,missionid,contentType,sort,paramId,contentReferenced,isShow,log_study_proc,fileURL,createdInXxTask,isShotCut,shotCutFrom_ContentId,isProcess,statu from exp_courses_node_content content', 
     ' where content.contentNo in (select distinct contentNo from exp_courses_node node where node.node_courseNo in (',v_course_nos_condition,')) and not exists ( select * from exp_courses_node_content ctx where content.contentNo=ctx.contentNo and ',
     ' content.typesort=ctx.typesort and  content.missionid=ctx.missionid and content.contentType=ctx.contentType and ctx.contentNo in (select distinct n.contentNo from exp_courses_node n where n.node_courseNo in (select DISTINCT ecn.node_courseNo from ',
     ' exp_courses_node ecn where ecn.contentNo in (select DISTINCT contentNo from exp_cour_node_cont ecntxt where ecntxt.classNo=\'',v_classNo,'\'))))') ;
    SELECT @dyn_sql;
    PREPARE stmt_sql FROM @dyn_sql;   
    EXECUTE stmt_sql;
 end if;
-- 3、批量签入数据
 if v_type=1 then
 -- 1、删除该课程实验下相关节点
    SET @dyn_sql = CONCAT('delete from exp_cour_node_cont where classNo=\'',v_classNo,
     '\' and exists (select * from exp_courses_node_content where exp_courses_node_content.contentNo=exp_cour_node_cont.contentNo and exp_courses_node_content.typesort=exp_cour_node_cont.typesort ',
     ' and exp_courses_node_content.missionid=exp_cour_node_cont.missionid and exp_courses_node_content.contentType=exp_cour_node_cont.contentType and exp_courses_node_content.contentNo in (select distinct contentNo from ',
     ' exp_courses_node where node_courseNo=\'',v_courseNo,'\'))');
    PREPARE stmt_sql FROM @dyn_sql;   
    EXECUTE stmt_sql;
   
  	SET @dyn_sql = CONCAT('insert into exp_cour_node_cont (classNo,contentNo,typesort,missionid,contentType,sort,paramId,contentReferenced,isShow,log_study_proc,fileURL,createdInXxTask,isShotCut,shotCutFrom_ContentId,isProcess,statu)',
    ' select distinct \'',v_classNo,'\' as classNo,contentNo,typesort,missionid,contentType,sort,paramId,contentReferenced,isShow,log_study_proc,fileURL,createdInXxTask,isShotCut,shotCutFrom_ContentId,isProcess,statu from exp_courses_node_content content', 
      ' where ',v_course_nos_condition) ;

    PREPARE stmt_sql FROM @dyn_sql;   
    EXECUTE stmt_sql;
 end if;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `muti_courses4exp`
-- ----------------------------
DROP PROCEDURE IF EXISTS `muti_courses4exp`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `muti_courses4exp`(in v_classNo varchar(100),in v_type integer)
c4e:BEGIN	

/*
'EXP20140218140332043','0'
*//*
 	CALL Audit_2('muti_courses4exp',
						CONCAT_WS(',',QUOTE(v_classNo), QUOTE(`v_type`)),@a);
COMMIT;

LEAVE c4e; */

	SET @a = NULL,
			@a = DATABASE();


			CASE v_type 
				WHEN 0 THEN
SET @stmt1 = CONCAT_WS('',"
SELECT
a.courseName,
a.courseNo
FROM
exp_courses AS a
INNER JOIN exp_experimentclass_course ON b.courseNo = a.courseNo
WHERE
b.classNo = ",QUOTE(v_classNo));
				WHEN 1 THEN
SET @stmt1 = CONCAT_WS('',"
SELECT
a.courseName,
a.courseNo
FROM
exp_courses AS a
INNER JOIN exp_experimentclass_course AS b ON b.courseNo = a.courseNo
WHERE
b.classNo = ",QUOTE(v_classNo));

				WHEN 2 THEN
SET @stmt1 = CONCAT_WS('',"
SELECT
a.courseName,
a.courseNo
FROM
exp_courses AS a
INNER JOIN exp_experimentclass_course AS b ON b.courseNo = a.courseNo
WHERE
b.classNo = ",QUOTE(v_classNo));
			ELSE SET @stmt1 = CONCAT_WS('',"java ");

			END CASE;


	PREPARE stmt1 FROM @stmt1;
	EXECUTE stmt1 ;


END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `muti_courses_tree`
-- ----------------------------
DROP PROCEDURE IF EXISTS `muti_courses_tree`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `muti_courses_tree`(in v_course_no varchar(100),in v_class_no varchar(100),in v_search varchar(100))
BEGIN
-- 处理思路：获取课程数所需要件
-- 1、课程节点
-- 2、任务内容
-- 3、课件内容
 /*
	CALL Audit_2('muti_courses_tree',
						CONCAT_WS(',',QUOTE(v_course_no), QUOTE(`v_class_no`),QUOTE(`v_search`)),@a);
COMMIT;

LEAVE c4e; */

-- 1、课程节点
 select CONCAT(node.node_No,'\t',node.node_text) as data,node.contentNo,node.node_Id,node.node_No,node.node_text,node.node_parentNo from exp_courses_node node 
    where node.node_courseNo=v_course_no order by -node.node_parentNo desc,-node.node_No desc;
  
-- 2、任务内容
 select DISTINCT CONCAT_WS('|',ctt.contentNo,ctt.typesort,ctt.missionid,ctt.contentType) as id,ctt.contentNo,ctt.typesort,ctt.missionid,ctt.contentType,am.missionLabel,am.mission_ask
   ,case when ecnc.missionid is NULL then '0' else '1' end as ischecked
 from 
   (select contentNo,typesort,missionid,contentType from exp_courses_node_content content where content.contentNo in 
     (select distinct contentNo from exp_courses_node node where node.node_courseNo=v_course_no) 
   )ctt
 LEFT JOIN acc_mission am on am.missionId=ctt.missionid
 LEFT JOIN exp_cour_node_cont ecnc on ecnc.classNo=v_class_no and ecnc.contentNo=ctt.contentNo and ctt.contentType=ecnc.contentType and ctt.missionid=ecnc.missionid and ctt.typesort=ecnc.typesort;   
-- 3、课件内容  

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `muti_courses_tree4allvalid`
-- ----------------------------
DROP PROCEDURE IF EXISTS `muti_courses_tree4allvalid`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `muti_courses_tree4allvalid`()
BEGIN

-- 有效课程内容方便使用
-- select contentNo from exp_cour_node_cont nodec where nodec.classNo IN
-- (select classNo from exp_experimentclass exp where EndTime>= now() and EXISTS 
-- (select * from exp_experimentclassstudent expc where exp.classNo=expc.classNo)
-- );

-- 实验ok
 select exp.classNo,exp.className from exp_experimentclass exp where EndTime>= now() and EXISTS 
 (select * from exp_experimentclassstudent expc where exp.classNo=expc.classNo);

-- 实验、课程ok
 SELECT DISTINCT fexp.classNo,fnode.node_courseNo,exp_c.courseName from 
  (select * from exp_courses_node node where node.contentNo is not null and node.contentNo in 
  (select DISTINCT contentNo from exp_cour_node_cont nodec where nodec.classNo IN
  (select classNo from exp_experimentclass exp where EndTime>= now() and EXISTS 
  (select * from exp_experimentclassstudent expc where exp.classNo=expc.classNo)
 ))) fnode
 LEFT JOIN 
  (select DISTINCT contentNo,classNo from exp_cour_node_cont nodec where nodec.classNo IN
  (select classNo from exp_experimentclass exp where EndTime>= now() and EXISTS 
  (select * from exp_experimentclassstudent expc where exp.classNo=expc.classNo)
  )) fexp on fnode.contentNo=fexp.contentNo
 LEFT JOIN exp_courses exp_c on exp_c.courseNo=fnode.node_courseNo order by fexp.classNo,exp_c.createtime;

-- 所有节点（非叶子）
 select node_id,node_No,node_parentNo,node.node_courseNo,contentNo,node_type,node_text,node_tip from exp_courses_node node where  node.contentNo is null;

-- 实验、所有有效叶子
 select distinct ecncn.classNo,cnode.node_id,cnode.node_No,cnode.node_parentNo,cnode.node_courseNo,cnode.contentNo,cnode.node_type,cnode.node_text,cnode.node_tip  
  from (select * from exp_cour_node_cont nodec where nodec.classNo IN
  (select classNo from exp_experimentclass exp where EndTime>= now() and EXISTS 
  (select * from exp_experimentclassstudent expc where exp.classNo=expc.classNo))
 ) ecncn
 LEFT JOIN
 (select node_id,node_No,node_parentNo,node.node_courseNo,contentNo,node_type,node_text,node_tip from exp_courses_node node where  node.contentNo is not null) cnode
 on ecncn.contentNo=cnode.contentNo order by ecncn.classNo asc,cnode.node_courseNo asc, -cnode.node_parentNo desc,-cnode.node_No desc;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `muti_courses_tree4expend`
-- ----------------------------
DROP PROCEDURE IF EXISTS `muti_courses_tree4expend`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `muti_courses_tree4expend`(in v_course_no varchar(100))
BEGIN
-- 处理思路：获取课程数所需要件
-- 1、课程节点
-- 2、该节点所有内容（含是否选中信息）
/*	CALL Audit_2('muti_courses_tree4expend',
						CONCAT_WS(',',QUOTE(v_course_no)),@a);
 COMMIT;
 LEAVE c4e; 
-- 1、课程节点*/
		SET @stmt1 = CONCAT_WS('',"SELECT CONCAT(a.node_No,'	',a.node_text) AS `data`,a.contentNo,a.node_Id,a.node_No,a.node_text,a.node_parentNo\n",
															"FROM exp_courses_node AS a\n","WHERE a.node_courseNo = ",QUOTE(v_course_no),"\n","ORDER BY nabc(a.node_parentNo), nabc(a.node_No)");
-- SELECT @stmt1;
	PREPARE stmt1 FROM @stmt1;
	EXECUTE stmt1 ;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `muti_courses_tree4mlist`
-- ----------------------------
DROP PROCEDURE IF EXISTS `muti_courses_tree4mlist`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `muti_courses_tree4mlist`(in `courseNo` varchar(100),in `classNo` varchar(100),in `node_no` varchar(60),in `type` integer,in v_search varchar(100),in `start` integer,in `len` integer)
t4l:BEGIN
   -- 遍历数据结束标志
  declare done int; 
  DECLARE exp_courses_node_no CURSOR FOR SELECT distinct node_no FROM exp_courses_node where node_NO=`node_no`;
  declare continue handler FOR SQLSTATE '02000' SET done = 1;
-- 处理思路：获取课程数所需要件
-- 2、该节点所有内容（含是否选中信息）

/*
CALL Audit_2('muti_courses_tree4mlist',
CONCAT_WS(',',QUOTE(`courseNo`), QUOTE(``classNo``),QUOTE(``node_no``),QUOTE(``type``),QUOTE(`v_search`),QUOTE(``start``),QUOTE(``len``)),@a);
COMMIT; 

LEAVE c4e; */


SET @dyn_sql = NULL,@a = NULL,@a = DATABASE();
/**/
IF @a NOT REGEXP 'taxde$' THEN

		SET @a ='kjan_a-e,kjan_a-f,kjan_abcd,kjan_dtb,kjqt_kjfl00_kjfl';

		IF IFNULL(v_search,'') != '' AND NOT v_search = 'null'  THEN

				SET @b1 = NULL,@b2 = NULL,@b3 = NULL,@b4 = NULL,
						@b1 =  IFNULL(preg_rlike('/(?<=\\s|^)任\\s*务(?=\\s|$)/',v_search),0),
						@b2 =  IFNULL(preg_rlike('/(?<=\\s|^)习\\s*题(?=\\s|$)/',v_search),0),
						@b3 =  IFNULL(preg_rlike('/(?<=\\s|^)任\\s*务(?=\\s|$)/',v_search),0),
-- 章~2，节 ~ 3 * 4
						@b4 =  preg_capture('/(?<=\\s|^)\\d{1,2}(\\.\\d{0,3}){0,4}(?=\\s|$)/',v_search);

				IF @b1 OR @b2 OR @b3 THEN

						SET @dyn_sql = CONCAT_WS(' OR ',
									IF(@b1 OR @b2 ,CONCAT_WS(' AND ', "c.contentType = 'kj'",CASE 
																WHEN @b1 AND NOT @b2 THEN CONCAT("INSTR(",QUOTE(@a),",d1.billId)")
																WHEN NOT @b1 AND @b2 THEN CONCAT("NOT INSTR(",QUOTE(@a),",d1.billId)")
																END),NULL),
									IF(preg_rlike('/(?<=^|\\s)课\\s*件(?=\\s|$)/',v_search),"c.contentType = 'edit'",NULL));

						SET @dyn_sql = CONCAT_WS('','AND (',@dyn_sql,')'),
						v_search = preg_replace('/(?<=^|\\s)课\\s*件(?=\\s|$)|(?<=\\s|^)任\\s*务(?=\\s|$)|(?<=\\s|^)习\\s*题(?=\\s|$)/','',v_search);

				END IF;

				IF @b4 IS NOT NULL AND @b4 LIKE CONCAT(`courseNo`,'%') THEN

					SET @dyn_sql = CONCAT_WS(' AND ' ,@dyn_sql, CONCAT("CONCAT(b1.node_No,'.',c.typesort) LIKE '",@b4,"%'")),
							v_search = replace(v_search,@b4,'');

				END IF;

				SET @b1 = NULL,
						@b3 = "CONCAT_WS('',d1.missionLabel,d2.title,d1.mission_ask)";

				sl:LOOP

					IF v_search = '' or preg_rlike('/^\\s*$/', v_search) = 1 THEN LEAVE sl; END IF;

					SET @b1 = preg_capture('/(?<=\\s|^)(\\S+)(?=\\s*|$)/',v_search),
							v_search = preg_replace('/(?<=\\s|^)(\\S+)(?=\\s*|$)/','',v_search,1);
					SET @dyn_sql =CONCAT_WS(' AND ',@dyn_sql, CONCAT("PREG_RLIKE('/",@b1,"/',",@b3,")"));

				END LOOP sl;

-- SELECT CAST(@dyn_sql AS CHAR),v_search,c(@b1),@b2;
		 END IF;


SET @dyn_sql = CONCAT_WS('',"SELECT\n",

IF(`type` = 1,CONCAT_WS('',"c.contentNo,c.typesort,c.missionid,
(CASE
WHEN c.contentType = 'kj' THEN
IF(INSTR(",QUOTE(@a),",d1.billId)>0,'test','kj') 
WHEN c.contentType = 'edit' THEN 'edit'
else 'sj' END) contentType ,
(CASE
WHEN c.contentType = 'kj' THEN d1.missionLabel
WHEN c.contentType = 'edit' THEN d2.title
else 'sj' END) AS missionLabel,
IF(e.missionid IS NOT NULL ,'0','1') AS ischecked,
d1.mission_ask,CONCAT(b1.node_No,'.',c.typesort) AS sort\n"
),
" count(*) AS NUM \n"
),
"FROM
exp_experimentclass AS a
INNER JOIN exp_experimentclass_course AS a1 ON a1.classNo = a.classNo
INNER JOIN exp_courses_node AS b1 ON a1.courseNo = b1.node_courseNo
INNER JOIN exp_courses_node_content AS c ON c.contentNo = b1.contentNo
LEFT JOIN acc_mission AS d1 ON c.missionid = d1.missionId
LEFT JOIN exp_courseware_cells AS d2 ON c.missionid = d2.unique_id\n",
"LEFT JOIN exp_cour_node_cont AS e ON a.classNo = e.classNo AND c.contentNo = e.contentNo AND c.typesort = e.typesort AND c.missionid = e.missionid\n",
"WHERE a.classNo = ",QUOTE(`classNo`)," AND\n",
"a1.courseno =" ,QUOTE(`courseNo`)," AND\n",
"b1.node_no LIKE '",`node_no`,"%' AND
b1.contentNo IS NOT NULL\n",
IF(@dyn_sql IS NULL,'',CONCAT(' AND ',@dyn_sql,'\n')), 
IF(`type` = 1,CONCAT_WS('',"
LIMIT ",`start`,",", `len`
),"")
);

-- SELECT CAST(@dyn_sql AS CHAR);LEAVE t4l;
PREPARE stmt_sql FROM @dyn_sql;
EXECUTE stmt_sql ;

  LEAVE t4l;
END IF;




  -- 打开游标
  OPEN exp_courses_node_no;
  
  -- 开始循环
  read_loop: LOOP
    -- 提取游标里的数据，这里只有一个，多个的话也一样；
    FETCH exp_courses_node_no INTO `node_no`;
    -- 声明结束的时候
    if done THEN
      LEAVE read_loop;
    END if;
   END LOOP;
  
   -- 关闭游标
   CLOSE exp_courses_node_no;
 
   if `type`=0 then
    SET @dyn_sql = CONCAT('select count(*) num from exp_courses_node_content content where content.contentNo in (',
      ' select distinct contentNo from exp_courses_node node where node.node_No like \'',`node_no`,'%\' and node.node_courseNo=\'',`courseNo`,'\')'
      );
    PREPARE stmt_sql FROM @dyn_sql;   
    EXECUTE stmt_sql;
   else 
    SET @dyn_sql = CONCAT('select ctt.contentNo,ctt.typesort,ctt.missionid,ctt.contentType,miss.missionLabel,miss.mission_ask,case when ecnc.missionid is NULL then \'0\' else \'1\' end as ischecked from (',
      ' select content.contentNo,content.typesort,content.missionid,content.contentType from exp_courses_node_content content where content.contentNo in (',
      ' select distinct contentNo from exp_courses_node node where node.node_No like \'',`node_no`,'%\' and node.node_courseNo=\'',`courseNo`,'\')',
      ' ) ctt left join acc_mission miss on ctt.missionid=miss.missionid',
      ' LEFT JOIN exp_cour_node_cont ecnc on ecnc.classNo=\'',`classNo`,'\' and ecnc.contentNo=ctt.contentNo and ctt.contentType=ecnc.contentType and ctt.missionid=ecnc.missionid and ctt.typesort=ecnc.typesort ',
      ' limit ',`start`,' , ',`len`
      );
    PREPARE stmt_sql FROM @dyn_sql;   
    EXECUTE stmt_sql;
   end if;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `muti_exp_info4tech`
-- ----------------------------
DROP PROCEDURE IF EXISTS `muti_exp_info4tech`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `muti_exp_info4tech`( in v_class_no varchar(100))
BEGIN

-- 1、实验名称
-- 2、课程名称组及相关介绍
-- 3、实验任务总数、单个课程任务数
  
 SET @dyn_sql = CONCAT('select exp.classNo,exp.className,exp.classType,exp.assistant_teaNo,exp.StartTime,exp.EndTime from exp_experimentclass exp where exp.classNo=\'',v_class_no,'\'');
 PREPARE stmt_sql FROM @dyn_sql;   
 EXECUTE stmt_sql;	

 SET @dyn_sql = CONCAT(' select _c.courseNo,_c.courseNum,_ec.courseName,_ec.courseType from ',
     ' (select courseNo,count(*) as courseNum from ',
     ' (select node.node_courseNo as courseNo,ecnc.classNo,ecnc.contentNo,ecnc.typesort from exp_cour_node_cont ecnc',
     ' LEFT JOIN exp_courses_node node on node.contentNo=ecnc.contentNo',
     ' where ecnc.classNo=\'',v_class_no,'\'',
     ' ) r group by courseNo ) _c LEFT JOIN exp_courses _ec on _c.courseNo=_ec.courseNo;');
 PREPARE stmt_sql FROM @dyn_sql;   
 EXECUTE stmt_sql;

 SET @dyn_sql = CONCAT(' select count(*) as totalMesNum from exp_cour_node_cont where classNo=\'',v_class_no,'\'');
 PREPARE stmt_sql FROM @dyn_sql;   
 EXECUTE stmt_sql;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `m_j`
-- ----------------------------
DROP PROCEDURE IF EXISTS `m_j`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `m_j`(IN `FunId` varchar(2),in `dblob` LONGBLOB)
m_j:BEGIN
/*

'01','{"0":{"enterId":"ENT15110213191300479","billid":""},"1":{"a1":"中泰纸业股份有限公司", "a2":"中泰纸业股份有限公司", "a3":"交通银行武汉汉阳支行","a4": "62222000639018171286","a5":"check:on", "a6": "账户：中国工商银行武汉汉阳支行（一般账户）； 账号：4200603100988125629；性质：股份有限公司，在深圳中小板上市，股票代码：002996 ；经营范围：商务信息用纸的研发、生产、销售； 增值税一般纳税人（税率17%），企业所得税税率为25%； 本公司产品分为热敏纸、无碳打印纸两大系列，其中热敏纸系列包括传真纸、POS用纸、ATM打印单、彩票纸、电影票五个品种；无碳打印纸系列包括密码信封、多联发票、压感打印纸三个品种","a7": "2011年1月1日", "a8": "医院会计","a9": "赵伟峰", "a10": "王珂玲", "a11": "方丽芳", "a12": "李有为", "a13": "白建勇"}}'
'02','{"0":{"enter":"ENT15110213191300479","billid":""},"1":{"a1":"中泰纸业股份有限公司","a2":"中泰纸业股份有限公司","a3":"交通银行武汉汉阳支行","a4":"62222000639018171286","a5":"check:on","a6":"账户：中国工商银行武汉汉阳支行（一般账户）； 账号：4200603100988125629；性质：股份有限公司，在深圳中小板上市，股票代码：002996 ；经营范围：商务信息用纸的研发、生产、销售； 增值税一般纳税人（税率17%），企业所得税税率为25%； 本公司产品分为热敏纸、无碳打印纸两大系列，其中热敏纸系列包括传真纸、POS用纸、ATM打印单、彩票纸、电影票五个品种；无碳打印纸系列包括密码信封、多联发票、压感打印纸三个品种","a7":"2011年1月1日","a8":"医院会计","a9":"赵伟峰","a10":"王珂玲","a11":"方丽芳","a12":"李有为","a13":"白建勇"}}'
funid
企业资料
01 02 03 04 增 读 改 删
1 经济业务列表 
11 12 13 14 读 写 改 删

4 删除 acc_b 

5 ab - billid  汇总 加载
6 ab - billid  试算 加载 

*/
	DECLARE `0` BLOB DEFAULT NULL;
	DECLARE `1` BLOB DEFAULT NULL;
	DECLARE `2` BLOB DEFAULT NULL;


/*
CALL Audit_1('m_j',CONCAT_WS(',',QUOTE(`FunId`),QUOTE(`dblob`)),'ok');

COMMIT;LEAVE m_j;
*/

  SET @stmt_json = NULL,
	 		`0` = j0(dblob,'0'),
			`2` = j0(dblob,'2'),
			`1` = j0(dblob,'1');


	CASE SUBSTR(`FunId`,1,1)

			WHEN '1' THEN
			CASE `FunId`
					WHEN '11' THEN 
						SET @`1C` = '1,2,3,4',
								@`1C` = preg_replace(r('`2c`'),"CONCAT(quotn('$1'),':{\"v\":',quotn(a.$1),'}')$2",@`1C`),
								@stmt_json = CONCAT_WS('',"SELECT a.bdId,a.line,CONCAT_WS('',quotn(a.rowNo),':{',CONCAT_WS(''",",",@`1C`,"),'}') AS b ",'FROM bigdata_ab AS a WHERE a.bdId = "bdId-160604233010318113"'),
								@stmt_json = CONCAT_WS('',"SELECT CONCAT_WS('','{',kv0('bdId',a.bdId,0),kv0('line',COUNT(*),0),GROUP_CONCAT(a.b SEPARATOR ',') ,'}') AS b\n",
'FROM(\n',@stmt_json,'\n)AS a');

				ELSE SET	@stmt_json = CONCAT_WS('','SELECT "Wrong or no `FunId` ',QUOTE(`FunId`),'" AS mes');
			END CASE;
			WHEN '0' THEN 
				CASE `FunId`
						WHEN	'01' THEN 
									SET	@stmt_json = CONCAT_WS("","INSERT ","acc_enter_backfile",	"(enterId,EnterBFid,enterback_title,file_name,enterback_file,billid)", 	"\nVALUE(",CONCAT_WS(",",
																			j1(`0`,"enterId"),
																			IF(j1(`0`,"EnterBFid") = "NULL" OR j1(`0`,"EnterBFid") = ""  ,QUOTE(gkey("ENTbf")),j1(dblob,"EnterBFid")),
																			j1(`0`,"enterback_title"),j1(`0`,"file_name"), QUOTE(`1`),j1(`0`,"billid")),")");
						WHEN '02' THEN 
											SET @stmt_json = CONCAT_WS("","SELECT c(quotj(CONCAT_WS(',' ,a.`0`,a.`1`))) as file \nFROM(\n", 
													"SELECT ",t_ckv('0',1,'a.enterId,a.EnterBFid,a.enterback_title,a.file_name,a.billid'), 'AS `0`,\n','CONCAT("\\\"a\\\"",":",','a.enterback_file) AS `1`',"\nFROM acc_enter_backfile AS a\nWHERE 1" ,
													preg_replace(REG('R1'),' AND $2 = $4',`0`),'\n) AS a');

						WHEN '03' THEN 
											SET @stmt_json = CONCAT_WS("","UPDATE acc_enter_backfile AS a \n SET a.enterback_file =", QUOTE(`1`),
																				IF(IFNULL(`2`,'') = '', NULL,CONCAT(',',preg_replace(REG('R1'),'\n$2 = $3',`2`))),
																								"WHERE 1 \n", preg_replace(REG('R1'),' AND $2 = $4',`0`));

				ELSE	SET	@stmt_json = CONCAT_WS('','SELECT "Wrong or no `FunId` ',QUOTE(`FunId`),'" AS mes');
			END CASE; 

		ELSE 	BEGIN
			CASE `FunId`				
			WHEN '4' THEN 
					SET @stmt_json = CONCAT_WS("","DELETE a.*,b.* FROM acc_a AS a LEFT JOIN acc_b AS b ON a.expID = b.expID AND a.missionId = b.missionId\nWHERE 1 ",
																		 preg_replace(REG('R1'),' AND  a.$2 = $4 ',`0`));
			WHEN '5' THEN 
			 BEGIN 
				DECLARE `1C` VARCHAR(2000) DEFAULT NULL;
				DECLARE `2C` VARCHAR(2000) DEFAULT NULL;

-- b
					SET `1C` = '1,2,3,4,5',
							`2C` = '1,2,3,4',

							@`1C` = preg_replace(REG('2col'),' null AS b$1',`1C`),
							@`2C` = preg_replace(REG('2col'),'a.b$1',`2C`),

							@stmt_json = CONCAT_WS('',"SELECT NULL AS rowNo,", @`1C`,
															" FROM acc_mission AS a WHERE a.missionId IS NULL",
															"\nUNION ALL\n",
															"SELECT  @rowId := @rowId +1,preg_capture(",QUOTE(REG('index')),",b.missionLabel),",@`2C`,
															"\nFROM acc_b AS a\n",
															'INNER JOIN acc_mission AS b ON a.missionId = b.missionId\n',
															"WHERE a.expID = ",j0(`0`,'expID'),
															' AND\n\tCONCAT_WS("",',@`2C`,')!=""'
															),
							@stmt_json = CONCAT_WS('',"SELECT  quotd(a.rowNo) AS rowno,quotj(CONCAT_WS(',',",CONCAT_WS(',',
														preg_replace(REG('2c'),"CONCAT(quotn('$1'),':{\"v\":',quotn(b$1),',\"c\":\"1\"}')$2",`1C`)),')) AS b\n',
														"FROM(\n",@stmt_json,"\n) AS a "),

							@stmt_json = CONCAT_WS('',"SELECT c(CONCAT_WS('',CONCAT('{\"line\":',quotd(COUNT(*))),',',GROUP_CONCAT(CONCAT_WS('',a.rowno,':',a.b,'\n')),'}')) AS b\nFROM(\n",
													@stmt_json,"\n) AS a ");

	
-- SELECT  c(@stmt_json ); LEAVE m_j;
				SET @rowId = 0;
				PREPARE stmt_json FROM @stmt_json;
				EXECUTE stmt_json ;
				LEAVE m_j;

			END;

			WHEN '6' THEN 
			 BEGIN 

				DECLARE `1C` VARCHAR(2000) DEFAULT NULL;
				DECLARE `2C` VARCHAR(2000) DEFAULT NULL;

-- b
				SET		`1C` = '1,3,4,5,6',
							@stmt_json = CONCAT_WS('',"SELECT b.rowNo,b.b1,","/*@t, 3  b.b3,*/money(CASE @t WHEN 0 THEN b.b3 WHEN 1  THEN @b3  WHEN 2 THEN @z3 END) AS b3,","/*4 c.b3*/money(CASE @t WHEN 0 THEN c.b3 WHEN 1  THEN @b4  WHEN 2 THEN @z4 END)  AS b4,","/*b.b5 c.b4*/money(CASE @t WHEN 0 THEN c.b4 WHEN 1  THEN @b5  WHEN 2 THEN @z5 END)  AS b5,","/*6*/money(CASE @t WHEN 0 THEN IFNULL(b.b3,0) + IFNULL(c.b3,0) - IFNULL(c.b4,0) WHEN 1 THEN @b3 + @b4 -@b5 WHEN 2 THEN @z3 + @z4 -@z5 END) AS b6,\n","/*clear*/CASE @t WHEN 0 THEN if1(@b3 := @b3 + IFNULL(b.b3,0)) AND if1(@b4 := @b4 + IFNULL(c.b3,0)) AND if1(@b5 := @b5 + IFNULL(c.b4,0)) WHEN 1  THEN if1(@z3 := @z3 + @b3) AND if1(@b3:=0) AND if1(@z4 := @z4 + @b4) AND if1(@b4:=0) AND if1(@z5 := @z5 + @b5) AND if1(@b5:=0) WHEN 2 THEN IF(b.b1 LIKE '负债合计%',1,if1(@z3:=0) AND if1(@z4:=0) AND if1(@z5:=0)) END \n",																			"FROM acc_standard_n AS b LEFT JOIN acc_b AS c ON c.expID = ",j0(`0`,'expID'), " AND b.b1 = c.b2\n",																			"WHERE b.missionId = ",j0(`0`,'missionId')," AND if1(@t := CASE WHEN b.b1 LIKE '%合计%' AND NOT b.b1 LIKE '负债合计%'  THEN 1 WHEN b.b1 LIKE '%总计%' OR b.b1 LIKE '负债合计%' THEN 2 ELSE 0 END)" ),
							@stmt_json = CONCAT_WS('',"SELECT  quotd(a.rowNo) AS rowno,quotj(CONCAT_WS(',',",CONCAT_WS(',',preg_replace(REG('2c'),"CONCAT(quotn('$1'),':{\"v\":',quotn(b$1),',\"c\":\"1\"}')$2",`1C`)),')) AS b\n',														"FROM(\n",@stmt_json,"\n) AS a "),
							@stmt_json = CONCAT_WS('',"SELECT c(CONCAT_WS('',CONCAT('{\"line\":',quotd(COUNT(*))),',',GROUP_CONCAT(CONCAT_WS('',a.rowno,':',a.b,'\n')),'}')) AS b\nFROM(\n",													@stmt_json,"\n) AS a ")/**/ ;

 -- SELECT  c(@stmt_json );  LEAVE m_j;

				SET @rowId = 0,@t = 0, @b3 = 0.00,@b4 = 0.00,@b5 = 0.00,@b6 = 0.00,@z3 = 0.00,@z4 = 0.00,@z5 = 0.00,@z6 = 0.00;

				PREPARE stmt_json FROM @stmt_json;
				EXECUTE stmt_json ;
				LEAVE m_j;

			END;

			WHEN '7' THEN 
			 BEGIN 

				DECLARE `1C` VARCHAR(2000) DEFAULT NULL;
				DECLARE `2C` VARCHAR(2000) DEFAULT NULL;
-- b
				SET		`1C` = REPLACE('`1`,`3`,`4`,`5`,`6`','`',''),
							`2C` = REPLACE('`1`,`2`,`3`,`4`','`',''),
							@stmt_json = CONCAT_WS('',"SELECT c.expID,c.missionId,c.missionId1,c.rowNo,c.b1,c.b2,Sum(c.b3) AS b3,c(GROUP_CONCAT(IF(IFNULL(c.b3,'')!='',preg_capture(",QUOTE(R('index')),",a.missionLabel),NULL))) AS t3,SUM(c.b4) AS b4 ,c(GROUP_CONCAT(IF(IFNULL(c.b4,'')!='',preg_capture(",QUOTE(R('index')),",a.missionLabel),NULL))) AS t4 FROM acc_b AS c INNER JOIN acc_mission AS a ON c.missionId = a.missionId  WHERE c.expID = ",j0(`0`,'expID'), " GROUP BY TRIM(c.b2)"),
							@stmt_json = CONCAT_WS('',"SELECT b.rowNo,b.b1,NULL AS t1,NULL AS t2, NULL AS t3,NULL AS t6,","/* @t,@b3,b.b3,*/money(@`1`:= if(if1(@b3 := @b3 + @t*IFNULL(b.b3,0)) AND @t = '0.0',@b3,b.b3)) AS b3,","/*c.b3 AS b3,@b4,b.b4,*/money(@`2`:= IF(if1(@b4 := @b4 + IFNULL(c.b3,0)) AND @t = '0.0',@b4,c.b3)) AS b4,c.t4,","/*c.b3 AS cb3,@b4,*/money(@`3`:= if(if1(@b5 := @b5 + IFNULL(c.b4,0)) AND @t = '0.0',@b5,c.b4)) AS b5,c.t4 AS t5,","/*b6,*/money(CASE WHEN @t =1 OR @t ='0.0' THEN IFNULL(@`1`,0)-IFNULL(@`2`,0)+ IFNULL(@`3`,0) ELSE IFNULL(@`1`,0)+IFNULL(@`2`,0)-IFNULL(@`3`,0) END) AS b6\n","FROM acc_standard_n AS b LEFT JOIN(",@stmt_json,")AS c ON INSTR(b.b1,c.b2)\n",	"WHERE b.missionId = ",j0(`0`,'missionId')," AND if1(@t := CASE WHEN b.b1 REGEXP '^(减)' THEN '-1' WHEN b.b1 REGEXP '^(加)' THEN '1' WHEN b.b1 REGEXP '^其中' THEN '0'WHEN b.b1 REGEXP '^(一|五)' THEN '1' WHEN b.b1 REGEXP CONCAT('^(',R1('〇-九'),')') THEN '0.0' ELSE @t END)" ),
							@stmt_json = CONCAT_WS('',"SELECT  quotd(a.rowNo) AS rowno,quotj(CONCAT_WS(',',",CONCAT_WS(',',preg_replace(REG('2c'),"CONCAT(quotn('$1'),':{\"v\":',quotn(b$1),',\"c\":\"1\"',IF((@tt:=CONCAT(',\"t\":',quotd(t$1)))IS NULL,'',@tt),'}')$2",`1C`)),')) AS b\n',"FROM(\n",@stmt_json,"\n) AS a "),
							@stmt_json = CONCAT_WS('',"SELECT c(CONCAT_WS('',CONCAT('{\"line\":',quotd(COUNT(*))),',',GROUP_CONCAT(CONCAT_WS('',a.rowno,':',a.b,'\n')),'}')) AS b\nFROM(\n",@stmt_json,"\n) AS a ");


-- SELECT  c(@stmt_json ); -- LEAVE m_j;

					SET @t = '',@b3 = -0.00,@b4 = -0.00,@b5 = -0.00,@`1`=0,@`2`=0,@`3`=0;

					PREPARE stmt_json FROM @stmt_json;
					EXECUTE stmt_json ;
					LEAVE m_j;

				END;

			WHEN '8' THEN 
			 BEGIN 

				DECLARE `1C` VARCHAR(2000) DEFAULT NULL;
				DECLARE `2C` VARCHAR(2000) DEFAULT NULL;

					SET `1C` = '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15',



							@stmt_json = CONCAT_WS('',"SELECT kv('','t1',a.t1) AS t,c(quotj(CONCAT_WS(',',",CONCAT_WS(',',
preg_replace(REG('2c'),"CONCAT(quotn('$1'),':{\"v\":',quotn(a$1),',\"c\":\"1\"}')$2",`1C`)),'))) AS a\n',

															" FROM acc_mission AS a 
INNER JOIN acc_standard_1 AS b ON b.missionId = a.missionId
WHERE a.missionId = ",j0(`0`,'missionId'));

 -- SELECT  c(@stmt_json ); LEAVE m_j;
		PREPARE stmt_json FROM @stmt_json;
		EXECUTE stmt_json ;

-- b
				SET		`1C` = REPLACE('`1`,`3`,`4`,`5`,`6`','`',''),
							`2C` = REPLACE('`1`,`2`,`3`,`4`','`',''),
							@stmt_json = CONCAT_WS('',"SELECT c.expID,c.missionId,c.missionId1,c.rowNo,c.b1,c.b2,Sum(c.b3) AS b3,c(GROUP_CONCAT(IF(IFNULL(c.b3,'')!='',preg_capture(",QUOTE(R('index')),",a.missionLabel),NULL))) AS t3,SUM(c.b4) AS b4 ,c(GROUP_CONCAT(IF(IFNULL(c.b4,'')!='',preg_capture(",QUOTE(R('index')),",a.missionLabel),NULL))) AS t4 FROM acc_b AS c INNER JOIN acc_mission AS a ON c.missionId = a.missionId  WHERE c.expID = ",j0(`0`,'expID'), " GROUP BY TRIM(c.b2)"),

							@stmt_json = CONCAT_WS('',"SELECT b.rowNo,b.b1,NULL AS t1,NULL AS t2, NULL AS t3,NULL AS t6,","/* @t,@b3,b.b3,*/money(@`1`:= if(if1(@b3 := @b3 + @t*IFNULL(b.b3,0)) AND @t = '0.0',@b3,b.b3)) AS b3,","/*c.b3 AS b3,@b4,b.b4,*/money(@`2`:= IF(if1(@b4 := @b4 + IFNULL(c.b3,0)) AND @t = '0.0',@b4,c.b3)) AS b4,c.t4,","/*c.b3 AS cb3,@b4,*/money(@`3`:= if(if1(@b5 := @b5 + IFNULL(c.b4,0)) AND @t = '0.0',@b5,c.b4)) AS b5,c.t4 AS t5,","/*b6,*/money(CASE WHEN @t =1 OR @t ='0.0' THEN IFNULL(@`1`,0)-IFNULL(@`2`,0)+ IFNULL(@`3`,0) ELSE IFNULL(@`1`,0)+IFNULL(@`2`,0)-IFNULL(@`3`,0) END) AS b6\n",
"FROM acc_standard_n AS b LEFT JOIN(",@stmt_json,")AS c ON INSTR(b.b1,c.b2)\n",	"WHERE b.missionId = ",j0(`0`,'missionId')," AND if1(@t := CASE WHEN b.b1 REGEXP '^(减)' THEN '-1' WHEN b.b1 REGEXP '^(加)' THEN '1' WHEN b.b1 REGEXP '^其中' THEN '0'WHEN b.b1 REGEXP '^(一|五)' THEN '1' WHEN b.b1 REGEXP CONCAT('^(',R1('〇-九'),')') THEN '0.0' ELSE @t END)"
															),
							@stmt_json = CONCAT_WS('',"SELECT  quotd(a.rowNo) AS rowno,quotj(CONCAT_WS(',',",CONCAT_WS(',',preg_replace(REG('2c'),"CONCAT(quotn('$1'),':{\"v\":',quotn(b$1),',\"c\":\"1\"',IF((@tt:=CONCAT(',\"t\":',quotd(t$1)))IS NULL,'',@tt),'}')$2",`1C`)),')) AS b\n',"FROM(\n",@stmt_json,"\n) AS a "),

							@stmt_json = CONCAT_WS('',"SELECT c(CONCAT_WS('',CONCAT('{\"line\":',quotd(COUNT(*))),',',GROUP_CONCAT(CONCAT_WS('',a.rowno,':',a.b,'\n')),'}')) AS b\nFROM(\n",													@stmt_json,"\n) AS a ")
/**/ ;


-- SELECT  c(@stmt_json ); -- LEAVE m_j;

					SET @t = '',@b3 = -0.00,@b4 = -0.00,@b5 = -0.00,@`1`=0,@`2`=0,@`3`=0;

					PREPARE stmt_json FROM @stmt_json;
					EXECUTE stmt_json ;

					LEAVE m_j;

				END;
			ELSE 
					SET	@stmt_json = CONCAT_WS('','SELECT "Wrong or no `FunId` ',QUOTE(`FunId`),'" AS mes') ;

			END CASE;	END;

	END CASE;

-- SELECT CAST(@stmt_json AS CHAR); LEAVE m_j;
	PREPARE stmt_json FROM @stmt_json;
	EXECUTE stmt_json ;


END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `nabc`
-- ----------------------------
DROP FUNCTION IF EXISTS `nabc`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `nabc`(`nodechar` varchar(20)) RETURNS decimal(26,20)
    NO SQL
    DETERMINISTIC
BEGIN 
declare  bit int default 3;
declare i int default 0 ;
declare nc varchar(20) default nodechar; 
declare num decimal(36,20) default 0 ;
if IFNULL(nodechar,'')=''  then 
	return NULL ;
end if ; 
lab: loop 
	set 
num =num + substring_index(nc ,'.' , 1) * power( 10, -1*i*bit) ;
	if   instr( nc , '.' ) =  0 then
		leave lab;
	end if;
	set
nc =  substring( nc ,instr(nc ,'.' )+1),
		i = i+1; 
end loop   ;
RETURN num; END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `nb`
-- ----------------------------
DROP FUNCTION IF EXISTS `nb`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `nb`(`p` varchar(200)) RETURNS varchar(200) CHARSET utf8mb3
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	DECLARE `r` VARCHAR(200) DEFAULT r('nb-1');
	DECLARE `id` VARCHAR(200) DEFAULT REGEXP_replace(`p`,`r`,'\\10\\2');
	DECLARE `subp` VARCHAR(200) DEFAULT REGEXP_replace(`p`,`r`,'\\10\\2\\3');
	DECLARE `fname` VARCHAR(200) DEFAULT REGEXP_replace(`p`,`r`,'\\4') ;

	RETURN IF(`fname` NOT REGEXP '\\.',CONCAT_WS('.',IF(`fname`<>REGEXP_replace(`p`,`r`,'\\1') ,CONCAT(`subp`,`fname`),`id`),'jsp'),CONCAT(`subp`,`fname`));
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `NewMId`
-- ----------------------------
DROP FUNCTION IF EXISTS `NewMId`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `NewMId`(`mId` varchar(60),`0or1` varchar(1)) RETURNS varchar(60) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...

	CASE
			WHEN IFNULL(`mId`,'') ='' THEN
					SET `mId` = NULL;

			WHEN `0or1` = 0 OR IFNULL(`0or1`,'') = '' THEN
					SET `mId` = preg_capture('/^.+?(?=_|$)/',`mId`);

			WHEN `0or1` = 1 THEN 
					SET `mId` = preg_capture('/(?<=_).+$/',`mId`);

		ELSE SET `mId` = NULL;
	END CASE;

	RETURN `mId`;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `node`
-- ----------------------------
DROP FUNCTION IF EXISTS `node`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `node`(`i` int(5),`N` varchar(200)) RETURNS varchar(200) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
-- 	DECLARE r VARCHAR(200) DEFAULT '(?<=\\.|^)\\d+$';
	RETURN 	CONCAT(REGEXP_replace(`N`,'(?<=\\.|^)\\d+$','\\1'),REGEXP_substr(`N`,'(?<=\\.|^)\\d+$')+i);
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `num`
-- ----------------------------
DROP FUNCTION IF EXISTS `num`;
DELIMITER ;;
CREATE DEFINER=`root`@`::1` FUNCTION `num`(`s` varchar(5880)) RETURNS varchar(1000) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	DECLARE `r1` VARCHAR(2000) DEFAULT '0(?:○|零)	1(?:一|壹)	2(?:二|贰)	3(?:三|叁|参)	 4(?:四|肆)	5(?:五|伍)	6(?:六|陆)	7(?:七|柒)	8(?:八|捌)	9(?:九|玖)';
	DECLARE `r2` VARCHAR(2000) DEFAULT '[[0,"○","零"],[1,"一","壹"],[2,"二","贰"],[3,"三","叁"],[4,"四","肆"],[5,"五","伍"],[6,"六","陆"],[7,"七","柒"],[8,"八","捌"],[9,"九","玖"]]';
	DECLARE `r0` VARCHAR(2000) DEFAULT '10(?:十|拾)	20(?:百|佰)	30(?:千|仟)	40万	80亿	160兆	320京	640垓';
	DECLARE `r`  VARCHAR(2000) DEFAULT REGEXP_replace(REGEXP_replace(CONCAT('^(.*?)(?:((?:',`r1`,'))((?:',`r0`,')*))'),'(?:\\s*)(\\d+)','|'),'(?<=:)\\|','');
	DECLARE `p`  VARCHAR(10) DEFAULT NULL;
	DECLARE `p0`  VARCHAR(10) DEFAULT 0;
	DECLARE `c0`  VARCHAR(10) DEFAULT 0;
	DECLARE `re`  VARCHAR(10) DEFAULT NULL;

	CASE  
	-- WHEN INSTR(JSON_EXTRACT(s,'$[*][2]'),REGEXP_substr(@a,'\\w')) THEN
	WHEN  s REGEXP '^\\s*\\d+\\s*' THEN
	
			l0:LOOP
			if  s NOT REGEXP '\\d' THEN LEAVE l0; END IF;
			SET c0 := REGEXP_substr(s,'\\d'),
				  r0 = CONCAT('$[',c0 ,'][2]');

				SET p0:= json_value(r2,r0)
			      ,s = regexp_replace(s,c0 ,p0)
				;

		END LOOP l0;
		SET re = s;
	ELSE
		


			SET @i=0;
				SET s = REGEXP_replace(s,'(?:元|圆)(?:整|正)?','');
				l:LOOP 
			SET @i=@i+1;
					SET `p`=REGEXP_SUBSTR(`s`,`r`);
			/**/
					IF IFNULL(`p`,'') = '' THEN LEAVE l;END IF;

					SET  `s` = REGEXP_replace(`s`,`r`,'');
						
							BEGIN DECLARE `ree`  VARCHAR(1000) DEFAULT REGEXP_replace(`p`,`r`,'\\3');DECLARE `part`  VARCHAR(10) DEFAULT NULL;
							SET p0=0;l2: LOOP 
							SET `part` = REGEXP_substr(`ree`,'^.');	IF IFNULL(`part`,'')=''THEN LEAVE l2;END IF;
									SET `ree` = REGEXP_replace(`ree`,'^.',''),`p0` = `p0`+REGEXP_substr(`r0`,CONCAT_WS('','\\d?(?=[^\\s]*',`part`,'[^\\s]*)'));
							END LOOP;END;
			/*IF @i = 4 then RETURN
			 c0;
			END if;*/
							CASE	WHEN `c0` = 0   THEN	SET `c0` = p0;
										WHEN	`c0`!= 0 AND p0>0 THEN
											SET `re` = CONCAT_WS('',`re`,REPEAT(0,ABS(c0-p0-1))),
													`c0` = `p0`;
									ELSE SET `re` = CONCAT_WS('',`re`,0),`c0` = `c0` -1;
							END CASE;

							SET		`re` = CONCAT_WS('',`re`,REGEXP_replace(`p`,`r`,'\\1')
			,REGEXP_substr(`r1`,CONCAT_WS('','\\d?(?=[^\\s]*',REGEXP_replace(`p`,`r`,'\\2'),'[^\\s]*)'))
			);

			
				END LOOP ;
				SET re = CONCAT(`re`,REPEAT(0,c0), `s`);
	END CASE;
	RETURN  re/**/
;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `o`
-- ----------------------------
DROP FUNCTION IF EXISTS `o`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `o`(o TEXT) RETURNS text CHARSET utf8mb3
    DETERMINISTIC
BEGIN
	DECLARE 默认 ,`mod`VARCHAR(100) DEFAULT NULL  ;
	DECLARE r  TINYTEXT  DEFAULT '(?:^|([\\s,]+\\-?\\w+)*)\\s*$'  ;
	
	DECLARE rs,action,多个动作  TEXT DEFAULT NULL ;
	DECLARE i  INT(11) DEFAULT REGEXP_instr(o,r) ;
	DECLARE k TINYTEXT DEFAULT REGEXP_replace(SUBSTR(o,i),'^[\\s,]+|[\\s,]+$','');
	DECLARE 		次数 int(5) DEFAULT 0;

  -- `mod` = REGEXP_substr(k,'[\\s,]+\\K\\w+\\s*$'),
  IF i= 0 && (@默认 IS NOT NULL || 默认 )IS NOT NULL tHEN
	 SET k =CONCAT_WS('',默认,@默认),
	 i = LENGTH(o)+1;
	END IF;
	SET o = substr(o,1,i-1);



	SET 多个动作 = CONCAT('["',REGEXP_replace(k,'[\\s,]+','","'),'"]'),k = REGEXP_substr(k,'\\w+') ;

	多个动作:WHILE JSON_LENGTH(多个动作)>次数  DO
	

	
	CASE 
	
	WHEN   IFNULL(k,'') =''   THEN SET 次数=999 ;
	
	WHEN 多个动作 REGEXP '"i"' THEN 

				SET rs = o0(k,0,0);

				IF rs is NULL THEN 
					SET rs = o1(k); 
				END IF ;


				SET  rs =  s(JSON_ARRAY(CONCAT_ws('','S专用',k),'','o专用'
				,rs),'i');

				SET k = IF(IFNULL(rs,'')= '',null, k );

				SET 多个动作 = REGEXP_replace(多个动作,',?"i"','') ;
				ITERATE 多个动作;

	WHEN   i != 0  AND rs IS NULL  THEN

		SET rs = s(CONCAT_ws('','S专用',k),0);
			IF rs = "no_ROWS"  THEN
					SET 多个动作 = '"i"';

			END IF ;
		ITERATE 多个动作;
		
	WHEN  i != 0 THEN

		SET 默认 = REGEXP_substr(k,@自用:='^-'),
				k = REGEXP_replace(k,'(^-|[\\s,]+\\w+?$)','');

		SET		k = case 
								WHEN k REGEXP @自用:='^\\s*\\$?\\[' THEN  REGEXP_replace(k,@自用,'$[')
								WHEN k REGEXP @自用:='^\\s*(?:\\$\\.)?(\\w)' THEN  REGEXP_replace(k,@自用,'$.\\1')
						ELSE k END ;

		CASE  WHEN  rs NOT REGEXP '\\s+\\Q(?(DEFINE)\\E'  THEN set o = rs;				
		ELSE
		SET  k = '^\\s*((?:.+\\|)?).*\\s*?(?=[\r\n])';
		SET rs = iF(默认 = '-' , REGEXP_replace(rs,k,' '),rs);

		SET  o = CASE WHEN   o REGEXP '^(?![\\n\\r])\\s*$' THEN rs 
									WHEN  默认 = '-' || rs REGEXP k THEN  REGEXP_replace(rs,k,CONCAT('\\1',REGEXP_replace(o,'\\\\','\\\\\\\\')))
						ELSE	CONCAT('',o,rs) END;

		SET k :=  CONCAT('(?xi)(?&dx)
(?(DEFINE)
(?<k>[xmsiJU])
(?<d>^\\(\\?(?&k)+\\))
(?<dx>(?=[^)]+x)(?&d))
)
');


  SET o = CONCAT(IF(o REGEXP k ,'' , '(?x)'),o); 

	END case;

	ELSE SET `o` = `o` ;

	end CASE ;
	SET 次数 = 次数 +1 ;
	END while 多个动作;

		RETURN `o` ;
	

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `o0`
-- ----------------------------
DROP FUNCTION IF EXISTS `o0`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `o0`(`k` tinytext,action TINYTEXT,p LONGBLOB) RETURNS longblob
    DETERMINISTIC
BEGIN  

DECLARE  r TINYTEXT DEFAULT NULL ;


	SET R =  CONCAT('\\.(',r3(k),')\\b'),
			k =CONCAT('^',r3(k),'$');


	CASE 
	WHEN IFNULL(k,'')='' THEN 
		SET k = k;
	WHEN  action =null || action =0  THEN 


	SET  p  =(  
SELECT
	a.Reg
FROM
	mysq1_schema.regc AS a
WHERE
	a.reg IS NOT NULL AND
	a.id REGEXP k 
);

	WHEN  action REGEXP '^(?:1|i)$'   THEN 


		UPDATE	mysq1_schema.regc AS a SET  a.Reg =  p  WHERE a.id REGEXP k ;
		SET p = ROW_COUNT();
	WHEN  action REGEXP '^(?:66|json)$'   THEN 

		UPDATE	mysq1_schema.regc AS a SET  a.json =  p  WHERE a.id REGEXP k ;
		DELETE 	a.* FROM  mysq1_schema.json AS a 	WHERE a.id REGEXP r;
		SET p = ROW_COUNT();

	ELSE

					SET   p  =(  
SELECT
	a.json
FROM
	mysq1_schema.regc AS a
WHERE
	a.json IS NOT NULL AND
	a.id REGEXP k 
);
	END CASE;


	RETURN p;

BEGIN
		DECLARE k LONGtext DEFAULT JSON_OBJECT(
'gql',CONCAT_WS('\n','(?x)\\b(\\w+)(?=(?&colon))'
,CONCAT('(?(DEFINE)
			(?<colon>
						\\s*:\\s*
			)	
			(?<postfix>
						[!]|\\[\\]
			)
'),')')

,'date',  CONCAT( '(?x)
(?(DEFINE)
		(?<year0>
				(?:20)([01]\\d)
		)
		(?<year1>
				(?<!\\d)(?:20)([01]\\d)(?=(?&fg1)(?&month))
		)
		(?<year2>
				(?<!\\d)(?:20)([01]\\d)(?=(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\\d|3[0-1]))
		)
		(?<year3>
		贰零(?:零|壹|贰)(?&cnum)
		)
		(?<year4>
			(?<!\\d)[1]\\d(?=(?&month1)(?&day1)\\b)
		)
		(?<year5>
			(?<=")(?&year0)(?=")
		)
		(?<month>
			(?:0?[1-9]|1[0-2])(?=月|\\D)(?!日|年)
		)
		(?<month1>
			(?:0[1-9]|1[0-2])
		)
		(?<day>
			(?:0?[1-9]|[1-3][0-9])(?=日|\\D)(?!月|年)
		)
		(?<day1>
			(?:0[1-9]|[12]\\d|3[0-1])
		)
		(?<fg0>
			"\\s*,\\s*"
		)
		(?<fg1>
			(?:年|\\D|(?&fg0))
		)
		(?<fg2>
			(?:月|\\D)
		)
		(?<fg3>
			(?:日|\\D)
		)
		(?<cnum>
		(?:零|壹|贰|叁|肆|伍|陆|柒|捌|玖)
		)

)' )
,'seal',CONCAT('(?ix)(?&私章)
(?(DEFINE)
	(?<分割1>(?#分割1)
		"\\s*:\\s*"
	)
	(?<b>(?i)
	<br/?>
	)	
	(?<bs>(?i)
	<br/?>\\w+
	)
	(?<shape>
	_shape":\\s*"
	)
	(?<私章>(?#私章)
		_name(?&分割1)\\w*[私签法]|_shape(?&分割1)4
	)
	(?<特殊>
	出纳.+法人
	)
	(?<排除>
		(*SKIP)(*F)
	)
	(?<str>
		\\w+\\b
	)
	(?<role>
		(?=`?rolename`)\\w+
	)
	(?<name>
		(?=`?name`)\\w+
	)
	(?<分割2>
	\\s*[:：]\\s*
	)
)')
,'REGEXP',CONCAT('(?x)(?:(?&zs))(*SKIP)(*FAIL)|

(?(DEFINE)
		(?<zs>
			(?&zs1)|(?&zs3)
		)
		(?<zs1>
			(?m)//.*?(?=\\s*$)
		)
		(?<zs2>
			(?s)<!--.*?-->
		)
		(?<zs3>
			(?s)/\\*.*?\\*/
		)
		(?<k>
		  \\b(?:\\w+\\.)*\\w+\\b
		)
		(?<v>
			(?ms)(?>"(?:[^\\\\"]|\\\\.)*?"|\'(?:[^\\\\\']|\\\\.)*?\')
		)
		(?<zfc>
      (?&v)(?&zfc0)++(?=\\s*(?:;|(?m)$))
		)
		(?<fg>
			\\s*\\+\\s*
		)
		(?<zfc0>
     (?:(?&fg)(?:(?&v)|(?&k)+))
		)
		
	(?<括>
		[()\\[\\]{}|]
	)
	(?<r0>
		\\s*(?>(?:(?!(?&括)|\\\\).|\\\\.)+|(?&r1)|(?&r2)|\\\\.)\\s*
	)	
	(?<r>
		((?:(?&k)|(?&r0))+)(?:\\s*\\|\\s*(?-1))*+
	)
	(?<r1>
		(?:(?&k)\\s*\\((?:(?&r))+\\))+
	)
	(?<r2>
		(?:\\{(?:(?&r))+})+
	)
	
)')
,'抓取',CONCAT('
	(?(DEFINE)
	(?<o>[^"\'])
	(?<b>(?i)(?&o)+?values)
	(?<e>(?ms)((?>','"(?:[^\\\\"]|\\\\.)*?"',"|'(?:[^\\\\']|\\\\.)*?'",'|null|-?\\d+(?:\\.\\d+)?))(?=\\s*(?:,\\s*(?-1)|\\))))
	(?<es>(?ms)(?&e)(?:\\s*,\\s*(?&e))*)
	)')
,'xml', CONCAT( '
		(?(DEFINE)
		(?<o>[^"\'])
		(?<col>(\\b\\w+\\b)(?:,(?-1))*)
		(?<name>(?&o)+?\\K\\b\\w+(?=\\())
		(?<k>(?im)^(?&o)+?values\\()
		(?<v>(?ms)((?>', '"(?:[^\\\\"]|\\\\.)*?"', "|'(?:[^\\\\']|\\\\.)*?'", '|null|-?\\d+(?:\\.\\d+)?))(?=\\s*(?:,\\s*(?-1)|\\))))
		(?<vs>(?ms)(?&v)(?:\\s*,\\s*(?&v))*)

	)' )
,'j',CONCAT( '(?x)
(?(DEFINE)(?ixsm)
			(?<k>"[\\w\\.\\$]+"|(?:\\$\\.)?\\b[\\w]+\\b|`.+`)(?=\\s*:)
			(?<k0>(?<!["])\\b(?![\\d])\\w+)
			(?<v>(?:"(?s)(?:[^\\\\"]|\\\\.)*"|\\-?\\d+(?:\\.\\d+)?|null|ture|false|(?&kvs)|(?&a)|(?&k)))
			(?<a0>\\[\\s*(?&v)(?:(?:\\s*,\\s*)(?&v))*?\\s*])
			(?<a>\\[\\s*(?&v)(?:(?:\\s*,\\s*)(?&v))*?\\s*])
			(?<kv>(?&k)\\s*:\\s*(?&v))
			(?<kvs>\\{\\s*(?&kv)(?:\\s*,\\s*(?&kv))*?\\s*})
			(?<j>(?:(?&kvs)|(?&a)))
		)' )
,'百家姓',CONCAT_WS('\n','(?x)^(?&过滤)(*SKIP)(*F)|',
'(?(DEFINE)',
			CONCAT('(?<过滤>','法(?=人|定)|出(?=纳|票)|中(?=国)|成本',')'),
			CONCAT('(?<过滤1>','^(?&过滤)(*SKIP)(*F)|^(?&姓)',')'),
			CONCAT('(?<姓>','[赵钱孙李周吴郑王冯陈褚卫蒋沈韩杨朱秦尤付许何吕施敬张孔曹严华金魏陶姜戚谢邹喻柏水窦章云苏潘葛奚范彭郎鲁韦昌马苗凤花方俞任袁柳酆鲍史唐费廉岑薛雷贺倪汤滕殷罗毕郝邬安常乐于时傅皮岳帅卞卿齐康伍余元卜顾孟平黄和穆萧尹姚邵湛汪祁毛禹狄米贝明臧计伏成戴谈宋茅庞熊纪舒屈项祝董梁杜阮蓝闵席季麻强贾路娄危江童颜郭梅盛林刁钟徐邱骆高夏蔡田樊胡凌霍虞万支柯昝管卢莫经房裘缪干解应宗丁宣贲邓郁单杭洪包诸左石崔吉钮龚程嵇邢滑裴陆荣翁荀羊於惠甄曲家封芮羿储靳汲邴糜松井段富巫乌焦巴弓牧隗山谷车侯宓蓬全郗班仰秋仲伊宫宁仇栾暴甘钭厉戎祖武符刘景詹束龙叶幸司韶郜黎蓟薄印宿白怀蒲邰从鄂索咸籍赖卓蔺屠蒙池乔阴鬱胥能苍双闻莘党翟谭贡劳逄姬申扶堵冉宰郦雍郤璩桑桂濮牛寿通边扈燕冀郏浦尚农温别庄晏柴瞿阎充慕连茹习宦艾鱼容向古易慎戈廖庾终暨居衡步都耿满弘匡国文寇广禄阙东欧殳沃利蔚越夔隆师巩厍聂晁勾敖融冷訾辛阚那简饶空曾毋沙乜养鞠须丰巢关蒯相查后荆红游竺权逯盖益桓公寸却逮唱有丛寸皇彤端实集翠辟良芒其中之称来繁朴毓荤绪硕买巧撒秘绍壬斋奕朋羽占穰闾贵贯崇告褒锐闳歧示委频呼威律保抄化校抗綦宏庚敏拱丑畅随卯友乙甲尾玄裔植矫昔度遇前咎敛泷衅圣夫镇邸掌员戏智凭进厚业资仍衷刑仵夷蛮孛帖洛洋郸邗剑隋茆苌桐机铎玉针庹磨瓮刀牵恽世同止睢种肖泣卷谬赧顿次念斯丹聊姓寻出户才书愚性霜寒字板独诗扬揭析紫柔奇佛弥素僧仙宇酒塔闪星天波速腾镜澄謇渠风濯茂兰藤检折驹貊肥雀禽节鲜栗帛布藏钞门庆及建巨希载漫力勤改亓修闽守勇练士五将军奉恭母丘礼孝伦问辉让依介市苑剧零招达六战候励萨覃初城局原妫泉清卑麦百言爱笪哈赏佴牟琴亢帅归鄢法楚督库稽光瑞泥摩铁]|(?:万俟|司马|上官|欧阳|夏侯|诸葛|闻人|东方|赫连|皇甫|尉迟|公羊|澹台|公冶|宗政|濮阳|淳于|单于|太叔|申屠|公孙|仲孙|轩辕|令狐|钟离|宇文|长孙|慕容|鲜于|闾丘|司徒|司空|丌官|司寇|仉督|子车|颛孙|端木|巫马|公西|漆雕|乐正|壤驷|公良|拓跋|夹谷|宰父|谷梁|晋楚|闫法|汝鄢|涂钦|段干|百里|东郭|南门|呼延|归海|羊舌|微生|缑亢|况郈|有琴|梁丘|左丘|东门|西门|商牟|佘佴|伯赏|南宫|墨哈|谯笪|年爱|阳佟|第五|言福|百家|姓终|万俟|司马|上官|欧阳|夏侯|诸葛|闻人|东方|赫连|皇甫|尉迟|公羊|澹台|公冶|宗政|濮阳|淳于|单于|太叔|申屠|公孙|仲孙|轩辕|令狐|钟离|宇文|长孙|慕容|鲜于|闾丘|司徒|司空|丌官|司寇|仉督|子车|颛孙|端木|巫马|公西|漆雕|乐正|壤驷|公良|拓跋|夹谷|宰父|谷梁|晋楚|闫法|汝鄢|涂钦|段干|百里|东郭|南门|呼延|归海|羊舌|微生|岳帅|缑亢|况郈|有琴|梁丘|左丘|东门|西门|商牟|佘佴|伯赏|南宫|墨哈|谯笪|年爱|阳佟|第五|言福|步都|东欧|聂晁|空曾|相查|凃肖|亓官|锺离|荔菲|辗迟)',')'),
')')
,'enter',CONCAT_WS('\n',
'(?&e)
(?(DEFINE)',
			CONCAT('(?<o>','(?:公司)',')'),
			 CONCAT('(?<e>','\\w+(?&o)',')'),
')')
,'s',CONCAT('(?x)
(?(DEFINE)
	(?<k>
			^\\s*\\K([^\\s,]+)
	)
	(?<p>
		(?:(?&k)\\s*,\\s*)?\\K[$\\w\\[\\]\\.*]+\\s*$
	)
)')
,'html',CAST(s('html',0)AS CHAR)
,'jsp',CAST(s('html',0)AS CHAR)

,'过滤',CONCAT('
(?(DEFINE)
	(?
	)
)
')
,'es6',CONCAT_ws('\n','(?x)'
,CONCAT('(?(DEFINE)
		(?<zs>
			(?&zs1)|(?&zs2)|(?&zs3)
		)
		(?<zs1>
			(?m)//.*?(?=\\s*$)
		)
		(?<zs2>
			(?s)<!--.*?-->
		)
		(?<zs3>
			(?s)/\\*.*?\\*/
		)
		(?<k0>
		  [\\w\\.]+
		)
		(?<k>
		  [\\@$]*(?&k0)+[?]?\\s*
		)
		(?<v>
		(?mis)(?>`[^`]*`|"(?:[^\\\\"]|\\\\.)*?"|\'(?:[^\\\\\']|\\\\.)*?\'|/(?:[^\\\\/]|\\\\.)+?/|null|true|false|\\-?\\d+(?:\\.\\d+)?)
		)
		(?<zfc>
      (?&zfc0)(?:(?&fg)(?&zfc0))+
		)
		(?<fg>
		  \\s*\\+\\s*
		)
		(?<zfc0>
     (?&v)|(?&k)
		)')
,CONCAT('(?<rcc>
(?m)^(?![\\n\\r])\\s*export\\s+class\\s+SearchNew.*?(?=\\{)(?&r2)
)
(?<state>
(?m)^(?![\\n\\r])\\s*export\\s+class\\s+SearchNew.*?(?=\\{)(?&r2)
)


')
,CONCAT('(?<kuoHao>
		[()\\[\\]{}|"\']
	)
	(?<link>
			\\s*[+\\-,=>;\\s:\\.<>!]+\\s*
	)
	(?<e>
			(\\s*(?&v)|(?&k)|(?&r1)|(?&r2)|(?&r3)|[&]|\\s*)(?:(?&link)(?-1))*(?&link)?\\s*
	)	
	(?<fn>
			(?=\\$\\.post)(?&k)(?&link)?\\s*\\((?&zfc)\\(\\s*(\\w+)\\s*\\)\\s*(?&r2)\\s*\\)
	)
	(?<r1>
		(\\s*\\(\\s*(?:\\.?(?&e)?)+\\s*\\))(?:(?&link)?(?-1))*
	)
	(?<r2>
		(\\s*\\{\\s*(?:\\.?(?&e)?)+\\s*\\})
	)
	(?<r3>
		(?:\\[\\s*(?:(?&e)?)+\\s*\\])+
	)'/**/)
,CONCAT('(?<post>
\\$\\.post\\s*\\((\\s*(?&zfc)\\s*),\\s*(?&k).+(\\w+).+(?=\\{)
		)')
,CONCAT('(?<tag>
<(\\w+)[^>]*?/\\s*>
		)
		(?<inner0>
		(?mis)(?>[^"\'<>{}\\s/]+|(?&r2)|`[^`]*`|(?:"(?:[^\\\\"]|\\\\.)*?")|(?:\'(?:[^\\\\\']|\\\\.)*?\'))
		)
		(?<inner>
			((?&inner0))(?:\\s*(?-1))*+\\s*
		)

		(?<outer>
				(?>(?&r2)|(?&tag1)|(?&tag2)|[^<>]+)
		)
		(?<tag1>
			<\\w+\\s*(?&inner)?/>
		)
		(?<tag2>
			<(\\w+)\\s*(?&inner)?>(?&outer)*?</\\g-1>
		)
')
,CONCAT('
(?<fields>
(?m)^\\s+\\K(?&k0)
)
')
,')')

,'path',CONCAT('(?x)^(?&分割)?[w](?:((?&分割))(?&path0))+
(?(DEFINE)
	(?<w>
			^(?&分割)?[w]\\K(?:(?&分割)(?&path0))+
	)


	(?<头>
		(?i)(?:(?:[a-z]|https?)\\:)?+
	)
	(?<分割1>
	/+
	)	
	(?<分割2>
		[\\\\]+
	)	
	(?<分割>
		(?:(?&分割1)|(?&分割2))
	)
	(?<path0>
		[^\\\\/]+
	)	
	(?<path1>
		(?&头)(?:(?&分割1)(?&path0))+
	)
	(?<path2>
		(?&头)(?:(?&分割2)(?&path0))+
	)	
	(?<path>
		(?&头)(?:(?&分割)(?&path0))+
	)
	(?<url>
	 	https?(?:(?&分割2)(?&path0))+
	)
)')); 
RETURN p;

		
		

  END;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `o1`
-- ----------------------------
DROP FUNCTION IF EXISTS `o1`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `o1`(`p` text  ) RETURNS longblob
    DETERMINISTIC
BEGIN
	DECLARE 多个动作,动作  TEXT DEFAULT NULL ;	DECLARE 次数 int(5) DEFAULT 0;


	多个动作:WHILE  次数 = 0   DO

	  SET  p = (
						SELECT
			`replace`
		FROM
			mysq1_schema.regc AS a
		WHERE
			a.id= p );


		SET	次数 = 次数 + 1;

	END while 多个动作;

	RETURN p;


END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `o2`
-- ----------------------------
DROP FUNCTION IF EXISTS `o2`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `o2`(`p` text) RETURNS text CHARSET utf8mb3
    DETERMINISTIC
BEGIN
	DECLARE 多个动作,动作  TEXT DEFAULT NULL ;	DECLARE 次数 int(5) DEFAULT 0;

	SET 多个动作 = JSON_SEARCH(JSON_EXTRACT(p ,'$[*][0]'),"all","跳");
	
	-- IF json_value(多个动作, '$[]'
	
	SET  次数 = json_length(多个动作);

	
	多个动作:WHILE  次数 > 0   DO
		
	 SET  动作 = json_value(多个动作,CONCAT('$[',次数-1,']'));
	 
	 SET  p = JSON_REMOVE(p, 动作),
				次数 = 次数 - 1;
	
	END while 多个动作;
	RETURN p;
	
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `p`
-- ----------------------------
DROP PROCEDURE IF EXISTS `p`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `p`(IN `p` MEDIUMBLOB)
p:BEGIN
	DECLARE `p2` BLOB DEFAULT json_extract(p,'$**.p2'); DECLARE `funcid` VARCHAR(60) DEFAULT j0(`p2`,'funcid');DECLARE `b` BLOB DEFAULT NULL;
	DECLARE `p1` BLOB DEFAULT NULL;
	DECLARE `ISp2` VARCHAR(1) DEFAULT 0;

  DECLARE CONTINUE HANDLER FOR  SQLSTATE '23000', SQLSTATE	'42000'	, SQLSTATE	'42S22' , SQLSTATE	'HY000'-- ,SQLSTATE	'22007'
	bl:BEGIN 
	GET DIAGNOSTICS CONDITION 1 @`sqlstate` = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;SET  @`sqlstate` = JSON_OBJECT('sqlstate',@`sqlstate`,'errno',@errno,'text',@text);
				SET @`errsql` = @p1_body,@funcid =  NULL;
				SET @funcid = CONCAT_WS(' ','Error: ',IF(isp2,
				
				(SELECT CONCAT_WS(', ',a.note,CONCAT_WS('',UPPER(SUBSTR(a.`name`,1,1)),LOWER(substr(a.`name`,2))),a.id) FROM mysq1_schema.qs AS a WHERE a.`name` = `funcid`)
				,(SELECT CONCAT_WS(', ',a.`SUBJECT`,CONCAT_WS('',UPPER(SUBSTR(a.`name`,1,1)),LOWER(substr(a.`name`,2))),a.id) FROM mysq1_schema.qs2 AS a WHERE a.`name` = `funcid`))
									,IF(isp2, ' p2' , ' p' )),
				@pp = QUOTE(`p`);
				CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp,'SQL',@`errsql`,'err',@`sqlstate`,'l',1));END;/**/


SET isp2 = p2 REGEXP ':\\s*"p2"';
IF IFNULL(`p2`,'')= '' or !json_valid(p2)  THEN CALL Error('p :no p2 or courseNo');	ELSE SET @p1_body = '';END IF;
IF isp2 THEN CALL p2(p);LEAVE p; END IF;

START TRANSACTION;
SET @funcid = CONCAT_WS(' ',(SELECT CONCAT_WS(', ',a.note,CONCAT_WS('',UPPER(SUBSTR(a.`name`,1,1)),LOWER(substr(a.`name`,2))),a.id) FROM mysq1_schema.qs AS a WHERE a.`name` = `funcid`)
							, ' p' ),
		@pp = QUOTE(`p`);
INSERT INTO plogs (Function_Name,parameter) VALUES (@funcid,@pp);
 -- CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp AS CHAR));
COMMIT;/*	
*/

	IF IFNULL(`p2`,'')= '' or !json_valid(p2)  THEN CALL Error('p :no p2 or courseNo');	ELSE SET @p1_body = '';END IF;

	IF j0(p2,'keyword') <> '' THEN BEGIN 
			DECLARE k TEXT DEFAULT j0(p2,'keyword');DECLARE k1 TEXT DEFAULT NULL;
			SET k1 :=  REGEXP_replace(k,'(?:([^\\x4e00-\\x9fa5]+))','|\\\\\\\\Q\\1\\\\\\\\\E'),
					k1 := REGEXP_replace(k1,'^\\s*\\|\\s*|\\s*\\|\\s*$',''),
					p2 = REGEXP_replace(p2,'(?i)(?<="keyword":)("(?:\\\\.|[^"])+")',json_quote(k1));

	END;END IF;


	IF (@p0 := json_keys(p)) REGEXP '"p1"' THEN  
			SET @P0	=	json_query(p,'$.p1');

	   	SET @P0	:=	CONCAT_WS(''	,'SELECT  "k1":',REGEXP_replace(REGEXP_replace(@P0
																,CONCAT_WS('|',REGEXP_replace(r('`kvP`'),'\\Q.*?(?:[{]?)\\E',''),'(?:[{,])((?4))(?::\\{)')
																,'\\1\\3\\4\\6\\7'),'(?<=")\\}(?=")','UNION ALL \nSELECT "k1":')),
					@p0 := REGEXP_replace(@p0,'(?is)"(?=(?:"(?:\\\\.|[^"])+"|\d+):)','",'),
					@P0	:=	CONCAT_WS('',REGEXP_replace(REGEXP_SUBSTR(@P0,r('`aline`')) ,r('`kv`'),'\\4 AS \\2 ') -- head
															,REGEXP_replace(REGEXP_replace(@P0,r('`aline`'),''),r('`kv-k`'),'\\1') -- other
												),
					@P0 = REGEXP_replace(REGEXP_REPLACE(@P0,'\\}+$',''),'(?im)(?<=^|,)""(?=(?:\\s+AS\\s+[^\\n\\r]*?)?(?:,|$))','NULL')/**/ ;
			SET `p` = JSON_COMPACT(json_set(`p`,'$.p1',@P0));
	END IF;





	IF p2 REGEXP '(?i)"bid":"(?:\\\\.|[^"])+"' THEN
		SET `b` = r8(j0(p2,"bid"));


		sc:BEGIN
			DECLARE `pl` VARCHAR(200) DEFAULT REGEXP_replace(REGEXP_replace(COLUMN_list(b),'(?:^|,)`[^`]*(?<!\\d)`(?=,|$)',''),'^,|,$','');
			DECLARE `oP`  VARCHAR(60) DEFAULT NULL; DECLARE `s` BLOB DEFAULT column_get(b,'s'AS CHAR);DECLARE parameter BLOB DEFAULT column_get(b,'parameter'AS CHAR);

			IF IFNULL(parameter,'')<>'' AND IFNULL(s,'')<>'' THEN 

					SET @s = `s`;
					SET parameter = r5(parameter,p);
					EXECUTE immediate parameter;
					SET `s` = @s;
			END IF;

			SET	@p1_body = COLUMN_get(`b`,'sql'AS CHAR);

			IF IFNULL(@p1_body,'') <> '' THEN SET	@p1_body = r5(@p1_body,p);ELSE LEAVE sc; END IF; 

			IF CAST(@p1_body AS CHAR) IS NULL THEN SET @p1_body = CONVERT(@p1_body USING gbk);END IF;
-- SELECT @p1_body AS s,REGEXP_substr(@p1_body ,r('`Sart-End`')) AS core ;-- LEAVE p;
			PREPARE scp_stmt from  @p1_body;COMMIT;EXECUTE scp_stmt ;		DEALLOCATE PREPARE scp_stmt ;

			l1:LOOP

				SET `oP` = REPLACE(REGEXP_SUBSTR(`pl`, '^`[^`]+`'),'`',''),@s = NULL;

				IF IFNULL(`oP`,'') = ''  THEN  LEAVE l1; ELSE SET `pl` = REGEXP_replace(`pl`, '^`[^`]+`,?','');END IF;

				SET @p1_body := NULL,
						@p1_body = COLUMN_get(b,op AS CHAR);

				IF IFNULL(@p1_body,'') = '' THEN ITERATE l1; END IF;

        IF `s` <>'' THEN 	SET @p1_body = REGEXP_replace(@p1_body,'(?i)(?<=FROM)\\s*(?:\\(\\s*)?`SQL`(?:\\s*\\))?\\s*(?=as\\s+[\\w]\\b)',CONCAT_WS('\n','\\1(','-- Start',REGEXP_replace(QUOTE(s),'^[\'"]|[\'"]$',''),'-- End',')'));				END IF;

				SET @p1_body = CAST(r5(@p1_body,p) AS CHAR);

				IF CAST(@p1_body AS CHAR) IS NULL THEN SET @p1_body = CONVERT(@p1_body USING gbk);END IF;

-- SELECT @p1_body AS s,REGEXP_substr(@p1_body ,r('`Sart-End`')) AS core ; LEAVE p;	-- 

		 	PREPARE scp_stmt from  @p1_body;COMMIT;EXECUTE scp_stmt ;		DEALLOCATE PREPARE scp_stmt ;COMMIT;
			END LOOP;
		END;
		SET `b` = NULL ;
	END IF;

	SET `b` = r8(`funcid`);
	SET @p1_body = COLUMN_get(`b`,'sql'AS CHAR);




	IF @p1_body IS NULL THEN SET @p1_body  = CONVERT("No sql!" USING gbk);SIGNAL SQLSTATE 'HY000' SET MYSQL_ERRNO =12345 , MESSAGE_TEXT =  @p1_body ; END IF;
		BEGIN DECLARE `plist` VARCHAR(200) DEFAULT REGEXP_replace(REGEXP_replace(COLUMN_list(b),'(?:^|,)`[^`]*(?<!\\d)`(?=,|$)',''),'^,|,$','');
					DECLARE `oneP`  VARCHAR(60) DEFAULT NULL;DECLARE `s` BLOB DEFAULT column_get(b,'s'AS CHAR);DECLARE parameter BLOB DEFAULT column_get(b,'parameter'AS CHAR);



			IF IFNULL(parameter,'')<>'' THEN 


					SET @s = s,parameter = r5(parameter,p);


					EXECUTE immediate parameter;

					IF IFNULL(@s,'') <> ''THEN
						SET s = @s;
					END IF;
			END IF;

      IF s <>'' THEN 	SET @p1_body = REGEXP_replace(@p1_body,'(?i)(?<=FROM)\\s*(?:\\(\\s*)?`SQL`(?:\\s*\\))?\\s*(?=as\\s+[\\w]+\\b)',CONCAT_WS('\n','\\1(','-- Start',REGEXP_replace(QUOTE(s),'^[\'"]|[\'"]$',''),'-- End',')'));				END IF;
-- SELECT r5(@p1_body,p),CONVERT(r5(@p1_body,p) USING utf8 ) ,CAST(r5(@p1_body,p) AS CHAR );-- LEAVE p;
			SET @p1_body = CAST(r5(@p1_body,p)AS CHAR);


			IF j0(p2,'limit') <> '' THEN SET @p1_body  = REGEXP_REPLACE(@p1_body,'(?i)"\\s*(\\d+\\s*,\\s*\\d+)"','limit \\1');END IF;

			l:LOOP

				SET `oneP` = REPLACE(REGEXP_SUBSTR(`plist`, '^`[^`]+`'),'`',''),@s = NULL;
				IF IFNULL(`oneP`,'') = ''  THEN  LEAVE l; ELSE SET `plist` = REGEXP_replace(`plist`, '^`[^`]+`,?','');END IF;

				SET @s := CONCAT_WS('',CONCAT("@",`oneP`," := ")
										,CONCAT_WS('',"CONCAT_WS('','",REGEXP_replace(COLUMN_get(b,`oneP` AS CHAR),'(`.*?`)',"',CONVERT(@\\1USING gbk),'"),"'")
										,CONCAT(")AS ",`oneP`)),
						@p1_body := CONCAT_WS('\n',REGEXP_replace(@p1_body,CONCAT('(?im)^(?<![\\.\\w@]|(?:\\-{2}\\s))[\\s,]*\\K',`oneP`,'\\b'),CONCAT(@s,'\\1')));

			END LOOP;
			SET 	@p1_body = REGEXP_replace(@p1_body , '(?i)as\\s+[^\\s,)]+(?=\\s+as)','');

		END ;

/*最后处理*/
		CASE
			WHEN CAST(@p1_body AS CHAR) REGEXP  CONCAT_WS('','\\b',funcid,'2JSON\\b(?=\\s*from\\()') THEN
			SET @p1_body= CONCAT_WS('\n'
									,CONCAT('select json_object(',QUOTE(funcid),',json_arrayagg(JSON_EXTRACT(',CONCAT(funcid,'2JSON'),',"$"))) as dblob\nfrom(')
									,@p1_body
									,') as 聚合');
	
			WHEN funcid  NOT REGEXP 'help|json$'  && REGEXP_substr(@p1_body,'(?is-m)^\\s*SELECT.+?(?m)^\\s*FROM') REGEXP '[\\w\\)]`?\\s+`?dblob`?\\b(?=\\s*)'  THEN
			SET 	@p1_body =CONCAT_WS('\t','SELECT\tCAST(COLUMN_json(COLUMN_create(',QUOTE(IF(IFNULL(COLUMN_get(b,'dom'AS CHAR),'')='','dblob',COLUMN_get(b,'dom'AS CHAR)))
,CONCAT_WS('',',a.dblob))AS CHAR)AS dblob\tFROM(\n',@p1_body,'\n)AS A '));

			IF CAST(@p1_body AS CHAR) IS NULL THEN SET @p1_body = CONVERT(@p1_body USING gbk);END IF;
			ELSE SET @p1_body= @p1_body;
		END CASE ;

		
-- SELECT cast(p AS CHAR),@p1_body AS s,REGEXP_substr(@p1_body ,r('`Sart-End`')) AS core,'3' ;-- LEAVE p;

	PREPARE p_stmt from  @p1_body;COMMIT;EXECUTE p_stmt ;		DEALLOCATE PREPARE p_stmt ;-- 

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `p0`
-- ----------------------------
DROP PROCEDURE IF EXISTS `p0`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p0`(IN `params` LONGBLOB)
p:BEGIN
		DECLARE path,`key` ,`value` TINYTEXT DEFAULT NULL;
		DECLARE ROOT   TINYTEXT DEFAULT 'D:/Program Files (x86)/Qianxue/';
		DECLARE TROOT  TINYTEXT DEFAULT 'D:/Program Files (x86)/Qianxue/';
		DECLARE  r  TINYTEXT DEFAULT  '\\s*:?=\\s*\\K(["\'])(?:(?=\\\\).{2}|(?!\\g1).)*?\\g1';
		DECLARE `p`  LONGBLOB DEFAULT NULL;
/*
		START TRANSACTION;
		INSERT INTO plogs (Function_Name,parameter) VALUES ('p0 ',params);
		COMMIT;
/**/

		CASE 
			WHEN json_valid(params) && JSON_DEPTH(params)>1 && JSON_EXISTS(params, '$.root')  THEN
				SET root =  JSON_VALUE(params, '$.root');
			WHEN   params REGEXP o('^(?&path)$ path') THEN
				SET root = `params`;
		
		END CASE;

		IF  IFNULL(root,'')='' THEN
				SET  p = `params` ,`params` = NULL;
		ELSE
			SET `p` = CAST(LOAD_FILE(CONVERT(CAST(root AS  CHAR) using gbk)) AS CHAR);
		END IF ;



		IF  json_valid(params) && JSON_DEPTH(params) > 1 && JSON_EXISTS(params ,'$.path')&& json_value(params,'$.path')  REGEXP '^\\s*\\w+' THEN 

			SET 	 params = json_set(
				params,
				'$.path',
				CONCAT(
						 CASE WHEN  j0(params ,'troot')!='' THEN j0(params ,'troot') 
									WHEN  p REGEXP CONCAT('@root',r)THEN REGEXP_replace(REGEXP_substr(p ,CONCAT('@root',r)),'^["\']|["\']$','')
								ELSE TROOT
						 end
						 ,json_value(params,'$.path')));

		END IF;


		SET root  = _f(p, JSON_ARRAY( '(?sx)^\\s*/\\*\\s*\\K
		(\\w+(?:[,\\s]+\\w+)*)
		(?=[,\\s]*\\*/)'
		,'[,\\s]+','","'
		,'^.+?$','["\\0"]'))
		;

		WHILE  IFNULL(root,'')!=''&& json_valid(root)&& JSON_DEPTH(root)>1 && json_length(root)>0   DO
			SET `key` = json_value(root,'$[0]'),root =JSON_REMOVE(root,'$[0]');
			SET value= json_EXTRACT(params,CONCAT('$.',`key`,'')),`key`= CONCAT('\\@`?',`key`,'`?');
			

			SET  p = REGEXP_replace(p,CONCAT(`key`,r),VALUE);

		END WHILE;


		SET  p  = 语句变数组(p);

		IF not json_valid(p) || JSON_LENGTH(p)<1 THEN 
		SELECT '不是数组 或长度为0' error;
		LEAVE p;
		END IF; 

		SET  @执行安静 = '--slint';

		CALL `执行`(p);


END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `p0`
-- ----------------------------
DROP FUNCTION IF EXISTS `p0`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `p0`(`p` longblob,k VARCHAR(10)) RETURNS longtext CHARSET utf8mb3
    NO SQL
BEGIN
	#Routine body goes here...

	RETURN CASE 
						WHEN k IS NULL || k = ''  THEN  p
						WHEN k =0 && p = 0  THEN 'here IS ok '
						WHEN k  REGEXP '(?i)\\\bq\\s*$'  || k='1' THEN QUOTE(p)
						WHEN k  REGEXP '(?i)\\\bdq\\s*$' || k = '2' THEN json_QUOTE(p)
	ELSE p END;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `p0_copy1`
-- ----------------------------
DROP PROCEDURE IF EXISTS `p0_copy1`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p0_copy1`(IN `params` LONGBLOB)
p:BEGIN
		DECLARE path,`key` ,`value` TINYTEXT DEFAULT NULL;
		DECLARE ROOT   TINYTEXT DEFAULT 'D:/Program Files (x86)/Qianxue/';
		DECLARE TROOT  TINYTEXT DEFAULT 'D:/Program Files (x86)/Qianxue/';
		DECLARE  r  TINYTEXT DEFAULT  '\\s*:?=\\s*\\K(["\'])(?:(?=\\\\).{2}|(?!\\g1).)*?\\g1';
		DECLARE `p`  LONGBLOB DEFAULT NULL;
/*
		START TRANSACTION;
		INSERT INTO plogs (Function_Name,parameter) VALUES ('p0 ',params);
		COMMIT;
*/

		CASE 
			WHEN json_valid(params) && JSON_DEPTH(params)>1 && JSON_EXISTS(params, '$.root')  THEN
				SET root =  JSON_VALUE(params, '$.root');
			WHEN   params REGEXP o('^(?&path)$ path') THEN
				SET root = `params`;
		
		END CASE;

		IF  IFNULL(root,'')='' THEN
				SET  p = `params` ,`params` = NULL;
		ELSE
			SET `p` = CAST(LOAD_FILE(CONVERT(CAST(root AS  CHAR) using gbk)) AS CHAR);
		END IF ;



		IF  json_valid(params) && JSON_DEPTH(params) > 1 && JSON_EXISTS(params ,'$.path')&& json_value(params,'$.path')  REGEXP '^\\s*\\w+' THEN 

			SET 	 params = json_set(
				params,
				'$.path',
				CONCAT(
						 CASE WHEN  j0(params ,'troot')!='' THEN j0(params ,'troot') 
									WHEN  p REGEXP CONCAT('@root',r)THEN REGEXP_replace(REGEXP_substr(p ,CONCAT('@root',r)),'^["\']|["\']$','')
								ELSE TROOT
						 end
						 ,json_value(params,'$.path')));

		END IF;


		SET root  = _f(p, JSON_ARRAY( '(?sx)^\\s*/\\*\\s*\\K
		(\\w+(?:[,\\s]+\\w+)*)
		(?=[,\\s]*\\*/)'
		,'[,\\s]+','","'
		,'^.+?$','["\\0"]'))
		;

		WHILE  IFNULL(root,'')!=''&& json_valid(root)&& JSON_DEPTH(root)>1 && json_length(root)>0   DO
			SET `key` = json_value(root,'$[0]'),root =JSON_REMOVE(root,'$[0]');
			SET value= json_EXTRACT(params,CONCAT('$.',`key`,'')),`key`= CONCAT('\\@`?',`key`,'`?');
			

			SET  p = REGEXP_replace(p,CONCAT(`key`,r),VALUE);

		END WHILE;


		SET  p  = 语句变数组(p);

		IF not json_valid(p) || JSON_LENGTH(p)<1 THEN 
		SELECT '不是数组 或长度为0' error;
		LEAVE p;
		END IF; 

		SET  @执行安静 = '--slint';

		CALL `执行`(p);


END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `p2`
-- ----------------------------
DROP PROCEDURE IF EXISTS `p2`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `p2`(IN `p` longblob)
    MODIFIES SQL DATA
p2:BEGIN
	#Routine body goes here...

	DECLARE `p2` BLOB DEFAULT j0(`p`,'p2'); DECLARE `funcid` VARCHAR(60) DEFAULT j0(`p2`,'funcid');DECLARE `b` MEDIUMBLOB DEFAULT NULL;
	DECLARE `k` VARCHAR(200) DEFAULT j0(p2,'k');
  DECLARE CONTINUE HANDLER FOR  SQLSTATE '23000', SQLSTATE	'42000'	, SQLSTATE	'42S22' , SQLSTATE	'HY000',SQLSTATE	'22007'
	/*BEGIN GET DIAGNOSTICS CONDITION 1 @`sqlstate` = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;SET  @`sqlstate` = JSON_OBJECT('sqlstate',@`sqlstate`,'errno',@errno,'text',@text);
				SET @`errsql` = @p1_body,@funcid =  NULL;
				SET @funcid = CONCAT_WS(' ','Error: ',(SELECT CONCAT_WS(', ',a.note,CONCAT_WS('',UPPER(SUBSTR(a.`name`,1,1)),LOWER(substr(a.`name`,2))),a.id) FROM mysq1_schema.qs2 AS a WHERE a.`name` = `funcid`)
									, ' p2' ),
				@pp = QUOTE(`p`);
				CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp,'SQL',@`errsql`,'err',@`sqlstate`,'l',1));END;*/

START TRANSACTION;
SET @funcid = CONCAT_WS(' ',(SELECT CONCAT_WS(', ',a.note,CONCAT_WS('',UPPER(SUBSTR(a.`name`,1,1)),LOWER(substr(a.`name`,2))),a.id) FROM mysq1_schema.qs2 AS a WHERE a.`name` = `funcid`)
							, ' p2' ),
		@pp = QUOTE(`p`);

INSERT INTO plogs (Function_Name,parameter) VALUES (@funcid,@pp);
COMMIT;	/*
*/

/*校验*/

	IF IFNULL(`p2`,'')= '' OR IFNULL(`funcid`,'') = '' THEN SIGNAL SQLSTATE 'HY000' SET MESSAGE_TEXT = 'no p2 or funcid is null';LEAVE p2;	ELSE SET @sql_body = NULL;END IF;

	SET `b` = r9(`funcid`), @P0	=	j0(p,"p1"),@p1_body = COLUMN_get(b,'sql'AS CHAR),@sql_body = NULL;


	CASE 	WHEN @p1_body REGEXP '(?im)^\\s*+delete' THEN	SET @p1_body = r5(@p1_body,p);
		ELSE
-- 处理参数
			IF k REGEXP '\\w+' THEN BEGIN DECLARE `r` VARCHAR(200) DEFAULT 
				CONCAT('(?is)("\\d+":\\{"',replace(k,',','":"(?:\\\\.|[^"])*"\\K((?:,"(?:\\\\.|[^"])*":"(?:\\\\.|[^"])*")+?)(?=,"'),')');
				SET @k := REGEXP_substr(@P0,`R`),
						@k := REGEXP_REPLACE(@k,r('`kv-v`'),'\\1\\2:""'),
						@k = CONCAT('\\1',@k),
						r = CONCAT('(?is)("\\d+":\\{"',replace(k,',','":"(?:\\\\.|[^"])*"(?=,"'),')')/**/ ;
				SET	@P0 = REGEXP_replace(@P0,r,@k), @k = NULL;
			END; END IF;
-- 处理p1;
			SET @P0	:=	CONCAT_WS(' ',"SELECT",REGEXP_replace(REGEXP_replace(@P0,r('`kvP`'),'\\1\\3\\4\\6'),'(?<=")\\}(?=")','UNION ALL \nSELECT ')),
					@P0	:=	CONCAT_WS('',REGEXP_replace(REGEXP_SUBSTR(@P0,r('`aline`')) ,r('`kv`'),'\\4 AS \\2 ') -- head
														,REGEXP_replace(REGEXP_replace(@P0,r('`aline`'),''),r('`kv-k`'),'\\1') -- other
													),
					@P0 = REGEXP_replace(REGEXP_REPLACE(@P0,'\\}+$',''),'(?im)(?<=^|,)""(?=(?:\\s+AS\\s+[^\\n\\r]*?)?(?:,|$))','NULL');


			BEGIN DECLARE `pl` VARCHAR(200) DEFAULT COLUMN_list(b);DECLARE `oPs`  VARCHAR(60) DEFAULT NULL;

					SET @i = 0;

					p20:LOOP 

							SET `oPs` = REPLACE(REGEXP_SUBSTR(`pl`, '^`[^`]+`'),'`',''),@s = NULL;
							IF IFNULL(`oPs`,'') ='' THEN LEAVE p20;ELSE SET `pl` = REGEXP_replace(`pl`, '^`[^`]+`,?','');END IF;

							SET	@p1_body = COLUMN_get(b,`oPs`AS CHAR);
							IF IFNULL(@p1_body,'') ='' THEN   ITERATE  p20;END IF;

							CASE	WHEN @p1_body REGEXP '(?is)^\\s*select(.*?)from(.*?)(?=where\\s+|$)' AND `funcid` REGEXP '(?i)UPDAT' THEN
											SET @p1_body = REGEXP_replace(@p1_body,'(?is)^\\s*SELECT(.*?)from(.*?)(?=where\\s+|$)','update \\2\nSET \\1');
											SET	@p1_body = REGEXP_replace(@p1_body,'(?ims)^((?:`?\\w+`?\\.)?[\\w`]+)\\s*,\\s*?([\\n\\r]+^\\s*`?\\w)','\\1 = \\2');
											SET @p1 := @p0;

										WHEN @p1_body REGEXP '(?i)^\\s*insert'  THEN
											SET @kfield  = REGEXP_REPLACE(REGEXP_substr(p,'(?s)(?<="p1":{"\\d":\\{)(?:"(?:\\\\.|[^"])*":"(?:\\\\.|[^"])*",?)*(?=\\})')
																													,'(?s)"((?:\\\\.|[^"])*)":"(?:\\\\.|[^"])*"','\\1');

											SET @k	=	REGEXP_replace(REGEXP_substr(@p1_body,'(?ims)^\\s*insert\\s+into\\s*\\w+\\(\\s*\\K.*?(?=,f`|\\))')
																								,'(?<!`)(\\b\\w+)\\b(?!`)','`\\1` AS `\\1`');
											SET	@k	=	REGEXP_replace(CONCAT('\\1', r5(@k,p2) ,','),'(?i)null','""');

											SET	@p1 =	REGEXP_REPLACE(@p0,'(?ims)^(\\s*SELECT\\s+)',@k) ;

											SET @p1_body = REGEXP_REPLACE(@p1_body,'f`kfield`',@`kfield`);

								ELSE SET @p1 = @p0 ;
							END CASE;


					IF @p1 IS NULL|| @p1 ='SELECT' THEN SET @p1 =NULL; END IF; -- SELECT @p1_body ,CAST(CONCAT_WS(',',p2,'"p1":"`p1`"')AS CHAR) ;
					SET @p1_body = r5(@p1_body,CONCAT_WS(',',p2,p2)); -- SELECT CAST(@p1_body AS CHAR);
					IF @p1_body REGEXP '(?ims)^\\s*\\-\\- +\\-\\-' THEN BEGIN 
							DECLARE `op` BLOB DEFAULT NULL ;DECLARE i INT(10) DEFAULT 0;DECLARE `mr` BLOB DEFAULT '(?is)^(.+?(?=(?:,[\\n\\r]+\\-\\-\\s+\\-)|$))([,\\-\\r\\n ]*)';

							
									SET @p1_body1 = REGEXP_replace(REGEXP_substr(@p1_body,'(?ism)^.+(?=^\\s*set)'),'"`p1`"',@p1),
											@p1_body2 = REGEXP_substr(@p1_body,'(?is)(?<=[\\n\\r])\\s*set\\K.*?(?=[\\n\\r]+\\s*where|$)'),
											@p1_body3 = REGEXP_substr(@p1_body,'(?isXx)(?<=[\\n\\r])where.*?$');
									p2l:LOOP

										SET `op` = REGEXP_REPLACE(REGEXP_substr(@p1_body2,`mr`),`mr`,'\\1');

										IF `op` ='' THEN LEAVE p2l;END IF;
										SET 	@p1_body2		=  REGEXP_REPLACE(@p1_body2,`mr`,'');
										SET @`op` = CAST(CONCAT_WS('\n',@p1_body1,'SET',`op`,@p1_body3)AS CHAR);
-- SELECT @`op`,REGEXP_replace(REGEXP_replace(@`op`,r('u2s'),'select \\2\nfrom \\1'),r('u2s2'),',');-- 

											EXECUTE immediate  @`op`;SET @i= @i+ROW_COUNT();
									END LOOP;
							END;
						ELSE 

							SET @p1_body =  IF(IFNULL(@p1,'') ='', @p1_body, REGEXP_replace(@p1_body,'`p1`',@p1));
							IF CAST(@p1_body AS CHAR) IS NULL THEN SET @p1_body = CONVERT(@p1_body USING gbk);END IF;
-- SELECT '2',@i,CAST(@p1_body AS CHAR),@p1 ,CAST(REGEXP_replace(REGEXP_replace(@p1_body,r('u2s'),'select \\2\nfrom \\1'),r('u2s2'),',') AS CHAR)AS `SQL`;-- LEAVE p2;


						EXECUTE immediate @p1_body;
						SET @i =  @i + ROW_COUNT();
					 END IF;
				END LOOP;

EXECUTE immediate CONCAT("SELECT  ",@i,IF(IFNULL(json_query(`p2`,'$.p2'),'') = 'p2',
' AS ROW_COUNT',
' AS dblob')
);
				LEAVE p2;
		END;

	END CASE;
	
-- SELECT j0(`p`,'p2'),p2, j0(`p2`,'funcid');leave p2;
	IF CAST(@p1_body AS CHAR) IS NULL THEN SET @p1_body = CONVERT(@p1_body USING gbk);END IF;
-- SELECT CAST(@p1_body AS CHAR),@p1 ,CAST(REGEXP_replace(REGEXP_replace(@p1_body,r('u2s'),'select \\2\nfrom \\1'),r('u2s2'),',') AS CHAR)AS `SQL`;LEAVE p2;-- 

	EXECUTE immediate @p1_body;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `p2_copy`
-- ----------------------------
DROP PROCEDURE IF EXISTS `p2_copy`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `p2_copy`(IN `p` LONGblob)
    MODIFIES SQL DATA
p2:BEGIN
	#Routine body goes here...

	DECLARE `p2` BLOB DEFAULT j0(`p`,'p2'); DECLARE `funcid` VARCHAR(60) DEFAULT j0(`p2`,'funcid');DECLARE `b` MEDIUMBLOB DEFAULT NULL;
	DECLARE `k` VARCHAR(200) DEFAULT j0(p2,'k');
  DECLARE CONTINUE HANDLER FOR  SQLSTATE '23000', SQLSTATE	'42000'	, SQLSTATE	'42S22' , SQLSTATE	'HY000',SQLSTATE	'22007'
	BEGIN GET DIAGNOSTICS CONDITION 1 @`sqlstate` = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;SET  @`sqlstate` = JSON_OBJECT('sqlstate',@`sqlstate`,'errno',@errno,'text',@text);
				SET @`errsql` = @p1_body,@funcid =  NULL;
				SET @funcid = CONCAT_WS(' ','Error: ',(SELECT CONCAT_WS(', ',CONCAT_ws('',a.note,a.`SUBJECT`),CONCAT_WS('',UPPER(SUBSTR(a.`name`,1,1)),LOWER(substr(a.`name`,2))),a.id) FROM mysq1_schema.qs2 AS a WHERE a.`name` = `funcid`)
									, ' p2' ),
				@pp = QUOTE(`p`);
				CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp,'SQL',@`errsql`,'err',@`sqlstate`,'l',1));END;
	/*
START TRANSACTION;
SET @funcid = CONCAT_WS(' ',(SELECT CONCAT_WS(', ',CONCAT_ws('',a.note,a.`SUBJECT`),CONCAT_WS('',UPPER(SUBSTR(a.`name`,1,1)),LOWER(substr(a.`name`,2))),a.id) FROM mysq1_schema.qs2 AS a WHERE a.`name` = `funcid`)
							, ' p2' ),
		@pp = QUOTE(`p`);

INSERT INTO plogs (Function_Name,parameter) VALUES (@funcid,@pp);
COMMIT;
*/

/*校验*/

	IF IFNULL(`p2`,'')= '' OR IFNULL(`funcid`,'') = '' THEN SIGNAL SQLSTATE 'HY000' SET MESSAGE_TEXT = 'no p2 or funcid is null';LEAVE p2;	ELSE SET @sql_body = NULL;END IF;

	SET `b` = r9(`funcid`), @P0	=	j0(p,"p1"),@p1_body = COLUMN_get(b,'sql'AS CHAR),@sql_body = NULL;


	CASE 	WHEN @p1_body REGEXP '(?im)^\\s*+delete' THEN	SET @p1_body = r5(@p1_body,p);
		ELSE
-- 处理参数
			IF k REGEXP '\\w+' THEN BEGIN DECLARE `r` VARCHAR(200) DEFAULT 
				CONCAT('(?is)("\\d+":\\{"',replace(k,',','":"(?:\\\\.|[^"])*"\\K((?:,"(?:\\\\.|[^"])*":"(?:\\\\.|[^"])*")+?)(?=,"'),')');
				SET @k := REGEXP_substr(@P0,`R`),
						@k := REGEXP_REPLACE(@k,r('`kv-v`'),'\\1\\2:""'),
						@k = CONCAT('\\1',@k),
						r = CONCAT('(?is)("\\d+":\\{"',replace(k,',','":"(?:\\\\.|[^"])*"(?=,"'),')')/**/ ;
				SET	@P0 = REGEXP_replace(@P0,r,@k), @k = NULL;
			END; END IF;
-- 处理p1;
			SET @P0	:=	CONCAT_WS(' ',"SELECT",REGEXP_replace(REGEXP_replace(@P0,r('`kvP`'),'\\1\\3\\4\\6'),'(?<=")\\}(?=")','UNION ALL \nSELECT ')),
					@P0	:=	CONCAT_WS('',REGEXP_replace(REGEXP_SUBSTR(@P0,r('`aline`')) ,r('`kv`'),'\\4 AS \\2 ') -- head
														,REGEXP_replace(REGEXP_replace(@P0,r('`aline`'),''),r('`kv-k`'),'\\1') -- other
													),
					@P0 = REGEXP_replace(REGEXP_REPLACE(@P0,'\\}+$',''),'(?im)(?<=^|,)""(?=(?:\\s+AS\\s+[^\\n\\r]*?)?(?:,|$))','NULL');


			BEGIN DECLARE `pl` VARCHAR(200) DEFAULT COLUMN_list(b);DECLARE `oPs`  VARCHAR(60) DEFAULT NULL;

					SET @i = 0;

					p20:LOOP 

							SET `oPs` = REPLACE(REGEXP_SUBSTR(`pl`, '^`[^`]+`'),'`',''),@s = NULL;
						IF IFNULL(`oPs`,'') ='' THEN LEAVE p20;ELSE SET `pl` = REGEXP_replace(`pl`, '^`[^`]+`,?','');END IF;

							SET	@p1_body = COLUMN_get(b,`oPs`AS CHAR);
							IF IFNULL(@p1_body,'') ='' THEN   ITERATE  p20;END IF;

							CASE	WHEN @p1_body REGEXP '(?is)^\\s*select(.*?)from(.*?)(?=where\\s+|$)' AND `funcid` REGEXP '(?i)UPDAT' THEN
											SET @p1_body = REGEXP_replace(@p1_body,'(?is)^\\s*SELECT(.*?)from(.*?)(?=where\\s+|$)','update \\2\nSET \\1');
											SET	@p1_body = REGEXP_replace(@p1_body,'(?ims)^((?:`?\\w+`?\\.)?[\\w`]+)\\s*,\\s*?([\\n\\r]+^\\s*`?\\w)','\\1 = \\2');
											SET @p1 := @p0;

										WHEN @p1_body REGEXP '(?i)^\\s*insert'  THEN

											SET @kfield  = REGEXP_REPLACE(REGEXP_substr(p,'(?s)(?<="p1":{"\\d":\\{)(?:"(?:\\\\.|[^"])*":"(?:\\\\.|[^"])*",?)*(?=\\})')
																													,'(?s)"((?:\\\\.|[^"])*)":"(?:\\\\.|[^"])*"','\\1');

											SET @k	=	REGEXP_replace(REGEXP_substr(@p1_body,'(?ims)^\\s*insert\\s+into\\s*\\w+\\(\\s*\\K.*?(?=,f`|\\))')
																								,'(?<!`)(\\b\\w+)\\b(?!`)','`\\1` AS `\\1`');
											SET	@k	=	REGEXP_replace(CONCAT('\\1', r5(@k,p2) ,','),'(?i)null','""');

											SET	@p1 =	REGEXP_REPLACE(@p0,'(?ims)^(\\s*SELECT\\s+)',@k) ;

											SET @p1_body = REGEXP_REPLACE(@p1_body,'f`kfield`',@`kfield`);

								ELSE SET @p1 = @p0 ;
							END CASE;


					IF @p1 IS NULL|| @p1 ='SELECT' THEN SET @p1 =NULL; END IF; -- SELECT @p1_body ,CAST(CONCAT_WS(',',p2,'"p1":"`p1`"')AS CHAR) ;
					SET @p1_body = r5(@p1_body,CONCAT_WS(',',p2,p2)); -- 
					SELECT CAST(@p1_body AS CHAR);

					
					
					IF @p1_body REGEXP '(?ims)^\\s*\\-\\- +\\-\\-' THEN BEGIN 
					
							DECLARE `op` BLOB DEFAULT NULL ;DECLARE i INT(10) DEFAULT 0;DECLARE `mr` BLOB DEFAULT '(?is)^(.+?(?=(?:,[\\n\\r]+\\-\\-\\s+\\-)|$))([,\\-\\r\\n ]*)';

							
									SET @p1_body1 = REGEXP_replace(REGEXP_substr(@p1_body,'(?ism)^.+(?=^\\s*set)'),'"`p1`"',@p1),
											@p1_body2 = REGEXP_substr(@p1_body,'(?is)(?<=[\\n\\r])\\s*set\\K.*?(?=[\\n\\r]+\\s*where|$)'),
											@p1_body3 = REGEXP_substr(@p1_body,'(?isXx)(?<=[\\n\\r])where.*?$');
									p2l:LOOP

										SET `op` = REGEXP_REPLACE(REGEXP_substr(@p1_body2,`mr`),`mr`,'\\1');

										IF `op` ='' THEN LEAVE p2l;END IF;
										SET 	@p1_body2		=  REGEXP_REPLACE(@p1_body2,`mr`,'');
										SET @`op` = CAST(CONCAT_WS('\n',@p1_body1,'SET',`op`,@p1_body3)AS CHAR);
										
-- SELECT @`op`,REGEXP_replace(REGEXP_replace(@`op`,r('u2s'),'select \\2\nfrom \\1'),r('u2s2'),',');-- 

											EXECUTE immediate  @`op`;SET @i= @i+ROW_COUNT();
									END LOOP;
							END;
						ELSE 

							SET @p1_body =  IF(IFNULL(@p1,'') ='', @p1_body, REGEXP_replace(@p1_body,'`p1`',@p1));
							IF CAST(@p1_body AS CHAR) IS NULL THEN SET @p1_body = CONVERT(@p1_body USING gbk);END IF;
-- 
SELECT '2',@i,CAST(@p1_body AS CHAR),@p1 ,CAST(REGEXP_replace(REGEXP_replace(@p1_body,r('u2s'),'select \\2\nfrom \\1'),r('u2s2'),',') AS CHAR)AS `SQL`;-- LEAVE p2;


						EXECUTE immediate @p1_body;
						SET @i =  @i + ROW_COUNT();
					 END IF;
				END LOOP;

EXECUTE immediate CONCAT("SELECT  ",@i,IF(IFNULL(json_query(`p2`,'$.p2'),'') = 'p2',
' AS ROW_COUNT',
' AS dblob')
);
				LEAVE p2;
		END;

	END CASE;
	
SELECT j0(`p`,'p2'),p2, j0(`p2`,'funcid');leave p2;
	IF CAST(@p1_body AS CHAR) IS NULL THEN SET @p1_body = CONVERT(@p1_body USING gbk);END IF;
-- SELECT CAST(@p1_body AS CHAR),@p1 ,CAST(REGEXP_replace(REGEXP_replace(@p1_body,r('u2s'),'select \\2\nfrom \\1'),r('u2s2'),',') AS CHAR)AS `SQL`;LEAVE p2;-- 

	EXECUTE immediate @p1_body;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `polling_mission`
-- ----------------------------
DROP PROCEDURE IF EXISTS `polling_mission`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `polling_mission`(in _expid varchar(60),in _id VARCHAR(60),in _pageNo VARCHAR(5))
polling_mission: BEGIN
	#Routine body goes here...

-- 用于背景表单(任务表单)
-- 1、获取背景表单划线联次信息T数据
-- 2、获取背景表单A数据
-- 3、获取背景表单B数据
-- 4、获取背景表单签章数据


CALL Audit_1('polling_mission',CONCAT_WS(',',QUOTE(`_expid`),QUOTE(`_id`),QUOTE(`_pageNo`)),'ok');
/*
*/

	IF  _pageNo IS NULL THEN 	SET _pageNo =1;END IF;
	IF _pageno =0 THEN SET _pageno =1;end IF;

  IF  IFNULL(_id, '' ) = '' THEN
			CALL Audit("polling_mission'S Parameter is wrong",CONCAT_WS(',','expid ,missionid,page',QUOTE(_expid),QUOTE(_id),QUOTE(_pageno)),
						QUOTE(_expid),QUOTE(_id),NULL,NULL,NULL,NULL);
			LEAVE polling_mission;
	END IF;

	IF IFNULL(_expid,'') = '' THEN
			CALL v5_bk_bill_m(_expid,_id,_pageNo);
			LEAVE polling_mission;
	END IF;



	
-- 1 任务
	SET @poll_mission_stat = CONCAT("SELECT 	a.missionId, a.billId,\n",
					QUOTE(_pageno),"AS pageNo,a.is_line,a.line_x1,a.line_y1,a.line_x2,a.line_y2,a.line_color,a.line_type,\n" ,
					Temp_Func("a.t??",1,8,NULL),",b.standard_jsp,b.max_page,\n",
					Temp_Func("b.page_title??",1,8,NULL),"\n"
					"FROM acc_mission AS a\n",
					"INNER JOIN mysq1_schema.bill_list AS b ON a.billId = b.billId\n",
					"WHERE a.missionId=",QUOTE(_id)) ;
		PREPARE stmt_poll FROM @poll_mission_stat;
		EXECUTE stmt_poll;


-- 2 a
		SET @poll_mission_stat = CONCAT("SELECT ",QUOTE(_id)," AS missionId ,", Temp_Func("a??",1,100,NULL),"\n", 
													"FROM acc_1 AS a \n",
													"where a.expid=",QUOTE(_expid)," AND a.missionid =",QUOTE(_id));

		PREPARE stmt_poll FROM @poll_mission_stat;
		EXECUTE stmt_poll;


-- 3 b
		SET @poll_mission_stat = CONCAT("SELECT a.rowNo,",QUOTE(_id)," AS missionId ,", Temp_Func("b??",1,50,NULL),"\n", 
													"FROM ",expid2b(_expid)," AS a \n",
													"where a.expid=",QUOTE(_expid)," AND a.missionid =",QUOTE(_id));

		PREPARE stmt_poll FROM @poll_mission_stat;
		EXECUTE stmt_poll;
		
-- 4 印章
		SET @poll_mission_stat = CONCAT(" SELECT ",QUOTE(_id)," AS missionId, a.seal_Id, b.x, b.y, c.roleID, c.seal_name,c.seal_content,c.seal_shape,\n",
										"c.seal_w AS w,c.seal_h AS h,c.seal_color,c.seal_font,\n",
										"c.seal_content_arc,c.seal_content_arc_font,\n",
										"c.seal_content_bottom,c.seal_content_bottom_font \n",
										"FROM acc_seal_1 AS a \n",
										"INNER JOIN acc_mission_seal AS b ON a.pageId = b.pageId AND a.missionId = b.missionId AND a.seal_Id = b.seal_id \n",
										"INNER JOIN acc_enter_seal AS c ON b.seal_id = c.sealID \n",
										"WHERE a.expid=",QUOTE(_expid)," AND a.missionid =",QUOTE(_id)," AND a.pageid = ",_pageno);
		PREPARE stmt_poll FROM @poll_mission_stat;
		EXECUTE stmt_poll;

		DEALLOCATE PREPARE stmt_poll;

-- 测试

-- 

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `prisma 2 grahpql`
-- ----------------------------
DROP FUNCTION IF EXISTS `prisma 2 grahpql`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `prisma 2 grahpql`(`env` longblob) RETURNS longblob
    DETERMINISTIC
BEGIN


SET @env_prisma2grahpql := JSON_MERGE(@ENV_prisma2grahpql := JSON_OBJECT(
"是否删除文件",0
,"是否写文件",1
,"root",@root_prisma2grahpql:= 'D:/Program Files (x86)/Qianxue/QxServer7.0/qn/node/q'
,'cd',CONCAT_WS(' ','cd /d',JSON_QUOTE(@root_prisma2grahpql))
,'schemaPrismaPath',CONCAT_WS('/',@root_prisma2grahpql,'prisma/schema.prisma')
),JSON_OBJECT(
"mkdir", CONCAT('mkdir -p ',js('env') ,'/migrations/0_init'),
"schemaPrisma",s(js('env.schemaPrismaPath'),'path'),
CAST("删除" AS CHAR),CONCAT_WS(' ','DEL ',JSON_QUOTE(js('env.schemaPrismaPath')))
));

RETURN(
SELECT 

CAST(@env_prisma2grahpql := env AS CHAR) env

FROM(
SELECT 
@file_prisma2grahpql :=js('env.schemaPrisma') file,

@Type_prisma2grahpql := _f(@file_prisma2grahpql,JSON_ARRAY(
o('model\\s+(post)\\s+(?&r2) es6')

 ,'^\\s*model','type'
 ,'(?m)^\\s*$\\s',''
 ,o('(?m)((?&fields))\\s+((?&k0)(?&r3)?).*?$ es6'),'\\1:\\2'
 ,'(?m)^\\s+\\@{2}.+?$',''

)) Type 

,@NEW_prisma2grahpql := _f(@Type_prisma2grahpql,JSON_ARRAY(
@r_prisma2grahpql:=O('(?m)^\\w+(\\s+)(post\\s*(?&r2))$ es6')
,@r_prisma2grahpql,'input\\1New\\2'
,'(?m).ID!',''
)) NEW

,@Update_prisma2grahpql := _f(@Type_prisma2grahpql,JSON_ARRAY(
@r_prisma2grahpql:=O('(?m)^\\w+(\\s+)(post\\s*(?&r2))$ es6')
,@r_prisma2grahpql,'input\\1Update\\2'
,'(?m).ID!',''
)) `Update`

,@Query_prisma2grahpql := _f(@Type_prisma2grahpql,JSON_ARRAY(
O('(?m)^\\w+(\\s+)(post)\\s*(?&r2)$ es6')
,'^type\\s+\\K(\\w+)([\\s*\\{]+[\\n\\r]+(?m)^(\\s+))([^\\s:]+:(\\s*))(\\S+)(?s).+?(?=[\\n\\r]?\\}(?-m)$)'
,'Mutation\\2\\1s:\\5[\\1!]!\n\\3\\1(\\4\\6):\\5\\1'
-- ,'(?m).ID!',''
)) `Query`
,@Mutation_prisma2grahpql := _f(@Type_prisma2grahpql,JSON_ARRAY(
O('(?m)^\\w+\\s+(post)\\s*(?&r2)$ es6')
, '^type\\s+\\K(\\w+)([\\s*\\{]+[\\n\\r]+(?m)^(\\s+))([^\\s:]+:(\\s*))(\\S+)(?s).+?(?=[\\n\\r]?\\}(?-m)$)'
,CONCAT('Mutation\\2'
,'\\5create\\1(input:\\5New\\1!):\\5\\1!'
,'\n\\3update\\1(input:\\5update\\1!):\\5\\1'
,'\n\\3update\\1(input:\\5update\\1!):\\5\\1'
)
)) `Mutation`

,@Subscription_prisma2grahpql := _f(@Type_prisma2grahpql,JSON_ARRAY(
O('(?m)^\\w+\\s+(post)\\s*(?&r2)$ es6')
, '^type\\s+\\K(\\w+)([\\s*\\{]+[\\n\\r]+(?m)^(\\s+))([^\\s:]+:(\\s*))(\\S+)(?s).+?(?=[\\n\\r]?\\}(?-m)$)'
,CONCAT('Subscription\\2'
,'\\5post:\\5\\1'
)
)) `Subscription`
,@file_prisma2grahpql := CONCAT_WS('\n\n',@NEW_prisma2grahpql,@NEW_prisma2grahpql,@Update_prisma2grahpql,@Query_prisma2grahpql,@Mutation_prisma2grahpql,@Subscription_prisma2grahpql)
,JSON_MERGE_patch(@env_prisma2grahpql
,JSON_OBJECT('schemagraphqlpath',CONCAT_WS('/',js('env.root'),'apps/q/src/posts/schema.graphql'))
,JSON_OBJECT('schemagraphql',@file_prisma2grahpql)
) env
) as a


);
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `prisma2grahpql`
-- ----------------------------
DROP FUNCTION IF EXISTS `prisma2grahpql`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `prisma2grahpql`(`env` longblob) RETURNS longblob
    DETERMINISTIC
BEGIN


SET @env_prisma2grahpql := JSON_MERGE(@ENV_prisma2grahpql := JSON_OBJECT(
"是否删除文件",0
,"是否写文件",1
,"root",@root_prisma2grahpql:= 'D:/Program Files (x86)/Qianxue/QxServer7.0/qn/node/q'
,'cd',CONCAT_WS(' ','cd /d',JSON_QUOTE(@root_prisma2grahpql))
,'schemaPrismaPath',CONCAT_WS('/',@root_prisma2grahpql,'prisma/schema.prisma')
),JSON_OBJECT(
"mkdir", CONCAT('mkdir -p ',js('env') ,'/migrations/0_init'),
"schemaPrisma",s(js('env.schemaPrismaPath'),'path'),
CAST("删除" AS CHAR),CONCAT_WS(' ','DEL ',JSON_QUOTE(js('env.schemaPrismaPath')))
));

RETURN (
SELECT 

@env_prisma2grahpql := env env

FROM(
SELECT 
@file_prisma2grahpql :=js('env.schemaPrisma') file,

@Type_prisma2grahpql := _f(@file_prisma2grahpql,JSON_ARRAY(
o('model\\s+(post)\\s+(?&r2) es6')

 ,'^\\s*model','type'
 ,'(?m)^\\s*$\\s',''
 ,o('(?m)((?&fields))\\s+((?&k0)(?&r3)?).*?$ es6'),'\\1:\\2'
 ,'(?m)^\\s+\\@{2}.+?$',''

)) Type 

,@NEW_prisma2grahpql := _f(@Type_prisma2grahpql,JSON_ARRAY(
@r_prisma2grahpql:=O('(?m)^\\w+(\\s+)(post\\s*(?&r2))$ es6')
,@r_prisma2grahpql,'input\\1New\\2'
,'(?m).ID!',''
)) NEW

,@Update_prisma2grahpql := _f(@Type_prisma2grahpql,JSON_ARRAY(
@r_prisma2grahpql:=O('(?m)^\\w+(\\s+)(post\\s*(?&r2))$ es6')
,@r_prisma2grahpql,'input\\1Update\\2'
,'(?m).ID!',''
)) `Update`

,@Query_prisma2grahpql := _f(@Type_prisma2grahpql,JSON_ARRAY(
O('(?m)^\\w+(\\s+)(post)\\s*(?&r2)$ es6')
,'^type\\s+\\K(\\w+)([\\s*\\{]+[\\n\\r]+(?m)^(\\s+))([^\\s:]+:(\\s*))(\\S+)(?s).+?(?=[\\n\\r]?\\}(?-m)$)'
,'Mutation\\2\\1s:\\5[\\1!]!\n\\3\\1(\\4\\6):\\5\\1'
-- ,'(?m).ID!',''
)) `Query`
,@Mutation_prisma2grahpql := _f(@Type_prisma2grahpql,JSON_ARRAY(
O('(?m)^\\w+\\s+(post)\\s*(?&r2)$ es6')
, '^type\\s+\\K(\\w+)([\\s*\\{]+[\\n\\r]+(?m)^(\\s+))([^\\s:]+:(\\s*))(\\S+)(?s).+?(?=[\\n\\r]?\\}(?-m)$)'
,CONCAT('Mutation\\2'
,'\\5create\\1(input:\\5New\\1!):\\5\\1!'
,'\n\\3update\\1(input:\\5update\\1!):\\5\\1'
,'\n\\3update\\1(input:\\5update\\1!):\\5\\1'
)
)) `Mutation`

,@Subscription_prisma2grahpql := _f(@Type_prisma2grahpql,JSON_ARRAY(
O('(?m)^\\w+\\s+(post)\\s*(?&r2)$ es6')
, '^type\\s+\\K(\\w+)([\\s*\\{]+[\\n\\r]+(?m)^(\\s+))([^\\s:]+:(\\s*))(\\S+)(?s).+?(?=[\\n\\r]?\\}(?-m)$)'
,CONCAT('Subscription\\2'
,'\\5post:\\5\\1'
)
)) `Subscription`
,@file_prisma2grahpql := CONCAT_WS('\n\n',@NEW_prisma2grahpql,@NEW_prisma2grahpql,@Update_prisma2grahpql,@Query_prisma2grahpql,@Mutation_prisma2grahpql,@Subscription_prisma2grahpql)
,JSON_MERGE_patch(@env_prisma2grahpql
,JSON_OBJECT('schemagraphqlpath',CONCAT_WS('/',js('env.root'),'apps/q/src/posts/schema.graphql'))
,JSON_OBJECT('schemagraphql',@file_prisma2grahpql)
) env
) as a
 );
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `pro_missionseal`
-- ----------------------------
DROP PROCEDURE IF EXISTS `pro_missionseal`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `pro_missionseal`()
BEGIN


DROP  temporary  table IF EXISTS cur2  ;

 create temporary  table cur2  as        
	select 
		c11.courseno as courseno,
		cast(concat(
			c11.courseName, ':', substring_index( c1.node_No , '.' , 1),'章',
				substring_index( c1.node_No , '.' , -1),'节' ,
				 c.sortNum , '单元' , a.step_label , '任务' ) 
			as char )  as title1 , 
		c1.node_No ,
		c.sortNum,
		a.* 
	from acc_mission as a 

	left join exp_node_content as c  
		on c.contentNo = a.referencedId 
	left join exp_courses_node as c1 
		on c.node_Id = c1.node_Id  
		left join exp_courses as c11 
			on c11.courseno =  c1.node_courseNo
where c.node_id is not null
	order by c1.node_courseNo +0.0 ,c1.node_No + 0.0 , c.sortNum ,  a.step_label ; 





 set @id =0  ,@courseno = 0 ;
DROP  temporary  table IF EXISTS cur1  ;
create temporary  table cur1  as        
	select 
		a.courseno,
		a.title1 ,
		cast(concat( a.node_No ,'.' ,a.sortNum, '.' ,  a.step_label ) as char) as title2 ,
		a.missionId as missionId , a.mission_ask , a.step_label  as orstep_label,
		a.missionLabel ,
		a.referencedId  ,
		b.billId , b.billname, 
		b1.billType, b1.billTypeSay
	from cur2 as a 
	left join bill_list  as b
		on b.billId = a.billId
	left join bill_type as b1
		on b1.billType = b.billType
	order by courseno +0.0 , b1.typeorder , a.node_No + 0.0 , a.sortNum ,b1.typeorder;

set @id =0  ,@courseno = 0 ;
DROP  temporary  table IF EXISTS cur2  ;
create temporary  table cur2  as       
	select   (@id :=  if( @courseno = 0 or  @courseno = a.courseno ,  @id +1, 1 ) ) as iddd  ,(@courseno :=a.courseno) as delno, 
			a.*
	from cur1  as  a ;


DROP  temporary  table IF EXISTS cur1  ;
create temporary  table cur1  as       
select * from cur2 ;

select * from cur1;
alter   table cur1 
		 add id  int(5) unsigned not null auto_increment FIRST  ,
		 add primary key (id)  ,
		add misskeys  int(5) unsigned default 0,
		add  billidortype varchar(10) ;




update  cur1 as  a 
			set misskeys = (
					select count( a.missionid )
						from acc_mission_backkey as b  use index( missionId )
						where a.missionId  =  b.missionId) ;


update  cur1 as  a 

				set billidortype =case
							 when exists(select id from exclusive where billType = a.billType)
								then   'type'   
							 when exists(select id from exclusive where billid = a.billid)
								then   'bill'   
							else  null 
						end;

DROP    table IF EXISTS mission  ;
create   table mission   as       
select *  from cur1;



DROP  table IF EXISTS mission_seal  ;

create   table mission_seal    as    
select 
	a.id, 
	a.iddd,

       a.id  as step_label, 
	a. title2 ,
	a.missionId , a.mission_ask , a.orstep_label,
	a.missionLabel ,
		

		group_concat( cast(b.pageid as char ) ) pageid ,
		group_concat(  cast(b.pkid as char ) ) pkid ,
		b.seal_no, b.seal_id , if(b1.seal_name is null ,'未知岗位', b1.seal_name) as seal_name , b1.seal_content, b11.role ,
	a.referencedId, 
	a.title1 ,	
		sum(b.p_write) as  p_write,
		a.billId , a.billname, 
		a.billType, a.billTypeSay , 
		a. misskeys ,a.billidortype
from cur1 as a 
left join acc_mission_seal as b 
	use index(qx)
	on a.missionId = b.missionId

	left join acc_enter_seal as b1 
		on  b1.sealID = b.seal_ID
		
			left join acc_enter_role as b11 
				on b11.roleID = b1.roleID
group by a.missionId , b.seal_no, b.seal_id 
order by id ;


alter   table mission_seal 
 	add idd  int(5) unsigned not null auto_increment FIRST  ,
	add primary key (idd) ,
	add UNIQUE KEY `qx` ( `missionLabel`,`idd`,`step_label`,`missionId`) , 
	add	index `qq`  (`missionId`  ,  `p_write`),
	add pno int(5) ,
	add  ppno int(5) ;





DROP  temporary  table IF EXISTS cur1  ;
 create temporary  table cur1  as     
select missionId , if( sum(p_write)  > 1, 1,  sum(p_write) ) as p_write
		 from   acc_mission_seal   
		group by missionId , seal_no , seal_id ;


update mission_seal as a
	set  a.pno =( select sum(b.p_write)  
		 from   cur1   as b		
		where  a.missionId = b.missionId  
		group by b.missionId   ) ;
 
DROP  temporary  table IF EXISTS cur1  ;
 create temporary  table cur1  as        
select b.id, b.idd , a.p_write
from acc_mission_seal as a
left join mission_seal  b on a.missionId = b.missionId  and a.pkid = b.pkid 
order by b.id, b.idd;

 alter  table cur1 	add	key `qq`  (`id`  ,  `idd`);
	 
select * from cur1;

update mission_seal as a
	set  a.ppno =( select sum(b.p_write)  
		 from   cur1   as b	
		where  a.id = b.id  and  b.idd <= a.idd ) ;











DROP  view IF EXISTS acc_seal_misson_stat  ;
CREATE view acc_seal_misson_stat 
as
select 
	c.expno ,
	a.* ,
	statdeal( c.expno , a.missionId ,a.seal_no ,  a.seal_Id ) as stat 
	

from mission_seal as a 

 join exp_experimentclassstudent as c ;





DROP  temporary  table IF EXISTS cur1  ;

DROP  temporary  table IF EXISTS cur2  ;



END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `p_copy`
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_copy`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `p_copy`(IN `p` MEDIUMBLOB)
p:BEGIN
	DECLARE `p2` BLOB DEFAULT JSON_EXTRACT(p,'$**.p2'); DECLARE `funcid` VARCHAR(60) DEFAULT j0(`p2`,'funcid');DECLARE `b` BLOB DEFAULT NULL;
	DECLARE `p1` BLOB DEFAULT NULL;
	DECLARE `ISp2` VARCHAR(1) DEFAULT 0;

  DECLARE CONTINUE HANDLER FOR  SQLSTATE '23000', SQLSTATE	'42000'	, SQLSTATE	'42S22' , SQLSTATE	'HY000'-- ,SQLSTATE	'22007'
	bl:BEGIN 
	GET DIAGNOSTICS CONDITION 1 @`sqlstate` = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;SET  @`sqlstate` = JSON_OBJECT('sqlstate',@`sqlstate`,'errno',@errno,'text',@text);
				SET @`errsql` = @p1_body,@funcid =  NULL;
				SET @funcid = CONCAT_WS(' ','Error: ',IF(isp2,
				
				(SELECT CONCAT_WS(', ',a.note,CONCAT_WS('',UPPER(SUBSTR(a.`name`,1,1)),LOWER(substr(a.`name`,2))),a.id) FROM mysq1_schema.qs AS a WHERE a.`name` = `funcid`)
				,(SELECT CONCAT_WS(', ',CONCAT_ws('',a.note,a.`SUBJECT`),CONCAT_WS('',UPPER(SUBSTR(a.`name`,1,1)),LOWER(substr(a.`name`,2))),a.id) FROM mysq1_schema.qs2 AS a WHERE a.`name` = `funcid`))
									,IF(isp2, ' p2' , ' p' )),
				@pp = QUOTE(`p`);
				CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp,'SQL',@`errsql`,'err',@`sqlstate`,'l',1));END;/**/

SET isp2 = p2 REGEXP ':\\s*"p2"';
IF IFNULL(`p2`,'')= '' or !json_valid(p2)  THEN CALL Error('p :no p2 or courseNo');	ELSE SET @p1_body = '';END IF;
IF isp2 THEN CALL p2(p);LEAVE p; END IF;

/*	
START TRANSACTION;
SET @funcid = CONCAT_WS(' ',(SELECT CONCAT_WS(', ',a.note,CONCAT_WS('',UPPER(SUBSTR(a.`name`,1,1)),LOWER(substr(a.`name`,2))),a.id) FROM mysq1_schema.qs AS a WHERE a.`name` = `funcid`)
							, ' p' ),
		@pp = QUOTE(`p`);
INSERT INTO plogs (Function_Name,parameter) VALUES (@funcid,@pp);
COMMIT;
*/



	IF j0(p2,'keyword') <> '' THEN BEGIN 
			DECLARE k TEXT DEFAULT j0(p2,'keyword');DECLARE k1 TEXT DEFAULT NULL;
			SET k1 :=  REGEXP_replace(k,'(?:([^\\x4e00-\\x9fa5]+))','|\\\\\\\\Q\\1\\\\\\\\\E'),
					k1 := REGEXP_replace(k1,'^\\s*\\|\\s*|\\s*\\|\\s*$',''),
					p2 = REGEXP_replace(p2,'(?i)(?<="keyword":)("(?:\\\\.|[^"])+")',json_quote(k1));

	END;END IF;


	IF (@p0 := json_keys(p)) REGEXP '"p1"' THEN  
			SET @P0	=	json_query(p,'$.p1');

	   	SET @P0	:=	CONCAT_WS(''	,'SELECT  "k1":',REGEXP_replace(REGEXP_replace(@P0
																,CONCAT_WS('|',REGEXP_replace(r('`kvP`'),'\\Q.*?(?:[{]?)\\E',''),'(?:[{,])((?4))(?::\\{)')
																,'\\1\\3\\4\\6\\7'),'(?<=")\\}(?=")','UNION ALL \nSELECT "k1":')),
					@p0 := REGEXP_replace(@p0,'(?is)"(?=(?:"(?:\\\\.|[^"])+"|\d+):)','",'),
					@P0	:=	CONCAT_WS('',REGEXP_replace(REGEXP_SUBSTR(@P0,r('`aline`')) ,r('`kv`'),'\\4 AS \\2 ') -- head
															,REGEXP_replace(REGEXP_replace(@P0,r('`aline`'),''),r('`kv-k`'),'\\1') -- other
												),
					@P0 = REGEXP_replace(REGEXP_REPLACE(@P0,'\\}+$',''),'(?im)(?<=^|,)""(?=(?:\\s+AS\\s+[^\\n\\r]*?)?(?:,|$))','NULL')/**/ ;
			SET `p` = JSON_COMPACT(json_set(`p`,'$.p1',@P0));
	END IF;





	IF p2 REGEXP '(?i)"bid":"(?:\\\\.|[^"])+"' THEN
		SET `b` = r8(j0(p2,"bid"));


		sc:BEGIN
			DECLARE `pl` VARCHAR(200) DEFAULT REGEXP_replace(REGEXP_replace(COLUMN_list(b),'(?:^|,)`[^`]*(?<!\\d)`(?=,|$)',''),'^,|,$','');
			DECLARE `oP`  VARCHAR(60) DEFAULT NULL; DECLARE `s` BLOB DEFAULT column_get(b,'s'AS CHAR);DECLARE parameter BLOB DEFAULT column_get(b,'parameter'AS CHAR);

			IF IFNULL(parameter,'')<>'' AND IFNULL(s,'')<>'' THEN 

					SET @s = `s`;
					SET parameter = r5(parameter,p);
					EXECUTE immediate parameter;
					SET `s` = @s;
			END IF;

			SET	@p1_body = COLUMN_get(`b`,'sql'AS CHAR);

			IF IFNULL(@p1_body,'') <> '' THEN SET	@p1_body = r5(@p1_body,p);ELSE LEAVE sc; END IF; 

			IF CAST(@p1_body AS CHAR) IS NULL THEN SET @p1_body = CONVERT(@p1_body USING gbk);END IF;
-- SELECT @p1_body AS s,REGEXP_substr(@p1_body ,r('`Sart-End`')) AS core ;-- LEAVE p;
			PREPARE scp_stmt from  @p1_body;COMMIT;EXECUTE scp_stmt ;		DEALLOCATE PREPARE scp_stmt ;

			l1:LOOP

				SET `oP` = REPLACE(REGEXP_SUBSTR(`pl`, '^`[^`]+`'),'`',''),@s = NULL;

				IF IFNULL(`oP`,'') = ''  THEN  LEAVE l1; ELSE SET `pl` = REGEXP_replace(`pl`, '^`[^`]+`,?','');END IF;

				SET @p1_body := NULL,
						@p1_body = COLUMN_get(b,op AS CHAR);

				IF IFNULL(@p1_body,'') = '' THEN ITERATE l1; END IF;

        IF `s` <>'' THEN 	SET @p1_body = REGEXP_replace(@p1_body,'(?i)(?<=FROM)\\s*(?:\\(\\s*)?`SQL`(?:\\s*\\))?\\s*(?=as\\s+[\\w]\\b)',CONCAT_WS('\n','\\1(','-- Start',REGEXP_replace(QUOTE(s),'^[\'"]|[\'"]$',''),'-- End',')'));				END IF;

				SET @p1_body = CAST(r5(@p1_body,p) AS CHAR);

				IF CAST(@p1_body AS CHAR) IS NULL THEN SET @p1_body = CONVERT(@p1_body USING gbk);END IF;

-- SELECT @p1_body AS s,REGEXP_substr(@p1_body ,r('`Sart-End`')) AS core ; LEAVE p;	-- 

		 	PREPARE scp_stmt from  @p1_body;COMMIT;EXECUTE scp_stmt ;		DEALLOCATE PREPARE scp_stmt ;COMMIT;
			END LOOP;
		END;
		SET `b` = NULL ;
	END IF;

	SET `b` = r8(`funcid`); 
SELECT  COLUMN_json(b);
	SET @p1_body = COLUMN_get(`b`,'sql'AS CHAR);




	IF @p1_body IS NULL THEN SET @p1_body  = CONVERT("No sql!" USING gbk);SIGNAL SQLSTATE 'HY000' SET MYSQL_ERRNO =12345 , MESSAGE_TEXT =  @p1_body ; END IF;
		BEGIN DECLARE `plist` VARCHAR(200) DEFAULT REGEXP_replace(REGEXP_replace(COLUMN_list(b),'(?:^|,)`[^`]*(?<!\\d)`(?=,|$)',''),'^,|,$','');
					DECLARE `oneP`  VARCHAR(60) DEFAULT NULL;DECLARE `s` BLOB DEFAULT column_get(b,'s'AS CHAR);DECLARE parameter BLOB DEFAULT column_get(b,'parameter'AS CHAR);



			IF IFNULL(parameter,'')<>'' THEN 


					SET @s = s,parameter = r5(parameter,p);


					EXECUTE immediate parameter;

					IF IFNULL(@s,'') <> ''THEN
						SET s = @s;
					END IF;
			END IF;

      IF s <>'' THEN 	SET @p1_body = REGEXP_replace(@p1_body,'(?i)(?<=FROM)\\s*(?:\\(\\s*)?`SQL`(?:\\s*\\))?\\s*(?=as\\s+[\\w]+\\b)',CONCAT_WS('\n','\\1(','-- Start',REGEXP_replace(QUOTE(s),'^[\'"]|[\'"]$',''),'-- End',')'));				END IF;
-- SELECT r5(@p1_body,p),CONVERT(r5(@p1_body,p) USING utf8 ) ,CAST(r5(@p1_body,p) AS CHAR );-- LEAVE p;
			SET @p1_body = CAST(r5(@p1_body,p)AS CHAR);


			IF j0(p2,'limit') <> '' THEN SET @p1_body  = REGEXP_REPLACE(@p1_body,'(?i)"\\s*(\\d+\\s*,\\s*\\d+)"','limit \\1');END IF;

			l:LOOP

				SET `oneP` = REPLACE(REGEXP_SUBSTR(`plist`, '^`[^`]+`'),'`',''),@s = NULL;
				IF IFNULL(`oneP`,'') = ''  THEN  LEAVE l; ELSE SET `plist` = REGEXP_replace(`plist`, '^`[^`]+`,?','');END IF;

				SET @s := CONCAT_WS('',CONCAT("@",`oneP`," := ")
										,CONCAT_WS('',"CONCAT_WS('','",REGEXP_replace(COLUMN_get(b,`oneP` AS CHAR),'(`.*?`)',"',CONVERT(@\\1USING gbk),'"),"'")
										,CONCAT(")AS ",`oneP`)),
						@p1_body := CONCAT_WS('\n',REGEXP_replace(@p1_body,CONCAT('(?im)^(?<![\\.\\w@]|(?:\\-{2}\\s))[\\s,]*\\K',`oneP`,'\\b'),CONCAT(@s,'\\1')));

			END LOOP;
			SET 	@p1_body = REGEXP_replace(@p1_body , '(?i)as\\s+[^\\s,)]+(?=\\s+as)','');

		END ;
/*最后处理*/
		CASE
			WHEN CAST(@p1_body AS CHAR) REGEXP  CONCAT_WS('','\\b',funcid,'2JSON\\b(?=\\s*from\\()') THEN
			SET @p1_body= CONCAT_WS('\n'
									,CONCAT('select json_object(',QUOTE(funcid),',json_arrayagg(JSON_EXTRACT(',CONCAT(funcid,'2JSON'),',"$"))) as dblob\nfrom(')
									,@p1_body
									,') as 聚合');
	
			WHEN funcid  NOT REGEXP 'help|json$'  && REGEXP_substr(@p1_body,'(?is-m)^\\s*SELECT.+?(?m)^\\s*FROM') REGEXP '[\\w\\)]`?\\s+`?dblob`?\\b(?=\\s*)'  THEN
			SET 	@p1_body =CONCAT_WS('\t','SELECT\tCAST(COLUMN_json(COLUMN_create(',QUOTE(IF(IFNULL(COLUMN_get(b,'dom'AS CHAR),'')='','dblob',COLUMN_get(b,'dom'AS CHAR)))
,CONCAT_WS('',',a.dblob))AS CHAR)AS dblob\tFROM(\n',@p1_body,'\n)AS A '));

			IF CAST(@p1_body AS CHAR) IS NULL THEN SET @p1_body = CONVERT(@p1_body USING gbk);END IF;
			ELSE SET @p1_body= @p1_body;
		END CASE ;
		
-- 
SELECT cast(p AS CHAR),@p1_body AS s,REGEXP_substr(@p1_body ,r('`Sart-End`')) AS core,'3' ;-- LEAVE p;

	PREPARE p_stmt from  @p1_body;COMMIT;EXECUTE p_stmt ;		DEALLOCATE PREPARE p_stmt ;-- 

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `p_copy1`
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_copy1`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `p_copy1`(IN `p` MEDIUMBLOB)
p:BEGIN
	DECLARE `p2` BLOB DEFAULT json_extract(p,'$**.p2'); DECLARE `funcid` VARCHAR(60) DEFAULT j(`p2`,'funcid');DECLARE `b` BLOB DEFAULT NULL;
	DECLARE `p1` BLOB DEFAULT NULL;

  DECLARE CONTINUE HANDLER FOR  SQLSTATE '23000', SQLSTATE	'42000'	, SQLSTATE	'42S22' , SQLSTATE	'HY000'-- ,SQLSTATE	'22007'
	bl:BEGIN GET DIAGNOSTICS CONDITION 1 @`sqlstate` = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;SET  @`sqlstate` = JSON_OBJECT('sqlstate',@`sqlstate`,'errno',@errno,'text',@text);
				SET @`errsql` = @p1_body,@funcid =  NULL;
				SET @funcid = CONCAT_WS(' ','Error: ',(SELECT CONCAT_WS(', ',a.note,CONCAT_WS('',UPPER(SUBSTR(a.`name`,1,1)),LOWER(substr(a.`name`,2))),a.id) FROM mysq1_schema.qs AS a WHERE a.`name` = `funcid`)
									, ' p' ),
				@pp = QUOTE(`p`);
				CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp,'SQL',@`errsql`,'err',@`sqlstate`,'l',1));END;/**/

/*	
START TRANSACTION;
SET @funcid = CONCAT_WS(' ',(SELECT CONCAT_WS(', ',a.note,CONCAT_WS('',UPPER(SUBSTR(a.`name`,1,1)),LOWER(substr(a.`name`,2))),a.id) FROM mysq1_schema.qs AS a WHERE a.`name` = `funcid`)
							, ' p' ),
		@pp = QUOTE(`p`);
INSERT INTO plogs (Function_Name,parameter) VALUES (@funcid,@pp);
 -- CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp AS CHAR));
COMMIT;
*/


	IF IFNULL(`p2`,'')= '' or !json_valid(p2)  THEN CALL Error('p :no p2 or courseNo');	ELSE SET @p1_body = '';END IF;

	IF j(p2,'keyword') <> '' THEN BEGIN 
			DECLARE k TEXT DEFAULT j(p2,'keyword');DECLARE k1 TEXT DEFAULT NULL;
			SET k1 :=  REGEXP_replace(k,'(?:([^\\x4e00-\\x9fa5]+))','|\\\\\\\\Q\\1\\\\\\\\\E'),
					k1 := REGEXP_replace(k1,'^\\s*\\|\\s*|\\s*\\|\\s*$',''),
					p2 = REGEXP_replace(p2,'(?i)(?<="keyword":)("(?:\\\\.|[^"])+")',json_quote(k1));

	END;END IF;


	IF (@p0 := json_keys(p)) REGEXP '"p1"' THEN  
			SET @P0	=	json_query(p,'$.p1');

	   	SET @P0	:=	CONCAT_WS(''	,'SELECT  "k1":',REGEXP_replace(REGEXP_replace(@P0
																,CONCAT_WS('|',REGEXP_replace(r('`kvP`'),'\\Q.*?(?:[{]?)\\E',''),'(?:[{,])((?4))(?::\\{)')
																,'\\1\\3\\4\\6\\7'),'(?<=")\\}(?=")','UNION ALL \nSELECT "k1":')),
					@p0 := REGEXP_replace(@p0,'(?is)"(?=(?:"(?:\\\\.|[^"])+"|\d+):)','",'),
					@P0	:=	CONCAT_WS('',REGEXP_replace(REGEXP_SUBSTR(@P0,r('`aline`')) ,r('`kv`'),'\\4 AS \\2 ') -- head
															,REGEXP_replace(REGEXP_replace(@P0,r('`aline`'),''),r('`kv-k`'),'\\1') -- other
												),
					@P0 = REGEXP_replace(REGEXP_REPLACE(@P0,'\\}+$',''),'(?im)(?<=^|,)""(?=(?:\\s+AS\\s+[^\\n\\r]*?)?(?:,|$))','NULL')/**/ ;
			SET `p` = JSON_COMPACT(json_set(`p`,'$.p1',@P0));
	END IF;





	IF p2 REGEXP '(?i)"bid":"(?:\\\\.|[^"])+"' THEN
		SET `b` = r8(j(p2,"bid"));


		sc:BEGIN
			DECLARE `pl` VARCHAR(200) DEFAULT REGEXP_replace(REGEXP_replace(COLUMN_list(b),'(?:^|,)`[^`]*(?<!\\d)`(?=,|$)',''),'^,|,$','');
			DECLARE `oP`  VARCHAR(60) DEFAULT NULL; DECLARE `s` BLOB DEFAULT column_get(b,'s'AS CHAR);DECLARE parameter BLOB DEFAULT column_get(b,'parameter'AS CHAR);

			IF IFNULL(parameter,'')<>'' AND IFNULL(s,'')<>'' THEN 

					SET @s = `s`;
					SET parameter = r5(parameter,p);
					EXECUTE immediate parameter;
					SET `s` = @s;
			END IF;

			SET	@p1_body = COLUMN_get(`b`,'sql'AS CHAR);

			IF IFNULL(@p1_body,'') <> '' THEN SET	@p1_body = r5(@p1_body,p);ELSE LEAVE sc; END IF; 

			IF CAST(@p1_body AS CHAR) IS NULL THEN SET @p1_body = CONVERT(@p1_body USING gbk);END IF;
-- SELECT @p1_body AS s,REGEXP_substr(@p1_body ,r('`Sart-End`')) AS core ;-- LEAVE p;
			PREPARE scp_stmt from  @p1_body;COMMIT;EXECUTE scp_stmt ;		DEALLOCATE PREPARE scp_stmt ;

			l1:LOOP

				SET `oP` = REPLACE(REGEXP_SUBSTR(`pl`, '^`[^`]+`'),'`',''),@s = NULL;

				IF IFNULL(`oP`,'') = ''  THEN  LEAVE l1; ELSE SET `pl` = REGEXP_replace(`pl`, '^`[^`]+`,?','');END IF;

				SET @p1_body := NULL,
						@p1_body = COLUMN_get(b,op AS CHAR);

				IF IFNULL(@p1_body,'') = '' THEN ITERATE l1; END IF;

        IF `s` <>'' THEN 	SET @p1_body = REGEXP_replace(@p1_body,'(?i)(?<=FROM)\\s*(?:\\(\\s*)?`SQL`(?:\\s*\\))?\\s*(?=as\\s+[\\w]\\b)',CONCAT_WS('\n','\\1(','-- Start',REGEXP_replace(QUOTE(s),'^[\'"]|[\'"]$',''),'-- End',')'));				END IF;

				SET @p1_body = CAST(r5(@p1_body,p) AS CHAR);

				IF CAST(@p1_body AS CHAR) IS NULL THEN SET @p1_body = CONVERT(@p1_body USING gbk);END IF;

-- SELECT @p1_body AS s,REGEXP_substr(@p1_body ,r('`Sart-End`')) AS core ; LEAVE p;	-- 

		 	PREPARE scp_stmt from  @p1_body;COMMIT;EXECUTE scp_stmt ;		DEALLOCATE PREPARE scp_stmt ;COMMIT;
			END LOOP;
		END;
		SET `b` = NULL ;
	END IF;

	SET `b` = r8(`funcid`);
	SET @p1_body = COLUMN_get(`b`,'sql'AS CHAR);




	IF @p1_body IS NULL THEN SET @p1_body  = CONVERT("No sql!" USING gbk);SIGNAL SQLSTATE 'HY000' SET MYSQL_ERRNO =12345 , MESSAGE_TEXT =  @p1_body ; END IF;
		BEGIN DECLARE `plist` VARCHAR(200) DEFAULT REGEXP_replace(REGEXP_replace(COLUMN_list(b),'(?:^|,)`[^`]*(?<!\\d)`(?=,|$)',''),'^,|,$','');
					DECLARE `oneP`  VARCHAR(60) DEFAULT NULL;DECLARE `s` BLOB DEFAULT column_get(b,'s'AS CHAR);DECLARE parameter BLOB DEFAULT column_get(b,'parameter'AS CHAR);



			IF IFNULL(parameter,'')<>'' THEN 


					SET @s = s,parameter = r5(parameter,p);


					EXECUTE immediate parameter;

					IF IFNULL(@s,'') <> ''THEN
						SET s = @s;
					END IF;
			END IF;

      IF s <>'' THEN 	SET @p1_body = REGEXP_replace(@p1_body,'(?i)(?<=FROM)\\s*(?:\\(\\s*)?`SQL`(?:\\s*\\))?\\s*(?=as\\s+[\\w]+\\b)',CONCAT_WS('\n','\\1(','-- Start',REGEXP_replace(QUOTE(s),'^[\'"]|[\'"]$',''),'-- End',')'));				END IF;
-- SELECT r5(@p1_body,p),CONVERT(r5(@p1_body,p) USING utf8 ) ,CAST(r5(@p1_body,p) AS CHAR );-- LEAVE p;
			SET @p1_body = CAST(r5(@p1_body,p)AS CHAR);


			IF j(p2,'limit') <> '' THEN SET @p1_body  = REGEXP_REPLACE(@p1_body,'(?i)"\\s*(\\d+\\s*,\\s*\\d+)"','limit \\1');END IF;

			l:LOOP

				SET `oneP` = REPLACE(REGEXP_SUBSTR(`plist`, '^`[^`]+`'),'`',''),@s = NULL;
				IF IFNULL(`oneP`,'') = ''  THEN  LEAVE l; ELSE SET `plist` = REGEXP_replace(`plist`, '^`[^`]+`,?','');END IF;

				SET @s := CONCAT_WS('',CONCAT("@",`oneP`," := ")
										,CONCAT_WS('',"CONCAT_WS('','",REGEXP_replace(COLUMN_get(b,`oneP` AS CHAR),'(`.*?`)',"',CONVERT(@\\1USING gbk),'"),"'")
										,CONCAT(")AS ",`oneP`)),
						@p1_body := CONCAT_WS('\n',REGEXP_replace(@p1_body,CONCAT('(?im)^(?<![\\.\\w@]|(?:\\-{2}\\s))[\\s,]*\\K',`oneP`,'\\b'),CONCAT(@s,'\\1')));

			END LOOP;
			SET 	@p1_body = REGEXP_replace(@p1_body , '(?i)as\\s+[^\\s,)]+(?=\\s+as)','');

		END ;


		CASE
			WHEN CAST(@p1_body AS CHAR) REGEXP  CONCAT_WS('','\\b',funcid,'2JSON\\b(?=\\s*from\\()') THEN
			SET @p1_body= CONCAT_WS('\n'
									,CONCAT('select json_object(',QUOTE(funcid),',json_arrayagg(JSON_EXTRACT(',CONCAT(funcid,'2JSON'),',"$"))) as dblob\nfrom(')
									,@p1_body
									,') as 聚合');
	
			WHEN funcid  NOT REGEXP 'help|json$' THEN
			SET 	@p1_body =CONCAT_WS('\t','SELECT\tCAST(COLUMN_json(COLUMN_create(',QUOTE(IF(IFNULL(COLUMN_get(b,'dom'AS CHAR),'')='','dblob',COLUMN_get(b,'dom'AS CHAR)))
,CONCAT_WS('',',a.dblob))AS CHAR)AS dblob\tFROM(\n',@p1_body,'\n)AS A '));

			IF CAST(@p1_body AS CHAR) IS NULL THEN SET @p1_body = CONVERT(@p1_body USING gbk);END IF;
			ELSE SET @p1_body= @p1_body;
		END CASE ;


		
-- 
SELECT @p1_body AS s,REGEXP_substr(@p1_body ,r('`Sart-End`')) AS core,'3' ;-- LEAVE p;

	PREPARE p_stmt from  @p1_body;COMMIT;EXECUTE p_stmt ;		DEALLOCATE PREPARE p_stmt ;-- 

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `q`
-- ----------------------------
DROP PROCEDURE IF EXISTS `q`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `q`(in `p` longblob)
    READS SQL DATA
label:BEGIN

	DECLARE  old_type VARCHAR(10) DEFAULT 'kjpz';
  DECLARE p2 VARCHAR(2000) DEFAULT j0(p,'p2');
	DECLARE type_ VARCHAR(20) DEFAULT j0(p2,'type');
	DECLARE page VARCHAR(20) DEFAULT j0(p2,'page');
	DECLARE keyword VARCHAR (200) DEFAULT j0(p2,'keyword');

/*
start TRANSACTION;
SET @DBLOB = p;
CALL Audit_2('q',quotej(p),@dblob );COMMIT;
LEAVE bl;*/
	set 				
				
				@qbkbody = NULL ,
				@totalnum = 0,
				@qbkbody1 = NULL ,
				@qbkbody2 = NULL ,
				@qbkbody3 = '' ;


  CASE    
			WHEN IFNULL(j0(p2,"funcid" ),'') = ''THEN SET `keyword` = j0(p2,'keyword');
				BEGIN
					set @allmis = '^原(始凭证)?[[:space:]|.|,|。|，]+|^^原(始凭证)?$|^y[[:space:]|.|,|。|，]*|^y$',
							@qbkbody1= "
SELECT
@allmis := NULL,
a.node_courseNo,
c.missionId,
NULL AS expID,
CONCAT_WS('  ',CONCAT(IF(IFNULL(c1.a4,'')='','记',c1.a4),'-',c1.a5),CONCAT_WS('-',c1.a1,c1.a2,c1.a3),c.missionLabel) AS missionLabel,
c.pageNo,
c.billId,
REPLACE(REPLACE(c(COLUMN_json(COLUMN_create(
'missionLabel',c.missionLabel,
'typesort',b.typesort,
'Vdate',c.Vdate,
'mission_ask',c.mission_ask,
'keyword',c3.blur_b1
))),'\n','\\n'),'\r','\\r') AS dblob,
NULL AS `courseno` ",
							@qbkbody2  = CONCAT_WS('\n',
"\nFROM exp_courses_node AS a
INNER JOIN exp_courses_node_content AS b ON b.contentNo = a.contentNo
INNER JOIN acc_mission AS c ON b.missionid = c.missionId
LEFT JOIN acc_standard_1 AS c1 ON c1.missionId = c.missionId",
"LEFT JOIN acc_standard_n AS c2 ON c2.rowNo = 1 AND c2.missionId = c.missionId\nLEFT JOIN acc_standard_blur_n AS c3 ON c3.missionId = c.missionId AND c2.rowNo = c3.rowno",
	IF(IFNULL(keyword ,'') != '',CONCAT_WS('',
"LEFT JOIN acc_standard_n AS c2 ON c2.missionId = c.missionId",
"INNER JOIN mysq1_schema.bill_list AS d ON c.billId = d.billId",
"INNER JOIN mysq1_schema.bill_type AS d1 ON d.billType = d1.billType"),NULL),
"WHERE",CONCAT_WS('\nAND '
,CONCAT("a.node_courseNo = ",QUOTE(j5(p2,'courseNo')))
,CONCAT("c.missionId = ",QUOTE(j5(p2,'missionId')))
,"c.billId LIKE 'kjpz_jzpz00_ty%'")
);


					CASE 
						WHEN type_ ="yspz"  THEN
								SET type_ = CONCAT("c3.billtype NOT IN ('kjpz','kjbb','kjzb')");

						WHEN type_ ="kjzb1" THEN
								SET type_ =CONCAT("c3.billtype =", QUOTE('kjzb')," AND c2.billname NOT LIKE '%总账%'");
						WHEN type_ = "kjzb2" THEN
								SET type_ = CONCAT("c3.billtype =", QUOTE('kjzb')," AND c2.billname LIKE '%总账%'");
						ELSE 
								SET old_type = 'kjpz',
										type_ = NULL;

					END CASE;

					IF IFNULL(keyword ,'') != '' THEN 
						SET  @qbkbody3  = concat("\nAND  case","\n", 
														"when CAST(CONCAT_WS(CONCAT(a.node_no,',',b.typesort,d.billname),d1.billTypeSay,c.mission_ask,","\n\t\t", 		
															Temp_Func('c.t??',1,8,NULL),") as char) REGEXP ",QUOTE(keyword)," then 1","\n\t",
														"when CAST(CONCAT_WS('',",Temp_Func('d.page_title??',1,8,NULL),") as char) REGEXP ",concat('\'',keyword,'\'') ," then 1",	"\n\t",
														"when CAST(CONCAT_WS('',",Temp_Func('c1.a??',1,100,null),") AS CHAR) REGEXP ",concat('\'',keyword,'\'')," then 1	","\n\t",
														"when CAST(CONCAT_WS('',",Temp_Func('c2.b??',1,50,NULL),")AS CHAR) REGEXP ",concat('\'',keyword,'\'')," then 1","\n\t",
													"ELSE 0 \nEND ");
					END IF;

					SET @qbkbody3 = C(CONCAT(CONCAT_WS(" AND ",type_ ), @qbkbody3,"\nGROUP BY c.missionid",
							"\nORDER BY c1.a2+0,c1.a3+0,c1.a4,c1.a5 +0 "
				-- 			,"\nLIMIT ",`page` ,',',IF(IFNULL(`num`,'')= '',10,`num`)
				));


					SET @allmis = NULL,

							@qbkbody = CONCAT_WS('','SELECT a.*,@allmis := CONCAT_WS(",",QUOTE(a.missionId),@allmis) AS missionids\nFROM(',
														@qbkbody1,@qbkbody2,@qbkbody3,'\n) AS a' );
 /*
SELECT  @qbkbody;
LEAVE label;
 */

					PREPARE stmt from  @qbkbody ;
					EXECUTE stmt ;
				-- CONCAT(a1.billname,' - ',c1.node_No,'.',c2.typesort,' - ',a.missionLabel
					SET @qbkbody1 = NULL,
							@qbkbody2 = NULL,
							@qbkbody3 = 
									CONCAT_WS('',	"\nSELECT a.missionid,a.missionid AS quoteid,'bd',
		CAST('记账凭证' AS CHAR) AS title,\n",
				"c(COLUMN_json(column_CREATE(a1.billId,a1.billname))) as dblob,\n",
						 "\na.pageNo,",QUOTEj(j0(p2,'courseNo'))," AS courseno 
FROM 
exp_courses_node AS c1 
INNER JOIN exp_courses_node_content AS c2 ON c2.contentNo = c1.contentNo
LEFT JOIN  acc_mission AS a ON c2.missionid = a.missionId
INNER JOIN mysq1_schema.bill_list AS a1 ON a.billId = a1.billId
WHERE c1.contentNo IS NOT NULL AND c2.missionid IN(",@allmis,") 
");

					CASE old_type
							WHEN 'kjpz' THEN  -- 凭证
								label1:BEGIN

										SET @qbkbody3 = CONCAT_WS('\n', -- @qbkbody3,"\n",
				-- 											"\n\t\t\t UNION ALL \n",
															"SELECT a.missionid,a.quoteid,IF(a.type = 'bk','bd',a.type),\n(CAST(CONCAT('附',a.sort,': ', \nIF(a.type IN ('bb','bk'), b1.billname,a.title) \n) AS CHAR)) AS title,\n(@s := IF(IFNULL(b1.max_page,1)>1,r7(c(COLUMN_json(COLUMN_create('pageno',a.pageNo,'billid',b1.billId,'max_page',b1.max_page AS CHAR,'type','3')))),NULL)) AS tmp,\nc(COLUMN_json(column_CREATE(\n'title',a.title\n,'type',a.type\n,'pageNo',a.pageNo\n,'missionid', a.missionid\n,'quoteid',a.quoteid\n,'sort',a.sort\n,'billId',b1.billId\n,'billname',b1.billname\n,'max_page',IF(IFNULL(b1.max_page,1)>1,b1.max_page,NULL)\n,'select',IF(@s IS NULL ,NULL ,REGEXP_replace(COLUMN_get(b1.page,'value' AS CHAR),j0(@s,'reg'),REPLACE(j0(@s,'REPLACEm'),'selected','checked')))))) as dblob,\na.pageNo,NULL AS courseno\nFROM acc_mission_back_information AS a\nLEFT JOIN acc_mission AS e ON a.quoteid = e.missionId \nLEFT JOIN acc_mission_backbill_1 AS b ON a.missionid = b.referencedID AND a.quoteid = b.missionId \nLEFT JOIN `mysq1_schema`.bill_list AS b1 ON b.bill_id = b1.billid OR e.billId = b1.billId \nLEFT JOIN mysq1_schema.bill_type AS b2 ON b1.billType = b2.billType",
															CONCAT("WHERE a.missionid IN(",@allmis,")")
													);
								END label1;
							ELSE 
										SET @qbkbody3 = @qbkbody3;
					END CASE ;
			END;

			WHEN IFNULL(j0(p2,"funcid" ),'') = "insert" THEN

				SET `p` := ju(`p`,"quoteId",CONCAT('bk-',REGEXP_replace(j2(`p`,"missionId"),'^("[\\w\\-]*?)(\\d{11})(")$','\\2'),CEIL(RAND()*10000))),
						@qbkbody3 := r5(r4('insertbk1'),`p`);

				PREPARE stmt from  @qbkbody3 ;	EXECUTE stmt ;

				SET @qbkbody3 := r5(r4('insertbk2'),`p`);

			WHEN IFNULL(j0(p2,"funcid" ),'') = "update" THEN 

					IF IFNULL(j0(p2,'missionid'),'')= '' OR IFNULL(j0(p2,'quoteid'),'')= '' THEN CALL Error('2id is null');END IF;

					SET @qbkbody3 = r5(R4('updatebk'),p);
			WHEN IFNULL(j0(p2,"funcid" ),'') = "delete" THEN 

					SET @qbkbody3 := "DELETE 
a.*
FROM
acc_mission_back_information AS a
WHERE
a.missionid = `missionid` AND
INSTR(`quoteid`,a.quoteid) > 0",
							 @qbkbody3 = r5(@qbkbody3,p);
-- SELECT c(@qbkbody3);LEAVE label;
				PREPARE stmt from  @qbkbody3 ;	EXECUTE stmt ;

					SET @qbkbody3 := "UPDATE (
SELECT a.missionid,a.quoteid,@i := @i+1 AS sort FROM(
SELECT
a.missionid,a.quoteid,(@i:=0 )AS sort
FROM acc_mission_back_information AS a
WHERE if1(@i:=@i+1) AND a.missionid = `missionid`
GROUP BY a.sort
)AS a ) AS a 
INNER JOIN acc_mission_back_information AS b ON a.missionid = b.missionid AND a.quoteid = b.quoteid
SET
b.sort = a.sort
WHERE b.sort<>a.sort",
						@qbkbody3 = r5(@qbkbody3,p);
-- SELECT c(@qbkbody3);LEAVE label;

		ELSE CALL Error("SOMETHING IS WORNG");
	END CASE ;



-- 	SET @qbkbody3 = CONCAT_WS("\n","CREATE TABLE temp_query_mission_2 AS",@qbkbody3); 	
	/*SELECT c(@qbkbody3) ;		
	LEAVE label; 
*/

	PREPARE stmt from  @qbkbody3 ;
	EXECUTE stmt ;
  DEALLOCATE PREPARE stmt;

END label
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `q`
-- ----------------------------
DROP FUNCTION IF EXISTS `q`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `q`(`w` longtext) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...	

	RETURN CONCAT("'",REPLACE(REPLACE(w,'\\','\\\\'),'\'','\\\''),"'");
	
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `q0`
-- ----------------------------
DROP FUNCTION IF EXISTS `q0`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `q0`(`k` tinytext) RETURNS tinytext CHARSET utf8mb3
    DETERMINISTIC
BEGIN
	#Routine body goes here...

	RETURN  
	  CASE  
				WHEN IFNULL(k,'') = '' THEN k
				WHEN k  REGEXP '`[^`]+`' THEN k 
			ELSE CONCAT('`',REGEXP_replace(k,'`',''),'`')
		END;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `qd`
-- ----------------------------
DROP FUNCTION IF EXISTS `qd`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `qd`(`w` longtext, `a` varchar(2000),`p` varchar(2000)) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...	
/*  IF w IS NULL THEN RETURN NULL; END IF;

	SET w = QUOTE(w);
  SET	w = SUBSTR(w,2,CHAR_LENGTH(w)-2),
			w = CONCAT('"',w,'"');
*/	RETURN CASE 
						WHEN w IS NULL THEN NULL
						ELSE CONCAT_ws('',`p`,'"',SUBSTR(QUOTE(w),2,CHAR_LENGTH(QUOTE(w))-2),'"',`a`)
				END ;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `qd1`
-- ----------------------------
DROP FUNCTION IF EXISTS `qd1`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `qd1`(`w` longtext, `p` varchar(200)) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...	
/*  IF w IS NULL THEN RETURN NULL; END IF;

	SET w = QUOTE(w);
  SET	w = SUBSTR(w,2,CHAR_LENGTH(w)-2),
			w = CONCAT('"',w,'"');
*/	RETURN CASE 
						WHEN w IS NULL OR w = '' THEN NULL
						ELSE CONCAT_ws('','"',`p`,'":',"{","\"v\":",quotd(w),"}")
				END ;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `qd2`
-- ----------------------------
DROP FUNCTION IF EXISTS `qd2`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `qd2`(`p` varchar(100),`w` LONGTEXT) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...	
	RETURN CONCAT(quotd(`p`) ,':',quotj(w));
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `quotd`
-- ----------------------------
DROP FUNCTION IF EXISTS `quotd`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `quotd`(`w` longtext) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...	
  
  CASE 
			WHEN w IS NULL THEN 
				SET w = NULL;
			WHEN w = '' THEN
				SET w = '""';
		ELSE
			SET w = REPLACE(QUOTE(w),'"','\\"'),
					w = CONCAT('"',SUBSTR(w,2,CHAR_LENGTH(w)-2),'"');
	END CASE;

	RETURN w ;
	
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `QUOTEj`
-- ----------------------------
DROP FUNCTION IF EXISTS `QUOTEj`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `QUOTEj`(`w` LONGBLOB) RETURNS text CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...	
  
  CASE 
			WHEN w IS NULL THEN RETURN NULL;
			WHEN w = '' THEN RETURN NULL;
			WHEN w	REGEXP '^(\\{((?:"(\\\\.|[^"])+"):(?:(?:"(?3)*")|(?1))(?:,(?2))*)+\\})$'  THEN SET w= CONCAT("'",w,"'");
			WHEN CONCAT('{',w,'}') REGEXP '^(\\{((?:"(\\\\.|[^"])+"):(?:(?:"(?3)*")|(?1))(?:,(?2))*)+\\})$' THEN SET w= CONCAT('\'{',w,'}\'') ;
		ELSE
			SET w= quotd(w) ;
	END CASE;
		RETURN REPLACE(REPLACE(w,'\t','\\t'),'\n','\\n');
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `quote_d`
-- ----------------------------
DROP FUNCTION IF EXISTS `quote_d`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `quote_d`(`w` longtext) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...	
  IF w IS NULL THEN RETURN NULL; END IF;

	SET w = QUOTE(w);

  IF INSTR(w,'"')>0 THEN
		SET w = replace(w,'"','\\"');
	END IF;

  SET	w = SUBSTR(w,2,CHAR_LENGTH(w)-2),
			w = CONCAT('"',w,'"');
	RETURN w;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `quotj`
-- ----------------------------
DROP FUNCTION IF EXISTS `quotj`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `quotj`(`w` LONGBLOB) RETURNS text CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...	
  
  CASE 
			WHEN w IS NULL THEN RETURN NULL;
			WHEN w = '' THEN RETURN NULL;
			WHEN w	REGEXP '^(\\{((?:"(\\\\.|[^"])+"):(?:(?:"(?3)*")|(?1))(?:,(?2))*)+\\})$'  THEN SET w = w;
			WHEN CONCAT('{',w,'}') REGEXP '^(\\{((?:"(\\\\.|[^"])+"):(?:(?:"(?3)*")|(?1))(?:,(?2))*)+\\})$' THEN SET w = CONCAT('{',w,'}') ;
		ELSE
			SET w = REPLACE(QUOTE(w),'"','\\"');
			SET w = CONCAT('"',SUBSTR(w,2,CHAR_LENGTH(w)-2),'"');
	END CASE;


		RETURN REPLACE(REPLACE(w,'\t','\\t'),'\n','\\n');
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `quotn`
-- ----------------------------
DROP FUNCTION IF EXISTS `quotn`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `quotn`(`w` longblob) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...	
  
  CASE 
			WHEN w IS NULL OR w = ''THEN 
				SET w = '""';
		ELSE
			SET w = QUOTE(REPLACE(w,'"','\\"')),
					w = CONCAT('"',SUBSTR(w,2,CHAR_LENGTH(w)-2),'"');
	END CASE;

	RETURN w ;
	
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `r`
-- ----------------------------
DROP FUNCTION IF EXISTS `r`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `r`(`k` varchar(2000)) RETURNS varchar(2000) CHARSET utf8mb3
    READS SQL DATA
    DETERMINISTIC
BEGIN
	
	DECLARE `r` VARCHAR(2000) DEFAULT NULL ;
  DECLARE `k1` VARCHAR(2000) DEFAULT REGEXP_replace(`k`,'\\$$','');

	IF IFNULL(`k`,'')='' THEN RETURN `r`; END IF;
	IF NOT `k` REGEXP '\\$$' THEN 
			SET  `k` = CONCAT(`k`,'$');
	END IF;

  CASE 
		WHEN k REGEXP '^\\-' THEN
SET k  = REGEXP_REPLACE(k,'^\\-','');
		SET `k` = (SELECT CONVERT(a.Reg USING gbk ) FROM reg AS a WHERE a.note REGEXP  `k1` OR a.`Code` REGEXP `k` );
		WHEN k REGEXP '\\t' THEN
			
			SET `r` = REGEXP_substr(k,'\\t[^\n]*'),
					`k` = REGEXP_replace(k,'\\t[^\\n]*',''),
					`k` = (
SELECT
CAST(CONCAT_WS('\t',a.Reg,IF( `r` REGEXP '^\\s*$',a.`replace` ,`r`))AS CHAR)
FROM mysq1_schema.reg AS a
WHERE 
a.note REGEXP  `k1` OR a.`Code` REGEXP  `k` );

		ELSE
		
	SET `k` = (SELECT CONVERT(a.Reg USING gbk ) FROM mysq1_schema.reg AS a WHERE a.note REGEXP  `k1` OR a.`Code` REGEXP  `k` limit 1);
	END CASE;

	RETURN 
CONVERT(`k` USING utf8 )

;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `r0`
-- ----------------------------
DROP FUNCTION IF EXISTS `r0`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `r0`(`k` blob) RETURNS blob
    READS SQL DATA
    DETERMINISTIC
BEGIN
	#Routine body goes here...


	IF IFNULL(`k`,'')='' THEN RETURN NULL; END IF;

  CASE 
		WHEN k REGEXP '\t$' THEN
			
			SET `k` = REGEXP_replace(k,'\t$',''),
					`k` = (
SELECT
COLUMN_create(1,a.Reg,2,a.`replace`)
FROM mysq1_schema.reg AS a
WHERE 
CONCAT_WS('',a.`Code`,a.note) REGEXP `k` );

		ELSE
	SET `k` = (SELECT CONVERT(a.Reg USING gbk ) FROM mysq1_schema.reg AS a WHERE  CONCAT_WS('',a.`Code`,a.note) REGEXP  `k` );
	END CASE;

	RETURN `k`
--  REGEXP_substr(k,'\t[^\n]*')
-- CONVERT(`k` USING utf8 )
-- QUOTE(`k`)
;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `R1`
-- ----------------------------
DROP FUNCTION IF EXISTS `R1`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `R1`(`funid` varchar(99)) RETURNS varchar(200) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	

	RETURN	REG1(CASE 
									WHEN`funid` REGEXP '^`[^`]+`$' THEN `funid`
								ELSE CONCAT('`',`funid`,'`') 
							END);
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `r10`
-- ----------------------------
DROP FUNCTION IF EXISTS `r10`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `r10`(c varchar(200)) RETURNS blob
    DETERMINISTIC
BEGIN
	#Routine body goes here...


	RETURN 	CASE 	WHEN c REGEXP "^[\\d]+$" THEN ( SELECT a.statement FROM `mysq1_schema`.qxsql AS a WHERE a.id = c )
								ELSE ( SELECT a.statement FROM `mysq1_schema`.qxsql AS a WHERE CONCAT_WS('',a.`schema`,a.`subject`,a.`name`) REGEXP c) END ;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `R2`
-- ----------------------------
DROP FUNCTION IF EXISTS `R2`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `R2`(`funid` varchar(99)) RETURNS varchar(10000) CHARSET utf8mb3
    NO SQL
BEGIN
	#Routine body goes here...

	RETURN	REG2(`funid` );
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `R3`
-- ----------------------------
DROP FUNCTION IF EXISTS `R3`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `R3`(`r` text) RETURNS text CHARSET utf8mb3
    NO SQL
BEGIN
	DECLARE
		次数 int(5) DEFAULT 1;

	set @r3自用 =  NULL;
	多个动作:WHILE  次数>0  DO

			SET 次数 = 0;
			CASE
					WHEN r IS NULL THEN RETURN NULL;
					
					WHEN  json_valid(r) && JSON_DEPTH(r)=2 && r REGEXP'^\\s*\\[' || r REGEXP '^\\w+(?:,\\w+)*$' THEN
						SET  r = _f(r,JSON_ARRAY(
						'"\\s*,\\s*"','|',
						'^\\s*(?:\\[")?|(?:"\\s*\\])?\\s*$',''
						));
					WHEN  r REGEXP @_r3自用:=o('(?&message) message') THEN 

						SET r  = _f(r,JSON_ARRAY(
												o('(?&替换的) message')
												,'路径为“',':'
												,'”',''
												,'\\\\(.)','\\1'
												,'，',',\n'	));
					
					WHEN r REGEXP '^\\s*npm\\b' THEN 
						SET r  = _f(r,JSON_ARRAY( 
											'(?i)\\s*npm\\s+I(?:NSTALL)?','yarn add'  
											,'(?i)(?:\\-\\-?s(ave)?)\\b',''
											,'(?i)\\-?\\-dev\\b','-D'))
											;
					
					WHEN CHAR_LENGTH(r)>500 THEN return r;
					WHEN @r3自用 IS NOT NULL && r REGEXP @r3自用 THEN
					   SET r =  REGEXP_replace(REGEXP_replace(r ,  @r3自用,'import from "@site\\1" '),'\\.js(?=")','')
									,次数 = 0
									,@r3自用 = null
									;

					WHEN r REGEXP o('(?&path) path') THEN 
						CASE  WHEN r REGEXP '\\\\' THEN
										SET r = REGEXP_replace(r ,'\\\\','/');
										IF r  REGEXP @r3自用:=  o('(?x)^(?&分割)?[w]((?:(?&分割)(?&path0))+) path') THEN
										SET 次数=1; END IF;

								ELSE 
										SET r = REGEXP_replace(r ,'/','\\\\');
						END CASE;
					WHEN r REGEXP '^`\w+`$' THEN
						SET r = R1(r);
					WHEN r REGEXP '(?<=\\(\\?)((?:&)(\\w+))(?=\\))|(?<=\\\\)((?:g\\{)(\\w+)\\})' THEN 
						SET r = REGEXP_replace(r,'(?<=\\(\\?)((?:&)(\\w+))(?=\\))','R<\\2>'),
								r = REGEXP_replace(r,'(?<=\\\\)((?:g\\{)(\\w+)\\})','k<\\2>');
					
					WHEN r REGEXP '(?<=\\(\\?)((?:R<)(\\w+))(?:>)(?=\\))|(?<=\\\\)((?:k\\<)(\\w+)\\>)' THEN
						SET r = REGEXP_replace(r,'(?<=\\(\\?)((?:R\\<)(\\w+))(?:\\>)(?=\\))','&\\2'),
								r = REGEXP_replace(r,'(?<=\\\\)((?:k\\<)(\\w+)\\>)','g{\\2}');
					WHEN r REGEXP "^([^$]*(\\$)\\d{1,3}[^$]*)*$" THEN
						SET r = REGEXP_replace(r, '(?<=[^$]|^)(\\$)(?=[^$]|$)',REPEAT('\\',2));
					WHEN r REGEXP "^(?:[^\\\\]*\\\\\\d{1,9}[^\\\\]*)*$" THEN 
						SET r = REGEXP_replace(r, '(?<=[^\\\\]|^)(\\\\)(\\d{1,9})','$\\2');

				ELSE SET r = r;	
			END CASE;

	END while 多个动作;

	RETURN r;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `R4`
-- ----------------------------
DROP FUNCTION IF EXISTS `R4`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `R4`(c varchar(200)) RETURNS blob
    DETERMINISTIC
BEGIN
	#Routine body goes here...


	RETURN 	-- CONVERT(
						CASE 	WHEN c REGEXP "^[\\d]+$" THEN ( SELECT a.`blob` FROM `mysq1_schema`.qs AS a WHERE a.id = c )
										ELSE ( SELECT CONVERT(a.`blob` USING gbk) FROM `mysq1_schema`.qs AS a WHERE CONCAT_WS('',a.`schema`,a.`subject`,a.`name`) REGEXP c) END 	
-- 					USING gbk)
;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `r4b`
-- ----------------------------
DROP FUNCTION IF EXISTS `r4b`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `r4b`(`p` blob) RETURNS longtext CHARSET utf8mb3
    NO SQL
BEGIN
	#Routine body goes here...
	DECLARE i INT(5) DEFAULT NULL;DECLARE y INT(5) DEFAULT NULL;
	DECLARE c0 VARCHAR(200) DEFAULT NULL;
	DECLARE c1 VARCHAR(200) DEFAULT '${pageContext.request.contextPath}';
	DECLARE c2 VARCHAR(200) DEFAULT CONCAT_WS('/',c1,'bill/');
	DECLARE 一大坨 LONGTEXT DEFAULT 
CONVERT(REGEXP_replace(CONCAT_WS('','<style type="text/css">'
-- '	.black_line_botton {		border-left-width: 0px;		border-left-style: none;		border-bottom-width: 1px;		border-bottom-style: solid;		border-bottom-color: #006600;	}	.dashed_table {		border: 1px dashed #006600;	}	.black_line_top {		border-top-width: 1px;		border-top-style: solid;		border-top-color: #006600;		text-align: center;	}	.bian_a {		border-left-width: 2px;		border-left-style: solid;		border-left-color: #000000;	}	.STYLE1 {		font-size: 18px;		font-weight: bold;		letter-spacing: 1em;		text-indent: 1em;	}	.jiner_input {		overflow: none;		text-decoration: none;		letter-spacing: 12px;		color: #000000;		border: 0px;		text-align: right;		background: ;		width: 100%;	}	.blckground {		background-image:url("${pageContext.request.contextPath}/images/table/jz-green.gif");		background-repeat: repeat-y;		text-decoration: none;	}	.STYLE3 {		font-size: 11px;	}	.bg_grid {		background-image:url("${pageContext.request.contextPath}/images/table/jpz-green.gif");		background-repeat: repeat-y;	}	#LayerOut {		position: relative;		top: 0;		left: 0;		z-index: 0;		width: 900px;		height: 450px;	}	#paperBg {		position: absolute;		top: 0;		left: 0;		z-index: 1;		width: 900px;		height: 450px;	}	#LayerBill {		position: absolute;		top: -1px;		left: -2px;		z-index: 2;		width: 900px;		height: 450px;	}	#div_img {		position: absolute;		top: 18px;		left: 850px;		z-index: 7;		width: 35px;		height: 45px;	}	.isDate {		font-size: 12px;		background: none;		border: 0px;	}	input.input_like_checkbox {		border: 1px solid #333;		height: 16px;		width: 16px;		text-align: center;		margin: 5px;		line-height: 10px;		font-size: 10px;		cursor: hand;		color: #660066;		color: #660066;	}	* html .input_like_checkbox {		border: 1px solid #333;		height: 16px;		width: 16px;		text-align: center;		margin: 5px;		line-height: 10px;		font-size: 10px;		cursor: hand;		color: #660066;		color: #660066;	}	.isNumeric {		BORDER: 0px;		TOP: 0px;		background: none;		font-size: 11px;;		font-style: oblique;		font-weight: bold;		color: #3300FF;	}	.billtitle {		BORDER: 0px;		TOP: 0px;		background: none;		font-size: 11px;;		font-style: oblique;		font-weight: bold;		color: #3300FF;	}	.toptxt {		border-bottom: 1px solid #000000;		border-top: 0px;		border-left: 0px;		border-right: 0px;		width: 110px;}	html input{		font-family:"楷体_GB2312","楷体";		font-size: 14px;		font-weight:bold;		background-color:transparent;		background:none;		letter-spacing: 0px;		word-spacing: normal;		border: 1px none #CCCCCC;		overflow:hidden;		width:100%;		line-height:15px}	</style>	'
,'html input{
	font-family:"楷体_GB2312","楷体";
	font-size: 14px;
	font-weight:bold;
	background-color:transparent;
	background:none;
	letter-spacing: 0px;
	word-spacing: normal;
	border: 1px none #CCCCCC;
	overflow:hidden;
	width:100%;
	line-height:15px}
</style>'
),'[\\n\\r]+','\t')USING gbk)
;



	DECLARE sign VARCHAR(200) DEFAULT NULL;
	
  IF json_valid(p) THEN SET i = json_value(p,'$[0]');END IF;

	 -- SET sign = CONCAT_WS('','<!--',i,'-->\n');审计
 SET `c0` = json_value(p,'$[1][0]');


	RETURN 
  CASE i

		WHEN 20 THEN  
json_array(
'19',' '
,'#\\w+_zl_\\w+\s*{\\s+display:\\Knone','block'
,'(?:zl|cg)_1.style.display="\\Knone','block'
,'(?:zl|cg)_bm.style.display="\\Knone','block'
,'(?i)(?:\\Q..\\E/image|(?:(?<=")|bill///)image)(?=/paperBg.jpg)',CONCAT_WS('','/file/images')
,'bill/([^/]+?)/V\\d/+\\g1',CONCAT_WS('',c2,c0)
,'bill/([^/]+?)/V\\d/+(?:netinnet_)?.*?',CONCAT_WS('',c2,c0,'/')
,'(?im-s)(url\\s*\\()["\']?(.*?/[^\\.]+\\.\\w+)\\b["\']?(?=\\))','\\1"\\2"'
,'bill///[^/]+/+(?=[^\\.]+\\.\\w+)',CONCAT_WS('',c2,c0,'/')
,'netinnet_',''
)			WHEN 19 THEN  
json_array(
'19','stra ','(?is)<input name=([\'"])save_data_button\\g1.+(?=</form>)',''

)			WHEN 18 THEN  
json_array(
'18','style',"(width\\s*:\\s*[\\d]++)(?!\\s*(?:px|%))",'\\1px'

)		WHEN 17 THEN  
json_array(
'17','style','(?m)^\\s*letter\\-spacing:\\s*\\K1(?=em;)','0.9'

)		WHEN 16 THEN  
json_array(
'16','最后的清除','(?<![\'"><])\\$\\{.*?\\.\\w{2,3}(?=\\s*\\)\\s*;)','"\\0"'

)

		WHEN 15 THEN  
json_array(
'15','最后的清除','(?mis)<br[^>]*?>\\s*?<hr[^>]*?>|<hr[^>]*?>',''

)
		WHEN 14 THEN  
json_array(
'14','插入java字段2','(?i)<body[^>]*?>'
,CONCAT_WS('','\\0\n<% DrawUtils bill = DrawUtils.getBillObject(request); bill.setPrjName(request.getContextPath()); %>	<%=bill.head1()%>	<%=bill.head3()%>	<%=bill.button1()%>	<%=bill.head2()%>${setseals}'
,sign)
)


		WHEN 13 THEN  
json_array(
'13','插入tbn','not','"tbN"', '(?is)<table(?=[^<>]+?>(?:<(?!table)[^<>]+?>|(?<=>)[^<>]+(?=<))*?<input[^<>]*?\\bb\\d+\\b)'
,CONCAT_WS('','<table id="tbN"',sign)
)
		WHEN 12 THEN  
json_array(
'12','插入tbn','not','"tbN"', '(?i)id\\s*=(["\'])mytable\\g1'
,CONCAT_WS('','id="tbN"',sign)
)
		WHEN 11 THEN  
json_array(
'11','插入tbn','(?i)id\\s*=(["\'])table1\\g1'
,CONCAT_WS('','id="tbN"',sign)
)

		WHEN 10 THEN  
json_array(
'10','去注释样式css','(?im-s)(?=<(?:link|img)\\s+.*?(?:showDialog|drag_resize|pen))(<[^>]*?>\\s*+)'
,CONCAT_WS('','',sign)
)

		WHEN 0 THEN  
json_array(
'0','抓保留样式'
,"(?ims)(<style[^>]*?>)\\s*\\<!--\\s*(.*?)\\s*-->\\s*(?=</style>)"
,'<!--|-->',CONCAT_WS('','',sign)
,'2(?=em)',CONCAT_WS(''
,CASE WHEN json_extract(p,'$[1]')REGEXP '"kjpz_jzpz00_ty2zzy07"'  THEN  '0.9'
 ELSE '1' END

,sign))

		WHEN 1 THEN  
json_array(
'1','插入java字段','<!DOCTYPE[^>]+>','\\0\n<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %><%@ page import="mse.utils.DrawUtils" %>'
)
		WHEN 2 THEN 
json_array(''
,json_array(
'2','编码','(?i)charset=GBK','charset=UTF8'
)
,
json_array(
'2','语法错误 去掉'
	,'(?i-m)var\\s+bindType\\s+\\K=\\s*;',''
),
json_array(
'2','多多 去注释','(?xs)Map\\(.*?(?:function)'

	,'(?s)/\\*(.+?)\\*/','\\1'
	,'(?i)//(?=calmap)',''

)
)

		WHEN 3 THEN 
json_array(
'3','取注释',CONCAT_WS('|','(?is)'
	,'\\<style\\s+type\\s*=\\s*[\'"]text/css[\'"]\\s*>\\s*\\<!--(.*)?-->\\s*</style>\\K\\s*'
 ,'(?s)(?:(?s)<!--.*?-->|(?ms)/\\*.*?\\*/'
,'<link[^>]+backup/netinnet.*?>'
	,'(?im-s)<table.*?确定.*?>\\s*$|(?ism)<table[^>]*?control_table[^>]*?>.*?</table>)\\s*+'
),''
,'(?ms)\\s*/\\*.*?\\*/\\s*\r',''
,'(?s)<!--.*?-->',''
,'(<!DOCTYPE)[^>]*>','\\1 HTML>'
,'(?mi)\\bpag\\D{0,6}1\\b[^<>}]*display:\\Knone','block'

)
		WHEN 4 THEN 
json_array(
'4','去script',CONCAT_WS('|'

,'(?ims)<(iframe)\\s+name="BillSaveWin".*?\\g1>\\s*'
,'(?s)\\Q<script language=\'JavaScript\'>var CHECK_VAR_DO3=0\\E.*?(?=</form>)'
,'(?s)<script\\s*language=\'JavaScript\'[^>]*>.*?</script>\\s*+'


),'')
		WHEN 5 THEN 
json_array(
'5','style 插入','(?im)^\\s*(<style)','<LINK href="${pageContext.request.contextPath }/images/favicon.ico"type=image/x-icon rel="Shortcut Icon">\n\\1'
)
		WHEN 6 THEN 
json_array(
'-1','style 插入2','(?i-s)bill/+(?:([^?"\\\\/*<>|\\s]+)/+)*+(?:netinnet_)?(?=(?1)\\.\\w{2,3})'
,CONCAT_WS('/',c2,json_value(p,'$[1][0]'),'',sign)
)
		WHEN 7 THEN 
json_array(
'5','style 插入','(?i)(?:bill_common)/(?:netinnet_)?','${pageContext.request.contextPath}/css/bill/n/'
)
		WHEN 8 THEN 
json_array(
'5','style 插入3'
,'(?i)bill///(?!image)\\w+(?=/)',CONCAT_WS('','/file/bill/',c0)
,'(?i)bill///(?=\\w+\\.\\w+)',CONCAT_WS('','/file/bill/',c0,'/')
,'input_b b\\d',''
,'bill///(?:netinnet_)?(?=[^/"\']+\\.\\w+)|(?<=")netinnet/netinnet_'
,CONCAT_WS('',CONCAT_WS('/',c1,'css/bill/n/'),sign)

)		
	WHEN 9 THEN 
json_array(
'5','一大坨样式','(?im)^\\s*(<head>)'
,CONCAT_WS('\n','\\1',sign,一大坨)
)

	WHEN 21 THEN 
json_array(
json_array(
	'1','公式处理'
		,'(?s)function\\s+(before)InitForm[^\\{]*(\\{(?:[^\\{}]+|(?-1))*?\\})\\K.+?(?://|function|</script)'
		,'\n\\1InitForm()\\0'
	)
	,json_array(
	'1','税率'
		,'(?s)17%(?=税|\\s*<)','13%'
	)	
,json_array(
	'1','多多税率',@rrfb:='(?si)calMap.+?FUNCTION\\s+beforeInitForm'

		,'0.17'	,'0.13'
	)

)
	WHEN 22 THEN 
json_merge(JSON_ARRAY('1','表单个性化')
, case 
		WHEN `c0` = 'kjsj_zzsnssbbybnsr_ygz_dzxz01' THEN 
		JSON_ARRAY('(?s)\\QcalMap.put("b1[1]","b1[0]");','\\0calMap.put("b1","b2+b3+(b4)");' )
		
		WHEN `c0` = 'odta_bqdkjxsyjgmxb_dz01' THEN 
		JSON_ARRAY(
		'(?s)\\QcalMap.put("b1[1]","b1[0]','\\0*.13' 
    ,'(?s)\\QcalMap.put("b8","b9+b10','\\0*.13' 
		)	
		WHEN `c0` REGEXP'kjpz_skpz00_xz01|kjpz_fkpz00_xz02' THEN 
		JSON_ARRAY(
		'(?-s)bill///[^/]*?/(\\w+\\.\\w+)',CONCAT_WS('',c2,c0,'/\\1') 

		)	
		WHEN `c0` REGEXP'kjzb_slsmxz_slsmxz05' THEN 
		JSON_ARRAY(
		'#LayerBill','.i_havebackground {\nbackground-image: url("/file/bill/kjzb_slsmxz_slsmxz05/sls_blod4.gif");\nbackground-repeat: no-repeat;\n}\n\\0'

		)	
		WHEN `c0` = 'kjqt_ncpsgfphptfamxb01' THEN 
		JSON_ARRAY(
		'function beforeInitForm',CONCAT_WS('','function common_init_zreo(){//初始化得时候对于需要自动计算的赋值
	  $("input[name=b3]").each(function(index){
	  	if($("input[name=b1]").eq(index).is(":visible")&&$("input[name=b2]").eq(index).is(":visible")){
			if($(this).val()=="") $(this).val("0.00");
			if($("input[name=b4]").eq(index).val()=="")$("input[name=b4]").eq(index).val("0.00")
		}
		
	  	
	  }); 
 }','\n\\0') 

		)
  ELSE NULL 
	END
)	
ELSE NULL		



  END

;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `r4b1`
-- ----------------------------
DROP FUNCTION IF EXISTS `r4b1`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `r4b1`(`p` blob) RETURNS longblob
    NO SQL
BEGIN
	#Routine body goes here...
	DECLARE i INT(5) DEFAULT NULL;DECLARE y INT(5) DEFAULT NULL;
	DECLARE c1 VARCHAR(200) DEFAULT '${pageContext.request.contextPath}';
	DECLARE c2 VARCHAR(200) DEFAULT CONCAT_WS('/',c1,'bill/');



	DECLARE sign VARCHAR(200) DEFAULT NULL;
	
  IF json_valid(p) THEN SET i = json_value(p,'$[0]');END IF;

	 -- SET sign = CONCAT_WS('','<!--',i,'-->\n');审计

	

	RETURN 
  CASE i


	
		WHEN 0 THEN  
json_array(
'1','抓取sytle','(?is)\\<style\\s+[^>]+?>.+?\\</style>',''
)		
		WHEN 1 THEN  
json_array(
'2','增加','^(.)','@charset "UTF-8";\n\\1'
)		
		WHEN 2 THEN  
json_array(
'2','去sytle','(?is)\\<style\\s*[^>]+?>|</style>',''
)


		ELSE NULL 
  END

;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `r4b2`
-- ----------------------------
DROP FUNCTION IF EXISTS `r4b2`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `r4b2`(`p` blob) RETURNS text CHARSET utf8mb3
    NO SQL
`la`:BEGIN
	#Routine body goes here...
	DECLARE i varchar(100) DEFAULT NULL;DECLARE y INT(5) DEFAULT NULL;
	DECLARE r  text DEFAULT NULL;
	DECLARE c , c0, c1 ,c2 ,c3 TEXT DEFAULT null;
	DECLARE sign VARCHAR(200) DEFAULT NULL;




  IF NOT json_valid(p) THEN RETURN NULL;  END IF;

	SET i = CAST(json_value(p,'$[0]') AS CHAR)
			,`c` :=  JSON_EXTRACT( p,'$[1]')
			,`c0` = IF(c IS NULL ||c= 'NULL',NULL,json_value(p,'$[1][0]'))
			,`c1` = IF(c IS NULL ||c= 'NULL',NULL,json_value(p,'$[1][1]'))
			,`c2` = IF(c IS NULL ||c= 'NULL',NULL,json_value(p,'$[1][2]'))
			,`c3` = IF(c IS NULL ||c= 'NULL',NULL,json_value(p,'$[1][3]'));

	-- SET sign = CONCAT_WS('','<!--',i,'-->\n'); -- 审计


	RETURN o2(
	
  CASE 
	
	WHEN `i` regexp '^抓取$' THEN 

	json_array('','多多(?#抓取99999999)',
o('(?#抓取99999999)(?#抓取99999999)(?&year1)|(?&year2)|(?&year3)|(?&year4)|(?&year5) date i')

	)


	WHEN `i` = 'iji' THEN 
JSON_ARRAY('','react',O("(?#抓取)(?m)^,?'\\w+'\\s*,\\s*\\w+\\s*(?&r1) es6") ,'(?m)^.+$','--0--')	


WHEN `i` = 'jsp2HOC' THEN 
		jsp2HOC(p)
	
	WHEN `i` regexp '^修改时间$' THEN 

	json_array('','多多',
o('|(?&year3) date'),
	o('\\d+|(?&cyear) date'),CONCAT('`?',`c0`,'`')
	)

  WHEN  `i` regexp '^生成单例模式$' THEN
json_array('mission_ask简单处理'
'\\\\r','<br/>'

)

  WHEN  `i` regexp '^类2组件$' THEN
JSON_ARRAY('','',
		JSON_ARRAY('前','',
			CONCAT_WS('','(export\\s*(?:\\w+\\s*)?)class\\s+(',c0,')\\s+extends\\s*Component(?=\\s*\\{)'),'\\1 const \\2 = function(proos)'
			
	)
		,json_array('状态','多多'
		,o('state\\s+=\\s*(?&r2),es6')
		,'^\\s*state\\s*=\\s*\\{|\\}$',''
		,o('(\\w+)\\s*:\\s*((?&v))\\s*,? es6'),'const [\\1 , set\\1] = useState(\\2)'
		)

		,json_array('类2组件','多多'
		,',\\s*set\\K[a-z]'
		,'(?#UPPER)^[a-z]','\\0'
		)
		
)		



    WHEN  `i` regexp '^分割markdown$' THEN
json_array('',''
			,JSON_ARRAY('','','(?x)(?ms)^\\#\\s+目录(?).*?(?=\\s*(?:^\\#\\s+\\S|(?-m)$))',''
			,'(?s-m)^(.+?)((?m)^\\#\\s+\\S+.+?(?m)$)','\\2\\1'
			)
		,JSON_ARRAY('装修','react'
				,o('(?x)(?&level0) markdown')
				,'(?m)^(\\#\\s+([^\\s\\#]+))'
				,CONVERT(concat(
'---
id: \\2
title: \\2
description: A short description of this page
keywords: [keywords, describing, the main topics]
sidebar_position: trs计数器
---
')USING utf8)

				,'(?m)^\\#(?=\\#)',''
				,'\\{width=[^{}]+?\\}',''

-- 				,	'(?ms)^(\\-{3}\\s+)(^\\#.+?<Img\\s+img)'
-- 					,CONCAT_WS('\n','\\1',
-- 						'import {Img} from "@site/src/components/img"\n',
-- 						'import BrowserOnly from "@docusaurus/BrowserOnly"\n',
-- 					
-- 					'\\2') -- import 
			)
)

			
			WHEN  `i` regexp '^分割markdown-生成描述关键词$' THEN
json_array('',''

		,json_array('','react'
		   ,'(?m)^(\\-{3}[\\n\\r]+(?m)^id(?-s).+?\\s*^title:\\s+((?-s).*?(?=\\s*(?m)$)))(?s).+?\\s*(?=(?:(?1)|(?-m)$))'
			 ,'抓取开始',''
			 ,'(?#抓取)(?m)^\\#{2}\\s+(\\S+)',', \\1'
			 ,'抓取结束',''

			 -- 生成描述关键词
			,CONCAT_WS('[\\n\\r]*'
								 ,'^抓取开始\\s*,\\s*(([^\\s,]+)(?:\\s*,\\s*(?2))*?)\\s*抓取结束(?m)$'
								 ,'(\\-{3}'
								 ,'\\w+:\\s*\\S+'
								 ,'\\w+:\\s*\\S+'
								 ,'description:\\s+).*?(?m)$'
								 ,'(keywords:\\s+).*?(?m)$'
						 )
						,'\\3\\1\n\\4[\\1]'
			 /**/
		)
		,json_array('修正 description','react'
						,'(?m)^description: .*?$'
						,',\\s*',' '
		)
		,json_array('修正 description keywords','react'
						,CONCAT_WS('[\\n\\r]*'
							,'(?m)^(?:description):\\s+.*?$'
							,'(?m)^(?:keywords):\\s+.*?$'
						)
						,'\\*',''
		)
				
)			
			
			WHEN  `i` regexp '^分割markdown-生成sql$' THEN
json_array('',''

		,json_array('','react'
		   ,'(?m)^(\\-{3}[\\n\\r]+(?m)^id(?-s).+?\\s*^title:\\s+((?-s).*?(?=\\s*(?m)$)))(?s).+?\\s*(?=(?:(?1)|(?-m)$))'
			 ,'(?sm)^\\--.+?^\\s*title:\\s+(.*?(?=\\s*(?m)$)).+?(?-m)$'
				,CONCAT_WS('','SELECT \\0	INTO DUMPFILE "',REGEXP_replace(@filename,'[^/]+\.mdd?',''),'\\1.md";\n ')
			)

		,json_array('','react'
			,'(?ims)^SELECT\\s+\\K((?!")\\S.+?)(?=(?m)\\t+INTO\\s+DUMPFILE)'
			,'(?#quote)(?is)^.+?$','\\0'
		)
/**/
)  

    WHEN  `i` regexp '^md2mdx$' THEN
JSON_ARRAY('md 2 mdx',''
		,json_array('md 2 mdx',''
			,'class(?=\\s*=[\'"])','\\0Name'
			,'(?<=\\[)\\s+(?=\\S)',''-- '可疑空格'
			,'(?<=\\d)in\\b',''
			-- 处理图像
			,CONCAT('(?sx)<img\\s+src=(',
						CONCAT_WS('|','"((?:(?=\\\\).{2}|(?!\\\\|").)*?)"',
							'\\{{1,2}(?:(?=\\\\).{2}|(?!\\\\|\\}).)*?\\}{1,2}',
							"'(?:(?=\\\\).{2}|(?!\\\\|').)*?'",
							'[^{}"\']+'
							),
						')\\s+(?1)*?\\s*/>'
						)
						
						,'![](\\2)'
			
-- 								,'<Image img={require(\\1)}'
--  			,CONCAT('(?sx)<[A-Z]\\w+\\s+(?:',
-- 						CONCAT_WS('|','"(?:(?=\\\\).{2}|(?!\\\\|").)*?"',
-- 							'\\{{1,2}(?:(?=\\\\).{2}|(?!\\\\|\\}).)*?\\}{1,2}',
-- 							"'(?:(?=\\\\).{2}|(?!\\\\|').)*?'",
-- 							'[^{}"\']+'
-- 							),
-- 						')*?\\s*/>'
-- 						)
-- 				,'\n<BrowserOnly>\n\t{()=>\\0}\n</BrowserOnly>\n'
		)
		,json_array('style','react'
			,@r4b2:= CONCAT('(style\\s*=\\s*)','"((?:(?=\\\\\).{2}|(?!\\\\|").)*?)"','')
			,@r4b2,'\\1{{\\2}}'
			,';',','-- '可疑空格'
			,'[\\d\\.]+%','"\\0"'
		)
		
)
    WHEN  `i` regexp '^mission_ask简单处理$' THEN
json_array('mission_ask简单处理'
'\\\\r','<br/>'

)  

  WHEN  `i` regexp '^[.\\d]+$' and `i` = 10 THEN
json_array('百度 去页面'

	,JSON_ARRAY('1','去'
	,CONCAT_WS('|'
		,'(?s)^.*?(?=<html>)'
		,'(?s)<(head|script).+?/\\g-1>\\s*+'
-- 		,'(?s)<script.+?/script>\\s*+'
		,'(?s)<!--.+?-->\s*+'
	),''
	
)	
	,JSON_ARRAY('1','修补'
			,'<(?:img|input)[^>]+[^/]{5}\\K>','/>'
	)	

	,JSON_ARRAY('1','抓取'
	
	,CONCAT_WS(''
			,'(?=<[^>]+?\\Q"main-content J-content"\\E[^>]*?>)'
			,(@`r4b2` := '(<(\\w+)[^>]*?(?:/>|>(?:(?-2)|[^<]*)*</\\g-1>))' )
		),'\\1'
	
)	

)  

  WHEN  `i` regexp '^[.\\d]+$' and `i` = 9 THEN
json_array('md',
	JSON_ARRAY('-1','多多 md头',@`r4b2`:='\\bmdtitle(:\\w++)?(?=\\b)'
	  ,@`r4b2`,CONCAT_WS('',
'---
`json:mdtitle`
---
')

)	
,JSON_ARRAY('1','多多 info',@`r4b2`:='\\bmdinfo(:\\w++)?(?=\\b)'
	  ,@`r4b2`,CONCAT_WS('',
':::info 要求
`json:mdinfo`
\n:::
')
)

,JSON_ARRAY('1','多多 tip',@`r4b2`:='\\bmdtip(:\\w++)?(?=\\b)'
	  ,@`r4b2`,CONCAT_WS('',
':::tip 提示\n\n
`json:mdtip`
\n:::
')
		,'注([:：])?','\r\n  .'
 ,'(?<g>\\w+=(?:(?<p>（|[(\\-*])\\w+(?<e>[=%)]|）)?|(?&p)?\\w+(?&e)){3,})|(?!=\\s*)\\(([^)]+)\\)|（([^）]+)）'
 ,'$$\\1$$\n  .\\5\\6\r'
,'[，,]','\r\n  .'
,'(?m)^\\s*(?:\\.|。?[$]*+)\\s*[\n\r]+|[$]{4,}',''
			,'(?m)^\\s*\\.\\s*$',''
)




,	JSON_ARRAY('1','多多 修补md头',@`r4b2`:='(?is-m)^(\\-\\-\\-).*?\\g1'
		,'#','号'
)
,	JSON_ARRAY('1','修补标签br'
		,'(?i)\\<br\\s*/?\\>','\n'
)
)  

	WHEN  `i` regexp '^[.\\d]+$' and `i` = 0 || i = '去注释' THEN
JSON_ARRAY('去注释',
json_array(
'2','多多抓thml css','(?is)<html.*?</html>'

 	,CONCAT_WS('','(?is)<link[^>]+?(css/bill/(?:[^/"\\\']+/)*+[\\w\\.]+)\\b[^>]*?>'),CONCAT_WS('','<style>`载入:C:/Program Files (x86)/Qianxue/QxServer7.0/Qn/Qnode/c/src/\\1`</style>',sign )
,CONCAT_WS('','(?is)<link[^>]+?favicon.ico[^>]*?>'),CONCAT_WS('','',sign )
,'﻿@charset "utf-8"',''

)

,json_array(
'3','去注释',CONCAT_WS('|'
	,'(?ism)<!DOCTYPE\\s+[^>]*+>'
	,'<%.*?%>'
  ,'(?:<!--.*?-->)|(?:/\\*.*?\\*/)'
 	,'(?is)\\<style\\s+type\\s*=\\s*[\'"]text/css[\'"]\\s*>\\s*\\<!--(.*)?-->\\s*</style>\\K\\s*'
	,'\\Q${setseals}\\E'
),'')

)
		WHEN  `i` regexp '^[.\\d]+$' and `i` = 1 || i ='抓样式' THEN 
json_array(
'2','多多抓thml css','(?is)<html.*?</html>'

	,CONCAT_WS('|'
				,'<%.*?%>'
				,'<html[^>]*?>|</html>'
			),''

)

		WHEN  `i` regexp '^[.\\d]+$' and `i` = 2 THEN 
json_array('处理头部','',
	json_array(
	'1','抓head','(?is)<head.*?</head>'

		,CONCAT_WS('|'
					-- ,'(?is)\\<style\\s+[^>]+?>.+?\\</style>'
					,'<meta[^>]+?>'
					,'<(?:head)[^>]*?>|</(?:head)>'
					,'<(title)[^>]*?>.*?</\\g1>'
		),''
	)

)

		WHEN  `i` regexp '^[.\\d]+$' and `i` = 3 THEN 
json_array(
'3','多多body','(?ims)(<body[^>]*?>.*?</body>)'
,'(?ims)(<body[^>]*?>.*?</body>)',
"import React from 'react';
export default function qwe() {return (<>
  \\1
</>);}"
,'<body[^>]*?>|</body>',''
,'<(?:img|input)[^>]+[^/]{5}\\K>','/>'
,'onpropertychange="setEncrypt\\(\\)"\\s*+',''
,'sameFlag="[^"]*?"',''
,'class=""',''
)	

		WHEN  `i` regexp '^[.\\d]+$' and `i` = 4 THEN 
json_array('react style2`style`',
	json_array(
	'l33','react sytle tag1','(?s)<style.+</style>'

	,'(?s)(<style[^>]*?>)(?!\\s*\\{`)(.*?)(</style>)','<style>{`\\2`}</style>'
	)
	,json_array(
	'','react sytle tag','(?s)(<style[^>]*?>)(.*?)(</style>)'
	,'[\\n\\r]+',''
	)
	,JSON_ARRAY(
		'l3','react style 后置',@`r4b2` := '(?s)(<style.*?>\\{`.+?</style>\\s*)(.+?<>(?:\\s*(?1)*+))'
		,@`r4b2`,'\\2\n\\1'
	)
)
		WHEN  `i` regexp '^[.\\d]+$' and `i` = 5 THEN 
json_array(
'3','react -1 驼峰  ','style=(["])(?:(?=\\\\).{2}|(?:(?!\\g1|\\\\).)*?)*?\\g1'
	,'\\w+="\\w+:"',''
	,';;',';'
	,'";','"'

,'(?#UPPER)\\-([a-z])','\\1'
,'(["\'])((?:(?=\\\\).{2}|(?:(?!\\g1|\\\\).)*+)*?)\\g1','{{\\2}}'
,':\\s*([\\w_\\#!]++(?:\\s+[\\#\\w_]++)*)',':"\\1"'
,';',','

)


		WHEN  `i` regexp '^[.\\d]+$' and `i` = 6 THEN 
json_array(
'3','React -2 驼峰 语法','(?s)<>.*?</>'
,'(?-i)\\bclass\\b','className'
,'rowspan','rowSpan'
,'cellpadding','cellPadding'
,'cellspacing','cellSpacing'
,'colspan','colSpan'
	,'tabindex="(\\d+)"','tabIndex="\\1"'
,CONCAT_WS('','(?is)\\Q${pageContext.request.contextPath}/bill\\E/{1,2}',c0,'/'),CONCAT_WS('','/img/b/',sign )
)

		WHEN  `i` regexp '^[.\\d]+$' and `i` = 7 THEN 
json_array(
'6','去换行 加tbody css -> scss'
,'(?m)(\\n\\s*?\\s){2,}',''
,'(?m)(?:</tbody>)?\\s*(</table>)','</tbody>\\1'
,'(?m)<table[^>]*?>(?!\\s*+<tbody)','\\0<tbody>'
-- ,'/[\\w_]+\\.\\Kcss','scss'
,CONCAT_WS('','(?is)\\Q${pageContext.request.contextPath}/bill\\E/{1,2}',c0,'/'),CONCAT_WS('','./',sign )
)

  WHEN  `i` regexp '^[.\\d]+$' and `i` = 8 THEN
json_array('处理img',
	JSON_ARRAY(
		'1','多多',@`r4b2`:='(<img[^>]*?src=)((["\'])[\\${}\\./\\w\\-]+/(\\w+)\\.\\w+\\b\\g3)'
		,@`r4b2`,'\\1{\\4} import \\4 from \\2 '
	)
	,JSON_ARRAY(
		'1',' import 前置'
		,@`r4b2` := '(?s)(export.+)(import\\s+\\w+\\s+from\\s*"[^"]+"\\s)','\\2\n\\1'
	)
)




	WHEN  `i` regexp '^[.\\d]+$' and `i` = 22 THEN
json_array('处理img',
	JSON_ARRAY(
		'1','多多',@`r4b2`:='(<img[^>]*?src=)((["\'])[\\${}\\./\\w\\-]+/(\\w+)\\.\\w+\\b\\g3)'
		,@`r4b2`,
':::tip
\\1  
:::'
	)


)

	WHEN  `i` = '抓取json' THEN
json_array('百度关键词'
	,JSON_ARRAY(
		'抓','多多抓取'
		,@`r4b2`:= '(?#抓取)<meta name="(?:keywords|description)"[^>]*>'
		,CONCAT_WS('','(?#抓取)',(@`r4b2`:='(?s)((["\'])(?:(?=\\\\).{2}|(?:(?!\\\\|\\g-1).)*+)*\\g-1)')),'\\0'
	,CONCAT_WS('','("[^"]+")(',@`r4b2`,')'),',\\1:\\2'
	)
	,JSON_ARRAY(
		'生成json','生成json'
		,'(?-m)^,','{'
		,'(?-m)"$','"}'
	)
)

 	WHEN  `i` = 'jsp-抓取abtinput' THEN
json_array('jsp','abt抓abjson'
,'(?ms)<head.*?/head>|<(?!input)(\\w+)./\\g1>|<!--.*?-->|//.*?$',''
		,'(?si).+?(?:<input[^>]+?(?:id|name)=["\']?\\b([abt]\\d+)\\b["\']?[^>]*?>|$)'	,',"\\1"'
		,',""',''
)

 	WHEN  `i` = 'jsp-abt生成json' THEN
JSON_ARRAY('bao',
json_array('l3','生成ajson'
		,CONCAT_WS('','(?s),"(?!',c0,').\\d+"')	,''
		,'^,',''
	,'(?#result)^(("b\\d+")(?:,\\g-1)++)(,(?1))+$','[]'
	,'("(?:(b)|\\w)\\d+")(?:,"\\w+")*?(?=(?(2),\\g1|$))','[\\0]' 

 		,'(\\[[^]]+?])(,(?1))++','[\\0]'
		,'^\\[',CONCAT_WS('',JSON_QUOTE(c0),':[')
		,'(?<=^"b":)(\\[("\\w+")(?:,(?-1))*?])(?:,(?-1))*?$','[\\0]'
)
,json_array('l3','多多循环'
,'("b\\d+")(?:,"b\\d+")*?,(\\g-2.*?])'
,'(?#循环)(("b\\d+")(?:,"b\\d+")*?),(\\g-3.*?])','\\1],[\\3'
)

)

 	WHEN  `i` = '提取abt关系' THEN
	JSON_ARRAY('jspabt变字段',
		json_array('jsp','多多抓取' 
				,@r := CONCAT_WS('','(?#抓取)(\\[("(?:(?=\\\\).{2}|(?![\\\\"]).)*?"|null|[\\-\\d\\.]+)(?:,\\s*(?-1))*?,"',c0,'\\d+"])')
				,@r,'\\0,'
		)
		
		,json_array('jsp','数组处理' 
				,',$',']'
				,'^.','[['
		)
)
 	WHEN  `i` = 'jspabt变字段' THEN

		json_array('jsp','多多抓取' 
				,'(?#抓取)(?<=\\[)".*?(?=])',''
				,'.++',CONCAT_WS('',JSON_QUOTE(c0),':\\0')
				,'","',','
		)

  	WHEN  `i` = '说明-字段' THEN
		JSON_ARRAY('jspabt变字段',
			json_array('jsp','多多抓取' 
					,@r:=  '(?#抓取)(?x)>(\\s*\\w(?:[\\w\\s]|：|<br\\s*/?>)*?)(?:<(?!textarea|input)[^>]+?>\\s*)*?
				((<(?:textarea|input)[^>]+?(?:id|name)=["\']?\\b([abt]\\d+)\\b["\']?[^>]*?>)(?:\\s*(?:<br\\s*/?>\\s*)?(?-2))*+)'
			,@r,'["\\1","\\2"],'

			,'\\s*+(?:<br\\s*/?>)\\s*+','","'
			,'<(?:textarea|input)[^>]+?(?:id|name)=["\']?\\b([abt]\\d+)\\b["\']?[^>]*?>','\\1'
			,'\\s+',''
			,'(\\d)(?=[abt]\\d+)','\\1","'
			,'","(?=\\w")|：',''
			,'(\\w)(及\\w)','\\1","\\2'

			)
		,json_array('jsp','数组处理' 
				,',$',']'
				,'^.','[['
		)
	)
		WHEN  `i` = '分裂数组1' THEN
		JSON_ARRAY('分裂数组取余',
			json_array('jsp','多多抓取' ,@rb2 := '(?i)(?#分裂数组1)\\[("[^abt]\\w*")(?:,\\s*(?-1)){1,},\\s*("[abt]\\d+")(?:,\\s*(?-1)){1,}\\]'
					,@rb2
			
			)

			,json_array('jsp','修正' 
					,'\\[]',''
			
			)
	)
 
	WHEN  `i` = 'SELECT2update' THEN
json_array('jsp','多多' 
		,'(?s)SELECT.*?FROM'
-- 		,'(?m),(.*?)(?:["\'])\\s*as\\s*(?:["\'])(\\s*\\D*?)\\s*$',',\\2=\\1'


)

 	WHEN  `i` = '增值税处理' THEN
	 case 
		WHEN `c0` = '' THEN 
json_array('jsp','   多多抓取' 
		,'(?#抓取)(?<=\\[)".*?(?=])',''
		,'.++',CONCAT_WS('',JSON_QUOTE(c0),':\\0')
		,'","',','


)
	END
	WHEN `i` = '公式处理' THEN 
json_array(
'1','公式处理'
	,'(?s)function\\s+(before|after)InitForm[^\\{]*(\\{(?:[^\\{}]+|(?-1))*?\\})\\K.+?(?://|function|</script)'
	,'\n\\1InitForm()\\0'
)	
	WHEN `i` = 'css' THEN 
		json_array(
		'1','-- 多多抓取' ,'(?#抓取)(?m)^[^\\{]+(\\{(?:[^\\{}]+|(?-1))*?\\})'-- ,@cssr := '(?#抓取)\\.glyphicon[^\\{]*(\\{(?:[^}\\{]|(?-1))*})|'	
			,'(?#抓取)(?s).*(glyphicon|btn-xs|\\Q-webkit-font-smoothing\\E).+$','\\0'

		)
	WHEN `i` = 'curl' THEN 
	JSON_ARRAY('curl','',
		json_array(
		'1','多多抓取' ,'(?#抓取)(?mxi)(?:-H.+?(?:
		Referer|Cookie|content\\-Type)|--data-raw|curl
		
		)(?:"(?:(?=\\\\).{2}|(?!["\\\\]).)*?"|.){2,}?(?=(?:\\\\)*?\\s*$)'
		)
		,json_array('','','\\s*0\\s*$',''
		,'(?<!\\\\)"','\\\\"'
		,"'",'"'
		)
	)	
	WHEN `i` = 'json格式key' THEN 
	JSON_ARRAY('json格式key',
		json_array('',''
		   ,'"(\\w+)"(?=,\\s*|])','\\0,\\1'
			,'\\[|]',''

		)
	)
		WHEN `i` = 'json格式keyas' THEN 
	JSON_ARRAY('json格式key',
		json_array('',''
		   ,'"(\\w+)"(?=,\\s*|])','\\1 AS \\1\n'
			,'\\[|]',''

		)
	)
		WHEN `i` = '注释样式' THEN 
	JSON_ARRAY('注释样式',
		json_array('',''
		   ,'<(link[^>]+(?:bill_common)\\.css\\b[^>]*?)>'
				 ,case WHEN c0  REGEXP '(?:kjdz_hcp000_hcp04)' THEN  '\\0'
				 ELSE '<%--\\0--%>' END
		)
	)
	WHEN `i` = 'dir变数组' THEN 
	json_array('',
		json_array('1','多多抓取' ,'(?#抓取)(?s).*?(\\w+\\.\\w{2,10}).*?(?=\\g<1>|$)'
					 ,'(?#抓取)(\\w+)\\.(\\w{2,10})'
					 ,concat('["',c0,'\\0",','"\\2",','"\\1"],')

	)
	,json_array(	'1','修补' 
					,',\\s*$',''
					,'^\\[','[['
					,']$',']]'
))	
	WHEN `i` = '移动css' THEN 
json_array('','移动css到js||替换',
		json_array('1','移动css到js '

			,CONCAT_WS('','(?isx)
		((?&link))(.+?)((?&script))	
		
				(?(DEFINE)
							(?<link> 
									<link(?&i)/\\s*>)
						(?<script> 	
										(?:\\s*+<script(?&i)>\\s*</script>)+
										)
						(?<i>[^>]*',c0,'[^>]*)
				)
	') ,'\\2\n\n<%--\\1\\3\--%>\n\n\t\t\\1\\3\n\n'
	)

	,JSON_ARRAY(1,'多多'
		,CONCAT_WS('','(?isx)<%--.+?--%>(*SKIP)(*F)|
		(?&link)(?&script) 
				
						(?(DEFINE)
									(?<link> 
											<link(?&i)/\\s*>)
								(?<script> 	
												(?:\\s*+<script(?&i)>\\s*</script>)+
												)
								(?<i>[^>]*',c0,'[^>]*)
						)')

		, CONCAT_WS('','(?isx)
		(href=.)(?&i)(/css/(?&f)',c0,'(?&f)\\b)
					(?(DEFINE)
							(?<i>[^>]*)
							(?<f>[\\w+\\.]*)
					)
		'),CONCAT_WS('','\\1',json_value(c,'$[1]'),'\\2')	

		, CONCAT_WS('','(?isx)
		(<script(?&i)src=.)(?&i)(/i18n/(?&f)\\.js\\b)
					(?(DEFINE)
							(?<i>[^>]*)
							(?<f>[\\w+\\-\\.]*)
					)
		'),CONCAT('\\1',json_value(c,'$[1]'),'/js\\2')

		, CONCAT_WS('','(?isx)
		(<script(?&i)src=.)(?&i)(/(?&f)',c0,'(?&f)\\.js\\b)
					(?(DEFINE)
							(?<i>[^>]*)
							(?<f>[\\w+\\-\\.]*)
					)
		'),CONCAT('\\1',json_value(c,'$[1]'),'/js\\2')

	)

)

	WHEN `i` = '处理目录' THEN 
	json_array('','处理目录',
			json_array('1','替换'
			,'\\\\','/'
			, '(?m)^\\s*(?:(?:\\d{4}/\\d{2}/\\d{2}\\s+[\\d:]+\\s+(?:[\\d,]+\\s+|\\Q<DIR>\\E.+$)))\\s*',''
			,'(?m)^\\s*(?:\\d+\\s+个|驱动器|所列|卷的).+?(?=\\s*$)',''
			,'(?m)(^[ \t]\\w:).+的目录$(?=\\s*(?1))',''
			,"(?m)^\\s+(?=\\S|\\s*$)",''
			,'(?m)\\s*(?:的目录)$',''
		)
	,JSON_ARRAY(1,'多多'
		,CONCAT_WS('','(?ismx)(?&path).*?(?=(?&path)|(?-m)$)
						(?(DEFINE)
													(?<path>
													[A-Za-z]:.+?$
													)

										)
						')
	,@r4b2自用:= '(?m)(?#作为参数 cd)(?m)[A-Za-z]:.+?$',''
	,'(?m)^([\\.@{}()\\w\\-]+?)$','`参cd`/\\1'
-- ,json_array('','else'	
-- ,'(?m-s)([A-Za-z]:).+(\\1).*$',''
 	,'(?m)^.+/\\s*$\\s+',''
-- )
	)
,json_array(1,'生成载入语句'
	,CONCAT_WS('','(?m-s)^.+?/',`c0`,'/(.+?(?:\\.(\\w+))?)$')
	,CONCAT_WS(' ','SELECT "\\1","\\2"'
,',LOAD_FILE(CONVERT("\\0" USING gbk))' 
	,'UNION ALL')
	,'UNION ALL\\s*$',''
)
/**/
)	
	WHEN `i` = 'docusaurus' THEN 
	json_array('','处理<DOCTYPE>',
			json_array('1','去facebook'
				,'(?ism)^(.*?)(<!DOCTYPE)\\s+(html)?[^>]*?(>)','\\2 html>\n\n\\1'
				
			)


)
	WHEN `i` = '处理DOCTYPE' THEN 
	json_array('','处理<DOCTYPE>',
			json_array('1','替换'
				,'(?is-m)^(.*?)(<!DOCTYPE)\\s+(html)?[^>]*?(>)','\\2 html>\n\n\\1'
				
			)


)
	WHEN `i` = 'xml2table2表' THEN 
	json_array('',' 抓取',
           o (CONCAT( '(?xm)(?#抓取1)((?&k))((?=.+',c0, ')(?&vs).+\\s*)(?:^\\g1(?-1))*,xml' )),''
					 ,o('(?#抓取1)((?&name))\\(((?&col))'),''
					 ,'^([^(]+)\\(((\\w+)(?:,.+))',
					CONCAT_WS(''
						,CONCAT_ws(',','SELECT \\2',j0(c,'补充列')),' FROM \\1 WHERE 1 '
						,CONCAT(' AND \\3=' ,JSON_QUOTE(json_value(c,'$[1]')))
						)

)
	WHEN `i` = '修改json-1' THEN 
	json_array('','合并 - 修改json-1',
			json_array('1','替换'
				,'(?is-m)^(.*?)(<!DOCTYPE)\\s+html[^>]*?(>)','\\2 html>\n\n\\1'
				
			)


)
	WHEN `i` = '@2``' THEN 
	json_array('','@ -> ` ',
			json_array('1',' ',
			'\\@(\\w+)\\b(\\s*\\w*+)','`\\1`\\2'
				
			)


)

	WHEN `i` = '测试队列' THEN 
	json_array('队列0','队列0',
	    			json_array('队列1','队列1'
							,JSON_ARRAY('对11','对11','123','321','321','处理一次')
							,'处理一次','处理一次.5'
						),	
						json_array('队列2','队列2','处理一次.5','处理二次'
					)
					,'处理二次','处理二次.5'
					,"done","竞赛"
					
)	
			
	WHEN `i` = '竞赛' THEN 

	json_array('','@ -> ` ',
						
			json_array('','去掉一大坨'
					,'(?sxm)^<bgimage.+?bgimage>',''
					,'(?sxm)(?>^.+?CDATA\\[)(.+?)(?>\\Q]]></sql>\\E\\s*$)','\\1;'
						,"'\\s*'",'NULL'
						,"\\s+(?=')",''
					,'"','\\\\\"'
					,"(?s)'((?:[^\\\\']|\\\\.)*?)\\s*'",'"\\1"'
					,"(?m)^insert(\\s*into\\s*)",CONCAT('REPLACE\\1`',c0,'`.')
					,'</sqls>$',''
					)
)	
	WHEN `i` = 'replace2select' THEN
json_array('1','2',
		json_array(	'l','多多',
CONCAT('(?xims)^( (?&b)\\( )	((?&es)\\)(?-s).*?(?=\\s*$))(?:(\\s*^)\\g1(?2))*
	(?(DEFINE)
	(?<o>[^"])
	(?<b>(?i)(?&o)+?values)
	(?<e>(?ms)("(?:[^\\\\"]|\\\\.)*?"|null|\\b-?\\d+(?:\\.\\d+)?\\b)(?=\\s*(?:,\\s*(?-1)|\\))))
	(?<es>(?ms)(?&e)(?:\\s*,\\s*(?&e))*)
	)')
	-- ,'(?s)^.+?$','--\\0--'
			,CONCAT('(?#反复应用)','(?isx)^[^(]+?\\(,*?\\K((?&k))(.+?)((?&v))
	(?(DEFINE)
	(?<k>\\w+(?=\\s*,\\s*\\w+|\\)))
	(?<v>("(?:[^\\\\"]|\\\\.)*?"|\\b-?\\d+(?:\\.\\d+)?\\b|NULL)(?=\\s*,\\s*(?-1)|\\)))
	)')
		,'\\2\\3 \\1'
	)
	,'(?mi)^replace.+?values\\(','SELECT '
	,'(?mi)\\)(?=\\s*;\\s*$)',''
	,'(?m);(?=\\s*^SELECT)',' UNION ALL'
)

	WHEN `i` = '反复应用' THEN
		json_array(	'l','多多',
CONCAT('(?xims)^( (?&b)\\( )	((?&es)\\)(?-s).*?(?=\\s*$))(?:(\\s*^)\\g1(?2))*
	(?(DEFINE)
	(?<o>[^"])
	(?<b>(?i)(?&o)+?values)
	(?<e>(?ms)("(?:[^\\\\"]|\\\\.)*?"|null|\\b-?\\d+(?:\\.\\d+)?\\b)(?=\\s*(?:,\\s*(?-1)|\\))))
	(?<es>(?ms)(?&e)(?:\\s*,\\s*(?&e))*)
	)')
	-- ,'(?s)^.+?$','--\\0--'
			,CONCAT('(?#反复应用)','(?isx)^[^(]+?\\(,*?\\K((?&k))(.+?)((?&v))
	(?(DEFINE)
	(?<k>\\w+(?=\\s*,\\s*\\w+|\\)))
	(?<v>("(?:[^\\\\"]|\\\\.)*?"|\\b-?\\d+(?:\\.\\d+)?\\b|NULL)(?=\\s*,\\s*(?-1)|\\)))
	)')
		,'\\2\\3 \\1'
	)	
	
	WHEN `i` = 'replace2create' THEN
json_array('1','接'
		,"done",'抓取'
		-- ,"done",'反复应用'
		,'(?i)^.*?\\K\\)(?=values\\()(?s).+?(?=;\\s*$)',''

		,'(?i)REPLACE\\s*into\\s*(.+)(?=\\()(.+?)(?=;\\s*$)','CREATE TABLE \\1 \\2)'
		,'\\w+(?=\\s*[,)])',CONCAT_WS(' ','\n\\0',' TINYTEXT NULL')
		,'(?i)^CREATE\\s*TABLE(.+?)(?=\\()','DROP TABLE IF EXISTS \\1;\n\\0'		
	)
	
  WHEN i= '抓取' THEN
	JSON_ARRAY('8gu','shibai',	

	o(
		CONCAT_ws(''
								,'(?#抓取)(?xim)^\\s*\\K(?=.+?',CONCAT('\\b(?:',json_value(c,'$[0]'),')\\b)'
								,'((?&b)\\()((?&es)\\).*?(?=\\s*$))(?:\\s*^\\g1(?-1))*,抓取')
								))
					 ,'\\0'

)
	WHEN `i` = '修改t表' THEN 
	json_array('','@ -> ` ',
json_array(	'l','多多',
			CONCAT('(?xms)^\\w+\\s*TABLE\\s*(?&n)\\s*(?&k)
	(?(DEFINE)
		(?<n>
			`?\\b(?:',`c0`,')\\b`?
		)
		(?<k>\\((?:[^()]|(?&k))*?\\))
		(?<o>^[^,\\r\\n]+,)
	)')

,'(?#直接)(?m)varchar\\((\\d+)\\)',' TINYTEXT '

)
)				


WHEN `i` = '百家姓' THEN 
	json_array('',''
		,'\\b\\w\\b,?',''
		,',','|'

)

WHEN `i` = '省市' THEN 
JSON_ARRAY('','',
json_array('','生成省市'
		,'(?:、|，)',','
		, '(?m)^\\s*$\\s*',''
		,'(?m)^(.+?)(\\w+)(?=\\s*$)' ,'\t[\\1[\\2]]'
		, '\\r\\n(?!$)',' ,\n'
		,'(?s)^.+$','[\n\\0\n]'
		,'\\b(?!\\d)\\w+',' "\\0" '
),
json_array('','生成'
		,'(?:、|，)',','
)
)
WHEN `i` = 'jalert' THEN 
	json_array('','jalert` '
			,json_array('1',' ',
			 '(?xm-s)
		(?:^|[\\(\\{]\\s*)
		(?!.*(?://|成功))
		.*?
		\\K((?&关键字))
		
		\\(((?&值))(\\s*,\\s*(?&值))*?(?=\\s*\\))
		
		(?(DEFINE)
			(?<关键字>[\\w\\.]+alert)
			(?<值>(["\'])?.+?\\g-1))','allWarn([\\2\\3]'
				
			)
			,json_array('1',' ',
			 '(?xm-s)
		(?:^|[\\(\\{]\\s*)
		(?=.*(?://|成功))
		.*?
		\\K((?&关键字))
		
		\\(((?&值))(\\s*,\\s*(?&值))*?(?=\\s*\\))
		
		(?(DEFINE)
			(?<关键字>[\\w\\.]*?jalert)
			(?<值>(["\'])?.+?\\g-1))','allNotice([\\2\\3]'
				
			)
)
WHEN `i` = '去注释' THEN 
		json_array('',''
			,o('(?&v)(*SKIP)(*FAIL)|(?&注释),html'),''
)
WHEN `i` = '抓取sample' THEN 
s('抓取sample',0)

WHEN `i` = '印章指纹1' THEN 
JSON_ARRAY('',''
,'\\w+',CONCAT_WS('','"\\0",',CONCAT(c0,'.'),'\\0')
,'^.*?(?=\\s*$)',CONCAT_WS('','JSON_OBJECT(\\0) ' ,CONCAT(c1))
)
WHEN `i` = '过滤企业' THEN 
JSON_ARRAY('',''
,'^\\s*(?>.*往来企业.*|\\d+|法律顾问签字章|netinnet)\\s*$','其它'
,'^(?:.+?\\-|\\d+)',''

)
WHEN `i` = '过滤人' THEN 
JSON_ARRAY('',''
,'^\\s*(?>.*往来企业.*|\\d+|法律顾问签字章|netinnet)\\s*$','某人'
,'(?:^.+?\\-\\s*|\\d+)|电子客票行程单',''

)
WHEN `i` = '过滤签章' THEN 
JSON_ARRAY('',''
,'^.*?(签字).*$','\\1章'



)

WHEN `i` = 'es6' THEN 
JSON_ARRAY('','',
/*		JSON_ARRAY('',CAST('多多' AS CHAR), 
		 o('(?&zfc),es6,i'),
			'(?s)([\'"])(.+)\\g1(?=\\s*$)','`\\2`'			
			,o('(?x)(["\'])\\s*\\+\\s*((?&k))\\s*\\+\\s*\\g{-2},es6'),'${\\2}'
 			,'(?i)\\Q${\\E(null)\\}','\\1'
			,'\\\\\(.)','\\1'
			

		)*/
		JSON_ARRAY('',CAST(' es6 $.post' AS CHAR), 
		 o('\\$\\.post\\s*\\((\\s*(?&zfc)\\s*),\\s*.+?\\(\\s*(\\w+).+(?=\\{)  es6 i')
		 ,'/*es6语法注释\\0*/\nfetch(\\1,{method: "POST"}).then(res=>res.text())\n.then(\\2=>'

/* 			,'(?i)\\Q${\\E(null)\\}','\\1'
			,'\\\\\(.)','\\1'
			
*/
		)
-- 		,JSON_ARRAY('',''		,o('(?x)(?&zs)(*SKIP)(*FAIL)|(["\'])?(\\w+)\\g1:\\s*\\g2,ES6语法'),'\\2')

)



		ELSE NULL 
  END
	)
;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `r4b3`
-- ----------------------------
DROP FUNCTION IF EXISTS `r4b3`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `r4b3`(`p` blob) RETURNS longblob
    NO SQL
`la`:BEGIN
	#Routine body goes here...
	DECLARE i INT(5) DEFAULT NULL;DECLARE y INT(5) DEFAULT NULL;
	DECLARE c0 VARCHAR(200) DEFAULT NULL;
	DECLARE c1 VARCHAR(200) DEFAULT NULL;
	DECLARE c2 VARCHAR(200) DEFAULT CONCAT_WS('/',c1,'bill/');



	DECLARE sign VARCHAR(200) DEFAULT NULL;

  IF NOT json_valid(p) THEN RETURN NULL;  END IF;
	SET i = json_value(p,'$[0]')
			,`c0` = json_value(p,'$[1][0]');

	-- SET sign = CONCAT_WS('','<!--',i,'-->\n'); -- 审计



	RETURN 
	
  CASE i

		WHEN 0 THEN  
		json_array(
'3','去注释','^(.)',CONCAT_WS('','
---
sidebar_position: ',1,'
---
\\1')
)
/*
*/
		ELSE NULL 
  END
;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `r4b_json`
-- ----------------------------
DROP FUNCTION IF EXISTS `r4b_json`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `r4b_json`(`p` blob) RETURNS longblob
    NO SQL
`la`:BEGIN
	#Routine body goes here...
	DECLARE i INT(5) DEFAULT NULL;DECLARE y INT(5) DEFAULT NULL;
	DECLARE c0 VARCHAR(200) DEFAULT NULL;
	DECLARE c1 VARCHAR(200) DEFAULT NULL;
	DECLARE c2 VARCHAR(200) DEFAULT CONCAT_WS('/',c1,'bill/');



	DECLARE sign VARCHAR(200) DEFAULT NULL;

  IF NOT json_valid(p) THEN RETURN NULL;  END IF;
	SET i = json_value(p,'$[0]')
			,`c0` = json_value(p,'$[1][0]');

	-- SET sign = CONCAT_WS('','<!--',i,'-->\n'); -- 审计



	RETURN 
	
  CASE i

		WHEN 0 THEN
JSON_ARRAY(		
		json_array(
'3','c','`[^`]++`'
,'(uuid).*?v4\\(\\)','varchar(200) NOT NULL DEFAULT \\1()'
,'uuid(?=,)','varchar(200) '
,'character varying','TINYTEXT'
-- ,'(?<=,)\\s+CONSTRAINT\\s+"[^"]+"',''
,'"',''
)
,json_array(
'跳','跳','(?s)[^`]*+`([^`]++)`[^`]*+(?=`|$)','\n\\1;\r'

)
)
/*
*/
		ELSE NULL 
  END
;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `r4b_mdjs`
-- ----------------------------
DROP FUNCTION IF EXISTS `r4b_mdjs`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `r4b_mdjs`(`p` blob) RETURNS longblob
    NO SQL
`la`:BEGIN
	#Routine body goes here...
	DECLARE i INT(5) DEFAULT NULL;DECLARE y INT(5) DEFAULT NULL;
	DECLARE c0 VARCHAR(200) DEFAULT NULL;
	DECLARE c1 VARCHAR(200) DEFAULT NULL;
	DECLARE c2 VARCHAR(200) DEFAULT CONCAT_WS('/',c1,'bill/');



	DECLARE sign VARCHAR(200) DEFAULT NULL;

  IF NOT json_valid(p) THEN RETURN NULL;  END IF;
	SET i = json_value(p,'$[0]')
			,`c0` = json_value(p,'$[1][0]');

	-- SET sign = CONCAT_WS('','<!--',i,'-->\n'); -- 审计



	RETURN 
	
  CASE i

		WHEN 0 THEN
JSON_ARRAY(		
	'0','detail','`[^`]++`'
	,'(?s)details(//j*.*?j//)'
,'
<details>
    <summary>details</summary>
\\1
</details>
'
	,'uuid(?=,)','varchar(200) '
	,'character varying','TINYTEXT'
	-- ,'(?<=,)\\s+CONSTRAINT\\s+"[^"]+"',''
	,'"',''
)
/*
*/
		ELSE NULL 
  END
;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `r4b_time`
-- ----------------------------
DROP FUNCTION IF EXISTS `r4b_time`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `r4b_time`(`p` blob) RETURNS longblob
    NO SQL
`la`:BEGIN
	#Routine body goes here...
	DECLARE i varchar(100) DEFAULT NULL;DECLARE y INT(5) DEFAULT NULL;
	DECLARE r  text DEFAULT NULL;
	DECLARE `c0` VARCHAR(200) DEFAULT NULL;
	DECLARE c1 VARCHAR(200) DEFAULT '${pageContext.request.contextPath}';
	DECLARE c2 VARCHAR(200) DEFAULT CONCAT_WS('/',c1,'bill/');



	DECLARE sign VARCHAR(200) DEFAULT NULL;

  IF NOT json_valid(p) THEN RETURN NULL;  END IF;

	SET i = CAST(json_value(p,'$[0]') AS CHAR)
			,`c0` = IFNULL(json_value(p,'$[1][0]'),'"NULL"');

	-- SET sign = CONCAT_WS('','<!--',i,'-->\n'); -- 审计



	RETURN 
	
  CASE 


  WHEN  `i` regexp '^[.\\d]+$' and `i` = 10 THEN

	JSON_ARRAY('1','时间'
	,"17%","13%"
	,@Rjson:='@@前10年@@',`c0`-10
	,@Rjson:='@@前5年@@',`c0`-5
	,@Rjson:='@@前4年@@',`c0`-4
	,@Rjson:='@@前3年@@',`c0`-3
	,@Rjson:='@@前2年@@',`c0`-2
	,@Rjson:='@@前1年@@',`c0`-1
	,'@@年@@',`c0`
	,@Rjson:='@@后1年@@',`c0`+1
	,@Rjson:='@@后2年@@',`c0`+2
	,@Rjson:='@@后3年@@',`c0`+3
	,@Rjson:='@@后5年@@',`c0`+5
	
	,'@@U年@@',REGEXP_replace(m2c(`c0`),'[元拾佰仟万拾佰仟亿拾佰仟万拾佰仟整]','')
	,@Rjson:='@@U后1年@@',REGEXP_replace(m2c(`c0`+1),'[元拾佰仟万拾佰仟亿拾佰仟万拾佰仟整]','')
	,@Rjson:='@@U后5年@@',REGEXP_replace(m2c(`c0`+5),'[元拾佰仟万拾佰仟亿拾佰仟万拾佰仟整]','')

	,@Rjson:='@@S年@@',substr(`c0`,3)
	,@Rjson:='@@S后1年@@',substr(`c0`+1,3)
	,@Rjson:='@@S后5年@@',substr(`c0`+5,3)
	
)	




/*
*/
		ELSE NULL 
  END
;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `r4b_time0`
-- ----------------------------
DROP FUNCTION IF EXISTS `r4b_time0`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `r4b_time0`(`p` blob) RETURNS longblob
    NO SQL
`la`:BEGIN
	#Routine body goes here...
	DECLARE i varchar(100) DEFAULT NULL;DECLARE y INT(5) DEFAULT NULL;
	DECLARE r  text DEFAULT NULL;
	DECLARE `c0` VARCHAR(200) DEFAULT NULL;
	DECLARE c1 VARCHAR(200) DEFAULT '${pageContext.request.contextPath}';
	DECLARE c2 VARCHAR(200) DEFAULT CONCAT_WS('/',c1,'bill/');



	DECLARE sign VARCHAR(200) DEFAULT NULL;

  IF NOT json_valid(p) THEN RETURN NULL;  END IF;

	SET i = CAST(json_value(p,'$[0]') AS CHAR)
			,`c0` = IFNULL(json_value(p,'$[1][0]'),'"NULL"');

	-- SET sign = CONCAT_WS('','<!--',i,'-->\n'); -- 审计



	RETURN 
	
  CASE 


  WHEN  `i` regexp '^[.\\d]+$' and `i` = 0 THEN

	JSON_ARRAY('1','ifa 时间'
	,"\\b2005\\b",`c0`-2
	,'\\b2006(?=(\\d{2,4})?\\b)',`c0`-1
	,'\\b2006(?=年|\\d{1,4}\\b)',`c0`-1
	,'\\b2007(?=(\\d{2,4})?\\b)',`c0`
	,'\\b2007(?=年|\\d{1,4}\\b)',`c0`
,'贰零零柒','贰零贰零'
,'贰零零陆','贰零壹玖'
)	




/*
*/
		ELSE NULL 
  END
;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `r4b_tool`
-- ----------------------------
DROP FUNCTION IF EXISTS `r4b_tool`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `r4b_tool`(`p` blob) RETURNS longblob
    NO SQL
`la`:BEGIN
	#Routine body goes here...  (?#抓取)
	DECLARE i varchar(100) DEFAULT NULL;DECLARE y INT(5) DEFAULT NULL;
	DECLARE r  text DEFAULT NULL;
	DECLARE `c0` VARCHAR(200) DEFAULT NULL;
	DECLARE c1 VARCHAR(200) DEFAULT '${pageContext.request.contextPath}';
	DECLARE c2 VARCHAR(200) DEFAULT CONCAT_WS('/',c1,'bill/');



	DECLARE sign VARCHAR(200) DEFAULT NULL;

  IF NOT json_valid(p) THEN RETURN NULL;  END IF;

	SET i = CAST(json_value(p,'$[0]') AS CHAR)
			,`c0` = IFNULL(json_value(p,'$[1][0]'),'"NULL"');

	-- SET sign = CONCAT_WS('','<!--',i,'-->\n'); -- 审计



	RETURN 
	
  CASE 


	WHEN  `i` = '抓取json' THEN
json_array('百度关键词'
	,JSON_ARRAY(
		'抓','多多抓取'
		,@`r4b2`:= '(?#抓取)<meta name="(?:keywords|description)"[^>]*>'
		,CONCAT_WS('','(?#抓取)',(@`r4b2`:='(?s)((["\'])(?:(?=\\\\).{2}|(?:(?!\\\\|\\g-1).)*+)*\\g-1)')),'\\0'
	,CONCAT_WS('','("[^"]+")(',@`r4b2`,')'),',\\1:\\2'
	)
	,JSON_ARRAY(
		'生成json','生成json'
		,'(?-m)^,','{'
		,'(?-m)"$','"}'
	)
)

	  WHEN  `i` regexp '^[.\\d]+$' and `i` = 10 THEN

	JSON_ARRAY('1','时间'
	,@Rjson:='@@前10年@@',`c0`-10
	,@Rjson:='@@前5年@@',`c0`-5
	,@Rjson:='@@前3年@@',`c0`-3
	,@Rjson:='@@前2年@@',`c0`-2
	,@Rjson:='@@前1年@@',`c0`-1
	,'@@年@@',`c0`
	,@Rjson:='@@后1年@@',`c0`+1
	,@Rjson:='@@后2年@@',`c0`+2
	,@Rjson:='@@后5年@@',`c0`+5
	
	,'@@U年@@',REGEXP_replace(m2c(`c0`),'[元拾佰仟万拾佰仟亿拾佰仟万拾佰仟整]','')
	,@Rjson:='@@U后1年@@',REGEXP_replace(m2c(`c0`+1),'[元拾佰仟万拾佰仟亿拾佰仟万拾佰仟整]','')
	,@Rjson:='@@U后5年@@',REGEXP_replace(m2c(`c0`+5),'[元拾佰仟万拾佰仟亿拾佰仟万拾佰仟整]','')

	,@Rjson:='@@S年@@',substr(`c0`,3)
	,@Rjson:='@@S后5年@@',substr(`c0`+5,3)
	
)	




/*
*/
		ELSE NULL 
  END
;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `r4b_X2mysql`
-- ----------------------------
DROP FUNCTION IF EXISTS `r4b_X2mysql`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `r4b_X2mysql`(`p` blob) RETURNS longblob
    NO SQL
`la`:BEGIN
	#Routine body goes here...
	DECLARE i INT(5) DEFAULT NULL;DECLARE y INT(5) DEFAULT NULL;
	DECLARE c0 VARCHAR(200) DEFAULT NULL;
	DECLARE c1 VARCHAR(200) DEFAULT NULL;
	DECLARE c2 VARCHAR(200) DEFAULT CONCAT_WS('/',c1,'bill/');



	DECLARE sign VARCHAR(200) DEFAULT NULL;

  IF NOT json_valid(p) THEN RETURN NULL;  END IF;
	SET i = json_value(p,'$[0]')
			,`c0` = json_value(p,'$[1][0]');

	-- SET sign = CONCAT_WS('','<!--',i,'-->\n'); -- 审计



	RETURN 
	
  CASE i

		WHEN 0 THEN  
		json_array(
'3','去注释','^(.)',CONCAT_WS('','
---
sidebar_position: ',1,'
---
\\1')
)
/*
*/
		ELSE NULL 
  END
;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `r5`
-- ----------------------------
DROP FUNCTION IF EXISTS `r5`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `r5`(`s` blob,`p` blob) RETURNS longblob
    NO SQL
    DETERMINISTIC
BEGIN
		DECLARE `re`	MEDIUMBLOB DEFAULT NULL;DECLARE `part`	BLOB DEFAULT NULL;DECLARE `r`	VARCHAR(500)DEFAULT
'(?six)^((?:(?:(?:@|\\bas\\s+|\\w\\.)`[^`]+`)|[^`])*?)
(?:((?:(?:(?<![\'"])`)|\\br\\([\'"])((?:(?<=[\'"])`)?(?:\\\\.|[^"`\'])+(?:`(?=[\'"]))?)(?:(?:`(?![\'"]))|[\'"]\\)))|$)';

-- INSERT plogs( Function_Name,summary) SELECT 'r5',CONCAT_WS(',',QUOTE(`s`),QUOTE(`p`));

		IF IFNULL(p,'')='' THEN
				RETURN REGEXP_replace(`s`,REGEXP_REPLACE(`r`,'^\\([^)]+\\)\\K(\\^)',''),'\\1@`\\2`');
		END IF;

		l:LOOP

			SET	`part` = REGEXP_substr(s,r);

			IF IFNULL(`part`,'') = '' THEN LEAVE l; END IF;
-- RETURN j2(p,REGEXP_REPLACE(`part`,`r`,'\\3'));
			SET	`s`	=	REGEXP_REPLACE(`s`,`r`,''),
					`re`	= CONCAT_WS(''
							,`re`	
							,REGEXP_REPLACE(`part`,`r`,'\\1')
							,CASE		WHEN REGEXP_REPLACE(`part`,`r`,'\\2') = '' THEN NULL
											WHEN `part` REGEXP '(?i)\\br\\((?:"(?:\\\\.|[^"])+"|\'(?:\\\\.|[^\'])+\')\\)$' THEN 
											IF(IFNULL((@r5part := json_QUOTE(r(REGEXP_REPLACE(`part`,`r`,'\\3')))),'') <> '' 
												,@r5part
												,REGEXP_REPLACE(`part`,`r`,'\\2'))
									ELSE IF((@r5part := REGEXP_REPLACE(`part`,`r`,'\\3')) REGEXP '^p1$'
											,j0(`p`,@r5part), 
											j2(`p`,@r5part))
								END
						);
		END loop;
		
		RETURN 
REGEXP_replace(CONCAT_WS('',`re`,`s`),'(?mxs)
^((?&s)-{2}[ 	]+((["])(?>[^\\\\"]|\\\\.)*?\\g-1|\\w+)(?&s):(?&s))(?!\\g-2)(?-2).*?$
\\K.*?(?=(?-3)|(?-m)$)
(?(DEFINE)(?<s>[ 	]*))','')
		;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `R6`
-- ----------------------------
DROP FUNCTION IF EXISTS `R6`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `R6`(`s` blob,`p` varchar(2000)) RETURNS mediumblob
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	DECLARE `result`	MEDIUMBLOB DEFAULT NULL;
	DECLARE `part`	BLOB DEFAULT NULL;
	DECLARE `r`	VARCHAR(2000)DEFAULT  '(?s)^(.*?)`(.*?)`';

	l:LOOP
		SET	`part` = REGEXP_substr(s,r);
		IF IFNULL(`part`,'') = '' THEN LEAVE l; END IF;

		SET	`s`	=	REGEXP_REPLACE(s,r,''),`result`	= CONCAT_WS('',`result`,REGEXP_REPLACE(`part`,r,'\\1'),j0(p,REGEXP_REPLACE(`part`,r,'\\2')));

	END loop;
	
	RETURN CONCAT_WS('',`result`,`s`) ;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `r7`
-- ----------------------------
DROP FUNCTION IF EXISTS `r7`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `r7`(`p` blob) RETURNS text CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
l:BEGIN
	#Routine body goes here...
	DECLARE `pageno` VARCHAR(8) DEFAULT j0(p,'pageno');
	DECLARE `rm` VARCHAR(2000) DEFAULT '[^<]+<[^>/]*\\d)(/>[^<]+';


/*
start TRANSACTION;
SET @DBLOB = p;
CALL Audit_2('r7',quotej(p),@dblob);COMMIT;
LEAVE l;*/

		SET @billid := j0(p,'billid') 
		,@max_page := j0(p,'max_page')
		,@type = j0(p,'type');

SET
`pageno` := 
CASE 
WHEN IFNULL(`pageno`,'')=0 THEN RPAD(1,@max_page,1)
WHEN `pageno` = '1' THEN RPAD(1,@max_page,0)
WHEN `pageno` REGEXP '^[01]+$' THEN SUBSTR(`pageno`,1,@max_page)
ELSE RPAD(LPAD(1,`pageno`,0),@max_page,0) END 

,`rm`:= REPLACE(REPLACE(`pageno`,'1',`rm`),'0',REPLACE(`rm`,')(',''))
,@`replace` := REPLACE(`pageno`,'0','');

		CASE 
				WHEN  IFNULL(@type,'')='' THEN 
					SET @`replace` = CONCAT(`pageno`,'11'),
							`rm`:= IF(`pageno` IS NULL ,'(',CONCAT('(?=\\s+pag[^<]+)(',`rm`)), 
							@rb = CONCAT('(',@billid ,'[^"]+")'),
							@ra = '.*?>"\\}\')';
				WHEN @type = 3 THEN 
					SET `rm` = REGEXP_replace(`rm`,'\\Q(/>[^<]+\\E$',''),
							@rb ='(',@ra = NULL;
	
		END CASE;

-- RETURN `rm`;
		SET @replace := 
			CASE @replace
					WHEN '11' THEN REGEXP_replace('12','(\\d)','$\\1\tselected=selected')
					WHEN '111' THEN REGEXP_replace('123','(\\d)','$\\1\tselected=selected')
					WHEN '1111' THEN REGEXP_replace('1234','(\\d)','$\\1\tselected=selected')
					WHEN '11111' THEN REGEXP_replace('12345','(\\d)','$\\1\tselected=selected')
					WHEN '11111' THEN REGEXP_replace('123456','(\\d)','$\\1\tselected=selected')
					WHEN '111111' THEN REGEXP_replace('1234567','(\\d)','$\\1\tselected=selected')
				ELSE REGEXP_replace('12345678','(\\d)','$\\1\tselected=selected')
			END 


,@r := CONCAT_WS('',@rb,`rm`,@ra) ;


	RETURN c(COLUMN_json(COLUMN_create('reg',@r,'replacement',@replace,'replacem',REPLACE(@replace,'$','\\'))));
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `R8`
-- ----------------------------
DROP FUNCTION IF EXISTS `R8`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `R8`(c varchar(200)) RETURNS blob
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	-- DECLARE d BLOB DEFAULT NULL;
	SET @d = NULL; 
	RETURN 	(
SELECT
dblob
FROM(
SELECT
@d:=COLUMN_create('sql',CONVERT( `BLOB`USING gbk)),
IF(IFNULL(parameter,'') = '' ,NULL,@d:=COLUMN_add(@d,'parameter',CONVERT(
CASE WHEN (@r8 := REGEXP_substr( `parameter` , CONVERT('(?m)^\\s*(?:用|using)\\s+\\K[\\w]+' USING gbk))) <> ''  THEN 
(SELECT a.`parameter` FROM mysq1_schema.qs AS a WHERE a.`name` = @r8)
ELSE a.`parameter` END USING gbk))),

IF(IFNULL(`sql`,'') = '' ,NULL,@d:=COLUMN_add(@d,'s',CONVERT(
CASE WHEN (@r8 := REGEXP_substr(`SQL` , CONVERT('(?m)^\\s*(?:用|using)\\s+\\K[\\w]+' USING gbk))) <> ''  THEN 
REGEXP_replace(`SQL`  , CONVERT('(?m)^\\s*(?:用|using)\\s+[\\w]+' USING gbk),
(SELECT a.`sql` FROM mysq1_schema.qs AS a WHERE a.`name` = @r8)
)
ELSE a.`sql` END USING gbk))),

IF(IFNULL(a.`name0`,'') = '' ,NULL,@d:=COLUMN_add(@d,a.`name0`,CONVERT(a.blob0 USING gbk))),
IF(IFNULL(a.`name1`,'') = '' ,NULL,@d:=COLUMN_add(@d,a.`name1`,CONVERT(a.blob1 USING gbk))),
IF(IFNULL(a.`name2`,'') = '' ,NULL,@d:=COLUMN_add(@d,a.`name2`,CONVERT(a.blob2 USING gbk))),
IF(IFNULL(a.`name3`,'') = '' ,NULL,@d:=COLUMN_add(@d,a.`name3`,CONVERT(a.blob3 USING gbk))),
IF(IFNULL(a.`name4`,'') = '' ,NULL,@d:=COLUMN_add(@d,a.`name4`,CONVERT(a.blob4 USING gbk))),
IF(IFNULL(a.`name5`,'') = '' ,NULL,@d:=COLUMN_add(@d,a.`name5`,CONVERT(a.blob5 USING gbk))),
@d AS dblob
FROM `mysq1_schema`.qs AS a 
WHERE IFNULL(a.`name`,'') <> ''  AND  a.`name` = c
-- CONCAT_WS('',a.`schema`,a.`subject`,a.`name`) REGEXP c
)AS a
);

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `R9`
-- ----------------------------
DROP FUNCTION IF EXISTS `R9`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `R9`(c varchar(200)) RETURNS mediumblob
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	-- DECLARE d BLOB DEFAULT NULL;
	SET @d = NULL; 
	RETURN 	(
SELECT
dblob
FROM(
SELECT
@d:=COLUMN_create('sql',CONVERT(
IF(IFNULL(`SQL`,'') = '', `blob`
,REGEXP_replace(`blob`,'(?i)(?<=FROM)\\s*(?:\\(\\s*)?`SQL`(?:\\s*\\))?(?=\\s*as\\s+[\\w]\\b)'
,IF(`SQL` REGEXP '(?i)\\bselect\\b',CONCAT_WS('\n','\\1(','-- Start',`sql`,'-- End',')'),CONCAT_WS('\n','\\1',`sql`))
))
USING gbk)/**/ ),
IF(IFNULL(a.`name0`,'') = '' ,NULL,@d:=COLUMN_add(@d,a.`name0`,CONVERT(a.blob0 USING gbk))),
IF(IFNULL(a.`name1`,'') = '' ,NULL,@d:=COLUMN_add(@d,a.`name1`,a.blob1)),
IF(IFNULL(a.`name2`,'') = '' ,NULL,@d:=COLUMN_add(@d,a.`name2`,CONVERT(a.blob2 USING gbk))),
IF(IFNULL(a.`name3`,'') = '' ,NULL,@d:=COLUMN_add(@d,a.`name3`,CONVERT(a.blob3 USING gbk))),
IF(IFNULL(a.`name4`,'') = '' ,NULL,@d:=COLUMN_add(@d,a.`name4`,CONVERT(a.blob4 USING gbk))),
IF(IFNULL(a.`name5`,'') = '' ,NULL,@d:=COLUMN_add(@d,a.`name5`,CONVERT(a.blob5 USING gbk))),
@d AS dblob
FROM `mysq1_schema`.qs2 AS a 
WHERE IFNULL(a.`name`,'') <> ''  AND CONCAT_WS('',a.`schema`,a.`subject`,a.`name`) REGEXP c
)AS a
);

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `refil`
-- ----------------------------
DROP FUNCTION IF EXISTS `refil`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `refil`(`cid` varchar(60)) RETURNS varchar(60) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	

	RETURN replace(trim(cid),'netinnet','qianxue');
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `REG`
-- ----------------------------
DROP FUNCTION IF EXISTS `REG`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `REG`(`funid` varchar(99)) RETURNS varchar(200) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...

	RETURN	CONCAT('/',CASE funid
			WHEN 'R1'   THEN CONCAT_WS('',REG1('`R11`' ),REG1('`R12`'),REG1('`R13`'))
						-- r a.$2=$3 1234，
			WHEN '""' THEN REG1('`""`')
			WHEN 'json' THEN REG1('`json`')
			WHEN '2num' THEN REG1('`2num`' )
			WHEN '2col' THEN REG1('`2col`' )
			WHEN '2c'	THEN REG1('`2c`')
			WHEN 'index'	THEN '\\s*[\\d-]*+' 
			WHEN '一'	THEN '^(?:\\s)*(一|二|三|四|五|六|七|八|九|十|〇)*(?:(、|：|\\,)?)'
			WHEN 'k(rv)-$2,'	THEN '(?:("(?:[^\\\\"]|\\\\{2}|\\\\"|\\\\)*+"):)?((?1))(:{|,)?'
			WHEN 'rv-($1)\n'	THEN '(?:{?)((?:"(?:[^\\\\"]|\\\\{2}|\\\\"|\\\\)*+",?)*)(?:,})(?:}?)'
			WHEN 'rnv-$1$3' THEN	'(\\(("(?:[^\\\\"]|\\\\{2}|\\\\"|\\\\)*+"),)((?:(?2),?){3}\\))'
			WHEN 'fields' THEN REG1('`fields`')
			WHEN 'keyvalue'THEN REG1('`keyvalue`')
		ELSE NULL 
  END,'/');
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `REG1`
-- ----------------------------
DROP FUNCTION IF EXISTS `REG1`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `REG1`(`funid` varchar(99)) RETURNS varchar(1000) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	RETURN	CASE funid
			WHEN '`R11`' 	THEN '(?:\\{?)' 
					-- 0 
			WHEN '`R12`' 	THEN '("((?:[^\\\\"]|\\\\{2}|\\\\"|\\\\)*+)")'
						-- 1 "2"
      WHEN '`R13`'	THEN '(?::(((?R1))\\,?)(?:\\}?))'
						--  1, 2
			WHEN '`""`'	THEN '"((?:[^\\\\"]|\\\\.)*)"'
			WHEN '`"`'	THEN '(?J)(?<c0>"(?<c>(?:\\\\.|[^"])*)")'
			WHEN '`q`'	THEN '(?J)(?<c0>(?:(?<d>")|(?<s>\'))(?(d)(?<c>(?:\\\\.|[^"])*)"|(?(s)(?<c>(?:(\\\\.)|[^\'])*)\')))'
			WHEN '`{}`'	THEN '(?J)(?<a>(?:\\s*)\\{(?:\\s*)(?<c0>(?<k>(?:"(?<c>(?:[^\\\\"]|\\\\.)*)")(?:\\s*):(?:\\s*)(?:"(?&c)"|(?&a)))?(?:(?:\\s*),(?:\\s*)(?&k))*)\\})'
					-- "0" 1
			WHEN '`dom`' THEN '(?iJx)(?:\\s*<(?:(?<TAG>TEXTAREA)|form[^>]*|[!\\w]+|!--[^>]*--|%[^%]*+%)(?:\\s+(?:(?:name=(?<n>(?<cm>(?(?=")(?:"(?:\\\\.|[^"])*")|(?(?=\')(?:\'(?:\\\\.|[^\'])*\')|[^\\s\\>]+))))|value=(?<v>(?&cm))|(?<r>readonly|[\\w\\-\\/%]+|(?:"(?:\\\\.|[^"])*")|\\p{P})|[\\w\\-]+=(?&cm))\\s*?)+)?>(?<v1>(?(TAG)[^<]*))(?:[^<]*</\\w+>)*)(?:[^<]*(?:</?\\w+>)*)*'
			WHEN '`dom1`' THEN '(?imxJ)(?:<(?(?=input(?!(?:"(?:\\\\.|[^"])*"|[^>])*?type=["\']?hidden["\']?))(?:(?:(?<f>"(?:\\\\.|[^"])*"|[^>])*?)(?:(?:(?<=(?<!\\.)value=)(?:"(?<qv>(?:\\\\.|[^"])*)"|(?<nqv>[^\\s\\>]+)))|(?:(?<=name=)(?:"(?<q>(?:\\\\.|[^"])*)"|(?<nq>[^\\s\\>]+))))){2}(?&f)*?|(?&f)*?)>[^<]*+)'
			WHEN '`kvnull`' THEN '(?:""(?::""){1,},?)++'
			WHEN '`kvq`' THEN '("\\w+":)(?:"("(?:\\\\.|[^"])*")")'
			WHEN '`geta`' THEN '(?iJ)(?:(?<s>"a\\d{1,2}":(?<q>"(?:\\\\.|[^"])*"),?)|(?:(?&q):(?&q),?))'
			WHEN '`getb`' THEN '(?iJ)(?:(?<s>"b\\d{1,2}":(?<q>"(?:\\\\.|[^"])*"),?)|(?:(?&q):(?&q),?))'
			WHEN '`gett`' THEN '(?iJ)(?:(?<s>"t\\d{1,2}":(?<q>"(?:\\\\.|[^"])*"),?)|(?:(?&q):(?&q),?))'
			WHEN '`bsamp`' THEN '(?iJ)(?<r1>(?<k>"\\w+")(?<c>:"(?:\\\\.|[^"])*"),?)(?(?=\\k<k>)(?<r>(?:\\k<k>(?&c),?)*)|(?<r>(?:(?!\\k<k>)"\\w+"(?&c),?)*))(?:,$)?'
			WHEN '`bsamp0`' THEN '(?J-sm)^(?<r1>(?<k>"\\w+")(?<c>:"(?:\\\\.|[^"])*"))(,\\k<k>(?&c))'
			WHEN '`row&b0`'		THEN '(?J-sm)^(?<r1>(?<k>"\\w+")(?<c>:"(?:\\\\.|[^"])*")),\\k<k>(?&c)'
			WHEN '`row&b1`' THEN '(?<k>"\\w+"):"(?:\\\\.|[^"])*"(?(?!,\\k<k>),"\\w+":"(?:\\\\.|[^"])*")*' 
			WHEN '`row&b2`' THEN '(?<k>"\\w+"):"(?:\\\\.|[^"])*"(?(?!,\\k<k>),"\\w+":"(?:\\\\.|[^"])*")*' 
			WHEN '`-geta`' THEN '(?iJ)(?:,?(?<s>"a\\d{1,2}":"readOnly",?)|(?:"a\\d{1,2}":(?:"(?:\\\\.|[^"])*"),?))'
			WHEN '`getai`' THEN '(?iJ)(?:,?(?<f>"a\\d{1,2}":"readOnly",?)|(?:,?(?<q>"(?:\\\\.|[^"])*"):(?&q)))'
			WHEN '`getbi`' THEN '(?iJ)(?:,?(?<f>"b\\d{1,2}":"readOnly",?)|(?:,?(?<q>"(?:\\\\.|[^"])*"):(?&q)))'
			WHEN '`kv`' 	THEN '(?:[{]?)(?<k>"(?<k1>(?:\\\\.|[^"])*)")(?<:>:)(?<v>"(?<v1>(?:\\\\.|[^"])*)")'
			WHEN '`k=v`' 	THEN '(?:[{]?)(?<k>"(?<k1>(?:\\\\.|[^"])*)")(?<:>:)(?<v>"(?<v1>(?:\\\\.|[^"])*)")'
			WHEN '`kv-k`'	THEN '(?iJ)(?:(?&v):)(?<v>"(?<v1>(?:\\\\.|[^"])*)")'
			WHEN '`kv-v`'	THEN '(?iJ)[{]?(?<d>,?)(?<v>"(?<v1>(?:\\\\.|[^"])*)")(?::(?&v))[}]?'
			WHEN '`+v`'		THEN '(?:(?<r>"(?:\\.|[^"])*"):(?<r3>{(?<r1>(?<r0>(?&r)|(?&r3))(?:,(?&r0))*)}))|(?<r2>(?&r1))(?!:)'
			WHEN '`,`'		THEN	'(?:(?:"(?:\\\\.|[^"])*"))\\K,+(?=\\})|,+(?=$)|(?<=^|\\{),+'
			WHEN	'`j-0`'	THEN clearj('
(\\{(
("(?:[^\\\\"]|\\\\.)*"):((?3)|(?1))(,(?2))*
)*\\})
')
			WHEN '`json`' THEN clearj('
(\\{(
("(?:\\\\.|[^\\"])*"):((?3)|(?1))(,(?2))*
)*\\})
')
			WHEN	'`json1`'	THEN '(?J)((?>(?:"(?<c>(?:[^\\\\"]|\\\\.)*)")|(?<a>(?:\\s*)\\{(?:\\s*)(?<c>(?<k>(?:"(?<c>(?:[^\\\\"]|\\\\.)*)")(?:\\s*):(?:\\s*)(?:"(?&c)"|(?&a)))?(?:(?:\\s*),(?:\\s*)(?&k))*)\\})))'
			WHEN '`2num`'	THEN '(?:\\w?\\.)?b(\\d{1,3},?)[\\s]*'
			WHEN	'`2col`'		THEN '((`?[^,]+`?)(,?))'
      WHEN  '`2c`' THEN '([^\\,]+)(,?)'
			WHEN '`〇-九`'	THEN '(一|二|三|四|五|六|七|八|九|十|〇)'
			WHEN '`fields`' THEN '((?:(?(?=`)(?:`[^`]+`)|(?:[^\\s,`]+))\\.)?((?(?=`)(?:`[^`]+`)|(?:[^\\s,\\.`]+))(?=,|$)))'
			WHEN '`keyvalue`' THEN '((?3))(:)("(?:[^\\\\"]|\\\\{2}|\\\\"|\\\\)*+")'
			WHEN '`KV-2`' THEN '(?2):((?:{(?:(?2):(?2),?)*})|("(?:[^\\\\"]|\\\\{2}|\\\\"|\\\\)*+"))'

		ELSE NULL 
  END;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `REG2`
-- ----------------------------
DROP FUNCTION IF EXISTS `REG2`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `REG2`(`funid` varchar(99)) RETURNS varchar(10000) CHARSET utf8mb3
    NO SQL
BEGIN
	#Routine body goes here...
	RETURN	CASE funid
			WHEN '`Dom2kw`' THEN 
CONCAT_WS('\n'
,CONCAT_WS('\t',REG1('`dom`'),'\t', '"\\3":"\\4\\6",')
,CONCAT(REG1('`kvnull`'),'\t', '')
,CONCAT(REG1('`kvq`'),'\t','\\1\\2')
,'\n')
			WHEN '`Dom2kwn`' THEN 
CONCAT_WS('\n'
,CONCAT(r('body'),'\tcap')
,CONCAT(rs('script,style,jtag,`anno`'),'\t')
,r('dom\t')
,r('kvnull')
,'\n')
			WHEN '`Dom2kw1`' THEN 
CONCAT_WS('\n'
,r('dom1\t')
,r('kvnull1')
,'\n')
			WHEN '`geta`' THEN CONCAT_WS('\n',CONCAT(REG1('`geta`'),'\t', '\\1'))
			WHEN '`getaf`' THEN 
CONCAT_WS('\n'
,CONCAT('j\ta')
,CONCAT(r('`bsamp`\tcap'))
,CONCAT(r('`kv-v`\t'))
)
			WHEN '`getai`' THEN
CONCAT_WS('\n',
CONCAT(REG1('`getai`'),'\t', '\\1')
,'\n')
			WHEN '`getb`' THEN CONCAT_WS('\n',CONCAT(REG1('`getb`'),'\t','\\1\n'))
			WHEN '`getbf`' THEN 
CONCAT_WS('\n'
,CONCAT('j\tb')
,CONCAT(r('`bsamp`\tcap'))
,CONCAT(r('`kv-v`\t'))
)
			WHEN '`getbi`' THEN
CONCAT_WS('\n'
,CONCAT(REG1('`getbi`'),'\t','\\1')
-- ,CONCAT(REG1('`row&b`'),'\t','{"rowno":"",\\1},')
,'\n')
			WHEN '`gett`' THEN CONCAT_WS('\n',CONCAT(REG1('`gett`'),'\t', '\\1'))
			WHEN '`gettf`' THEN 
CONCAT_WS('\n'
,CONCAT('j\tt')
,CONCAT(r('`bsamp`\tcap'))
,CONCAT(r('`kv-v`\t'))
)
			WHEN '`,`' 		THEN CONCAT(REG1('`,`'),'\t','')
			WHEN '`fields1`' THEN 
CONCAT_WS('\n'
,CONCAT('(?:"(?<c>(?:[^\\\\"]|\\\\.)*)")(?::)(?:"")','\t','"\\1:",quotd(\\1)')
,CONCAT('(?:"(?<c>(?:[^\\\\"]|\\\\.)*)")(?::)(?:"(json)")','\t','"\\1:",quotd(COLUMN_\\2(\\1))')
,CONCAT('^{|}$','\t','')
,'\n'
)
		WHEN '`fields2`'	THEN
CONCAT_WS('\n' 
,CONCAT('("((?&c))")(?::)',R1('`json1`'),'	','\\2=\\3\r')
,CONCAT(REG1('`{}`'),'\t','COLUMN_CREATE(\\2)')
,CONCAT('("((?&c))")(?::)',R1('`json1`'),'\t','\\1,\\3 AS CHAR')
,CONCAT('^{|}$','\n'))

		WHEN '`where`' THEN
CONCAT_WS('\n'
,CONCAT('(?:"(?:func|table)")(?::)(?:"(?:(?:[^\\\\"]|\\\\.)*)"),?','\t','')
,CONCAT('(?:{?"((?:[^\\"]|\\.)*)")(?::)("(?:[^\\"]|\\.)*")(?:,?}?)','\t','and \\1=\\2'),'\n'
)

		ELSE NULL 
  END;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `regex`
-- ----------------------------
DROP FUNCTION IF EXISTS `regex`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `regex`(`v` varchar(2000),`r` varchar(200),`a` varchar(2000)) RETURNS blob
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...

	RETURN REGEXP_replace(v,CONCAT("(\\Q",r,"\\E)"),CONCAT("\\1",REPLACE(a,'\\','\\\\')));
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `replace_set_0`
-- ----------------------------
DROP FUNCTION IF EXISTS `replace_set_0`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `replace_set_0`(`vstring` varchar(800),`tem` varchar(30)) RETURNS varchar(400) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...

	IF Tem IS null then  SET  tem = ',';ELSE SET tem =CONCAT(',',tem); END IF;
	case 
		 WHEN IFNULL(vstring ,'') = '' THEN RETURN null;
      
     WHEN  SUBSTRING(vstring , 1,1) != ',' THEN
					SET vstring = CONCAT(',',vstring);
		ELSE 
				SET vstring = trim(vstring);
	END CASE;
	SET vstring = REPLACE(vstring,',',tem);
	SET vstring = TRIM(',' FROM vstring);
	
	RETURN vstring;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `RS`
-- ----------------------------
DROP FUNCTION IF EXISTS `RS`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `RS`(`k` varchar(2000)) RETURNS varchar(2000) CHARSET utf8mb3
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	DECLARE r varchar(2000) DEFAULT NULL;

	IF IFNULL(`k`,'')='' THEN RETURN r; END IF;
	IF k REGEXP '^"|"$' THEN
		SET `k` = REGEXP_replace(`k`,r('-q'),'"\\1"');
	END IF;
		

	SET r = ( SELECT a.Regs FROM mysq1_schema.regs AS a WHERE  a.stat IS NULL  AND INSTR(`k`,a.`code`));
	IF FOUND_ROWS() = 0 THEN
		BEGIN
			DECLARE r0 varchar(2000) DEFAULT NULL;
			DECLARE c varchar(2000) DEFAULT NULL;
				SELECT
				GROUP_CONCAT(a.`Code` ORDER BY FIND_IN_SET(a.`code`,f2(r('-q\t'),k))) ,
				GROUP_CONCAT( 
					IF(a.`Code` REGEXP '^`[^`]*`$', CONCAT("(?:", a.Reg, ')'),NULL)
						ORDER BY FIND_IN_SET(a.`code`,f2(r('-q\t'),k)) SEPARATOR '|' ),
				GROUP_CONCAT( 
					IF(NOT a.`Code` REGEXP '^`[^`]*`$', CONCAT("(?:", a.Reg, ')'),NULL)
						ORDER BY FIND_IN_SET(a.`code`,f2(r('-q\t'),k)) SEPARATOR '|' )
		INTO c,r0,r
				FROM  mysq1_schema.reg AS a
				WHERE INSTR(k,quote_d(a.`Code`));

				SET r = CONCAT_WS('|',r0,REGEXP_replace(r,'(<(?<k>\\w+)\\Q[^>]*>(?:\\E)(\\Q(?:</\\E\\k<k>>)',
			 CONCAT_WS('','\\1',REPLACE(REGEXP_replace(c,'(?:\\w+|[,\\s"\'])|(?:`([^`]*)`)','(?&\\1)'),'(?&)',''),'|\\3'))) ;

			INSERT INTO mysq1_schema.regs (`CODE`,`REGs`)
			SELECT 	c,r;

		END;
	END IF;

	IF r IS NOT NULL THEN SET k = r; END IF;

	RETURN		`k`;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `r_com_arr`
-- ----------------------------
DROP FUNCTION IF EXISTS `r_com_arr`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `r_com_arr`(`b` longtext,`av` longtext) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
/*
'"\'1\',\'12\'"','"\'1\',\'材料采购\'","\'2\',\'应交税费\'","\'3\',\'其他货币资金\'"'
'"\'1\',\'其他货币资金\',\'12\'"','"\'1\',\'材料采购\'","\'2\',\'应交税费\'","\'3\',\'其他货币资金\'"'
'"\'2\',\'22\'"','"\'2\',\'应交税费\'","\'3\',\'其他货币资金\'"'
*/
	DECLARE y TINYINT DEFAULT 0 ;DECLARE x TINYINT DEFAULT 0;
	DECLARE i TINYINT DEFAULT 0 ;
	DECLARE r LONGTEXT DEFAULT NULL;DECLARE ra LONGTEXT DEFAULT '';
	
	y:LOOP
		SET y = y + 1,x = 0,i = 0;
				

		IF  ra IS NULL OR ra = preg_capture('/(?<!\\\\)\"\'\\d+\',\'.*?(?<!\\\\)\'\"/',av,0,y)  THEN RETURN NULL; END IF;

		SET ra = preg_capture('/(?<!\\\\)\"\'\\d+\',\'.*?(?<!\\\\)\'\"/',av,0,y);

		x:LOOP
			SET	x = x+1,
					r = Fetch_x(x,ra);

			CASE
					WHEN  r IS NULL  THEN  LEAVE x;
					WHEN  r = 'NULL' OR ''  THEN  ITERATE x;
					WHEN fetch_x(x,b) REGEXP r THEN SET i = i+1;
				ELSE ITERATE y;
			END CASE;

		END LOOP x;
  IF i = x-1 THEN  RETURN ra;END IF;

	END LOOP y;

RETURN ra;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `s`
-- ----------------------------
DROP FUNCTION IF EXISTS `s`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `s`(`p` longblob,action TINYTEXT) RETURNS longblob
    DETERMINISTIC
BEGIN#Routine body goes here...
	DECLARE
		path,id,id1,id2,`mod` TINYTEXT DEFAULT NULL;
	DECLARE r  TINYTEXT  DEFAULT '(?:^|([\\s,]+\\-?\\w+)*)\\s*$'  ;
	DECLARE
		次数 int(5) DEFAULT 0;
		



	IF  action  IS NULL ||  action = '0'   THEN
	
		SET R =  CONCAT( '\\s*,\\s*(?:\\w+|\\$?(?:\\.\\w+|\\[\\d+\\])+)(?:\\s*,\\s*\\-\\d+)?(?=\\s*$)' );
	
		SET action = IF(CHAR_LENGTH(p)>200, SUBSTR(p,CHAR_LENGTH(p)-200),p);


		SET action   = REGEXP_substr(action , R),
				p  =  REGEXP_replace(p,  r,'');
		
	END IF ; 

SET `mod` = REGEXP_substr(action,@s专用:= '[\\s,]+\\-\\d'),action=REGEXP_replace(action,@s专用,'');  



	多个动作:WHILE  次数=0  DO
	SET 次数 = 1;
	CASE
			WHEN action  REGEXP  @szy:='^\\s*(?:2|p(?:ath)?|l(?:oad)?)' THEN

				SET id = p;
			
				IF action  NOT REGEXP 'i\\s*$'THEN    
					SET  p = ( SELECT J  FROM mysq1_schema.JSON AS j WHERE j.id = id );


				END IF ;

				IF  (NOT FOUND_ROWS() || action  REGEXP 'i\\s*$') && action  REGEXP @szy  THEN 

					SET  p = JSON_ARRAY(id,'载入',cast(LOAD_FILE(convert(id USING gbk)) AS CHAR)),

							 action = 'insert',次数 = 0;
					ITERATE 多个动作;
				END if;

				RETURN p;
			
			WHEN action  REGEXP  '(?i)^\\s*(?:D(?:EL(?:ETE)?)?)' THEN
				SET id1 = p;
				
				DELETE a.* FROM mysq1_schema.json  AS a  WHERE a.id = id1; 
				
				RETURN FOUND_ROWS();
			WHEN action  = '3' THEN
				SET action := REGEXP_substr(p,@自用:= '[\\s,]+(\\w+)$'),
						p = REGEXP_replace(p,@自用,''),
						action  = REGEXP_replace(action,@自用,'\\1');
				RETURN p;

		WHEN action  REGEXP '^\\s*(?:5|replacemant)\\s*$' THEN

		set p =  REGEXP_substr(p,'\\.\\K\\w+$');		
		SET p =o1(p,null);
		
		WHEN action  REGEXP '^\\s*(?:4|写出)\\s*$' THEN

				SET id := p ;
	-- 			SELECT 	a.j  INTO DUMPFILE  @id 	 FROM     mysq1_schema.json AS a  WHERE 	a.id = id;
					

				RETURN  '写出';

			WHEN action  REGEXP '(?i)^\\s*,?\\s*(?:I(:NSERT)?|1)' THEN

					IF json_length(p) = 4 THEN SET id2 =json_value( CAST(p AS CHAR),'$[2]') ,p = json_remove(p,'$[2]'); END IF;

					SET id = IF(JSON_value( p, '$[0]' ) REGEXP '(?i)(%[a-z0-9]{2}){2,}' ,urldecode(JSON_value( p, '$[0]' )),JSON_value( p, '$[0]' ));

					IF IFNULL(id ,'')='' THEN  SIGNAL SQLSTATE 'HY000' SET MYSQL_ERRNO =123456 , MESSAGE_TEXT = '无主键';END IF;    				
					SET id1 = 	JSON_value(p,'$[1]'),p= json_value(p,'$[2]');
		
					SET p = CASE 
											WHEN  json_valid(p) THEN
												case 	WHEN JSON_DEPTH(p)=1 AND p REGEXP '^\\s*"' THEN  JSON_UNQUOTE(CAST(p AS CHAR))
															WHEN JSON_DEPTH(p)>1 AND JSON_LENGTH(p) = 1 THEN json_extract(p,'$[0]') 
													ELSE p 
												END
											ELSE p  
									END;

					SET p = IF(`mod` REGEXP '-'  
													,REGEXP_replace(p,'(?-m)^\\s*.*?(?=\\s*(?m)$)','')
													,p);

					SET @s专用 = (SELECT a.id FROM mysq1_schema.`JSON` AS a  WHERE  a.id = id);	

					IF FOUND_ROWS() THEN
						UPDATE  mysq1_schema.JSON  AS a  
								 SET 	j =  p,stamptime = now()
						WHERE  a.id = id;
					ELSE

						INSERT INTO mysq1_schema.JSON ( id, id1,id2, j )
							VALUES 	(id,id1,CAST(id2 AS CHAR),p);
					END if;



			ELSE 

			IF action REGEXP '^\\s*f\\s*' THEN SET path = null,`mod` = 'f' ;ELSE SET PATH =  action; END IF ;
			

			SET path =
				CASE
						WHEN path REGEXP '\\$' THEN path 
						WHEN path REGEXP ( @SR := '^\\$?\\[' ) THEN
						REGEXP_REPLACE ( path, '^\\$?\\[', '$[' ) 
						WHEN path REGEXP @SR := '^\\$?(\\w)' THEN
						REGEXP_REPLACE ( path, '^\\$?(\\w)', '$.\\1' ) ELSE CONCAT( '$', path ) 
				END;

			SET id = p;
		SET  p = ( SELECT J  FROM mysq1_schema.JSON AS j WHERE j.id = id );

      IF  NOT FOUND_ROWS()  THEN   
					-- QUOTE(REGEXP_replace(o('(?&path) path'),'\\s+',''))
					IF   id REGEXP '(?i)^\\s*\\[a-zA-Z]:[/\\\\]' &&  id REGEXP  '(?x)(?&path)(?(DEFINE)(?<w>^(?&分割)?[w]\\K(?:(?&分割)(?&path0))+)(?<头>(?i)(?:(?:[a-z]|https?)\\:)?+)(?<分割1>/+)(?<分割2>[\\\\]+)(?<分割>(?:(?&分割1)|(?&分割2)))(?<path0>[^\\\\/]+)(?<path1>(?&头)(?:(?&分割1)(?&path0))+)(?<path2>(?&头)(?:(?&分割2)(?&path0))+)(?<path>(?&头)(?:(?&分割)(?&path0))+)(?<url>https?(?:(?&分割2)(?&path0))+))' THEN
					SET action = 'path',p = id,次数=0 ;  iterate 多个动作;
					END IF;
				RETURN "no_ROWS";
			END if;

			SET  P = IF(JSON_VALID(P),JSON_EXTRACT(P,PATH ) ,P); 
	END CASE;

	SET action = REGEXP_replace(action ,'^[\\s,]+\\w+',''); 
	END while 多个动作;


SET  p =  CASE 
											WHEN  json_valid(p) THEN
												case 	WHEN JSON_DEPTH(p)=1 AND p REGEXP '^\\s*"' THEN  JSON_UNQUOTE(cast(p as CHAR))
															WHEN JSON_DEPTH(p)>1 AND JSON_LENGTH(p) = 1 THEN json_extract(p,'$[0]') 
													ELSE p 
												END
											ELSE p  
									END;
--	RETURN CONCAT_WS('__',FOUND_ROWS(),ROW_COUNT());
-- 	IF `mod` = 'f'  THEN  SET p = f(id, action);end IF;

	RETURN p;-- IF(json_valid(p)&& JSON_LENGTH(p)=1 && JSON_DEPTH(p)=2,json_value(p,'$[0]'),p);
		
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `s2a`
-- ----------------------------
DROP FUNCTION IF EXISTS `s2a`;
DELIMITER ;;
CREATE DEFINER=`root`@`::1` FUNCTION `s2a`(s varchar(200)) RETURNS varchar(200) CHARSET utf8mb3
    NO SQL
BEGIN
	-- RETURN REGEXP_substr(s,'^\\d{1,3}(?=\\s\\d+)');
CASE 
							WHEN s REGEXP '^\\d+\\s' THEN  SET s = REGEXP_replace(FORMAT(REGEXP_replace(s,'^\\d+\\s(?=\\d+)',''),REGEXP_substr(s,'^\\d{1,3}(?=\\s\\d+)')),',','');
						 	WHEN s REGEXP '^-?\\d+(.\\d+)?$' THEN SET s = CONCAT('￥',FORMAT(s,2));
							WHEN s REGEXP '^￥[\\-\\.,\\d]+$' THEN SET s = REGEXP_REPLACE(s,'[$,]|￥','');
	ELSE SET s = s; 
END CASE ;

	RETURN s;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `s2d`
-- ----------------------------
DROP FUNCTION IF EXISTS `s2d`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `s2d`(`s` longblob) RETURNS tinytext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	
	RETURN IF(IFNULL(s,'')='',null,REGEXP_replace(REGEXP_substr(CAST(s AS CHAR),'￥?\\-?[\\d,]+(?:\\.\\d+)?'),'[^\\d\\.\\-]',''));
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `s2dp`
-- ----------------------------
DROP FUNCTION IF EXISTS `s2dp`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `s2dp`(`s` tinytext) RETURNS tinytext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...

	RETURN IF(IFNULL(s,'')='',null,REGEXP_replace(s,'[^\\d\\-]',''));
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `s2j`
-- ----------------------------
DROP FUNCTION IF EXISTS `s2j`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `s2j`(i int(1),`j` blob) RETURNS text CHARSET utf8mb3
    DETERMINISTIC
BEGIN
	#Routine body goes here...

	RETURN  CASE    
					WHEN  i IS null OR i = 0  THEN regexp_replace(regexp_replace(cast(j AS CHAR) ,'\\\\(.)','\\1'),'"(?=\\[)|(?<=])"','') 
					WHEN  i = 1 THEN regexp_replace(regexp_replace(regexp_replace(cast(j AS CHAR) ,'\\\\(.)','\\1'),'"(?=\\[)|(?<=])"','') ,'(^\\[|,\\s*)\\K\\[+|]+(?=,\\s*[\\["n\\d]|]$)','')
					
					else  j  end ;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `s2m`
-- ----------------------------
DROP FUNCTION IF EXISTS `s2m`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `s2m`(`s` varchar(2000),`a&b` varchar(5),`f` varchar(500)) RETURNS varchar(2000) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...

	RETURN 	CASE 
						 WHEN IFNULL(s,'') = '' THEN s
						 WHEN NOT FIND_IN_SET(`a&b` ,`f`) THEN s
						 WHEN s NOT REGEXP '^￥?[\\d\\s\\.]+$' THEN s
						 WHEN s REGEXP '\\.' THEN s
						 WHEN s REGEXP '￥' THEN CONCAT('￥',REGEXP_REPLACE(s,'￥|\\s','')/100)
						ELSE REGEXP_REPLACE(s,'\\s','')/100
					END;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `s2sql`
-- ----------------------------
DROP FUNCTION IF EXISTS `s2sql`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `s2sql`(`type` varchar(100),`p0` tinyblob,`p` longBLOB) RETURNS longblob
    NO SQL
BEGIN
DECLARE `res` longblob DEFAULT NULL;DECLARE `factor` TINYtext DEFAULT NULL;
	#Routine body goes here...
	SET p = REGEXP_replace(p,'""','null') ; 
	
	CASE 
			WHEN !json_valid(`p0`) OR  !json_valid(p) THEN  
				SET res = NULL;

			WHEN`type` REGEXP  '1|UPDATE' THEN 
				SET `factor` =REGEXP_substr(`type`,',\\K\\d');


				CASE WHEN `type` = 3 THEN
						SET `factor` = null;
					ELSE 
							SET `factor` = null;
				END CASE ;

				
				SET `res`:= REGEXP_replace(json_extract(CAST(`p` AS CHAR),'$[*][1]','$[*][2]'),'("([abt]\\d+)"),\\s*(.*?)(?=,\\s*"[abt]\\d+"|])','\\2=\\3')
							,`res` = substr(`res`,2,char_length(`res`)-2);


				SET `res`:= CONCAT_WS('\t'
				,CONCAT('UPDATE ' ,REGEXP_substr(json_value(`p0`,'$.type'),'\\w+(?=\\s*$)'))
				,CONCAT('SET ',res)
				,json_value(`p0`,'$.WHERE'),';'
				);


			ELSE 
				SET `res`:= REGEXP_replace(json_extract(CAST(`p` AS CHAR),'$[*][0]','$[*][1]','$[*][2]' ),'"(\\w+)",\\s*"(\\w+)",\\s*(.*?)(?=,\\s*"\\w+"|])','\\2,\\3 as \\1')
						,`res` = substr(`res`,2,char_length(`res`)-2);
						
				SET `res`:= CONCAT_WS('\t'
				,'SELECT '
				,CONCAT_WS(','
						,CONCAT(json_extract(p0,'$.billname'),' AS billname'),CONCAT(json_extract(p0,'$.code'),' AS code'),CONCAT(json_extract(p0,'$.sort'),' AS sort')
					,regexp_replace(REGEXP_replace(REGEXP_replace(json_value(p0,'$.WHERE'),'WHERE\\s+',''), '(\\w+)\\s*=\\s*(.*?)(?=\\s*AND|$)','\\2 as \\1'),'(?i)ANd',',')
					,`res`)
				,CONCAT('FROM ' ,REGEXP_substr(json_value(`p0`,'$.type'),'\\w+(?=\\s*$)'))
				,json_value(`p0`,'$.WHERE')
				);
				
	END CASE;
	
	RETURN res;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `SaveOrUpdate`
-- ----------------------------
DROP PROCEDURE IF EXISTS `SaveOrUpdate`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `SaveOrUpdate`(IN `FUNCID` varchar(1) ,IN `table_name` varchar(30),IN `key_fields` varchar(140),IN `key_values` varchar(120),IN `field_Names` longtext,IN `field_values` longtext)
    READS SQL DATA
label1:BEGIN
	#Routine body goes here...



  DECLARE CONTINUE HANDLER FOR  SQLSTATE '23000', SQLSTATE	'42000'	, SQLSTATE	'42S22' , SQLSTATE	'HY000'-- ,SQLSTATE	'22007'
	BEGIN GET DIAGNOSTICS CONDITION 1 @`sqlstate` = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;SET  @`sqlstate` = JSON_OBJECT('sqlstate',@`sqlstate`,'errno',@errno,'text',@text);
				SET @`errsql` = @3in1_body;
				SET @funcid = CONCAT_WS(' ','Error: ', ' SaveOrUdate ' ,`funcid`),
				@pp =CONCAT_WS(',',QUOTE(`funcid`) , QUOTE(table_name) , QUOTE(key_fields) , QUOTE(key_values) , QUOTE(field_Names) , QUOTE(field_values));
				CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp,'SQL',@`errsql`,'err',@`sqlstate`));
	END;

START TRANSACTION;
				SET @funcid = CONCAT_WS(' ', ' SaveOrUdate' ,`funcid`),
				@pp =CONCAT_WS(',',QUOTE(`funcid`) , QUOTE(table_name) , QUOTE(key_fields) , QUOTE(key_values) , QUOTE(field_Names) , QUOTE(field_values));
CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp));COMMIT;/**/



START TRANSACTION;
CALL Audit("SaveOrUpdate",CONCAT_WS(',',QUOTE(`funcid`) , QUOTE(table_name) , QUOTE(key_fields) , QUOTE(key_values) , QUOTE(field_Names) , QUOTE(field_values)),
 QUOTE(`funcid`) , QUOTE(table_name) , QUOTE(key_fields) , QUOTE(key_values) , QUOTE(field_Names) , QUOTE(field_values));
COMMIT;/*
*/-- expid 异常

	SET @`funcid` = NULL,
			@statu = Fetch_Set(key_values,1,NULL) = "''" OR Fetch_Set(key_values,1,NULL) = 'NULL';

	IF IFNULL(@statu,1) = 1  THEN

		CALL audit('SaveOrUpdate-expid为空',CONCAT_WS(',',QUOTE(`funcid`) , QUOTE(table_name) , QUOTE(key_fields) , QUOTE(key_values) , QUOTE(field_Names) , QUOTE(field_values)),					QUOTE(`funcid`) , QUOTE(table_name) , QUOTE(key_fields) , QUOTE(key_values) , QUOTE(field_Names) , QUOTE(field_values));

		SELECT 1,key_fields ,key_values ;

		LEAVE label1;

	END IF ;

-- missionid 异常
	SET @statu = NULL,
			@statu = Fetch_Set(key_values,2,NULL) = "''" OR Fetch_Set(key_values,2,NULL) = 'NULL' ;

	IF IFNULL(@statu,1) = 1 THEN

		CALL audit('SaveOrUpdate-missionid 为空',CONCAT_WS(',',QUOTE(`funcid`) , QUOTE(table_name) , QUOTE(key_fields) , QUOTE(key_values) , QUOTE(field_Names) , QUOTE(field_values)),					QUOTE(`funcid`) , QUOTE(table_name) , QUOTE(key_fields) , QUOTE(key_values) , QUOTE(field_Names) , QUOTE(field_values));

		SELECT 1,key_fields ,key_values ;

		LEAVE label1;

	END IF ;



	SET @fields_ = NULL,
			@fields_ = fileds_update_temp(key_fields,key_values,"AND"),
			@stmt_save_update =  NULL,
			@statu = NULL;

	IF @fields_ IS NULL THEN 

		CALL audit('SaveOrUpdate-@fields_为空 异常真多 ！fileds_update_temp ',CONCAT_WS(',',QUOTE(`funcid`) , QUOTE(table_name) , QUOTE(key_fields) , QUOTE(key_values) , QUOTE(field_Names) , QUOTE(field_values)),					QUOTE(`funcid`) , QUOTE(table_name) , QUOTE(key_fields) , QUOTE(key_values) , QUOTE(field_Names) , QUOTE(field_values));

		SELECT 1,key_fields ,key_values ;

		LEAVE label1;

	END IF;

-- acc_1;

	IF `table_name` LIKE 'acc_1' THEN

			SET @stmt_save_update = concat("SELECT 1 \n",
																		 "   into @STATU\n",
																		 "FROM acc_1\n",
																		 "where ", @fields_ ," limit 1");
			PREPARE stmt1 FROM @stmt_save_update;
			EXECUTE stmt1 ;

			IF @statu = 1 THEN
-- 更新
/**/
					SET @stmt_save_update = concat("DELETE a.* \n",
																		 "FROM ", expid2b(REPLACE(Fetch_Set(key_values,1,NULL),'\'','')) ," AS a \n",
																		 "where ", @fields_ );

					PREPARE stmt1 FROM @stmt_save_update;
					EXECUTE stmt1 ;

					SET @statu_  = @fields_ ,
							@fields_ = fileds_update_temp(field_names,field_values,null),

							@stmt_save_update =CONCAT("UPDATE ",table_name,"\n",
																				"SET ",@fields_,"\n",
																				"WHERE ",@statu_);

				ELSE 

					SET @stmt_save_update =CONCAT("INSERT ",table_name,"(",key_fields,",",field_names,")
							VALUES(",key_values,",",field_values,")");
			END IF;
		ELSE 


			SET		@statu_ = NULL,
						@stmt_save_update  = CONCAT("SELECT CONCAT_WS('',",`field_values`,") INTO @statu_");

			PREPARE stmt1 FROM @stmt_save_update;
			EXECUTE stmt1 ;

			IF IFNULL(@statu_,'') = '' THEN
				SELECT 1,'走了','leave';
				LEAVE label1;

			END IF;

			
			SET @stmt_save_update =CONCAT("REPLACE INTO ",table_name,"(",key_fields,",",field_names,")
							VALUES(",key_values,",",field_values,")");

	END IF;

	
  PREPARE stmt1 FROM @stmt_save_update;
 	EXECUTE stmt1 ;
  SET @field1 = FOUND_ROWS(),
			@field2 = @stmt_save_update;

	DEALLOCATE PREPARE stmt1; 


-- 返回结果
 SELECT 1,@field1,@field2;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `seacher1`
-- ----------------------------
DROP PROCEDURE IF EXISTS `seacher1`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `seacher1`(IN `co_no`  varchar(60), IN `missionid_` varchar(60) ,IN `type` varchar(10),IN `keyword` varchar(60),in `page` int(4),in `num` int(6))
    READS SQL DATA
label:BEGIN
 /*
CALL Audit( "seacher1" , @ ,co_no, missionid_ , type  , keyword , page , num);
LEAVE label;

*/


	set 	@num = num ,																	
				@stmtbody = NULL ,

				@totalnum = 0 ,
				@stmtbody1 = NULL ,
				@stmtbody2 = NULL ;
	IF type is null or trim(type) = '' THEN
      SET @type = 'bb';
		ELSE
			SET @type = trim(type);
	END IF;

	IF page <1 THEN 
			set @offset1 = 1;
		ELSE
			SET @offset1 =(page-1)  * num  ;
	END IF;

	IF co_no IS NULL OR co_no ='null' OR co_no = '' THEN SET co_no = ''; END IF;


		 SET KEYWORD = REPLACE(REPLACE(REPLACE(trim(keyword),' ','.*'),',','|'),'，','|');


	IF missionid_ is null THEN
			SET @missionid ='';
		ELSE 
			SET @missionid = missionid_ ;
	END IF ;



	CASE  when  type = 'bb' then 

	SET @a = NULL,@stmtbody2 = NULL;
	
	SELECT  CONCAT("/^[",GROUP_CONCAT(a.billType SEPARATOR '|'),"]{1,}/") INTO @a
	FROM mysq1_schema.bill_type AS a;

	IF @a IS NOT NULL THEN
		SET @stmtbody2 = CAST(preg_capture(@a,keyword) AS CHAR);

		IF @stmtbody2 IS NOT NULL THEN
				IF @stmtbody2 != 'qbdj' THEN
					SET @stmtbody2 = CONCAT("\n AND INSTR(",QUOTE(@stmtbody2),",b.billtype) > 0 \n");
					ELSE SET @stmtbody2 = NULL;
				END IF;
				 
				SET  keyword = CAST(PREG_REPLACE(@a,'',keyword,1) as char);

				IF TRIM(KEYword) = '' THEN SET KEYWORD = '.*' ; END  IF;
    
		END IF;
	END IF ;

-- SELECT  @stmtbody2, KEYWORD ; -- LEAVE label;

					set @stmtbody1= "SELECT  count(DISTINCT a.missionid )
													into @totalnum ",
							@stmtbody2  = CONCAT_WS("","
FROM
acc_mission_backbill_1 AS a
LEFT JOIN acc_mission_back_information AS e ON a.missionId = e.quoteid AND e.type = 'bb'
LEFT JOIN acc_mission_backbill_n AS d ON a.missionId = d.missionId
INNER JOIN mysq1_schema.bill_list AS b ON a.bill_Id = b.billId
INNER JOIN mysq1_schema.bill_type AS c ON b.billType = c.billType
LEFT JOIN exp_courses_node_content AS e1 ON e.missionid = e1.missionid
LEFT JOIN exp_courses_node AS e3 ON e1.contentNo = e3.contentNo
LEFT JOIN exp_courses AS E4 ON E4.courseNo = e3.node_courseNo
LEFT JOIN acc_mission AS e2 ON e.missionid = e2.missionId
WHERE  a.referencedID <> 'bill_test1'
AND a.missionid NOT IN 
(SELECT a.quoteid FROM acc_mission_back_information AS a WHERE a.missionid = '",missionid_,"')
AND (INSTR(IFNULL(node_courseno,''),",QUOTE(co_no),")>0 OR  CONCAT(e.missionid ,e3.node_courseno) is null )",
@stmtbody2,
"AND 
			case 
							when  cast(concat_ws('',IF(e2.missionLabel IS NULL ,'没有使用未引用未没用没使用',concat(e3.node_No,'.',e1.typesort,'.',e.sort)),e.title, a.missionLabel,b.billname, e2.missionlabel,c.billTypeSay, /*c.billType,*/"
								,substmt('a.t',8),") as CHAR) REGEXP '",keyword,"' then 1
							when CAST(CONCAT_WS('',",substmt('b.page_title',8),") AS CHAR) REGEXP '",keyword,"' then 1	
							when CAST(CONCAT_WS('',IF(e2.missionLabel IS NULL ,'没有使用未引用未没用没使用',concat(e3.node_No,'.',e1.typesort,'.',e.sort)),e.title, a.missionLabel,b.billname, e2.missionlabel,c.billTypeSay, /*c.billType,*/" ,substmt('a.a',100),") as CHAR) REGEXP '",keyword,"'  then 1	
							when CAST(CONCAT_WS('',IF(e2.missionLabel IS NULL ,'没有使用未引用未没用没使用',concat(e3.node_No,'.',e1.typesort,'.',e.sort)),e.title, a.missionLabel,b.billname, e2.missionlabel,c.billTypeSay, /*c.billType,*/" ,substmt('d.b',50),") as CHAR) REGEXP '",keyword,"'  then 1	
						else 0 
					end
");



				when  @type = 'bf' then 
						set @stmtbody1= "SELECT  count(DISTINCT a.Pkid)
													into @totalnum ",
								@stmtbody2 = CONCAT_WS("","
FROM acc_mission_backfile AS a
LEFT JOIN acc_mission_back_information AS b ON b.type = 'bf' AND a.Pkid = b.quoteid 
LEFT JOIN exp_courses_node_content AS c ON b.missionid = c.missionid
LEFT JOIN exp_courses_node AS c1 ON c.contentNo = c1.contentNo
LEFT JOIN exp_courses AS c4 ON c1.node_courseNo = c4.courseNo
LEFT JOIN acc_mission AS c5 ON c.missionid = c5.missionId
WHERE a.Pkid NOT IN 
(SELECT a.quoteid FROM acc_mission_back_information AS a WHERE a.missionid = ",QUOTE(missionid_),")\n",
CONCAT(" AND (\n",
"INSTR(c1.node_courseNo , ",QUOTE(co_no),") OR  c1.node_courseNo IS NULL )\n"),
IF(keyword IS NULL OR keyword = '.+', '',
CONCAT(
"AND
case 
	 when  CONCAT(SUBSTRING_INDEX(a.file_type,'.',-1),b.sort,a.missback_title,SUBSTRING_INDEX(a.file_type,'.',-1))  REGEXP '",keyword,"' then 1	
	 when  CONCAT(c1.node_No,'.',c.typesort,c5.missionLabel)  REGEXP '",keyword,"' then 1	
	 WHEN  CONCAT('没有使用未引用未没用没使用未使用',
CASE SUBSTRING_INDEX(a.file_type,'.',-1)
	WHEN 'htm' THEN '网页文件'
	WHEN 'jpg' THEN '图片文件'
	WHEN 'png' THEN '图片文件'
	WHEN 'jpeg' THEN '图片文件'
	WHEN 'gif' THEN '图片文件'
	WHEN 'PDF' THEN  'PDF文件'
	WHEN 'html' THEN '网页,注意：无法解析'
	ELSE SUBSTRING_INDEX(a.file_type,'.',-1)
END ,'没有使用未引用未没用没使用未使用') REGEXP '",keyword,"' then 1	
   else 0 
end")));
				when  @type = 'bt' then 
						set @stmtbody1= "SELECT  count(DISTINCT a.Pkid)
													into @totalnum ",
								@stmtbody2 = concat("
														FROM 	acc_mission_backtext AS a
														LEFT JOIN (SELECT missionid , quoteid from acc_mission_back_information where type = 'bt' and missionid = @missionid ) AS b ON a.Pkid = b.quoteid
														where b.quoteid IS NULL  
																and  case 
																					when  concat( a.missback_title, a.missback_text)  like concat('%',@keyword,'%') then 1	
																					else 0 
																			end ;
														");


	ELSE SELECT NULL ;
	END CASE;

	set @stmtbody = concat(@stmtbody1,@stmtbody2);
 -- SELECT  @stmtbody ; LEAVE label;
	PREPARE stmt from  @stmtbody ;
	EXECUTE stmt ;
	DEALLOCATE PREPARE stmt;


	CASE  when  @type = 'bb' then 
					set @stmtbody  = concat("SELECT DISTINCT
@totalnum as totalnum,
@offset1 := @offset1 +1 as rowNo ,
a.missionId,
CAST(CONCAT_WS(' ; ',
CONCAT(b.billname,
IF(IFNULL(b.max_page,1) = 1,'',
CONCAT(' <',
CASE 
	WHEN IFNULL(e.pageNo,0) =0 THEN '所有联'
	WHEN e.pageNo =1 THEN  b.page_title1
	WHEN e.pageNo =1 THEN  b.page_title2
	WHEN e.pageNo =1 THEN  b.page_title2
	WHEN e.pageNo =1 THEN  b.page_title2
	WHEN e.pageNo =1 THEN  b.page_title2
	WHEN e.pageNo =1 THEN  b.page_title2
ELSE '未知联次'
END,'>'))),
IF(e3.node_courseNo IS NULL,' 未引用 ',
CONCAT_ws('',concat(e3.node_No,'.',e1.typesort,' - ',e2.missionLabel,' ; ',E4.courseName)))
)AS CHAR) as missionLabel,
b.billId,
IF(e.title IS null,a.missionlabel,e.title) AS billname,
CAST(CONCAT(IFNULL(e.sort,'-'),'- ',b.billname,
IF(IFNULL(b.max_page,1) = 1,'',
CONCAT(' <',
CASE 
	WHEN IFNULL(e.pageNo,0) =0 THEN '所有联'
	WHEN e.pageNo =1 THEN  b.page_title1
	WHEN e.pageNo =1 THEN  b.page_title2
	WHEN e.pageNo =1 THEN  b.page_title2
	WHEN e.pageNo =1 THEN  b.page_title2
	WHEN e.pageNo =1 THEN  b.page_title2
	WHEN e.pageNo =1 THEN  b.page_title2
ELSE '未知联次'
END,'>'))) AS CHAR)AS billTypeSay,'b.page_title1 ' as page_title1
,b.page_title2,
b.page_title3,b.page_title4,
b.page_title5,b.page_title6,
b.page_title7,b.page_title8,
a.pageid as pageNo,
a.referencedID
"
,@stmtbody2,"
GROUP BY  a.referencedID ,a.missionId
ORDER BY case when E4.courseName IS NULL then 1 else 0 end  ASC , 
E4.courseName ASC,
nabc(CAST(CONCAT_WS('',e3.node_No,'.',e1.typesort,'.',e.sort) AS CHAR)) ASC
limit ?,?");
				when  @type = 'bf' then 

						set @stmtbody  = CONCAT("
SELECT
	@totalnum as totalnum,
a.Pkid,
CAST(
IF(c.missionid IS NULL ,CONCAT(' - ',a.missback_title),CONCAT(b.sort,' - ' , b.title)
) AS char ) AS file_type,
-- a.file_type,
CAST(CONCAT(
CASE SUBSTRING_INDEX(a.file_type,'.',-1)
	WHEN 'htm' THEN '网页文件'
	WHEN 'jpg' THEN '图片文件'
	WHEN 'png' THEN '图片文件'
	WHEN 'jpeg' THEN '图片文件'
	WHEN 'gif' THEN '图片文件'
	WHEN 'PDF' THEN  'PDF文件'
	WHEN 'html' THEN '网页(可能无法解析)'
	ELSE SUBSTRING_INDEX(a.file_type,'.',-1)
END ,
' ; ',
IF(c.missionid IS NULL ,'未引用',
CONCAT('<',c1.node_No,'.',c.typesort,'>',c5.missionLabel,' ; ',c4.courseName)
)) AS CHAR) AS missback_title,
c1.node_courseNo,
c1.node_courseNo,
c.paramId,
c4.courseName,
a.Pkid AS missionid \n",
@stmtbody2,"\n
ORDER BY case when c1.node_courseNo is null then 1 else 0 end ASC ,c1.node_courseNo,nabc(c1.node_No),c.typesort ASC
limit ?,? ");

				when  @type = 'bt' then 
						set @stmtbody  = concat("
														SELECT
															@totalnum as totalnum,
																@offset1 := @offset1 +1 as rowNo ,
																a.Pkid,
																a.missionId,
																a.missback_title,
																a.missback_text
														FROM 	acc_mission_backtext AS a
														LEFT JOIN (SELECT missionid , quoteid from acc_mission_back_information where type = 'bt' and missionid = @missionid ) AS b ON a.Pkid = b.quoteid
														where b.quoteid IS NULL  
																and  case 
																					when  concat( a.missback_title, a.missback_text)  REGEXP  ",QUOTE(keyword)," then 1	
																					else 0 
																			end 
													limit ?,? ;
														");


	ELSE SELECT NULL ;
	END CASE;
-- SELECT  @stmtbody ; -- LEAVE label;


	PREPARE stmt from  @stmtbody ;
	EXECUTE stmt  USING  @offset1  , @num;
	DEALLOCATE PREPARE stmt;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `seacher2`
-- ----------------------------
DROP PROCEDURE IF EXISTS `seacher2`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `seacher2`(IN `missionid` varchar(60) ,IN `keyword` varchar(60),in `page` int(4),in `num` int(6))
    READS SQL DATA
BEGIN

	set 	@offset1 =( page-1)  * num ,			
				@num = num ,											
				@keyword	= if(keyword is null, '', trim(keyword)),	
				@stmtbody = NULL ,
				@missionid = IF(missionid is null ,'',TRIM(missionid)),

				@totalnum = 0 ,
				@stmtbody1 = NULL ,
				@stmtbody2 = NULL ;



	IF  IFNULL(@keyword,'') = '' then 
					set @stmtbody1= "SELECT   count(a.missionId)  
													into @totalnum 
													",
							@stmtbody2  = "
													FROM
													acc_mission AS a
													";
	ELSE   
					set @stmtbody1= "SELECT count(DISTINCT a.missionId) 
													into @totalnum ",
							@stmtbody2 = "
												FROM
												acc_mission AS a
												LEFT JOIN mysq1_schema.bill_list AS b ON a.billId = b.billId
												LEFT JOIN mysq1_schema.bill_type AS c ON b.billType = c.billType
												LEFT JOIN acc_standard_1 AS d ON a.missionId = d.missionId
												LEFT JOIN acc_standard_n AS e ON d.missionId = e.missionId
												LEFT JOIN exp_courses_node_content AS f ON a.missionId = f.missionid AND f.contentType = 'kj'
														";
	end IF;

	set @stmtbody = concat(@stmtbody1,@stmtbody2);

	PREPARE stmt from  @stmtbody ;
	EXECUTE stmt ;
	DEALLOCATE PREPARE stmt;

-- 							if(d.missionId IS NULL,'无','有') AS havinganser,#答案

					set @stmtbody  = concat("
													SELECT DISTINCT
															@totalnum as totalnum,
															@offset1 := @offset1 +1 as rowNo ,
															a.missionId,
															a.missionLabel,-- 任务名称
															b.billname,#表单名称
															c.billTypeSay,#表单类型
															a.mission_ask,#任务要求

															a.need_input_a + a.need_input_b AS inputcolumn,#填空数

															SUBSTRING_INDEX(a.referencedId,'-',1) AS ower,
															a.pageno,
															a.createtime,a.updatetime
													FROM
													acc_mission AS a
													LEFT JOIN mysq1_schema.bill_list AS b ON a.billId = b.billId
													LEFT JOIN mysq1_schema.bill_type AS c ON b.billType = c.billType
													LEFT JOIN acc_standard_1 AS d ON a.missionId = d.missionId
													LEFT JOIN acc_standard_n AS e ON d.missionId = e.missionId
													LEFT JOIN exp_courses_node_content AS f ON a.missionId = f.missionid AND f.contentType = 'kj'
													WHERE a.missionid <> @missionid  
																and  case 
																					when  concat( a.missionLabel,b.billname, c.billTypeSay, c.billType ,"			
																								,substmt('a.t',8),") like concat('%',@keyword,'%') then 1
																					when concat(",substmt( 'b.page_title',8),") like concat('%',@keyword,'%') then 1	
																					when concat(" ,substmt( 'd.a',100),") like concat('%',@keyword,'%') then 1	
																					when  concat(" ,substmt( 'e.b',50),") like concat('%',@keyword,'%') then 1	
																					else 0 
																			end 
													limit ?,? 
													");


	PREPARE stmt from  @stmtbody ;
	EXECUTE stmt  USING  @offset1  , @num;
	DEALLOCATE PREPARE stmt;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `seacher4`
-- ----------------------------
DROP PROCEDURE IF EXISTS `seacher4`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `seacher4`(IN `co_no` varchar(60),IN `missionid` varchar(60) ,IN `keyword` varchar(600),in `page` int(4),in `num` int(6))
    READS SQL DATA
label:BEGIN
-- 1054 1064 SQLSTATE 1139 - Got error 'empty (sub)expression' from regexp
-- 锁定课程 
-- '671100000238042252009156563918','2.5 明细 原材料',1,1000
/*
start TRANSACTION;
CALL Audit_2('seacher4',CONCAT_WS(',',QUOTE(co_no),QUOTE(missionid),QUOTE(keyword),QUOTE(page),QUOTE(num)),@a );COMMIT;

*/
	set 				
				@num = num ,											
				@stmtbody = NULL ,
				@totalnum = 0 ,
				@stmtbody1 = NULL ,
				@stmtbody2 = NULL ,
				@stmtbody3 = NULL ;

	IF page <1 THEN 
			set @offset1 = 1;
		ELSE
			SET @offset1 =(page-1)  * num  ;
	END IF;

	IF TRIM(co_no) = '' THEN set co_no = NULL; END IF;


	IF IFNULL(keyword ,'') != '' THEN 
			SET keyword = REPLACE(REPLACE(keyword,' ','|'),'.','\\.');
-- SELECT keyword;
			SET  @stmtbody3  = concat("
					and  case 
										when  cast(CONCAT_WS('',CONCAT(e1.node_No,'.',d.typesort ),a.missionLabel,b.billname,c.billTypeSay,a.createtime,a.updatetime ,a.mission_ask,"			
										,	Temp_Func('a.t??',1,8,NULL),") as char) REGEXP ",quote(keyword)," then 1
										when  cast(CONCAT_WS('',",Temp_Func('a.t??',1,8,NULL),",a.mission_ask,a.updatetime,a.createtime,c.billTypeSay,b.billname,a.missionLabel,CONCAT(e1.node_No,'.',d.typesort )) as char) REGEXP ",quote(keyword)," then 1 
										when CONCAT_WS('',CONCAT(e1.node_No,'.',d.typesort ),a.missionLabel,b.billname,c.billTypeSay,a.createtime,a.updatetime ,a.mission_ask,",
											Temp_Func('b.page_title??',1,8,NULL),") REGEXP ",quote(keyword)," then 1	
										when CONCAT_WS('',CONCAT(e1.node_No,'.',d.typesort ),a.missionLabel,b.billname,c.billTypeSay,a.createtime,a.updatetime ,a.mission_ask,",
											Temp_Func('e.a??',1,100,null),") REGEXP ",quote(keyword)," then 1	
										when CONCAT_WS('',CONCAT(e1.node_No,'.',d.typesort ),a.missionLabel,b.billname,c.billTypeSay,a.createtime,a.updatetime ,a.mission_ask,",
											Temp_Func('f.b??',1,50,NULL),") REGEXP ",quote(keyword)," then 1	
									else 0 
								end ");
		ELSE
			SET @stmtbody3 = '';
	END IF;

	IF	IFNULL(missionid,'') != '' THEN 
			SET @missionid = TRIM(missionid);
		ELSE
			SET @missionid =  '';
	END IF;


	set @stmtbody1= "CREATE TEMPORARY TABLE cur1 AS
				SELECT DISTINCT

							a.missionId,
							CONCAT(e1.node_No,'.',cast(d.typesort as char)) AS cnum,#任务编号
							a.missionLabel AS missionLabel,-- 任务名称
							b.billname as billname ,#表单名称
							c.billTypeSay,#表单类型
							a.mission_ask,#任务要求
							 IFNULL(a.need_input_a,0) + IFNULL(a.need_input_b,0) as inputcolumn ,#填空数
							a.pageno AS pageno, #联次
							f1.coursename AS ower, #课程名称
							a.createtime,a.updatetime # 创建时间
							 ",
			@stmtbody2  = CONCAT_WS("","
				FROM acc_mission AS a
				INNER JOIN mysq1_schema.bill_list AS b ON a.billId = b.billId
				INNER JOIN mysq1_schema.bill_type AS c ON b.billType = c.billType
				INNER JOIN exp_courses_node_content AS d ON a.missionId = d.missionid
				INNER JOIN exp_courses_node AS e1 ON d.contentNo = e1.contentNo
				INNER JOIN exp_courses AS f1 ON e1.node_courseNo = f1.courseNo
				LEFT JOIN  acc_standard_1 AS e ON a.missionId = e.missionId
				LEFT JOIN acc_standard_n AS f ON a.missionId = f.missionId
				LEFT JOIN acc_mission_back_information AS e2 ON e2.quoteid = a.missionid AND e2.missionId =", QUOTE(@missionid),"
				WHERE\n ",
CONCAT("f1.courseno = '",co_no,"' AND "),
" a.missionid !='", @missionid,"' AND e2.missionid IS  NULL ") ;


	set @stmtbody = concat(@stmtbody1,@stmtbody2,@stmtbody3);


	DROP TEMPORARY TABLE IF EXISTS cur1;
	PREPARE stmt from  @stmtbody ;
	EXECUTE stmt ;
	set @totalnum = FOUND_ROWS();
-- 	DEALLOCATE PREPARE stmt;



	set @stmtbody  = concat("
    SELECT 
			@totalnum as totalnum ,
			cnum,
			missionId,
			pageno AS pageno,
			missionLabel,
			billname,
			billTypeSay,
			mission_ask,
			inputcolumn,
			ower,
			createtime,
			updatetime
		from cur1 ORDER BY cabc(pageno)
		limit ?,? ");


	PREPARE stmt from  @stmtbody ;
	EXECUTE stmt  USING  @offset1  , @num;
	DEALLOCATE PREPARE stmt;
	DROP TEMPORARY TABLE  IF EXISTS cur1;

END label
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `seacher5`
-- ----------------------------
DROP PROCEDURE IF EXISTS `seacher5`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `seacher5`(IN `classNo` varchar(60) ,IN `keyword` varchar(2000),in `page` int(4),in `num` int(6))
    READS SQL DATA
sl5:BEGIN

	DECLARE  weight VARCHAR(60) DEFAULT NULL;DECLARE  expnos MEDIUMTEXT DEFAULT NULL;

 START TRANSACTION;
CALL Audit_1('seacher5',CONCAT_WS(',',QUOTE( `classNo`),QUOTE(`keyword`),QUOTE(`page`),QUOTE(`num`)),'ok');
 COMMIT;
/**/
START TRANSACTION;
SET @all := null,@all = REGEXP_substr(keyword,'\\+'),`keyword`  = REGEXP_replace(`keyword`,'搜索|\\+','');
	set 	
				@offset2 = (IF(page=0,1,page)-1)*num,
				@num = num ,				

				keyword	:= REGEXP_replace(IFNULL(keyword,''),'([()$.\\-{}\\?])','\\\\\\1'),
				weight = REGEXP_substr(keyword,'(?:\\d+(?:(?<=\\d)\\.\\d+)?)(?=%)'),-- |(?:\\*\\d+(?:\\.\\d+)?))
	 			keyword = REGEXP_replace(keyword,'(?:\\d+(?:(?<=\\d)\\.\\d+)?%)|^\\s++|\\s++$',''),-- |(?:\\*\\d+(?:\\.\\d+)?))',''),
				@stmtbody = NULL ,
				classNo = IF(classNo is null ,'',TRIM(classNo)),  
			@totalnum = 0 ;

			SET @totalnum = NULL,@maxtime = NULL,@maxstatu =NULL;

			SET @stmtbody = CONCAT_WS('\n',"SET @stmtbody = ("	
,"SELECT
json_arrayagg(json_array(a.classNo,a.studentNo,a.expno,a.teacherScore,b.difficulty_level))
FROM exp_experimentclassstudent AS a0 
INNER JOIN exp_experimentclassstudent as a ON a0.studentNo  = a.studentNo"
,IF(IFNULL(@all,'')='+',NULL,CONCAT_WS('',' and ',"a.classNo = ",QUOTE(classNo)))
,"INNER JOIN exp_experimentclass AS b ON a.classNo = b.classNo
INNER join mysq1_schema.exp_classstudent as c on a.studentNo = c.stuNo
INNER join mysq1_schema.exp_class as d on c.classno = d.classNo
WHERE "	
,CONCAT_WS('',"a0.classNo = ",QUOTE(classNo))
/*,CONCAT_WS('',"CASE 
WHEN IFNULL(" ,QUOTE(`keyword` ),",'')= '' THEN 1 
when CONCAT_WS('|',d.classNo,d.className)!='' AND CONCAT_WS('|',d.classNo,d.className)REGEXP ",QUOTE(`keyword` )," then 1
when CONCAT_WS('|',c.stu_name,a.studentNo)  != '' AND CONCAT_WS('|',c.stu_name,a.studentNo) REGEXP ",QUOTE(`keyword` ),"  then 1 
else 0
end")*/	
,')'	);
-- SELECT REGEXP_replace(keyword,'%','');
			EXECUTE immediate @stmtbody;
			set expnos = @stmtbody;

			DROP TEMPORARY TABLE if EXISTS `a`;

				SET @stmtbody = CONCAT_WS('\n',"CREATE TEMPORARY TABLE `a` AS\nSELECT\na.statu,\na.expNo,\na.studentNo,\nsum(b.mission_result) mission_result,\nsum(b.resultCount) resultCount,\nsum(b.read_ans_size) read_ans_size,\nsum(b.score) score,\nCOUNT(missionid) 题\n,d.mission_total \nFROM\nexp_experimentclassstudent AS a\nINNER JOIN exp_experimentclass AS d ON a.classNo = d.classNo\nLEFT JOIN acc_1 AS b ON b.expID = a.expNo"
				,"WHERE -- a.statu IS NOT NULL AND "
				,CONCAT_WS('\n','instr(',quote(expNos),',a.expNo)>0')
				,"GROUP BY expNo"
				);

				EXECUTE immediate   @stmtbody ;

				SET @DISABLE_TRIGGERS =1;
				SET @stmtbody = CONCAT_WS('',"UPDATE \n`a` AS a\nINNER JOIN exp_experimentclassstudent AS d ON d.expNo = a.expNo\nseT\nd.statu = NULL ,\nd.mission_result = a.mission_result,\nd.read_ans_size = a.read_ans_size,\nd.score = a.score,\nd.missionscore = IF(IFNULL(mission_total,0)= 0,NULL,a.score/mission_total),\nd.done = 题"
				-- ,CONCAT_WS('',"WHERE a.statu IS NOT NULL")
				);
				EXECUTE immediate  @stmtbody;

				SET @DISABLE_TRIGGERS =NULL;

				SET @stmtbody  = CONCAT_WS('\n',"SELECT count(*)\ninto @totalnum ","FROM exp_experimentclassstudent as a\n INNER JOIN exp_experimentclass AS b ON a.classNo = b.classNo\nLEFT join mysq1_schema.exp_classstudent as c on a.studentNo = c.stuNo\nLEFT join mysq1_schema.exp_class as d on c.classno = d.classNo",'where',CONCAT_WS('\n','instr(',quote(expNos),',a.expNo)>0'));

				EXECUTE  immediate @stmtbody ;


			set @stmtbody  := CONCAT_WS('\n'
,"SELECT 
@totalnum as total,
IF( IFNULL(A.SCORE,0)=0 ,'-',rowid)rowid ,
a.classNo,
className AS className,
a.studentNo,
stu_name AS stu_name,
a.expNo,
IF(A.SCORE1 IS null OR A.SCORE =0,'',score1) AS score,
IF(A.read_ans_size IS null OR A.read_ans_size =0,'',read_ans_size) read_ans_size,
IF(A.mission_result IS null OR A.mission_result =0,'',mission_result) mission_result,
IF(A.log_count IS null OR A.log_count =0,'',log_count) log_count,
IF(a.teacherScore IS NULL OR a.teacherScore=0,'',a.teacherScore) AS teacherScore
FROM(
SELECT
dense_rank()  OVER (ORDER BY IFNULL(SUM(score),0)+ IFNULL(SUM(score1)/COUNT(score1),0)   DESC) rowid,
studentNo
,CONCAT_WS(',',IFNULL(score,'--'), ROUND(SUM(score1)/COUNT(score1),2)) score1
,ROUND(IFNULL(SUM(score),0)+ IFNULL(SUM(score1)/COUNT(score1),0),2) score
,a.classNo,className,stu_name, expNo,read_ans_size,mission_result,log_count,teacherScore
FROM(
SELECT 

@totalnum as total,
@rowNo= 1,@score = 0,
a.classNo,
IFNULL(d.className,'') className,
a.studentNo,
ifnull(c.stu_name,'')stu_name, 
a.expNo,"
,"@score := a.missionscore,"
,CONCAT_WS('',"ROUND(IF(b.classNo = ",QUOTE(classNo),",@score,NULL),2) AS score,")
,CONCAT_WS('',"ROUND(IF(b.classNo = ",QUOTE(classNo),",NULL,@score),2)AS score1,")
,CONCAT_WS('',"IF(b.classNo = ",QUOTE(classNo),",ifnull(a.read_ans_size,0),0) AS read_ans_size,")
,CONCAT_WS('',"IF(b.classNo = ",QUOTE(classNo),",ifnull(a.mission_result,0),0) AS mission_result,")
,CONCAT_WS('',"IF(b.classNo = ",QUOTE(classNo),",ifnull(a.done,0),0) AS log_count,")
,"teacherScore
FROM exp_experimentclassstudent as a
INNER JOIN exp_experimentclass AS b ON a.classNo = b.classNo
INNER join mysq1_schema.exp_classstudent as c on a.studentNo = c.stuNo
INNER join mysq1_schema.exp_class as d on c.classno = d.classNo"
,"WHERE ",CONCAT_WS('\n','instr(',quote(expNos),',a.expNo)>0')
,')as a 
GROUP BY studentNo-- ,a.expNo
ORDER BY score DESC
)AS A'
,"WHERE "
,CONCAT_WS('',"CASE 
WHEN IFNULL(" ,QUOTE(`keyword` ),",'')= '' THEN 1 
when CONCAT_WS('|',classNo,className)!='' AND CONCAT_WS('|',classNo,className)REGEXP ",QUOTE(`keyword` )," then 1
when CONCAT_WS('|',stu_name,studentNo)  != '' AND CONCAT_WS('|',stu_name,studentNo) REGEXP ",QUOTE(`keyword` ),"  then 1 
else 0
end")
);

-- SELECT @stmtbody ;-- LEAVE sl5;
EXECUTE immediate @stmtbody ;
commit;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `seacher5_copy`
-- ----------------------------
DROP PROCEDURE IF EXISTS `seacher5_copy`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `seacher5_copy`(IN `classNo` varchar(60) ,IN `keyword` varchar(2000),in `page` int(4),in `num` int(6))
    READS SQL DATA
sl5:BEGIN

	DECLARE  weight VARCHAR(60) DEFAULT NULL;DECLARE  expnos MEDIUMTEXT DEFAULT NULL;
/*
 START TRANSACTION;
CALL Audit_1('seacher5',CONCAT_WS(',',QUOTE( `classNo`),QUOTE(`keyword`),QUOTE(`page`),QUOTE(`num`)),'ok');
 COMMIT;
/**/
START TRANSACTION;
SET @all := null,@all = REGEXP_substr(keyword,'\\+'),`keyword`  = REGEXP_replace(`keyword`,'搜索|\\+','');
	set 	
				@offset2 = (IF(page=0,1,page)-1)*num,
				@num = num ,				

				keyword	:= REGEXP_replace(IFNULL(keyword,''),'([()$.\\-{}\\?])','\\\\\\1'),
				weight = REGEXP_substr(keyword,'(?:\\d+(?:(?<=\\d)\\.\\d+)?)(?=%)'),-- |(?:\\*\\d+(?:\\.\\d+)?))
	 			keyword = REGEXP_replace(keyword,'(?:\\d+(?:(?<=\\d)\\.\\d+)?%)|^\\s++|\\s++$',''),-- |(?:\\*\\d+(?:\\.\\d+)?))',''),
				@stmtbody = NULL ,
				classNo = IF(classNo is null ,'',TRIM(classNo)),  
			@totalnum = 0 ;

			SET @totalnum = NULL,@maxtime = NULL,@maxstatu =NULL;

			SET @stmtbody = CONCAT_WS('\n',"SET @stmtbody = ("	
,"SELECT
json_arrayagg(json_array(a.classNo,a.studentNo,a.expno,a.teacherScore,b.difficulty_level))
FROM exp_experimentclassstudent AS a0 
INNER JOIN exp_experimentclassstudent as a ON a0.studentNo  = a.studentNo"
,IF(IFNULL(@all,'')='+',NULL,CONCAT_WS('',' and ',"a.classNo = ",QUOTE(classNo)))
,"INNER JOIN exp_experimentclass AS b ON a.classNo = b.classNo
INNER join mysq1_schema.exp_classstudent as c on a.studentNo = c.stuNo
INNER join mysq1_schema.exp_class as d on c.classno = d.classNo
WHERE "	
,CONCAT_WS('',"a0.classNo = ",QUOTE(classNo))
/*,CONCAT_WS('',"CASE 
WHEN IFNULL(" ,QUOTE(`keyword` ),",'')= '' THEN 1 
when CONCAT_WS('|',d.classNo,d.className)!='' AND CONCAT_WS('|',d.classNo,d.className)REGEXP ",QUOTE(`keyword` )," then 1
when CONCAT_WS('|',c.stu_name,a.studentNo)  != '' AND CONCAT_WS('|',c.stu_name,a.studentNo) REGEXP ",QUOTE(`keyword` ),"  then 1 
else 0
end")*/	
,')'	);
-- SELECT REGEXP_replace(keyword,'%','');
			EXECUTE immediate @stmtbody;
			set expnos = @stmtbody;

			DROP TEMPORARY TABLE if EXISTS `a`;

				SET @stmtbody = CONCAT_WS('\n',"CREATE TEMPORARY TABLE `a` AS\nSELECT\na.statu,\na.expNo,\na.studentNo,\nsum(b.mission_result) mission_result,\nsum(b.resultCount) resultCount,\nsum(b.read_ans_size) read_ans_size,\nsum(b.score) score,\nCOUNT(missionid) 题\n,d.mission_total \nFROM\nexp_experimentclassstudent AS a\nINNER JOIN exp_experimentclass AS d ON a.classNo = d.classNo\nLEFT JOIN acc_1 AS b ON b.expID = a.expNo"
				,"WHERE -- a.statu IS NOT NULL AND "
				,CONCAT_WS('\n','instr(',quote(expNos),',a.expNo)>0')
				,"GROUP BY expNo"
				);

				EXECUTE immediate   @stmtbody ;

				SET @DISABLE_TRIGGERS =1;
				SET @stmtbody = CONCAT_WS('',"UPDATE \n`a` AS a\nINNER JOIN exp_experimentclassstudent AS d ON d.expNo = a.expNo\nseT\nd.statu = NULL ,\nd.mission_result = a.mission_result,\nd.read_ans_size = a.read_ans_size,\nd.score = a.score,\nd.missionscore = IF(IFNULL(mission_total,0)= 0,NULL,a.score/mission_total),\nd.done = 题"
				-- ,CONCAT_WS('',"WHERE a.statu IS NOT NULL")
				);
				EXECUTE immediate  @stmtbody;

				SET @DISABLE_TRIGGERS =NULL;

				SET @stmtbody  = CONCAT_WS('\n',"SELECT count(*)\ninto @totalnum ","FROM exp_experimentclassstudent as a\n INNER JOIN exp_experimentclass AS b ON a.classNo = b.classNo\nLEFT join mysq1_schema.exp_classstudent as c on a.studentNo = c.stuNo\nLEFT join mysq1_schema.exp_class as d on c.classno = d.classNo",'where',CONCAT_WS('\n','instr(',quote(expNos),',a.expNo)>0'));

				EXECUTE  immediate @stmtbody ;


			set @stmtbody  := CONCAT_WS('\n'
,"SELECT 
@totalnum as total,
IF( IFNULL(A.SCORE,0)=0 ,'-',rowid)rowid ,
a.classNo,
className AS className,
a.studentNo,
stu_name AS stu_name,
a.expNo,
IF(A.SCORE1 IS null OR A.SCORE =0,'',score1) AS score,
IF(A.read_ans_size IS null OR A.read_ans_size =0,'',read_ans_size) read_ans_size,
IF(A.mission_result IS null OR A.mission_result =0,'',mission_result) mission_result,
IF(A.log_count IS null OR A.log_count =0,'',log_count) log_count,
IF(a.teacherScore IS NULL OR a.teacherScore=0,'',a.teacherScore) AS teacherScore
FROM(
SELECT
dense_rank()  OVER (ORDER BY IFNULL(SUM(score),0)+ IFNULL(SUM(score1)/COUNT(score1),0)   DESC) rowid,
studentNo
,CONCAT_WS(',',IFNULL(score,'--'), ROUND(SUM(score1)/COUNT(score1),2)) score1
,ROUND(IFNULL(SUM(score),0)+ IFNULL(SUM(score1)/COUNT(score1),0),2) score
,a.classNo,className,stu_name, expNo,read_ans_size,mission_result,log_count,teacherScore
FROM(
SELECT 

@totalnum as total,
@rowNo= 1,@score = 0,
a.classNo,
IFNULL(d.className,'') className,
a.studentNo,
ifnull(c.stu_name,'')stu_name, 
a.expNo,"
,"@score := a.missionscore,"
,CONCAT_WS('',"ROUND(IF(b.classNo = ",QUOTE(classNo),",@score,NULL),2) AS score,")
,CONCAT_WS('',"ROUND(IF(b.classNo = ",QUOTE(classNo),",NULL,@score),2)AS score1,")
,CONCAT_WS('',"IF(b.classNo = ",QUOTE(classNo),",ifnull(a.read_ans_size,0),0) AS read_ans_size,")
,CONCAT_WS('',"IF(b.classNo = ",QUOTE(classNo),",ifnull(a.mission_result,0),0) AS mission_result,")
,CONCAT_WS('',"IF(b.classNo = ",QUOTE(classNo),",ifnull(a.done,0),0) AS log_count,")
,"teacherScore
FROM exp_experimentclassstudent as a
INNER JOIN exp_experimentclass AS b ON a.classNo = b.classNo
INNER join mysq1_schema.exp_classstudent as c on a.studentNo = c.stuNo
INNER join mysq1_schema.exp_class as d on c.classno = d.classNo"
,"WHERE ",CONCAT_WS('\n','instr(',quote(expNos),',a.expNo)>0')
,')as a 
GROUP BY studentNo-- ,a.expNo
ORDER BY score DESC
)AS A'
,"WHERE "
,CONCAT_WS('',"CASE 
WHEN IFNULL(" ,QUOTE(`keyword` ),",'')= '' THEN 1 
when CONCAT_WS('|',classNo,className)!='' AND CONCAT_WS('|',classNo,className)REGEXP ",QUOTE(`keyword` )," then 1
when CONCAT_WS('|',stu_name,studentNo)  != '' AND CONCAT_WS('|',stu_name,studentNo) REGEXP ",QUOTE(`keyword` ),"  then 1 
else 0
end")
);

-- 
SELECT @stmtbody ;-- LEAVE sl5;
EXECUTE immediate @stmtbody ;
commit;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `seacher6`
-- ----------------------------
DROP PROCEDURE IF EXISTS `seacher6`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `seacher6`(in expid varchar(70))
    READS SQL DATA
BEGIN

	insert plogs (Function_Name , parameter)value('seach 6', exppid);

	set @expid = expid ,@rowid= calcuscore(NULL,expid),@rowid = NULL,@statu= NULL;
-- SELECT @expid ;
						SELECT a.rowid, b.statu INTO @rowid,@statu
							FROM 	exp_experimentclassstudent AS a
							INNER JOIN exp_experimentclass AS b ON a.classNo = b.classNo
							WHERE  a.expNo = @expid;



-- dyna sort  select @rowid,@statu

			IF @statu IS NOt NULL THEN
					SELECT 	count(DISTINCT b.missionscore)+1  INTO @rowid
					FROM exp_experimentclassstudent AS a
					inner JOIN exp_experimentclassstudent AS b ON a.classNo = b.classNo 
					where a.expNo = @expid and a.missionscore < b.missionscore ;
			END IF;
-- 
			SELECT
					if(e.classType=1 ,null, @rowid) as rowid,
					a.classNo,
					d.className,
					a.studentNo,
					c.stu_name,
					a.expNo,
					if(e.classType=1 ,CAST('--' as char),ifnull(a.missionscore,0)) AS score,
					if(e.classType=1 ,CAST('--' as char),ifnull(a.read_ans_size,0)) AS read_ans_size,
					if(e.classType=1 ,CAST('--' as char),ifnull(a.mission_result,0)) AS mission_result,
					if(e.classType=1 ,CAST('--' as char),ifnull(a.log_count,0)) AS log_count,
					if(e.classType=1 ,CAST('--' as char),ifnull(a.teacherScore,0)) as teacherScore
					FROM
					exp_experimentclassstudent AS a
					LEFT JOIN mysq1_schema.exp_classstudent AS c ON a.studentNo = c.stuNo
					LEFT JOIN mysq1_schema.exp_class AS d ON c.classNo = d.classNo
					LEFT JOIN exp_experimentclass AS e ON a.classNo = e.classNo
							where  @expid = a.expNo ;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `seacher7`
-- ----------------------------
DROP PROCEDURE IF EXISTS `seacher7`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `seacher7`(IN `classNo` varchar(60) ,IN `keyword` varchar(60),in `page` int(4),in `num` int(6))
    READS SQL DATA
BEGIN
	-- insert plogs (Function_Name , parameter)value('seach 7',CONCAT_WS('', QUOTE(`classNo`) ,QUOTE(`keyword`) ,`page` ,`num` ));

	set 	
				@offset2 = (IF(page=0,1,page)-1)*num,
				@num = num ,											

				@keyword	= if(keyword is null, '', trim(keyword)),	
				@stmtbody = NULL ,
				@classNo = IF(classNo is null ,'%',concat(TRIM(classNo),'%')),  
			@totalnum = 0 ;

				set @stmtbody1  = "
							SELECT count(*) 
							into @totalnum 	
												",
						@stmtbody2  = "
							FROM mysq1_schema.exp_classstudent as c 
							left join mysq1_schema.exp_class as d on c.classno = d.classNo
							where   c.classNo LIKE @classNo 
									AND
									case 
											
											when @keyword = ''  then 1 
											when d.className like concat('%',@keyword,'%') then 1
											when concat(c.stu_name,c.stuNo) like concat('%',@keyword,'%') then 1 
											else 0
									end ",
							@stmtbody  = concat(@stmtbody1,@stmtbody2);



				PREPARE stmt from  @stmtbody ;
				EXECUTE stmt ;
				DEALLOCATE PREPARE stmt;

/*										a.expNo,

										ifnull(a.missionscore,0) AS score,
										ifnull(a.read_ans_size,0) AS read_ans_size,
										ifnull(a.mission_result,0) AS mission_result,
										ifnull(a.log_count,0) AS log_count,
*/
-- 									a.rowNo,


			set @stmtbody1  = "
							SELECT 
										@totalnum as total,
										#ifnull(a.rowNo,'--') as rowid,

										c.classNo,
										d.className,
										c.stuNo,
										c.stu_name,

										d.teano
											",
					@stmtbody2  = CONCAT(@stmtbody2,"
										ORDER BY c.stuNo
										LIMIT ?,?"),
					@stmtbody = concat(@stmtbody1,@stmtbody2);


			PREPARE stmt from  @stmtbody ;
			EXECUTE stmt USING  @offset2  , @num;
			DEALLOCATE PREPARE stmt;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `search55`
-- ----------------------------
DROP PROCEDURE IF EXISTS `search55`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `search55`(IN `classNo` varchar(60) ,IN `keyword` varchar(2000),in `page` int(4),in `num` int(6))
    READS SQL DATA
sl5:BEGIN

	DECLARE  weight VARCHAR(60) DEFAULT NULL;
/*
START TRANSACTION;
CALL Audit_1('seacher5',CONCAT_WS(',',QUOTE( `classNo`),QUOTE(`keyword`),QUOTE(`page`),QUOTE(`num`)),'ok');
COMMIT;
*/

	set 	
				@offset2 = (IF(page=0,1,page)-1)*num,
				@num = num ,				

				@keyword	:= REGEXP_replace(IFNULL(keyword,''),'([()$.\\-{}\\?])','\\\\\\1'),
				weight = REGEXP_substr(@keyword,'(?:\\d+(?:(?<=\\d)\\.\\d+)?)(?=%)'),-- |(?:\\*\\d+(?:\\.\\d+)?))
	 			@keyword = REGEXP_replace(@keyword,'(?:\\d+(?:(?<=\\d)\\.\\d+)?%)',''),-- |(?:\\*\\d+(?:\\.\\d+)?))',''),
				@stmtbody = NULL ,
				@classNo = IF(classNo is null ,'',TRIM(classNo)),  
			@totalnum = 0 ;

			SET @totalnum = NULL,@maxtime = NULL,@maxstatu =NULL;

SELECT
-- a.classNo,Count(*),a.mission_total,a.statu,
CONCAT_WS('','UPDATE exp_experimentclass  SET mission_total = ',Count(*),',statu = NULL WHERE classNo = ',QUOTE(a.classNo))
INTO @stmtbody
FROM
exp_experimentclass AS a
INNER JOIN exp_experimentclass_course AS b ON b.classNo = a.classNo
INNER JOIN exp_courses_node AS c ON b.courseNo = c.node_courseNo
INNER JOIN exp_courses_node_content AS d ON d.contentNo = c.contentNo
LEFT JOIN exp_cour_node_cont AS e ON e.classNo = b.classNo AND e.courseNo = b.courseNo AND e.classNo = b.classNo AND e.courseNo = b.courseNo AND e.contentNo = d.contentNo AND e.typesort = d.typesort AND e.missionid = d.missionid AND e.classNo = b.classNo AND e.courseNo = b.courseNo
WHERE 1
AND a.classNo = `classNo`
AND d.contentType != 'edit'
AND e.classNo IS NULL;


EXECUTE immediate @stmtbody;

EXECUTE immediate "DROP TEMPORARY TABLE if EXISTS TEMPORARY ";




SET @stmtbody = CONCAT_WS('\n',
"
CREATE TEMPORARY TABLE TEMPORARY AS
SELECT
a.statu,
a.expNo,
a.studentNo,
sum(b.mission_result) mission_result,
sum(b.resultCount) resultCount,
sum(b.read_ans_size) read_ans_size,
sum(b.score) score,
COUNT(*) 题
,d.mission_total 
FROM
exp_experimentclassstudent AS a
INNER JOIN exp_experimentclass AS d ON a.classNo = d.classNo
LEFT JOIN acc_1 AS b ON b.expID = a.expNo
WHERE
a.statu IS NOT NULL"
,CONCAT('AND a.classNo = ',quote(classNo))
,"GROUP BY expNo"
);


				EXECUTE immediate   @stmtbody ;
SET @DISABLE_TRIGGERS =1;
EXECUTE immediate "
UPDATE 
TEMPORARY AS a
INNER JOIN exp_experimentclassstudent AS d ON d.expNo = a.expNo
seT
d.statu = NULL ,
d.mission_result = a.mission_result,
d.read_ans_size = a.read_ans_size,
d.score = a.score,
d.missionscore = IF(IFNULL(mission_total,0)= 0,NULL,a.score/mission_total),
d.done = 题
WHERE
a.statu IS NOT NULL";


				SET @stmtbody1  = "
SELECT count(*) 
into @totalnum 	
					",
						@stmtbody2  = CONCAT_WS('',"
FROM exp_experimentclassstudent as a
INNER JOIN exp_experimentclass AS b ON a.classNo = b.classNo
LEFT JOIN exp_experimentclass_course AS b1 ON b1.classNo = b.classNo
LEFT join mysq1_schema.exp_classstudent as c on a.studentNo = c.stuNo
LEFT join mysq1_schema.exp_class as d on c.classno = d.classNo
WHERE b.classNo = ",QUOTE(@classNo),"
AND
case 
when (@keyword:=",QUOTE(@keyword), ")='' then 1
when CONCAT_WS('',d.classNo,d.className) REGEXP @keyword  then 1
when concat(c.stu_name,a.studentNo) REGEXP @keyword  then 1 
else 0
end  ",'\nGROUP BY a.expno'),
							@stmtbody  = concat(@stmtbody1,@stmtbody2);




			set @stmtbody1  := CONCAT_WS('\n',
"SELECT 
@totalnum as total,
@rowNo := IF(IFNULL(a.score,0) <>@score ,@rowid+1, @rowid) AS rowid,
a.classNo,
className AS className,
a.studentNo,
stu_name AS stu_name,
a.expNo,
@SCORE := IFNULL(A.SCORE,0) AS score,
a.read_ans_size,
a.mission_result,
IF(done =1,0,done) log_count,
IF(a.teacherScore IS NULL,'',a.teacherScore) AS teacherScore


FROM(
SELECT 
done,
@totalnum as total,
@rowNo= 1,@score = 0,
a.classNo,
d.className,
a.studentNo,
c.stu_name,
a.expNo,"
,CONCAT_WS('',"a.missionscore",CONCAT('*',IF(`weight`='',NULL,`weight`),"/100"))," AS score,
ifnull(a.read_ans_size,0) AS read_ans_size,
ifnull(a.mission_result,0) AS mission_result,
ifnull(a.log_count,0) AS log_count,
a.teacherScore
FROM exp_experimentclassstudent as a
INNER JOIN exp_experimentclass AS b ON a.classNo = b.classNo
LEFT join mysq1_schema.exp_classstudent as c on a.studentNo = c.stuNo
LEFT join mysq1_schema.exp_class as d on c.classno = d.classNo"
,CONCAT_WS('',"WHERE b.classNo = ",QUOTE(@classNo)),
"AND CASE 
when (@keyword:=",QUOTE(@keyword), ")='' then 1
when CONCAT_WS('',d.classNo,d.className) REGEXP @keyword  then 1
when concat(c.stu_name,a.studentNo) REGEXP @keyword  then 1 
else 0
end",'GROUP BY a.expno',
"ORDER BY case when a.missionscore is null then 1 else 0 end ASC ,a.missionscore DESC,a.studentNo ASC"
,CONCAT_WS('',"LIMIT ",CONCAT_WS(',',@offset2,@num))
,')AS A'),
					@stmtbody = concat(@stmtbody1);
SET @rowid = 0,@score=0 ;

	EXECUTE immediate @stmtbody ;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Select_ErrFields`
-- ----------------------------
DROP FUNCTION IF EXISTS `Select_ErrFields`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `Select_ErrFields`(`statu` varchar(1),`a_n` int(3),`a_fnz` varchar(300),`field_Names` varchar(400),`field_values` longtext) RETURNS varchar(2000) CHARSET utf8mb3
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
	#Routine body goes here...

	DECLARE w1 VARCHAR(20);
	DECLARE w2 VARCHAR(200);

/*
绿色： #00FF00
红色： #FF9999 
*/

	SET @fields_ = '';

	CASE
			WHEN statu IS NULL THEN
				label1:LOOP
						SET  	w1 = Fetch_Set(a_fnz,1,NULL),w2 = '',
									a_fnz = SUBSTR(a_fnz , CHAR_LENGTH(w1)+2),
									@w2 = 0;
						IF field_Names != '' AND field_values != '' THEN
							SET @w2 = FIND_IN_SET(CONCAT(@statu,w1),field_Names);
						END IF;

						IF @w2 != 0 THEN 
								SET field_Names = Fetch_Set_Pop(field_Names,@w2,NULL),
										field_values = Fetch_Set_Pop(field_values,@w2,'\''),
										w2 = Fetch_Set(field_values,1,'\''), 
										field_Names = SUBSTR(field_Names , CHAR_LENGTH(w1)+3),
										field_values = SUBSTR(field_values , CHAR_LENGTH(w2)+3),
										@fields_  = CONCAT(@fields_,QUOTE(w2)," REGEXP a.a",w1," AS err_",w1);
							ELSE
								SET @fields_  = CONCAT(@fields_,"'' REGEXP a.a",w1," AS err_",w1);
						END IF;
						SET a_n = a_n - 1;
						IF a_n <= 0 THEN LEAVE label1; END IF;
						SET @fields_ = CONCAT(@fields_,",");
					END LOOP  label1;
			ELSE set @fields_='error';
	END CASE;

	RETURN @fields_ ;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Select_ErrStat`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Select_ErrStat`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Select_ErrStat`(IN `STATU` varchar(5),IN `key_fields` varchar(140),IN `key_values` varchar(120),IN `field_Names` varchar(400),IN `field_values` longtext)
    MODIFIES SQL DATA
select_arr: BEGIN
#  1164 ; 1054;1139
#  NULL 比较
# 1 提交
# 3 读取

  DECLARE CONTINUE HANDLER FOR  SQLSTATE '23000', SQLSTATE	'42000'	, SQLSTATE	'42S22' , SQLSTATE	'HY000', SQLSTATE	'22007'
	BEGIN 
		GET DIAGNOSTICS CONDITION 1 @`sqlstate` = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;SET  @`sqlstate` = JSON_OBJECT('sqlstate',@`sqlstate`,'errno',@errno,'text',@text);
		SET @funcid = 'Select_ErrStat',@`errsql` = @p1_body,
				@p = CONCAT_WS(',',QUOTE(`STATU`) ,QUOTE(`key_fields`) ,QUOTE(`key_values`),QUOTE(`field_Names`),QUOTE(`field_values`));
		CALL `Audit_3`(COLUMN_create('m',CONCAT_WS(': ','Error',CONCAT_WS(', ',@funcid,'  P2')),'err', @`sqlstate`,'SQL', @select_err_body,'pp',@`p`)	);
	END;

/*
start TRANSACTION;
SET @funcid = 'Select_ErrStat',@p = CONCAT_WS(',',QUOTE(`STATU`) ,QUOTE(`key_fields`) ,QUOTE(`key_values`),QUOTE(`field_Names`),QUOTE(`field_values`));
CALL Audit_3(COLUMN_create('m',CONCAT_WS(' : ',@funcid),'pp',@p));COMMIT;
SELECT NULL;CALL Audit_1('Select_ErrStat',CONCAT_WS(',',QUOTE(`STATU`) ,QUOTE(`key_fields`) ,QUOTE(`key_values`),QUOTE(`field_Names`),QUOTE(`field_values`)),`field_values`);
COMMIT;*/

-- SELECT NULL; LEAVE select_arr;



	SET @missionid = null,@a_t = null,@a_n= 0;

  SET @missionid = Fetch_Set(key_values,2,'\''),
			@a_t = Fetch_Set(key_values,3,'\''),
			@select_err_body = 'select null';

 -- SELECT  CONCAT_WS(',',QUOTE(@missionid),'0','@a_fields','@a_n','@a_value');LEAVE select_arr;	
		CALL Generate_One_En(@missionid,'0',@a_fields,@a_n,@a_value);
-- SELECT  @select_err_body; LEAVE select_arr;

-- SELECT @select_err_body;
		IF IFNULL(@a_fields,'') != '' THEN

				CALL Fetch_Set_values(@a_value,'0',@a_values_1);
				SET @field_name = CONCAT('\'',REPLACE(field_names,',','\',\''),'\'');

				IF IFNULL(@a_values_1,'') != '' THEN  

						CALL Temp_Func_3(CONCAT_WS(' ',"IF(???? REGEXP ???,IF(??? REGEXP ",QUOTE('\\Q(?#\\E'),",NULL,'#00FF00'),'#FF9999')AS ERR_?? "),NULL,NULL,
																	null,NULL,'a',@a_fields,@a_values_1,@field_name,field_values,@one);
					IF IFNULL(@one,'') != '' THEN 
							SET	@select_err_body =CONCAT("SELECT \n",
											Fetch_Set(key_values,1,',')," AS expid,\n",
											QUOTE(@missionid)," AS missionid,\n",
											 0, " AS rowNo, " ,@one,"\n",QUOTE(@a_fields)," AS a_s");
						END IF;
				END IF;
		END IF ;




-- SELECT  @select_err_body; LEAVE select_arr;
	EXECUTE immediate @select_err_body;

	SET @a = null,
			@select_err_body =CONCAT("
	SELECT mission_result  INTO @a
	FROM acc_1 WHERE expid = ",Fetch_Set( `key_values` ,1,',')," AND missionid = ",QUOTE(@missionid));
 -- LEAVE select_arr;


	EXECUTE immediate @select_err_body;

	IF FOUND_ROWS() = 0 THEN 
			SET @select_err_body =  CONCAT("
			INSERT INTO acc_1(expid,missionid,mission_result)
			VALUE(",Fetch_Set( `key_values` ,1,','),"," ,QUOTE(@missionid),",1)");
		ELSE 
			SET @select_err_body =  CONCAT("
			UPDATE acc_1 
				SET mission_result = ",CEILING(IFNULL(@a,0) + 1),"
			WHERE expid = ",Fetch_Set( `key_values` ,1,',')," AND missionid = ",QUOTE(@missionid));
	END IF;

		EXECUTE immediate @select_err_body;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `SpeedDial`
-- ----------------------------
DROP PROCEDURE IF EXISTS `SpeedDial`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SpeedDial`(IN `funcid` varchar(60),IN `p` varchar(500))
`l`:BEGIN

/*
funcid
0 - 上翻
1 - 下翻
2 - 刷新 NULL
3 -  岗位 

'*/

DECLARE CONTINUE HANDLER FOR  SQLSTATE 'HY000', SQLSTATE '23000', SQLSTATE	'42000'	, SQLSTATE	'42S22'	
bl:BEGIN GET DIAGNOSTICS CONDITION 1 @`sqlstate` = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;SET  @`sqlstate` = JSON_OBJECT('sqlstate',@`sqlstate`,'errno',@errno,'text',@text);SET @funcid := NULL,
		@funcid = CONCAT_WS(' ','Error：','Speedial',`funcid`  ,ELT(`funcid` +1,'上翻','下翻','刷新 NULL','岗位')),@`errsql` = @sql_body,
		@pp = CONCAT_WS(',',QUOTE(`funcid`),QUOTE(`p`));
CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp,'SQL',@`errsql`,'err',@`sqlstate`));END; 
SET @开始时间 = SYSDATE(6);
/*
START TRANSACTION; 
		SET @funcid = CONCAT_WS(' ','Speedial',`funcid`  ,ELT(`funcid` +1,'上翻','下翻','刷新 NULL','岗位')),@`errsql` = @sql_body,
		@pp = CONCAT_WS(',',QUOTE(`funcid`),QUOTE(`p`));
CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp));COMMIT;
LEAVE `l`; 
*/
SET @start:=sysdate(6);

	SET @sql_body = NULL;


	CASE 
			WHEN  `funcid` = 3 THEN 
			CALL flow(REGEXP_replace( `p`,'(?<=p2":){','{"funcid":"3",'));
-- 		 SELECT REGEXP_replace( p,'(?<=p2":){','{"funcid":"3",');
			LEAVE `l`;

		ELSE
		
 
	SET @sql_body = NULL,@requirement1 = NULL,@requirement2 = NULL,@expId = NULL,@classNo = NULL,@courseNo = NULL,@nodeNo = NULL,@contentNo = NULL;

	SET	@expId = j0(`p`,"expId"),
			@classNo = j0(`p`,"classNo"),
			@courseNo = j0(`p`,"courseNo"),
			@nodeNo = IF(IFNULL(j0(`p`,"nodeNo"),'')='',NULL,j0(`p`,"nodeNo")),
			@contentNo = j0(`p`,"contentNo"),
			@nodenum = Stati_ch(@nodeNo,'.');
	SET @requirement1 = CONCAT_WS(' AND\n',CONCAT('a.expNo = ',quote_d(@expId)),
																	CONCAT('a.studentNo = ',json_extract(p,'$.stuNo')),
																		CONCAT('a1.classNo = ',quote_d(@classNo)),
																		IF(`funcid` = 0 AND IFNULL(@nodeNo,'')='',NULL,
																		CONCAT('b.node_courseNo = ',quote_d(@courseNo))
																		)
/*																		,CASE `funcid` = 0 
																				WHEN @nodenum > 0 THEN
																					CONCAT('b.node_No like "',SUBSTRING_INDEX(@nodeNo,".",@nodenum),'.%"')
																				WHEN @nodeNo IS NOT NULL OR @courseNo IS NULL THEN NULL
																			ELSE CONCAT('b.node_No like "',@nodeNo,'.%"')
																		END
*/																);


IF RAND()*10>0 THEN 
		SET	@sql_body = CONCAT_WS("",	"REPLACE INTO abc(expID,classNo,courseNo,cabc_node_No,node_No,contentNo,practic,test,per1,courseware,perRate,perscore,statu)\n",
																	"SELECT a.expNo AS expID,a1.classNo,a2.courseNo,cabc(b.node_No) AS cabc_node_No,b.node_No,b.contentNo,\n",
																	"Count(IF(c1.contentType = 'kj' AND c6.billType <> 'kjxt',c1.missionid,NULL)) AS practic,\n",
																	"Count(IF(c1.contentType = 'kj' AND c6.billType = 'kjxt',c1.missionid,NULL)) AS test,\n",
																	"Sum(IF(c5.billid IS NOT NULL , 1,0)) AS per1,\n",
																	"Count(c2.unique_id) AS courseware,\n",
																	"Count(c4.missionId) AS perRate,\n",
																	"Sum(IF(a1.classType != 1,IF(c4.score<0,0,c4.score),NULL)) AS perscore,NULL\n",
																	"FROM exp_experimentclassstudent AS a\n",
																	"INNER JOIN exp_experimentclass AS a1 ON a.classNo = a1.classNo\n",
																	"INNER JOIN exp_experimentclass_course AS a2 ON a2.classNo = a1.classNo\n",
																	"INNER JOIN exp_courses_node AS b ON a2.courseNo = b.node_courseNo\n",
																	"LEFT JOIN abc AS b1 ON b1.classNo = a2.classNo AND b1.courseNo = a2.courseNo AND b1.courseNo = b.node_courseNo AND b1.node_No = b.node_No AND b1.contentNo = b.contentNo AND b1.expID = a.expNo\n",
																	"INNER JOIN exp_courses_node_content AS c1 ON c1.contentNo = b.contentNo\n",
																	"LEFT JOIN exp_cour_node_cont AS c0 ON a1.classNo = c0.classNo AND c1.contentNo = c0.contentNo AND c1.typesort = c0.typesort AND c1.missionid = c0.missionid AND b.node_courseNo = c0.courseNo\n",
																	"LEFT JOIN acc_mission AS c5 ON c5.missionId = c1.missionid\n",
																	"LEFT JOIN mysq1_schema.bill_list AS c6 ON c5.billId = c6.billId\n",
																	"LEFT JOIN exp_courseware_cells AS c2 ON c1.missionid = c2.unique_id\n",
																	"LEFT JOIN acc_1 AS c4 ON c4.expID = a.expNo AND c1.missionid = c4.missionId\n",
																	"WHERE ",@requirement1," AND b.contentNo IS NOT NULL AND (b1.expID IS NULL OR b1.statu IS NOT NULL)  AND c0.missionid IS NULL\n",
																	"GROUP BY a1.classNo ,a.expNo,a2.courseNo,b.node_No");
-- SELECT  @sql_body ;
	 	EXECUTE immediate @sql_body ;
END IF;


		SET	@nodenum = Stati_ch(@nodeNo,'.'),
				@requirement1 = CONCAT_WS(' AND ',CONCAT('b.expId = ',quote_d(@expId)),
													CONCAT('b.classNo = ',quote_d(@classNo))),
				@sql_body = CONCAT_WS('',
						",\nSum(b.practic) AS practic,\n",
						"Sum(b.courseware) AS courseware,\n",
						"Sum(b.test) AS test,\n",
						"ROUND(SUM(b.perScore)/(SUM(b.practic) + Sum(b.test))) AS perscore,\n",
						"ROUND(SUM(b.perRate)/(SUM(b.practic)+ Sum(b.test))*100) AS perRate,\n",
						"a.node_type,a.node_tip,a.ico_url,a.node_isChapter,\n",
						"CAST(CONCAT_ws('&nbsp&nbsp&nbsp',\n",
						"				IF(Sum(b.practic) = 0 ,NULL,CONCAT('实训题 - ', Sum(b.practic))),\n",
						"				IF(Sum(b.test) = 0 ,NULL,CONCAT('客观题 - ', Sum(b.test))),\n",
						"--				IF(Sum(b.test) !=0 AND Sum(b.courseware) != 0 AND Sum(test)  !=0 ,'<br>',NULL),\n",
						"				IF(Sum(b.courseware) = 0 ,NULL,CONCAT('课件 - ', Sum(b.courseware)))\n",
						" )AS CHAR) AS Str_total\n",
						"FROM exp_courses_node AS a\n",
						"LEFT JOIN exp_courses AS a1 ON a.node_courseNo = a1.courseNo\n");

		IF IFNULL(@classNo,'') = '' THEN
					 SET @sql_body = CONCAT_WS('',@sql_body,"LEFT JOIN(\n","SELECT\nc1.contentNo,\nCount(IF(c1.contentType = 'kj' AND c6.billType <> 'kjxt',c1.missionid,NULL)) AS practic,\nCount(IF(c1.contentType = 'kj' AND c6.billType = 'kjxt',c1.missionid,NULL)) AS test,\nSum(IF(c5.billid IS NOT NULL , 1,0)) AS per1,\nCount(c2.unique_id) AS courseware,\nnull AS perRate,\nNULL AS perscore,\na.node_courseNo\nFROM\nqianxue_test.exp_courses_node_content AS c1\nINNER JOIN qianxue_test.exp_courses_node AS a ON c1.contentNo = a.contentNo\nLEFT JOIN qianxue_test.acc_mission AS c5 ON c5.missionId = c1.missionid\nLEFT JOIN mysq1_schema.bill_list AS c6 ON c5.billId = c6.billId\nLEFT JOIN qianxue_test.exp_courseware_cells AS c2 ON c1.missionid = c2.unique_id\nWHERE \na.node_courseNo = ",QUOTE(@courseNo),"\nGROUP BY\nc1.contentNo","\n) AS b ON b.contentNo = a.contentNo");
			ELSE SET	@sql_body = CONCAT_WS('',@sql_body,"INNER JOIN exp_experimentclass_course AS a2 ON a2.classNo = ",quote_d(@classNo)," AND a2.courseNo = a1.courseNo\n",
						"LEFT JOIN abc AS b ON ",@requirement1," AND b.courseNo = a.node_courseNo AND b.node_No = a.node_No AND b.contentNo = a.contentNo");
		END IF;


-- 	SET @sql_body = CONCAT_WS('',CONCAT(',',@a_body),@sql_body);

	SET @requirement1 = CONCAT("a.node_courseNo = ",quote_d(@courseNo)),
			@a_body = NULL;

	CASE 
			WHEN @nodenum > 0 AND  `funcid` = 0  THEN
					SET @requirement2 = CONCAT_WS('','SUBSTRING_INDEX(a.node_No,".",',@nodenum+1,')'),
							@a_body = CONCAT_WS('',"/*n0*/SELECT ",QUOTE(@expId)," AS expID,",QUOTE(@classNo)," AS classNo,",
															"a.node_courseNo AS courseNo,a.node_No ,a.node_url,a.contentNo,a.node_Id,a.node_parentNo,a.node_text,",QUOTE(@a_body)),
							@requirement1 = CONCAT_WS(' AND\n',@requirement1,CONCAT('a.node_courseNo = ',quote_d(@courseNo)),
																								CONCAT('a.node_No LIKE "',SUBSTRING_INDEX(@nodeNo,".",@nodenum),'.%"')),
							@requirement2 = CONCAT_WS(',',CONCAT('cabc(',@requirement2,')'));

			WHEN preg_rlike('/^\\d+/',@nodeNo) AND  `funcid` = 1 THEN
					SET @requirement2 = CONCAT_WS('','SUBSTRING_INDEX(a.node_No,".",',@nodenum+2,')'),
							@a_body = CONCAT_WS('',"/*n1*/SELECT ",QUOTE(@expId)," AS expID,",QUOTE(@classNo)," AS classNo,",
														"a.node_courseNo AS courseNo,a.node_No,a.node_url,a.contentNo,a.node_Id,a.node_parentNo, a.node_text,",QUOTE(@a_body)),
							@requirement1 = CONCAT_WS(' AND\n',@requirement1,CONCAT('a.node_courseNo = ',quote_d(@courseNo)),
																				CONCAT('a.node_No LIKE "',@nodeNo,'.%"')),
							@requirement2 = CONCAT_WS(',',CONCAT('cabc(',@requirement2,')'));

			WHEN @nodeNo IS NULL  AND  `funcid` = 1 OR  @nodeNo IS NOT NULL AND `funcid` = 0  OR IFNULL(j0(`p`,'cnumber'),0) = 1 THEN

					SET @a_body := NULL,
							@a_body := CONCAT(",\n'domid',case when ifnull(a.node_text,'') = '' then null\n",REPLACE(@a_body,'`@a_body`',' when a.node_text'),' end\n'),
							@a_body = CONCAT_WS('',"\n,CAST(COLUMN_json(COLUMN_CREATE('billid',a.billid,'before_id',a.before_id",@a_body,"))AS CHAR)");

					SET @requirement2 = CONCAT_WS('','SUBSTRING_INDEX(a.node_No,".",',@nodenum+1,')'),
							@a_body = CONCAT_WS('',"/*1z*/SELECT ",QUOTE(@expId)," AS expID,",QUOTE(@classNo)," AS classNo,",
														"a.node_courseNo AS courseNo, a.node_No,a.node_url,a.contentNo,a.node_Id,a.node_parentNo, a.node_text\n",@a_body),
							@requirement1 = IF(IFNULL(@courseNo,'') = '',NULL,CONCAT_WS(' AND\n',@requirement1,CONCAT('a.node_courseNo = ',quote_d(@courseNo)))),
							@requirement2 = CONCAT_WS(',',CONCAT('cabc(',@requirement2,')'));

			WHEN @courseNo IS NULL OR `funcid` = 0 OR @nodeNo IS NULL AND  `funcid` = 0 THEN 

SELECT NULL INTO @a_body FROM information_schema.`TABLES` AS a WHERE a.TABLE_SCHEMA = DATABASE() AND a.TABLE_NAME =  'exp_group';

IF FOUND_ROWS() THEN 

SELECT '"exp_group","1"' inTO @a_body FROM exp_experimentclassstudent AS a INNER JOIN exp_group AS b ON b.expId = a.expNo
WHERE  a.expNo  = j0(p,'expid')AND b.stuNo = j0(p,'stuNo'); 
END IF ;
--  SET @a_body = NULL ;
SELECT NULLIF(CONCAT_WS(',',@a_body,GROUP_CONCAT(CONCAT(quote(a.COLUMN_NAME),',a1.',a.COLUMN_NAME) SEPARATOR ',')),'') INTO @a_body
FROM information_schema.`COLUMNS` AS a WHERE a.TABLE_SCHEMA = DATABASE()AND a.TABLE_NAME  = 'exp_courses' AND a.COLUMN_NAME REGEXP  'before_id|billid' ;

					SET @a_body = CONCAT("\nCAST(COLUMN_json(COLUMN_CREATE(",@a_body,"))AS CHAR)");
					SET @a_body = CONCAT_WS('',"/*0c*/SELECT ",QUOTE(@expId)," AS expID,",QUOTE(@classNo)," AS classNo,",
														"a.node_courseNo AS courseNo,NULL AS node_No,a1.img_url AS node_url,a1.courseName AS node_text,",
														"NULL AS contentNo,a.node_Id,0 AS node_parentNo,",IF(IFNULL(@a_body,'')<>'',@a_body,'""'),' AS dblob '),
							@requirement2 = "CONCAT(IFNULL(a1.sort,''),a.node_courseNo)"/**/ ;
		-- 		SELECT @a_body;			

		ELSE		SELECT "NOT ok"; LEAVE  `l`;
	END CASE;

 	SET @sql_body = CONCAT_WS('',@a_body,@sql_body,CONCAT("\nWHERE ",@requirement1),"\nGROUP BY ",@requirement2,'\nHAVING str_total <> ""');



	END CASE;
  SET  @sql_body:= REGEXP_replace(@sql_body,'(?i)AS Str_total',CONCAT_WS('','AS Str_total,exetime(',QUOTE(@开始时间),CONVERT(')as zhxing汉'USING utf8)));-- leave `l`;
 -- SELECT CAST(@sql_body AS CHAR) ;
	EXECUTE immediate @sql_body ;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `SpeedDialen`
-- ----------------------------
DROP PROCEDURE IF EXISTS `SpeedDialen`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SpeedDialen`(IN `funcid` varchar(60),IN `p` varchar(500))
`l`:BEGIN

/*
funcid
0 - 上翻
1 - 下翻
2 - 刷新 NULL
3 -  岗位 

'*/

DECLARE CONTINUE HANDLER FOR  SQLSTATE 'HY000', SQLSTATE '23000', SQLSTATE	'42000'	, SQLSTATE	'42S22'	
bl:BEGIN GET DIAGNOSTICS CONDITION 1 @`sqlstate` = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;SET  @`sqlstate` = JSON_OBJECT('sqlstate',@`sqlstate`,'errno',@errno,'text',@text);SET @funcid := NULL,
		@funcid = CONCAT_WS(' ','Error：','Speedialen',`funcid`  ,ELT(`funcid` +1,'上翻','下翻','刷新 NULL','岗位')),@`errsql` = @sql_body,
		@pp = CONCAT_WS(',',QUOTE(`funcid`),QUOTE(`p`));
CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp,'SQL',@`errsql`,'err',@`sqlstate`));END; 
SET @开始时间 = SYSDATE(6);

START TRANSACTION; 
		SET @funcid = CONCAT_WS(' ','Speedial',`funcid`  ,ELT(`funcid` +1,'上翻','下翻','刷新 NULL','岗位')),@`errsql` = @sql_body,
		@pp = CONCAT_WS(',',QUOTE(`funcid`),QUOTE(`p`));
CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp));COMMIT;/*
LEAVE `l`; 
*/
SET @start:=sysdate(6);

	SET @sql_body = NULL;


	CASE 
			WHEN  `funcid` = 3 THEN 
			CALL flow(REGEXP_replace( `p`,'(?<=p2":){','{"funcid":"3",'));
-- 		 SELECT REGEXP_replace( p,'(?<=p2":){','{"funcid":"3",');
			LEAVE `l`;

		ELSE
		
 
	SET @sql_body = NULL,@requirement1 = NULL,@requirement2 = NULL,@expId = NULL,@classNo = NULL,@courseNo = NULL,@nodeNo = NULL,@contentNo = NULL;

	SET	@expId = j0(`p`,"expId"),
			@classNo = j0(`p`,"classNo"),
			@courseNo = j0(`p`,"courseNo"),
			@nodeNo = j0(`p`,"nodeNo"),
			@contentNo = j0(`p`,"contentNo"),
			@nodenum = Stati_ch(@nodeNo,'.');

 SET  @sql_body = CONCAT_WS('\t','SELECT json_array(count(*),GROUP_CONCAT(statu))\ninto @sql_body\nFROM abc0 AS a WHERE a.classNo=',json_extract(p,"$.classNo"),CONCAT(' AND a.courseNo=',json_extract(p,"$.courseNo")));
EXECUTE immediate @sql_body ;

if(json_value(@sql_body,'$[0]') = 0 OR json_value(@sql_body,'$[1]') != 'null' )THEN
SELECT 'ok';

SET @sql_body = CONCAT_WS('\n','REPLACE INTO abc0(classNo,courseNo,cabc_node_No,node_No,contentNo,classType,practic,test,per1,courseware,missionids,createtime)\nSELECT \na1.classNo,a2.courseNo,cabc(b.node_No) AS cabc_node_No,b.node_No,b.contentNo,\na1.classType,\nCount(IF(c1.contentType = \'kj\' AND c6.billType <> \'kjxt\',c1.missionid,NULL)) AS practic,\nCount(IF(c1.contentType = \'kj\' AND c6.billType = \'kjxt\',c1.missionid,NULL)) AS test,\nSum(IF(c5.billid IS NOT NULL , 1,0)) AS per1,\nCount(c2.unique_id) AS courseware\n,GROUP_CONCAT(c5.missionid) missionids\n,NOW()\nFROM  exp_experimentclass AS a1 \nINNER JOIN exp_experimentclass_course AS a2 ON a2.classNo = a1.classNo\nINNER JOIN exp_courses_node AS b ON a2.courseNo = b.node_courseNo\nINNER JOIN exp_courses_node_content AS c1 ON c1.contentNo = b.contentNo\nLEFT JOIN exp_cour_node_cont AS c0 ON a1.classNo = c0.classNo AND c1.contentNo = c0.contentNo AND c1.typesort = c0.typesort AND c1.missionid = c0.missionid AND b.node_courseNo = c0.courseNo\nLEFT JOIN acc_mission AS c5 ON c5.missionId = c1.missionid\nLEFT JOIN mysq1_schema.bill_list AS c6 ON c5.billId = c6.billId\nLEFT JOIN exp_courseware_cells AS c2 ON c1.missionid = c2.unique_id\nWHERE'
,CONCAT_WS(' ','a1.classNo = ',json_extract(p,"$.classNo"),CONCAT(' AND\nb.node_courseNo = ',json_extract(p,"$.courseNo")) ,'AND b.contentNo IS NOT NULL\nAND c0.missionid IS NULL\nGROUP BY a1.classNo ,a2.courseNo,b.node_No'
));

EXECUTE immediate @sql_body ;
END IF;

	SET @requirement1 = CONCAT_WS(' AND\n',CONCAT('a.expNo = ',quote_d(@expId)),
																		CONCAT('a1.classNo = ',quote_d(@classNo)),
																		IF(`funcid` = 0 AND @nodeNo IS NULL,NULL,
																		CONCAT('b.node_courseNo = ',quote_d(@courseNo))
																		)
																);

-- 生成 
-- SELECT CONCAT('b.node_No like "',SUBSTRING_INDEX(@nodeNo,".",@nodenum),'.%"');
IF RAND()*10>0 THEN 
		SET	@sql_body = CONCAT_WS("\n"
	,'REPLACE INTO abc(expID,classNo,courseNo,cabc_node_No,node_No,contentNo,practic,test,per1,courseware,perRate,perscore,statu)'
	,CONCAT_WS('','SELECT\n',json_extract(`p`,"$.expId"),' expID ,\na.classNo,a.courseNo,A.cabc_node_No,A.node_No,A.contentNo,\nA.practic,\nA.test,\nA.per1,\nA.courseware,\nCount(c4.missionId) AS perRate,\nSum(IF(a.classType != 1,IF(c4.score<0,0,c4.score),NULL)) AS perscore,NULL\nFROM abc0 AS a\nLEFT JOIN abc AS b1 ON b1.classNo = a.classNo AND b1.courseNo = a.courseNo AND b1.courseNo = a.courseNo AND b1.node_No = a.node_No AND b1.contentNo = a.contentNo AND b1.expID = "21103118595857603835"\nLEFT JOIN acc_1 AS c4 ON c4.expID = ',json_extract(`p`,"$.expId"),' AND INSTR(a.missionids,c4.missionId)')
	,concat_ws(' ','WHERE a.classNo =', json_extract(p,"$.classNo") ,CONCAT('AND\na.courseNo = ',json_extract(p,"$.courseNo")) ,'AND (b1.expID IS NULL OR b1.statu IS NOT NULL)  \nGROUP BY a.classNo ,a.courseNo,a.node_No')
);
-- SELECT @sql_body ;LEAVE l;
	 	EXECUTE immediate @sql_body ;
END IF;


		SET	@nodenum = Stati_ch(@nodeNo,'.'),
				@requirement1 = CONCAT_WS(' AND ',CONCAT('b.expId = ',quote_d(@expId)),
													CONCAT('b.classNo = ',quote_d(@classNo))),
				@sql_body = CONCAT_WS('',
						",\nSum(b.practic) AS practic,\n",
						"Sum(b.courseware) AS courseware,\n",
						"Sum(b.test) AS test,\n",
						"ROUND(SUM(b.perScore)/(SUM(b.practic) + Sum(b.test))) AS perscore,\n",
						"ROUND(SUM(b.perRate)/(SUM(b.practic)+ Sum(b.test))*100) AS perRate,\n",
						"a.node_type,a.node_tip,a.ico_url,a.node_isChapter,\n",
						"CAST(CONCAT_ws('&nbsp&nbsp&nbsp',\n",
						"				IF(Sum(b.practic) = 0 ,NULL,CONCAT('实训题 - ', Sum(b.practic))),\n",
						"				IF(Sum(b.test) = 0 ,NULL,CONCAT('客观题 - ', Sum(b.test))),\n",
						"--				IF(Sum(b.test) !=0 AND Sum(b.courseware) != 0 AND Sum(test)  !=0 ,'<br>',NULL),\n",
						"				IF(Sum(b.courseware) = 0 ,NULL,CONCAT('课件 - ', Sum(b.courseware)))\n",
						" )AS CHAR) AS Str_total\n",
						"FROM exp_courses_node AS a\n",
						"LEFT JOIN exp_courses AS a1 ON a.node_courseNo = a1.courseNo\n");

		IF IFNULL(@classNo,'') = '' THEN
					 SET @sql_body = CONCAT_WS('',@sql_body,"LEFT JOIN(\n","SELECT\nc1.contentNo,\nCount(IF(c1.contentType = 'kj' AND c6.billType <> 'kjxt',c1.missionid,NULL)) AS practic,\nCount(IF(c1.contentType = 'kj' AND c6.billType = 'kjxt',c1.missionid,NULL)) AS test,\nSum(IF(c5.billid IS NOT NULL , 1,0)) AS per1,\nCount(c2.unique_id) AS courseware,\nnull AS perRate,\nNULL AS perscore,\na.node_courseNo\nFROM\nqianxue_test.exp_courses_node_content AS c1\nINNER JOIN qianxue_test.exp_courses_node AS a ON c1.contentNo = a.contentNo\nLEFT JOIN qianxue_test.acc_mission AS c5 ON c5.missionId = c1.missionid\nLEFT JOIN mysq1_schema.bill_list AS c6 ON c5.billId = c6.billId\nLEFT JOIN qianxue_test.exp_courseware_cells AS c2 ON c1.missionid = c2.unique_id\nWHERE \na.node_courseNo = ",QUOTE(@courseNo),"\nGROUP BY\nc1.contentNo","\n) AS b ON b.contentNo = a.contentNo");
			ELSE SET	@sql_body = CONCAT_WS('',@sql_body,"INNER JOIN exp_experimentclass_course AS a2 ON a2.classNo = ",quote_d(@classNo)," AND a2.courseNo = a1.courseNo\n",
						"LEFT JOIN abc AS b ON ",@requirement1," AND b.courseNo = a.node_courseNo AND b.node_No = a.node_No AND b.contentNo = a.contentNo");
		END IF;


-- 	SET @sql_body = CONCAT_WS('',CONCAT(',',@a_body),@sql_body);

	SET @requirement1 = CONCAT("a.node_courseNo = ",quote_d(@courseNo)),
			@a_body = NULL;

	CASE 
			WHEN @nodenum > 0 AND  `funcid` = 0  THEN
					SET @requirement2 = CONCAT_WS('','SUBSTRING_INDEX(a.node_No,".",',@nodenum+1,')'),
							@a_body = CONCAT_WS('',"/*n0*/SELECT ",QUOTE(@expId)," AS expID,",QUOTE(@classNo)," AS classNo,",
															"a.node_courseNo AS courseNo,a.node_No ,a.node_url,a.contentNo,a.node_Id,a.node_parentNo,a.node_text,",QUOTE(@a_body)),
							@requirement1 = CONCAT_WS(' AND\n',@requirement1,CONCAT('a.node_courseNo = ',quote_d(@courseNo)),
																								CONCAT('a.node_No LIKE "',SUBSTRING_INDEX(@nodeNo,".",@nodenum),'.%"')),
							@requirement2 = CONCAT_WS(',',CONCAT('cabc(',@requirement2,')'));

			WHEN preg_rlike('/^\\d+/',@nodeNo) AND  `funcid` = 1 THEN
					SET @requirement2 = CONCAT_WS('','SUBSTRING_INDEX(a.node_No,".",',@nodenum+2,')'),
							@a_body = CONCAT_WS('',"/*n1*/SELECT ",QUOTE(@expId)," AS expID,",QUOTE(@classNo)," AS classNo,",
														"a.node_courseNo AS courseNo,a.node_No,a.node_url,a.contentNo,a.node_Id,a.node_parentNo, a.node_text,",QUOTE(@a_body)),
							@requirement1 = CONCAT_WS(' AND\n',@requirement1,CONCAT('a.node_courseNo = ',quote_d(@courseNo)),
																				CONCAT('a.node_No LIKE "',@nodeNo,'.%"')),
							@requirement2 = CONCAT_WS(',',CONCAT('cabc(',@requirement2,')'));

			WHEN @nodeNo IS NULL  AND  `funcid` = 1 OR  @nodeNo IS NOT NULL AND `funcid` = 0  OR IFNULL(j0(`p`,'cnumber'),0) = 1 THEN

					SET @a_body := NULL,
							@a_body := CONCAT(",\n'domid',case when ifnull(a.node_text,'') = '' then null\n",REPLACE(@a_body,'`@a_body`',' when a.node_text'),' end\n'),
							@a_body = CONCAT_WS('',"\n,CAST(COLUMN_json(COLUMN_CREATE('billid',a.billid,'before_id',a.before_id",@a_body,"))AS CHAR)");

					SET @requirement2 = CONCAT_WS('','SUBSTRING_INDEX(a.node_No,".",',@nodenum+1,')'),
							@a_body = CONCAT_WS('',"/*1z*/SELECT ",QUOTE(@expId)," AS expID,",QUOTE(@classNo)," AS classNo,",
														"a.node_courseNo AS courseNo, a.node_No,a.node_url,a.contentNo,a.node_Id,a.node_parentNo, a.node_text\n",@a_body),
							@requirement1 = IF(IFNULL(@courseNo,'') = '',NULL,CONCAT_WS(' AND\n',@requirement1,CONCAT('a.node_courseNo = ',quote_d(@courseNo)))),
							@requirement2 = CONCAT_WS(',',CONCAT('cabc(',@requirement2,')'));

			WHEN @courseNo IS NULL OR `funcid` = 0 OR @nodeNo IS NULL AND  `funcid` = 0 THEN 

SELECT NULL INTO @a_body FROM information_schema.`TABLES` AS a WHERE a.TABLE_SCHEMA = DATABASE() AND a.TABLE_NAME =  'exp_group';

IF FOUND_ROWS() THEN 

SELECT '"exp_group","1"' inTO @a_body FROM exp_experimentclassstudent AS a INNER JOIN exp_group AS b ON b.expId = a.expNo
WHERE  a.expNo  = j0(p,'expid')AND b.stuNo = j0(p,'stuNo'); 
END IF ;
--  SET @a_body = NULL ;
SELECT NULLIF(CONCAT_WS(',',@a_body,GROUP_CONCAT(CONCAT(quote(a.COLUMN_NAME),',a1.',a.COLUMN_NAME) SEPARATOR ',')),'') INTO @a_body
FROM information_schema.`COLUMNS` AS a WHERE a.TABLE_SCHEMA = DATABASE()AND a.TABLE_NAME  = 'exp_courses' AND a.COLUMN_NAME REGEXP  'before_id|billid' ;

					SET @a_body = CONCAT("\nCAST(COLUMN_json(COLUMN_CREATE(",@a_body,"))AS CHAR)");
					SET @a_body = CONCAT_WS('',"/*0c*/SELECT ",QUOTE(@expId)," AS expID,",QUOTE(@classNo)," AS classNo,",
														"a.node_courseNo AS courseNo,NULL AS node_No,a1.img_url AS node_url,a1.courseName AS node_text,",
														"NULL AS contentNo,a.node_Id,0 AS node_parentNo,",IF(IFNULL(@a_body,'')<>'',@a_body,'""'),' AS dblob '),
							@requirement2 = "CONCAT(IFNULL(a1.sort,''),a.node_courseNo)"/**/ ;
		-- 		SELECT @a_body;			

		ELSE		SELECT "NOT ok"; LEAVE  `l`;
	END CASE;

 	SET @sql_body = CONCAT_WS('',@a_body,@sql_body,CONCAT("\nWHERE ",@requirement1),"\nGROUP BY ",@requirement2,'\nHAVING str_total <> ""');



	END CASE;
  SET  @sql_body:= REGEXP_replace(@sql_body,'(?i)AS Str_total',CONCAT_WS('','AS Str_total,exetime(',QUOTE(@开始时间),CONVERT(')as zhxing汉'USING utf8)));-- leave `l`;
 -- SELECT @sql_body,CAST(@sql_body AS CHAR);-- LEAVE `l`;
	EXECUTE immediate @sql_body ;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `SpeedDial_copy`
-- ----------------------------
DROP PROCEDURE IF EXISTS `SpeedDial_copy`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SpeedDial_copy`(IN `funcid` varchar(60),IN `p` varchar(500))
`l`:BEGIN

/*
funcid
0 - 上翻
1 - 下翻
2 - 刷新 NULL
3 -  岗位 

'*/

DECLARE CONTINUE HANDLER FOR  SQLSTATE 'HY000', SQLSTATE '23000', SQLSTATE	'42000'	, SQLSTATE	'42S22'	
bl:BEGIN GET DIAGNOSTICS CONDITION 1 @`sqlstate` = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;SET  @`sqlstate` = JSON_OBJECT('sqlstate',@`sqlstate`,'errno',@errno,'text',@text);SET @funcid := NULL,
		@funcid = CONCAT_WS(' ','Error：','Speedial',`funcid`  ,ELT(`funcid` +1,'上翻','下翻','刷新 NULL','岗位')),@`errsql` = @sql_body,
		@pp = CONCAT_WS(',',QUOTE(`funcid`),QUOTE(`p`));
CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp,'SQL',@`errsql`,'err',@`sqlstate`));END; 
SET @开始时间 = SYSDATE(6);

START TRANSACTION; 
		SET @funcid = CONCAT_WS(' ','Speedial',`funcid`  ,ELT(`funcid` +1,'上翻','下翻','刷新 NULL','岗位')),@`errsql` = @sql_body,
		@pp = CONCAT_WS(',',QUOTE(`funcid`),QUOTE(`p`));
CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp));COMMIT;/*
LEAVE `l`; 
*/
SET @start:=sysdate(6);

	SET @sql_body = NULL;


	CASE 
			WHEN  `funcid` = 3 THEN 
			CALL flow(REGEXP_replace( `p`,'(?<=p2":){','{"funcid":"3",'));
-- 		 SELECT REGEXP_replace( p,'(?<=p2":){','{"funcid":"3",');
			LEAVE `l`;

		ELSE
		
 
	SET @sql_body = NULL,@requirement1 = NULL,@requirement2 = NULL,@expId = NULL,@classNo = NULL,@courseNo = NULL,@nodeNo = NULL,@contentNo = NULL;

	SET	@expId = j0(`p`,"expId"),
			@classNo = j0(`p`,"classNo"),
			@courseNo = j0(`p`,"courseNo"),
			@nodeNo = IF(IFNULL(j0(`p`,"nodeNo"),'')='',NULL,j0(`p`,"nodeNo")),
			@contentNo = j0(`p`,"contentNo"),
			@nodenum = Stati_ch(@nodeNo,'.');
	SET @requirement1 = CONCAT_WS(' AND\n',CONCAT('a.expNo = ',quote_d(@expId)),
																	CONCAT('a.studentNo = ',json_extract(p,'$.stuNo')),
																		CONCAT('a1.classNo = ',quote_d(@classNo)),
																		IF(`funcid` = 0 AND IFNULL(@nodeNo,'')='',NULL,
																		CONCAT('b.node_courseNo = ',quote_d(@courseNo))
																		)
/*																		,CASE `funcid` = 0 
																				WHEN @nodenum > 0 THEN
																					CONCAT('b.node_No like "',SUBSTRING_INDEX(@nodeNo,".",@nodenum),'.%"')
																				WHEN @nodeNo IS NOT NULL OR @courseNo IS NULL THEN NULL
																			ELSE CONCAT('b.node_No like "',@nodeNo,'.%"')
																		END
*/																);


IF 1 THEN 
		SET	@sql_body = CONCAT_WS("",	"REPLACE INTO abc(expID,classNo,courseNo,cabc_node_No,node_No,contentNo,practic,test,per1,courseware,perRate,perscore,statu)\n",
																	"SELECT a.expNo AS expID,a1.classNo,a2.courseNo,cabc(b.node_No) AS cabc_node_No,b.node_No,b.contentNo,\n",
																	"Count(IF(c1.contentType = 'kj' AND c6.billType <> 'kjxt',c1.missionid,NULL)) AS practic,\n",
																	"Count(IF(c1.contentType = 'kj' AND c6.billType = 'kjxt',c1.missionid,NULL)) AS test,\n",
																	"Sum(IF(c5.billid IS NOT NULL , 1,0)) AS per1,\n",
																	"Count(c2.unique_id) AS courseware,\n",
																	"Count(c4.missionId) AS perRate,\n",
																	"Sum(IF(a1.classType != 1,IF(c4.score<0,0,c4.score),NULL)) AS perscore,NULL\n",
																	"FROM exp_experimentclassstudent AS a\n",
																	"INNER JOIN exp_experimentclass AS a1 ON a.classNo = a1.classNo\n",
																	"INNER JOIN exp_experimentclass_course AS a2 ON a2.classNo = a1.classNo\n",
																	"INNER JOIN exp_courses_node AS b ON a2.courseNo = b.node_courseNo\n",
																	"LEFT JOIN abc AS b1 ON b1.classNo = a2.classNo AND b1.courseNo = a2.courseNo AND b1.courseNo = b.node_courseNo AND b1.node_No = b.node_No AND b1.contentNo = b.contentNo AND b1.expID = a.expNo\n",
																	"INNER JOIN exp_courses_node_content AS c1 ON c1.contentNo = b.contentNo\n",
																	"LEFT JOIN exp_cour_node_cont AS c0 ON a1.classNo = c0.classNo AND c1.contentNo = c0.contentNo AND c1.typesort = c0.typesort AND c1.missionid = c0.missionid AND b.node_courseNo = c0.courseNo\n",
																	"LEFT JOIN acc_mission AS c5 ON c5.missionId = c1.missionid\n",
																	"LEFT JOIN mysq1_schema.bill_list AS c6 ON c5.billId = c6.billId\n",
																	"LEFT JOIN exp_courseware_cells AS c2 ON c1.missionid = c2.unique_id\n",
																	"LEFT JOIN acc_1 AS c4 ON c4.expID = a.expNo AND c1.missionid = c4.missionId\n",
																	"WHERE ",@requirement1," AND b.contentNo IS NOT NULL AND (b1.expID IS NULL OR b1.statu IS NOT NULL)  AND c0.missionid IS NULL\n",
																	"GROUP BY a1.classNo ,a.expNo,a2.courseNo,b.node_No");

	 	EXECUTE immediate @sql_body ;
END IF;


		SET	@nodenum = Stati_ch(@nodeNo,'.'),
				@requirement1 = CONCAT_WS(' AND ',CONCAT('b.expId = ',quote_d(@expId)),
													CONCAT('b.classNo = ',quote_d(@classNo))),
				@sql_body = CONCAT_WS('',
						",\nSum(b.practic) AS practic,\n",
						"Sum(b.courseware) AS courseware,\n",
						"Sum(b.test) AS test,\n",
						"ROUND(SUM(b.perScore)/(SUM(b.practic) + Sum(b.test))) AS perscore,\n",
						"ROUND(SUM(b.perRate)/(SUM(b.practic)+ Sum(b.test))*100) AS perRate,\n",
						"a.node_type,a.node_tip,a.ico_url,a.node_isChapter,\n",
						"CAST(CONCAT_ws('&nbsp&nbsp&nbsp',\n",
						"				IF(Sum(b.practic) = 0 ,NULL,CONCAT('实训题 - ', Sum(b.practic))),\n",
						"				IF(Sum(b.test) = 0 ,NULL,CONCAT('客观题 - ', Sum(b.test))),\n",
						"--				IF(Sum(b.test) !=0 AND Sum(b.courseware) != 0 AND Sum(test)  !=0 ,'<br>',NULL),\n",
						"				IF(Sum(b.courseware) = 0 ,NULL,CONCAT('课件 - ', Sum(b.courseware)))\n",
						" )AS CHAR) AS Str_total\n",
						"FROM exp_courses_node AS a\n",
						"LEFT JOIN exp_courses AS a1 ON a.node_courseNo = a1.courseNo\n");

		IF IFNULL(@classNo,'') = '' THEN
					 SET @sql_body = CONCAT_WS('',@sql_body,"LEFT JOIN(\n","SELECT\nc1.contentNo,\nCount(IF(c1.contentType = 'kj' AND c6.billType <> 'kjxt',c1.missionid,NULL)) AS practic,\nCount(IF(c1.contentType = 'kj' AND c6.billType = 'kjxt',c1.missionid,NULL)) AS test,\nSum(IF(c5.billid IS NOT NULL , 1,0)) AS per1,\nCount(c2.unique_id) AS courseware,\nnull AS perRate,\nNULL AS perscore,\na.node_courseNo\nFROM\nqianxue_test.exp_courses_node_content AS c1\nINNER JOIN qianxue_test.exp_courses_node AS a ON c1.contentNo = a.contentNo\nLEFT JOIN qianxue_test.acc_mission AS c5 ON c5.missionId = c1.missionid\nLEFT JOIN mysq1_schema.bill_list AS c6 ON c5.billId = c6.billId\nLEFT JOIN qianxue_test.exp_courseware_cells AS c2 ON c1.missionid = c2.unique_id\nWHERE \na.node_courseNo = ",QUOTE(@courseNo),"\nGROUP BY\nc1.contentNo","\n) AS b ON b.contentNo = a.contentNo");
			ELSE SET	@sql_body = CONCAT_WS('',@sql_body,"INNER JOIN exp_experimentclass_course AS a2 ON a2.classNo = ",quote_d(@classNo)," AND a2.courseNo = a1.courseNo\n",
						"LEFT JOIN abc AS b ON ",@requirement1," AND b.courseNo = a.node_courseNo AND b.node_No = a.node_No AND b.contentNo = a.contentNo");
		END IF;


-- 	SET @sql_body = CONCAT_WS('',CONCAT(',',@a_body),@sql_body);

	SET @requirement1 = CONCAT("a.node_courseNo = ",quote_d(@courseNo)),
			@a_body = NULL;

	CASE 
			WHEN @nodenum > 0 AND  `funcid` = 0  THEN
					SET @requirement2 = CONCAT_WS('','SUBSTRING_INDEX(a.node_No,".",',@nodenum+1,')'),
							@a_body = CONCAT_WS('',"/*n0*/SELECT ",QUOTE(@expId)," AS expID,",QUOTE(@classNo)," AS classNo,",
															"a.node_courseNo AS courseNo,a.node_No ,a.node_url,a.contentNo,a.node_Id,a.node_parentNo,a.node_text,",QUOTE(@a_body)),
							@requirement1 = CONCAT_WS(' AND\n',@requirement1,CONCAT('a.node_courseNo = ',quote_d(@courseNo)),
																								CONCAT('a.node_No LIKE "',SUBSTRING_INDEX(@nodeNo,".",@nodenum),'.%"')),
							@requirement2 = CONCAT_WS(',',CONCAT('cabc(',@requirement2,')'));

			WHEN preg_rlike('/^\\d+/',@nodeNo) AND  `funcid` = 1 THEN
					SET @requirement2 = CONCAT_WS('','SUBSTRING_INDEX(a.node_No,".",',@nodenum+2,')'),
							@a_body = CONCAT_WS('',"/*n1*/SELECT ",QUOTE(@expId)," AS expID,",QUOTE(@classNo)," AS classNo,",
														"a.node_courseNo AS courseNo,a.node_No,a.node_url,a.contentNo,a.node_Id,a.node_parentNo, a.node_text,",QUOTE(@a_body)),
							@requirement1 = CONCAT_WS(' AND\n',@requirement1,CONCAT('a.node_courseNo = ',quote_d(@courseNo)),
																				CONCAT('a.node_No LIKE "',@nodeNo,'.%"')),
							@requirement2 = CONCAT_WS(',',CONCAT('cabc(',@requirement2,')'));

			WHEN @nodeNo IS NULL  AND  `funcid` = 1 OR  @nodeNo IS NOT NULL AND `funcid` = 0  OR IFNULL(j0(`p`,'cnumber'),0) = 1 THEN

					SET @a_body := NULL,
							@a_body := CONCAT(",\n'domid',case when ifnull(a.node_text,'') = '' then null\n",REPLACE(@a_body,'`@a_body`',' when a.node_text'),' end\n'),
							@a_body = CONCAT_WS('',"\n,CAST(COLUMN_json(COLUMN_CREATE('billid',a.billid,'before_id',a.before_id",@a_body,"))AS CHAR)");

					SET @requirement2 = CONCAT_WS('','SUBSTRING_INDEX(a.node_No,".",',@nodenum+1,')'),
							@a_body = CONCAT_WS('',"/*1z*/SELECT ",QUOTE(@expId)," AS expID,",QUOTE(@classNo)," AS classNo,",
														"a.node_courseNo AS courseNo, a.node_No,a.node_url,a.contentNo,a.node_Id,a.node_parentNo, a.node_text\n",@a_body),
							@requirement1 = IF(IFNULL(@courseNo,'') = '',NULL,CONCAT_WS(' AND\n',@requirement1,CONCAT('a.node_courseNo = ',quote_d(@courseNo)))),
							@requirement2 = CONCAT_WS(',',CONCAT('cabc(',@requirement2,')'));

			WHEN @courseNo IS NULL OR `funcid` = 0 OR @nodeNo IS NULL AND  `funcid` = 0 THEN 

SELECT NULL INTO @a_body FROM information_schema.`TABLES` AS a WHERE a.TABLE_SCHEMA = DATABASE() AND a.TABLE_NAME =  'exp_group';

IF FOUND_ROWS() THEN 

SELECT '"exp_group","1"' inTO @a_body FROM exp_experimentclassstudent AS a INNER JOIN exp_group AS b ON b.expId = a.expNo
WHERE  a.expNo  = j0(p,'expid')AND b.stuNo = j0(p,'stuNo'); 
END IF ;
--  SET @a_body = NULL ;
SELECT NULLIF(CONCAT_WS(',',@a_body,GROUP_CONCAT(CONCAT(quote(a.COLUMN_NAME),',a1.',a.COLUMN_NAME) SEPARATOR ',')),'') INTO @a_body
FROM information_schema.`COLUMNS` AS a WHERE a.TABLE_SCHEMA = DATABASE()AND a.TABLE_NAME  = 'exp_courses' AND a.COLUMN_NAME REGEXP  'before_id|billid' ;

					SET @a_body = CONCAT("\nCAST(COLUMN_json(COLUMN_CREATE(",@a_body,"))AS CHAR)");
					SET @a_body = CONCAT_WS('',"/*0c*/SELECT ",QUOTE(@expId)," AS expID,",QUOTE(@classNo)," AS classNo,",
														"a.node_courseNo AS courseNo,NULL AS node_No,a1.img_url AS node_url,a1.courseName AS node_text,",
														"NULL AS contentNo,a.node_Id,0 AS node_parentNo,",IF(IFNULL(@a_body,'')<>'',@a_body,'""'),' AS dblob '),
							@requirement2 = "CONCAT(IFNULL(a1.sort,''),a.node_courseNo)"/**/ ;
		-- 		SELECT @a_body;			

		ELSE		SELECT "NOT ok"; LEAVE  `l`;
	END CASE;

 	SET @sql_body = CONCAT_WS('',@a_body,@sql_body,CONCAT("\nWHERE ",@requirement1),"\nGROUP BY ",@requirement2,'\nHAVING str_total <> ""');



	END CASE;
  SET  @sql_body:= REGEXP_replace(@sql_body,'(?i)AS Str_total',CONCAT_WS('','AS Str_total,exetime(',QUOTE(@开始时间),CONVERT(')as zhxing汉'USING utf8)));-- leave `l`;
SELECT CAST(@sql_body AS CHAR) ;
	EXECUTE immediate @sql_body ;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `statdeal`
-- ----------------------------
DROP FUNCTION IF EXISTS `statdeal`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `statdeal`(expid varchar(60), missionId varchar(30), seal_no varchar(3), seal_Id  varchar(30)) RETURNS varchar(450) CHARSET utf8mb3
    READS SQL DATA
    DETERMINISTIC
begin

	set  @expid= expid ,
		@missionId = missionId ,
	    	@seal_no =seal_no ,
		@seal_Id = seal_Id ,
		 @stat =  '未知'  ,
		@pro  = ' 任务提示：' ;

GOD:  begin



			select
				c.pass_score_size  , c.redo_size
				into @pass_score_size, @redo_size
				from  exp_experimentclassstudent as a
				left join exp_experimentclass  as b  on a.classNo =  b.classNo
				left join exp_difficulty as c on b.difficulty_level  =  c.difficulty_level
				where  a.expNo = @expid ;

			select
				a.score,a.log_count
				into @score , @log_count
   				from acc_1 as a
					 use index(AK_kj_a)
				where a.missionId = @missionId and a.expID =  @expid;

			if @score  is  null then
				set   @score = 0  ,@log_count = 0 ;
			end if;

			set @stat = concat(@stat ,' score-' ,  @score, '  log_count-' ,@log_count )  ;


		begin
			set @LastScoreS= null, @LastSubStats  = null ;
			 P2: begin
				set @a = null ;

				select
					a.misskeys , a.billidortype
					into @a , @b
					from mission_seal  as a
					where @missionId  =  a.missionId limit 1;

		  	    	 if @a= 0   then
					set @LastScoreS = 0 , @LastSubStats   = 0 ; 
					leave P2;
				end if  ;



				if @b  is not null then
					 set @LastScoreS = 0 , @LastSubStats   = 0 ; 



					leave P2 ;

				end if ;

				set @pro  = concat(@pro , @a , '个前置任务'); 



				select
    					sum(
						if( e.missionId is null , 1,
						
							if (@pass_score_size  <= e.score or e.log_count >= @redo_size , 0 , 1 )
						)
					)   
					into @LastScoreS 
   					from acc_mission_backkey as b use index( missionId )
					left join acc_1 as e  on e.expID =  @expid
						and  e.missionId = SUBSTRING_INDEX( SUBSTRING_INDEX(b.standard_url,'=', -3 ), '&', 1 )
				 	where b.missionId = @missionId ;

				select
						sum(
						 	if( e.missionId is null , 1,
								case when  e.substat = 0  then 1
									when   e.substat = 1  then 0
									when   e.substat = 2  then 1
									when   e.substat is null   then 1
								end )
							) 
				into @LastSubStats  
   				from acc_mission_backkey as b use index( missionId )
				left join acc_seal_1 as e  on e.expID =  @expid
					and  e.missionId = SUBSTRING_INDEX( SUBSTRING_INDEX(b.standard_url,'=', -3 ), '&', 1 )
				 where b.missionId = @missionId ;

				
				if @LastSubStats  is null then
					set @LastSubStats   = 0 ,
						@LastScoreS = 0  ;

				end if;


			end  ; 


			set @stat = concat ( @stat , ' LastScoreS-' ,  @LastScoreS ,  ' LastSubStats-' ,   @LastSubStats ) ;



				if @LastScoreS > 0  or   @LastSubStats  !=0 then

					set @stat = replace ( @stat , '未知' , '未启动');

					set @pro  = concat(@pro ,
										if( @LastScoreS != 0 , concat( @LastScoreS ,  '个未完成') , '' ) ,
 	                                                              		if(   @LastSubStats  !=0 ,  '或未提交' , '' )
									);
					leave god;
				end if ;


		end ;


			set @LaScorestatS  = null ,
				@LaSealstatS  = null ,
				@LaSubstatS  = null ;

		begin

				set @a = null ;

	
					select
						sum( if  (@pass_score_size /a.pno  * a.ppno <= @score or  @log_count >= @redo_size  ,0,1 ) ) 
						into @LaScorestatS 
						from  mission_seal as a
						left join  acc_1  as b
							 use index(AK_kj_a)
							on @expid = b.expID and  b.missionId = a.missionId 
					where a.seal_no < @seal_no and a.missionId = @missionId ;

				if  @LaScorestatS is null then

						set  @LaScorestatS = 0 ,
							@a = '' ,@LaSealstatS=0, @LaSubstatS = 0;


				else

					select 
						group_concat( a.pra  SEPARATOR '→' )  as pra ,
						 max( a.SealstatS )  SealstatS ,
						case when max( a.substat ) =2  then 1
							when min( a.substat )  = 0 then  1
							when min( a.substat ) = 1 then  0
						end  as  substat
						into  @a, @LaSealstatS, @LaSubstatS  
					from (
					select  
						concat( a.seal_no,'-', group_concat( a.pra ) )  as pra ,
						 max( a.SealstatS )  SealstatS ,
						if( max( a.substat ) =2 , 2 ,min( a.substat ) )   as  substat

						from (
							select 
					                          a.seal_no,
								 concat( group_concat( distinct a.seal_name ) ,
									case when max( a.substat ) =2  then  ' ㄨ'
										when min( a.substat )  = 0 then   ' ?'
										when min( a.substat ) = 1 then  ' √'
									end
								 )as  pra ,
								max( a. SealstatS)   SealstatS,
								if( max( a.substat ) =2 , 2 ,min( a.substat ) ) substat
								from  (
								select   
		                    			           	a.seal_no,a.seal_Id  ,
									trim(c.seal_name)   as seal_name ,
									 if ( b.seal_Id is null , 1 ,0) as  SealstatS,
									 if(  b.substat is null , 0 ,  b.substat )  substat
									from  acc_mission_seal as a
									left join acc_enter_seal as c on c.sealID = a.seal_Id
									left join  acc_seal_1 as b  use index(AK_kj_a)
										on @expid = b.expID and  b.missionId = a.missionId and  b.seal_Id = a.seal_id and a.pageid = b.pageid
									where a.seal_no < @seal_no  and a.missionId = @missionId    
								) as a
								group by  a.seal_no, a.seal_Id   
							) as a 
						group by  a.seal_no  
						) as a;
						


				end if;


			set @stat = concat ( @stat , ' LaScoreS-' ,  @LaSealstatS ,  ' LatSubStats-' ,   @LaSealstatS ) ,
				 @pro  = concat(@pro , @a , if (@a = '' , ''  ,  '→' ) ) ;





		end;	





		set @Scorestat = null , @SubStat =null ;
		begin



			L4:begin

	
				select
					if  (@pass_score_size /a.pno  * a.ppno <= @score or  @log_count >= @redo_size  ,0,1 )  
					into @Scorestat
					from  mission_seal as a
					where a.seal_no  =  @seal_no and a.missionId =  @missionId and   a.seal_Id = @seal_Id ;


				
				if @Scorestat is null then

					set @Scorestat = 0 ;

				end if ;

				set @a = null ;

					select
						concat(  a.seal_no,'☞', group_concat( a.pra ) )  as pra ,
						 max( a.SealstatS )  SealstatS ,
						if( max( a.substat ) =2 , 2 ,min( a.substat ) )   as  substat
						into  @a,@Sealstat, @Substat 
						from (
							select 
					                          a.seal_no,
								 concat( group_concat( distinct a.seal_name ) ,
									case when max( a.substat ) =2  then  ' ㄨ'
										when min( a.substat )  = 0 then   ' ?'
										when min( a.substat ) = 1 then  ' √'
									end
								 )as  pra ,
								max( a. SealstatS)   SealstatS,
								if( max( a.substat ) =2 , 2 ,min( a.substat ) ) substat
								from  (
								select   
		                    			           	a.seal_no,a.seal_Id  ,
									trim(c.seal_name)   as seal_name ,
									 if ( b.seal_Id is null , 1 ,0) as  SealstatS,
									 if(  b.substat is null , 0 ,  b.substat )  substat

									from  acc_mission_seal as a
									left join acc_enter_seal as c on c.sealID = a.seal_Id
									left join  acc_seal_1 as b  use index(AK_kj_a)
										on @expid = b.expID and  b.missionId = a.missionId and  b.seal_Id = a.seal_id and a.pageid = b.pageid
									where a.seal_no  = @seal_no and a.missionId = @missionId    
								) as a
								group by  a.seal_Id   
							) as a 
						group by  a.seal_no ;


						if @a is null then

							return  concat (if(@stat is null or  @pro is null,'err_4: 没有的岗位',concat(@stat,@pro)) );
						end if;
			end; 

				set	@stat = concat( @stat , ' Scorestat-' , @Scorestat  , ' SealStat-' ,  @SealStat , ' SubStat-' , @SubStat) ,
					 @pro  = concat(@pro , @a ) ;

		end;

				set   @NextScoreStateS = null ,
					@NextSealStatS = null ,
					 @NextSubStat = null ;
		begin

				set	@a = null ;

				

					select
					sum( if  (@pass_score_size /a.pno  * a.ppno <= @score or  @log_count >= @redo_size  ,0,1 ) )
						into @NextScoreStateS  
						from  mission_seal as a
						left join  acc_1  as b
							 use index(AK_kj_a)
							on @expid = b.expID and  b.missionId = a.missionId 
					where a.seal_no >  @seal_no and a.missionId = @missionId ;

					if  @NextScoreStateS is null then
						set  @NextScoreStateS  = 0,
							@NextSealStatS = 0,
							 @NextSubStat = 0,
							@a='';
					else  

	
					select 
						group_concat( a.pra  SEPARATOR '→' )  as pra ,
						 max( a.SealstatS )  SealstatS ,
                                    		case when max( a.substat ) =2  then 1
							when min( a.substat )  = 0 then  1
							when min( a.substat ) = 1 then  0
						end  as  substat
						into  @a, @NextSealStatS , @NextSubStat   
					from (
					select  
						concat( a.seal_no,'-', group_concat( a.pra ) )  as pra ,
						 max( a.SealstatS )  SealstatS ,
						if( max( a.substat ) =2 , 2 ,min( a.substat ) )   as  substat
						from (
							select 
					                          a.seal_no,
								 concat( group_concat( distinct a.seal_name ) ,
									case when max( a.substat ) =2  then  ' ㄨ'
										when min( a.substat )  = 0 then   ' ?'
										when min( a.substat ) = 1 then  ' √'
									end
								 )as  pra ,
								max( a.SealstatS)   SealstatS,
								if( max( a.substat ) =2 , 2 ,min( a.substat ) ) substat
								from  (
								select   
		                    			           	a.seal_no,a.seal_Id  ,
									trim(c.seal_name)   as seal_name ,
									 if ( b.seal_Id is null , 1 ,0) as  SealstatS,
									 if(  b.substat is null , 0 ,  b.substat )  substat

									from  acc_mission_seal as a
									left join acc_enter_seal as c on c.sealID = a.seal_Id
									left join  acc_seal_1 as b  use index(AK_kj_a)
										on @expid = b.expID and  b.missionId = a.missionId and  b.seal_Id = a.seal_id and a.pageid = b.pageid
									where a.seal_no > @seal_no and a.missionId = @missionId    
								) as a
								group by  a.seal_Id   
							) as a 
						group by  a.seal_no  
						) as a ;
						

					set @a = concat(  '→'  , @a );

					end if ;

					set @stat = concat (@stat, ' NextScoreStateS-' ,  @NextScoreStateS,  ' NextSealStatS-' , @NextSealStatS  , ' NextSubStat-' , @NextSubStat  ) ,
						@pro = concat (@pro , @a);


		end;

		case
			
			when @LaScorestatS != 0 or @LaSealstatS != 0 or  @LaSubstatS != 0 then
				set @stat = replace( @stat , '未知', '未启动' ) ;
	
			

			when  @SubStat = 2 then
	 					set @stat = replace( @stat , '未知', '已退回' ) ;

			

			when @SubStat !=1 or @SealStat != 0  or  @Scorestat != 0  then
						set @stat = replace( @stat , '未知', '待处理' ) ;


			

			when   @SubStat =1 and (@NextScoreStateS != 0 or @NextSealStatS  != 0 or @NextSubStat != 0 ) then
					set @stat = replace( @stat , '未知', '审批中' ) ;

			 else
			 		set @stat = replace( @stat , '未知', '已结束' ) ;

		end case;

	end ; 

return  concat (if(@stat is null or  @pro is null,'错',concat(@stat,@pro)) );

ENd
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `state`
-- ----------------------------
DROP FUNCTION IF EXISTS `state`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `state`(`state` longblob,k varchar(10)) RETURNS longblob
    NO SQL
    DETERMINISTIC
BEGIN

	RETURN 

	CASE 	WHEN  IFnull(state,'' )=''  THEN 
					JSON_MERGE_PATCH(
						JSON_OBJECT('current',@state专用:=SYSDATE(6),"Period",0,'start',@state专用)
						,JSON_OBJECT('Period',exetime(@state专用))
						,JSON_OBJECT('current',SYSDATE(6))
					)
				WHEN   NOT json_valid(state) THEN
					_s(json_array(123,'不是json')) 
					
				WHEN k REGEXP '^(?!0)\\d+$'  THEN
					json_value(state,'$.counts') =k
						
				WHEN  k REGEXP '^\\s*\\-' THEN 

							JSON_MERGE_PATCH(
							REGEXP_replace(							
							`state`,
							'(?x)(?&h)(?(?=\\[)\\[(?:(?&v),\\s*)*\\K(?&v)|\\K(?&v))
								(?(DEFINE)
								(?<v>
									(?:"[^"]+"|\\d+(?:\\.\\d+)?)
								)
								(?<h>
									"Period":\\s*
								)
								)',exetime(json_value(`state`,'$.current'))),

								JSON_OBJECT(
									'counts',counts(json_value(`state`,'$.counts')),
									'total',exetime(json_value(`state`,'$.start')),
									'current',SYSDATE(6)
							))
						
				ELSE 	JSON_MERGE_PATCH(
								JSON_MERGE(`state` ,JSON_OBJECT('Period',exetime(json_value(`state`,'$.current')))),
								JSON_OBJECT(
									'current',SYSDATE(6),
									'counts',counts(json_value(`state`,'$.counts')),
									'total',exetime(json_value(`state`,'$.start')))
							)

	END ;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Stati_ch`
-- ----------------------------
DROP FUNCTION IF EXISTS `Stati_ch`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Stati_ch`(`lontext`  varchar(500),`chars`  varchar(50)) RETURNS int(6)
    NO SQL
    DETERMINISTIC
BEGIN
	SET @re_=0,@chars= CHAR_LENGTH(chars) ;

	label1: LOOP 
-- @char_pos >0 DO
		SET @char_pos = INSTR(lontext,CHARS);

		IF @char_pos > 0 THEN
			SET	@re_=@re_ +1,
				lontext = substr(lontext,@char_pos + @chars + 1);
			ITERATE label1;
			ELSE LEAVE Label1;

		END IF ;

	END LOOP;

	RETURN @re_;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `str2d`
-- ----------------------------
DROP FUNCTION IF EXISTS `str2d`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `str2d`(`reid` varchar(60)) RETURNS datetime
    NO SQL
    DETERMINISTIC
BEGIN
	CASE
			WHEN LEFT(reid,2) IN ( '11','10','09','12','13','14','15','16','17','18','19','08') THEN
					SET reid = RPAD(reid,12,'0'),
							reid = CONCAT('',reid);
			WHEN LEFT(reid,2) IN ( '20') THEN
					SET reid = RPAD(reid,14,'0'),
							reid = RIGHT(reid,12);
	ELSE
				SET reid = '197001241851';
	END CASE;

	RETURN reid ;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `stucourse`
-- ----------------------------
DROP PROCEDURE IF EXISTS `stucourse`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `stucourse`(IN `stuno` varchar(20))
BEGIN
SELECT
a.courseNo,
a.courseName
FROM
exp_courses AS a;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `stuerr`
-- ----------------------------
DROP PROCEDURE IF EXISTS `stuerr`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `stuerr`(`_expid` varchar(60) , idno int(4),_offset int(4), recno int(4))
label_stuerr:BEGIN

  DECLARE CONTINUE HANDLER FOR  SQLSTATE '23000', SQLSTATE	'42000'	, SQLSTATE	'42S22' , SQLSTATE	'HY000',SQLSTATE	'22007'
	BEGIN GET DIAGNOSTICS CONDITION 1 @`sqlstate` = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;SET  @`sqlstate` = JSON_OBJECT('sqlstate',@`sqlstate`,'errno',@errno,'text',@text);
				SET @`errsql` = @stmtbody;
				SET @funcid = CONCAT_WS(' ','Error: ', ' Stuerr' ),
				@pp = CONCAT_WS(',',QUOTE(_expid),QUOTE(idno),QUOTE(_OFFSET),QUOTE(recno));
				CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp,'SQL',@`errsql`,'err',@`sqlstate`));
	END;
/*
START TRANSACTION;
				SET @funcid = CONCAT_WS(' ', ' Stuerr' ),
				@pp = CONCAT_WS(',',QUOTE(_expid),QUOTE(idno),QUOTE(_OFFSET),QUOTE(recno));
CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp));COMMIT;
*/

	set @expid = _expid ,
			@id = idno,
			@recno= recno;  



	set @good = 60,@better = 70, @perfect= 90 ;


	set	@a = calcuscore(null,@expid);
	
	set @stmtbody = CONCAT("select\n",
				" case ",@id ,"\n",
				"		when 0 then a.nodone\n",
				"		when 1 then a.missionbad\n",
				"		when 2 then a.missiongood\n",
				"		when 3 then a.missionbetter\n",
				"		when 4 then a.missionperfect\n",
				"		else a.done\n",
				"	end as total, \n",
				"cast(CONCAT(c.node_No,'.',c1.typesort) as char) as no, \n",
				"CAST(CONCAT_WS('','<',c.node_No,'.',c1.typesort,'>',c2.missionlabel) AS CHAR) AS missionlabel,\n",
				"c1.missionid,\n",
				"d.score \n",
-- 				"a.expno as expid\n",

			"from  exp_experimentclassstudent as a \n",
			"INNER JOIN exp_experimentclass as b on a.classno =b.classno\n",
			"INNER JOIN exp_experimentclass_course AS b1 ON b.classno =b1.classno\n",
			"INNER JOIN exp_courses_node AS c ON b1.courseNo = c.node_courseNo\n",
			"INNER JOIN exp_courses_node_content AS c1 ON c.contentNo = c1.contentNo\n",
			"INNER JOIN acc_mission AS c2 ON c1.missionid = c2.missionId\n",
			"INNER JOIN acc_1 AS d ON d.missionid = c1.missionId AND a.expNo = d.expid\n",
			"where  a.expno = ",QUOTE(_expid)," \n",
			"			and case ",@id ,"\n", 
			"						when 0  then d.missionid  is null \n",
			"						when 1 then d.score  is  null  or d.score < 60\n",
			"						when 2 then d.score >= 60 and d.score < 80 \n",
			"						when 3 then d.score >= 80 and  d.score < 90\n",
			"						when 4 then d.score >= 90\n",
			"					else 1\n",
			"					end \n",
			"order by nabc(CONCAT(c.node_No,'.',c1.typesort))\n",
			"limit ",_OFFSET,",",@recno);
-- SELECT  CAST(@stmtbody AS CHAR);

	PREPARE stmt from  @stmtbody ;
	EXECUTE stmt ;
	DEALLOCATE PREPARE stmt;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `stuexp`
-- ----------------------------
DROP PROCEDURE IF EXISTS `stuexp`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `stuexp`(IN `stuno` varchar(20))
BEGIN
	set @stuno = ifnull(stuno ,''),
			@a = stuno2score(null, stuno);
/*
CALL Audit_1('stuexp',QUOTE(stuno),'rig');
*/
SELECT a.TABLE_NAME INTO @exp_group  FROM information_schema.`TABLES` AS a WHERE a.TABLE_SCHEMA = database() AND TABLE_NAME = 'exp_group';

	SET @exp_stmt =CONCAT_WS('',"select \n",
"		b.statu,\n",
"		",QUOTE(stuno)," AS stuNo ,\n", 
"		d.stu_name,\n",
"		e.className,\n", 
"		c.classNo,b.expNo as expid,\n", 
"		c.className AS expname ,\n",
"		DATE_FORMAT(c.StartTime,'%H :%i , %Y-%c-%e ') as  StartTime ,\n",
"		DATE_FORMAT(c.EndTime,'%H :%i , %Y-%c-%e ') as EndTime,\n",
"		ROUND((UNIX_TIMESTAMP( NOW() ) -UNIX_TIMESTAMP( c.StartTime ))/ (UNIX_TIMESTAMP(c.EndTime)-UNIX_TIMESTAMP( c.StartTime ))*100) AS timerate,\n",
" 		case when cast(c.EndTime  as date) is null then '－－' \n",
"			when  now() > EndTime  then '已结束' \n",
"			when now() <  StartTime  then '未开始' \n",
"		else  '进行中'  end  as stat, \n",
"		b.teacherScore,b.TeacherSay ,\n",
"		f.tea_name,\n",
"		b.missionscore as  shixundefen ,\n",
"		c.mission_total  as zongrenwushu,\n",
"		b.done  as wanchengrenwushu ,\n",
"		b.done/c.mission_total   as wanchenglv ,\n",
"		c.classtype,\n",
"		H.courseNo,\n",
"COUNT(c1.classNo) AS cnumber,\n",
"		h.courseName \n",
"FROM exp_experimentclassstudent AS b  \n",
IF(@exp_group = 'exp_group',CONCAT_WS('','LEFT JOIN exp_group AS g ON b.expNo = g.expId AND g.stuNo = ',QUOTE(`stuno` )),NULL),
"LEFT JOIN exp_experimentclass AS c ON b.classNo = c.classNo \n",
"LEFT JOIN exp_experimentclass_course AS c1 ON c.classNo = c1.classNo \n",
"LEFT JOIN mysq1_schema.exp_classstudent AS d ON ",
IF(@exp_group = 'exp_group',"IF(IFNULL(g.stuno,'') <> '',g.stuNo , b.studentNo)",'b.studentNo')," = d.stuNo \n",
"LEFT JOIN mysq1_schema.exp_class AS e ON d.classNo = e.classNo \n",
"LEFT JOIN mysq1_schema.exp_teacher AS f ON e.teaNo = f.teaNo \n",
"INNER JOIN exp_courses AS h ON c1.courseNo = h.courseNo \n",
"WHERE  b.studentNo = ",QUOTE(@stuno),"\n",
"GROUP BY c.classNo \n",
"order by c.StartTime ,c.EndTime\n") ;
-- SELECT @exp_stmt;
	PREPARE exp_stmt FROM @exp_stmt;	EXECUTE exp_stmt;	DEALLOCATE PREPARE exp_stmt;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `stuno2score`
-- ----------------------------
DROP FUNCTION IF EXISTS `stuno2score`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `stuno2score`(classno varchar(20),stuno varchar(60)) RETURNS varchar(200) CHARSET utf8mb3
    MODIFIES SQL DATA
    DETERMINISTIC
stuno2score:BEGIN
-- INSERT plogs (FUNCTION_name,parameter) VALUES('stuno2score',CONCAT_WS(',',QUOTE(classno),QUOTE(stuno))); 
		CASE 
				when  classno is not null  then 
							SET @classno = classno, @stuno = '' ;

				WHEN  stuno IS NOT NULL THEN

							set @stuno = stuno , @classno = NULL ;

								SELECT GROUP_CONCAT(DISTINCT a.classNo) AS classNo 
									INTO @classno
								FROM
								exp_experimentclassstudent AS a
								WHERE
								a.studentNo = @stuno AND
								a.statu IS NOT NULL;

							if @classno IS NULL then 
								 RETURN concat('1-','operration cancel,','Deal--stuno ',IFNULL(@stuno , 'null'),'-ClassNo:',IFNULL(@classno,'NULL'));
							end if ;							

				ELSE 
-- two is null 返回 引起全算
							RETURN NULL ;
		end case ;

DROP TEMPORARY TABLE IF EXISTS cur1;
CREATE TEMPORARY TABLE cur1
AS
										SELECT
										a.expNo,
-- 									c.expid,
										d.mission_total as total ,
										Sum(c.score) AS score,
										Sum(c.read_ans_size) AS read_ans_size,
										Sum(c.mission_result) AS mission_result,
										Sum(c.log_count) AS log_count,

										count(c.score) AS done ,
										sum(Inscore(c.score ,0,60)) AS bad, 
										SUM(inscore(c.score,60,70)) as good,
										SUM(inscore(c.score,70,80)) AS better,
										SUM(inscore(c.score,90,150)) as perfect,
										a.statu 
										FROM exp_experimentclassstudent AS a
										INNER JOIN acc_1 AS c ON a.expNo = c.expid
-- 										INNER JOIN tmpexpcourse AS b ON a.classNo = b.classNo and c.missionid = b.missionId
										INNER JOIN exp_experimentclass as d on a.classNo = d.classNo
										WHERE 
										a.statu is not NULL  AND 
										instr(a.studentNo , @stuno) AND 
										instr(a.classno , @classno)
										GROUP BY
										a.expNo;

		UPDATE exp_experimentclassstudent as a ,cur1 as b																																										
					set 
							a.missionscore = IF(IFNULL(b.total,0)=0,NULL ,ROUND(b.score / b.total,2)) ,
							a.score1 = b.score,
							a.read_ans_size = b.read_ans_size,
							a.mission_result = b.mission_result,
							a.log_count = b.log_count,
							a.nodone = b.total - ifnull(b.done ,0) ,
							a.done = b.done,
							a.missionbad = b.bad ,
							a.missiongood = b.good,
							a.missionbetter = b.better,
							a.missionperfect = b.perfect ,
							a.statu = null 
		where a.expNo = b.expNo  ;

DROP TEMPORARY TABLE IF EXISTS cur1;
	RETURN concat_ws('2-',FOUND_ROWS());

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `stureport`
-- ----------------------------
DROP PROCEDURE IF EXISTS `stureport`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `stureport`(IN `k` text)
BEGIN
	#Routine body goes here...
	SET @user_name = '王某',
			@user_id = '账号',
			@classNo = '实训编号',
			@courseNo = '课程名称',
			@className = '实训名称';
SELECT  @user_name,@user_id ,@classNo,@courseNo,@className,a.Binary_Blob
FROM
mysq1_schema.persistence_memory AS a
WHERE
a.ElementID = 'ware-15123115382930610'  ;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `stuscore`
-- ----------------------------
DROP PROCEDURE IF EXISTS `stuscore`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `stuscore`(IN `stuno` varchar(60))
    MODIFIES SQL DATA
BEGIN
  DECLARE CONTINUE HANDLER FOR  SQLSTATE '23000', SQLSTATE	'42000'	, SQLSTATE	'42S22' , SQLSTATE	'HY000'-- ,SQLSTATE	'22007'
	bl:BEGIN GET DIAGNOSTICS CONDITION 1 @`sqlstate` = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;SET  @`sqlstate` = JSON_OBJECT('sqlstate',@`sqlstate`,'errno',@errno,'text',@text);
				SET @`errsql` = NULL,@funcid =  NULL;
				SET @funcid = CONCAT_WS(' ','Error: ', ' stuscore' ),
				@pp = QUOTE(`stuno` );
				CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp,'SQL',@`errsql`,'err',@`sqlstate`,'l',1));END;/**/

	/*
START TRANSACTION;
				SET @funcid = CONCAT_WS(' ','Error: ', ' stuscore' ),
				@pp = QUOTE(`stuno` );
CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp));COMMIT;

*/	
		--  call cutmpcourse('0');
		set @stuno = stuno ;
		set @a = stuno2score(null, stuno);
		SELECT 1;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `sub`
-- ----------------------------
DROP FUNCTION IF EXISTS `sub`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `sub`(`p` longblob) RETURNS longblob
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	DECLARE i LONGBLOB DEFAULT 0;
	DECLARE re LONGBLOB DEFAULT json_value(p,'$[0]');
	DECLARE r0 blob  DEFAULT json_remove(p,'$[0]');
	DECLARE r text DEFAULT NULL ;


	IF IFNULL(r0,'')='' OR IFNULL(re ,'')=''THEN RETURN NULL;END IF;
	SET re = json_value(p,'$[0]');

	IF IFNULL(re,'')=''THEN RETURN NULL;END IF;

	x:LOOP

		IF i >= json_length(r0) THEN LEAVE x;END IF;

		SET r = json_value(r0,CONCAT_WS('','$[',i,']')),p= NULL;

		l:LOOP

		IF re NOT REGEXP r OR re =''  THEN LEAVE l;END IF;
			SET p = CONCAT_WS(',',p,REGEXP_substr(re,r))
				,re = REGEXP_replace(re,CONCAT_WS('','(?s-m)^.*?',r),'');

		END LOOP;
		SET i=i+1,re=p;
RETURN p;
	END LOOP;

	RETURN p;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `substmt`
-- ----------------------------
DROP FUNCTION IF EXISTS `substmt`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `substmt`(`fieldname` varchar(20),`num` smallint(2)) RETURNS varchar(2700) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	set @subST = '' ;
	if fieldname is not null and num>=1 then  
		set  @x  =  1 ;		

			set 	@y =  concat( fieldname, @x) ,
				@subST = concat(  @subST , 
							"ifnull(" , @y , ",'')") ,
				 @x = @x+1;

		 REPEAT    
			set 	@y =  concat( fieldname, @x) ,
				@subST = concat(  @subST , 
							",ifnull(" , @y , ",'')") ,
				 @x = @x+1;
		UNTIL @x  > num  end  REPEAT ;
	end if;


	RETURN @subST ;  
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Temp_Func`
-- ----------------------------
DROP FUNCTION IF EXISTS `Temp_Func`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Temp_Func`(`templates` longtext,temp_start int(2),`temp_num` int(2),sepre varchar(5)) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
-- createtime 13-1-2
-- 创建模板
-- reservation ??
-- 生成字段
 

	DECLARE StrL longtext;

	IF 	sepre is null THEN
			SET sepre =',';
	END if;

  SET temp_num = temp_start+ temp_num,
			StrL = '';

	
  LOOPNum:LOOP 
		
		SET StrL = CONCAT(StrL,REPLACE(templates,'??',CAST(temp_start AS CHAR))),
				temp_start = temp_start + 1;

	IF temp_start >= temp_num THEN LEAVE LOOPNum;
	end if;
	SET StrL = CONCAT(StrL,sepre);
	ITERATE LOOPNum ;
  END LOOP ;

	RETURN StrL;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Temp_Func_2`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Temp_Func_2`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Temp_Func_2`(in `templates` tinytext,in temp_fields text,in `field_values` longtext,in sepre varchar(5),out `results_` longtext)
label0:BEGIN
	#Routine body goes here...
-- createtime 13-1-2
-- 创建模板
-- reservation ??
-- 生成字段


	DECLARE StrL MEDIUMTEXT DEFAULT NULL;
-- VARCHAR(13000);
	DECLARE v1 text;
-- VARCHAR(200);
	DECLARE v2 text;
-- VARCHAR(200);
	DECLARE i INT(3);

	IF 	sepre is null THEN
			SET sepre =',';
	END if;

  SET StrL = NULL,i = 1 ; 


	IF IFNULL(CONCAT(Temp_FIELDS,templates),'') = '' THEN LEAVE label0; END IF;


  LOOPNum:LOOP 
			CALL Fetch_Set_p1(temp_fields,i,v1);
			IF  v1 IS NOT NULL THEN

					CALL Fetch_Set_P1(field_values,i,v2);
-- select v1,v2,temp_fields,field_values,i;

					IF v2 IS NULL THEN SET v2=''; END IF;
					SET  StrL = CAST(CONCAT_WS(',',StrL,
											REPLACE(REPLACE(templates,'???',QUOTE(v2)),'??',v1)
											)AS CHAR);
				ELSE 
					LEAVE LOOPNum;
			END IF;

			SET i= i+1;
-- 					StrL = CONCAT(StrL,' ',sepre);
  END LOOP ;

		SET results_ = StrL;
 --  SELECT results_,temp_fields,v1,field_values,v2;LEAVE label0;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Temp_Func_3`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Temp_Func_3`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Temp_Func_3`(in `templates` varchar(500),in `sepre1` varchar(5),in `suse` varchar(60),in `templates1` varchar(500),in `sepre2` varchar(5),in type_ varchar(20),in `a_fields` varchar(400),in `a_values` longtext,in `r_fields` longtext,in `r_values` longtext,inout results_ longtext)
temp3:BEGIN
-- createtime 13-1-2
-- 创建模板
-- reservation ??
-- 生成字段

	DECLARE a_field VARCHAR(200);	DECLARE a_value LONGTEXT;	DECLARE r_value VARCHAR(400);	DECLARE i INT(3);	DECLARE ia INT(3);	DECLARE ir INT(3);-- 	DECLARE r_field VARCHAR(200);


	DECLARE CONTINUE HANDLER FOR  SQLSTATE '23000', SQLSTATE	'42000'	, SQLSTATE	'42S22' , SQLSTATE	'HY000',SQLSTATE	'22007'
	bl:BEGIN GET DIAGNOSTICS CONDITION 1 @`sqlstate` = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;SET  @`sqlstate` = JSON_OBJECT('sqlstate',@`sqlstate`,'errno',@errno,'text',@text);
				SET @`errsql` = @3in1_body;
				SET @funcid = CONCAT_WS(' ','Error: ', ' Temp_Func_3' ),
				@pp =CONCAT_WS(',',quote(`templates`),quote(`sepre1`),quote(`suse`),quote(`templates1`),quote(`sepre2`),quote(`type_`),quote(`a_fields`),quote(`a_values`),quote(`r_fields`),quote(`r_values`),"@a");
				CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp,'SQL',@`errsql`,'err',@`sqlstate`));LEAVE bl;
	END;
/*
START TRANSACTION;
				SET @funcid = CONCAT_WS(' ', ' Temp_Func_3' ),
				@pp =CONCAT_WS(',',quote(`templates`),quote(`sepre1`),quote(`suse`),quote(`templates1`),
quote(`sepre2`),quote(`type_`),quote(`a_fields`),quote(`a_values`),quote(`r_fields`),quote(`r_values`),"@a");
INSERT INTO plogs (Function_Name,parameter) VALUES (@funcid,@pp);

-- CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp,'l',1));
COMMIT;/*
CALL Audit_1('Temp_Func_3',CONCAT_WS(',',quote(`templates`),quote(`sepre1`),quote(`suse`),quote(`templates1`),quote(`sepre2`),quote(`a_fields`),quote(`a_values`),quote(`r_fields`),quote(`r_values`),"@a"),'ok');
*/ 

	IF IFNULL(a_fields,'') = '' THEN LEAVE temp3; END IF;
/*
	IF suse IS NULL THEN
		SET suse = NULL;
	END IF;
 */
	IF 	sepre1 is null THEN
			SET sepre1 =',';	
	END if;
	IF sepre2 is null THEN
			SET sepre2 =',';	
	END if;
	SET results_ = NULL,ia = 1 ,
			@results_2=NULL; 


	IF type_ IS NULL THEN
		 SET type_ = '';
	END IF;

  LOOPNum:LOOP 
			SET ir=NULL,r_value='',a_value=NULL;

			CALL Fetch_Set_P0(a_fields,ia,a_field);

			IF IFNULL(a_field,'') != '' THEN 


					CALL Fetch_Set_P1(a_values,ia,a_value);
-- SELECT  a_values,ia,a_value;
					IF IFNULL(a_value,'') !='' THEN
							SET @TYPE = CONCAT(type_,a_field),
  
									ir = FIND_IN_SET(QUOTE(@type),r_fields);

							IF ir > 0 THEN
									CALL Fetch_Set_P1(r_values,ir,r_value);
-- SELECT  r_values,ir,r_value;
									IF r_value is NULL THEN 
											SET r_value ='';
									END IF;
							END IF;
					END IF;

					SET results_  = CAST(CONCAT_WS(sepre1,RESULTS_,
										REPLACE(REPLACE(REPLACE(templates,'????',QUOTE(r_value)),'???',QUOTE(a_value)),'??',a_field)
											)AS CHAR),
							@results_2 = CAST(CONCAT_WS(sepre2,@RESULTS_2,
									REPLACE(REPLACE(REPLACE(templates1,'????',QUOTE(r_value)),'???',QUOTE(a_value)),'??',a_field)
											)AS CHAR);
--  SELECT results_,@results_2;
					ELSE LEAVE LOOPNum;
			END IF ;

/* 			IF FIND_IN_SET(ia+1,a_fields) = 0 THEN END IF;*/
			SET ia= ia+1;
-- 					results_ = CONCAT(results_,sepre1),

  END LOOP ;
			-- SELECT @results_2;
		IF suse IS NOT NULL THEN
			SET @results_2 =CONCAT_WS('','\n',suse,@results_2) ;
		END IF;
		SET 
				results_ = CAST(CONCAT_WS(',',results_,@results_2)AS CHAR);

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Temp_Func_C`
-- ----------------------------
DROP FUNCTION IF EXISTS `Temp_Func_C`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Temp_Func_C`(`templates` varchar(200),temp_fields varchar(500),sepre varchar(5)) RETURNS varchar(12000) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
-- createtime 13-1-2
-- 创建模板
-- reservation ??
-- 生成字段


	DECLARE StrL VARCHAR(13000);
	DECLARE v1 VARCHAR(200);

	IF 	sepre is null THEN
			SET sepre =',';
	END if;

  SET StrL = ''; 


	IF Temp_FIELDS IS NULL OR Temp_FIELDS = '' THEN RETURN  NULL; END IF;

  LOOPNum:LOOP 

			SET v1 := SUBSTRING_INDEX(temp_fields,',',1),
					StrL := CAST(CONCAT(StrL,REPLACE(templates,'??',v1))AS CHAR),
					temp_fields := SUBSTR(temp_fields,LENGTH(v1)+2);

		
		IF temp_fields = '' THEN LEAVE LOOPNum;end if;
		SET StrL = CONCAT(StrL,sepre);
	ITERATE LOOPNum ;
  END LOOP ;

	RETURN StrL;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `test`
-- ----------------------------
DROP FUNCTION IF EXISTS `test`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `test`(`p` longblob) RETURNS longblob
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
    RETURN        p REGEXP   '(?Xx)(?:(?:"(?:(?=\\\\).{2}|[^"\\\\]+)*?")|[null]+|[-\\.,])\\s*:("[^"]+?"),(?=(?:"(?:(?=\\\\).{2}|[^"\\\\]++)*?"|[^\\["]++)+?\\g1)'
	;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `test1`
-- ----------------------------
DROP FUNCTION IF EXISTS `test1`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `test1`(`p` BLOB) RETURNS blob
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...

	RETURN p;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `tools`
-- ----------------------------
DROP PROCEDURE IF EXISTS `tools`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `tools`(`p` blob)
toolSl:BEGIN
	#Routine body goes here...

	DECLARE `p2` BLOB DEFAULT j0(`p`,'p2');
	DECLARE `r` VARCHAR(200) DEFAULT '"((?3))":("((?:\\\\.|[^"])*)")';
	DECLARE `missionId` VARCHAR(200) DEFAULT j0(`p2`,'missionId');
	DECLARE `expId` VARCHAR(200) DEFAULT j0(`p2`,'expId');
	DECLARE `funcid` VARCHAR(60) DEFAULT j0(`p2`,'funcid');

/*
-- start TRANSACTION;
CALL Audit_2('tools',CONCAT_WS(',',QUOTE(`p`)),@a);COMMIT;
LEAVE sdl; */

  IF p2 IS NULL OR IFNULL(`expid`,'')='' OR IFNULL(`expid`,'')='' THEN CALL Error('no p2 epxid missionId');
			ELSE SET @`WHERE` = NULL;END IF;

		SET 	@`WHERE` :=CONCAT_WS('\n',"WHERE",CONCAT_WS(' and ',CONCAT('a.missionid = ',QUOTE(`missionid`)),CONCAT('a.expid = ',QUOTE(`expid`)))),
					@sql_body :=  REGEXP_replace(j0(P,'P1'),`r`, '\\1=if(ifnull(\\2,"")="",\\1,\\1+\\2+0)'),
					@sql_body :=  CONCAT_WS('\n',"UPDATE acc_1 AS a\nSET",@sql_body,@`WHERE`)
											;


	PREPARE sql_stmt from  @sql_body;
	EXECUTE sql_stmt ;

	IF ROW_COUNT() = 0 THEN
				SET 	@sql_body:=CONCAT_WS(',',p2,j0(P,'P1')),
							@sql_body =  CONCAT_WS('\n',CONCAT_WS('','INSERT INTO ACC_1(',REGEXP_replace(@sql_body,`r`,'\\1'),')')
														,'VALUES'
														,REGEXP_REPLACE(CONCAT_WS('','(',REGEXP_REPLACE(@sql_body,`r`,'\\2'),')'),'""|"0"','NULL')
													);
	END IF;
		

--   SELECT @sql_body;
	PREPARE sql_stmt from  @sql_body;
	EXECUTE sql_stmt ;
	DEALLOCATE PREPARE sql_stmt ;


END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `t_ckv`
-- ----------------------------
DROP FUNCTION IF EXISTS `t_ckv`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `t_ckv`(`k` varchar(100),`t` varchar(10),`c`  varchar(20000)) RETURNS varchar(20000) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	SET t = IF(t IS NULL OR t= 0,'quotd(','quotd(');
	RETURN	CONCAT_WS('','CONCAT_WS("",','quotd(',QUOTE(k),'),\":{",CONCAT_WS(\",\",',
							preg_replace('/(([^.,\\n]*)\\.((?R2)*))(,(?R1))*?/',
								CONCAT('','CONCAT(',QUOTE(quotd(@a := '$3')),',',QUOTE(':'),',',CONCAT_WS('',t,'$2','.',@a,'))'))
							,c)
					 ,'),"}")')
				;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `UnQ`
-- ----------------------------
DROP FUNCTION IF EXISTS `UnQ`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `UnQ`(`v` text) RETURNS text CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	IF v IS NULL OR v REGEXP '^null$' THEN RETURN NULL;END IF;
	SET v = REGEXP_REPLACE(v,'^[\'"]|(?<=[^\\\\])\\\\|[\'"]*$','\\1');
	RETURN   v;-- '^[\'"]|(?<=[^\\\\])\\\\|[\'"]*$';
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Uq`
-- ----------------------------
DROP FUNCTION IF EXISTS `Uq`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `Uq`(`v` text) RETURNS text CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...

	RETURN   REPLACE(REPLACE(SUBSTR(v,2,CHAR_LENGTH(v)-2),'\\\'','\''),'\\\\','\\');
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `url`
-- ----------------------------
DROP FUNCTION IF EXISTS `url`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `url`(`p` tinytext) RETURNS longblob
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
	SET p = CONCAT_WS(' ','curl -X GET',IF(p REGEXP '^https://',null,'https://'),p);
	
	
	RETURN e(p);
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `urldecode`
-- ----------------------------
DROP FUNCTION IF EXISTS `urldecode`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `urldecode`(original_text text) RETURNS text CHARSET utf8mb3
    DETERMINISTIC
BEGIN
  DECLARE new_text TEXT DEFAULT NULL;  
    DECLARE pointer INT DEFAULT 1;  
    DECLARE end_pointer INT DEFAULT 1;  
    DECLARE encoded_text TEXT DEFAULT NULL;  
    DECLARE result_text TEXT DEFAULT NULL;  
    DECLARE rep_text TEXT DEFAULT NULL;  
    DECLARE unhex_text TEXT DEFAULT NULL;  
    SET new_text = REPLACE(original_text,'+',' ');  
    SET new_text = REPLACE(new_text,'%0A','\r\n');  
    SET pointer = LOCATE('%', new_text);  
    WHILE pointer <> 0 && pointer < (CHAR_LENGTH(new_text) - 2) DO  
        SET end_pointer = pointer + 3;  
        WHILE MID(new_text, end_pointer, 1) = '%' DO  
            SET end_pointer = end_pointer+3;  
        END WHILE;  
        SET encoded_text = MID(new_text, pointer, end_pointer - pointer);  
        SET rep_text = REPLACE(encoded_text, '%', '');
        SET unhex_text = UNHEX(rep_text);
        SET result_text = CONVERT(unhex_text USING utf8mb4);  
        SET new_text = REPLACE(new_text, encoded_text, result_text);  
        SET pointer = LOCATE('%', new_text, pointer + CHAR_LENGTH(result_text)); 
    END WHILE;  
    RETURN new_text;  
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `urlencode`
-- ----------------------------
DROP FUNCTION IF EXISTS `urlencode`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `urlencode`(str text) RETURNS text CHARSET utf8mb3
    DETERMINISTIC
BEGIN
DECLARE sub VARCHAR(1) CHARSET utf8mb4;
  DECLARE val BIGINT DEFAULT 0;
  DECLARE ind INT DEFAULT 1;
  DECLARE oct INT DEFAULT 0;
  DECLARE ret VARCHAR(4096) DEFAULT '';
  DECLARE octind INT DEFAULT 0;
  IF str is NULL THEN
      RETURN NULL;
  ELSE SET ret = '';
      WHILE ind <= CHAR_LENGTH(str) DO
        SET sub = MID(str, ind, 1);
        SET val = ORD(sub);
        IF NOT (val BETWEEN 48 AND 57 OR 
                val BETWEEN 65 AND 90 OR 
                val BETWEEN 97 AND 122 OR 
                val IN (45, 46, 95, 126)) THEN
            SET octind = OCTET_LENGTH(sub);
            WHILE octind > 0 DO
              SET oct = (val >> (8 * (octind - 1)));
              SET ret = CONCAT(ret, '%', LPAD(HEX(oct), 2, 0));
              SET val = (val & (POWER(256, (octind - 1)) - 1));
              SET octind = (octind - 1);
            END WHILE;
        ELSE
          SET ret = CONCAT(ret, sub);
        END IF;
        SET ind = (ind + 1);
    END WHILE;
  END IF;
  RETURN ret;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `v`
-- ----------------------------
DROP FUNCTION IF EXISTS `v`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `v`(`v` longblob) RETURNS longblob
    DETERMINISTIC
BEGIN
	#Routine body goes here...

	RETURN NULL;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `v2t`
-- ----------------------------
DROP PROCEDURE IF EXISTS `v2t`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `v2t`( IN `k` TINYTEXT,IN `p` longblob)
`l`:BEGIN
	DECLARE `模式` , `类型` ,`name` varchar(100) DEFAULT NULL;

  SET `name` := REGEXP_substr(k,'^\\s*\\w+');

	
	IF  p IS NULL|| p = '0' THEN

		SET  p  = (SELECT  1  FROM	information_schema.VIEWS AS a WHERE 	a.TABLE_SCHEMA = database() AND	a.TABLE_NAME =  `name`) ;

			IF FOUND_ROWS() THEN

				SET  p  =  CONCAT_WS(' ',
													'SELECT  *  ',
													CONCAT('FROM ',`name`) 
											);


			end IF;
		END IF ;


	SET k := CONCAT_WS('','["',REGEXP_replace(k,',','","'),'"]') 
	,类型 :=  REGEXP_substr(k ,',\\s*"\\Kt\\s*"')
	,k:= REGEXP_replace(k ,',\\s*"t\\s*"','')
  ,`模式` = JSON_value(k,'$[1]')
  ,`name` =  IF(`name` REGEXP @自用 := '(?i)v0$' , REGEXP_replace(`name`,@自用 ,''), CONCAT(`name`,'v0'));



SET p =  REGEXP_replace(p,'\\\\','\\\\\\\\');

	CASE
		WHEN IFnull(p,'') = ''  THEN 
			LEAVE `l`;
		WHEN `模式` IS NULL OR `模式` REGEXP '^(?:1|(re?)?c(reate)?)$' THEN
			 SET 	p = CONCAT_WS('\n'
					,CONCAT_WS(' ',"CREATE",IF(IFNULL(类型,'') REGEXP '^t', 'TEMPORARY','') ,"TABLE IF not EXISTS",`name`,"AS")
					, cast(`p`AS char)
					);
			case	WHEN `模式` IS NULL THEN
				 SET k = k;
				 
				WHEN `模式` REGEXP '^(?:(?:1|(re)?[rc](reate)?)|d)$' THEN 
					EXECUTE immediate CONCAT_WS(' ','drop',IF(IFNULL(类型,'') REGEXP '^t', 'TEMPORARY','') ,'TABLE IF EXISTS',`name` );
					IF `模式` REGEXP '^d$' THEN LEAVE `l`;END IF;
			 END CASE; 
		 WHEN `模式`REGEXP '(?i)^(11|l(?:ist)?)$|显示' THEN
		  SET p = CONCAT_WS(' ','SELECT' ,JSON_QUOTE(CAST(p AS CHAR)),'AS 语句') ;
		ELSE LEAVE `l`;
	END CASE;
	

	EXECUTE immediate  p ;


END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `v3_initial_mission`
-- ----------------------------
DROP PROCEDURE IF EXISTS `v3_initial_mission`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `v3_initial_mission`(IN `expid_` varchar(20000),IN `missionid_` varchar(60),in sealNo_ Integer(3),in pageId_ varchar(30))
    READS SQL DATA
`l`:BEGIN
	#Routine body goes here...

	DECLARE db_a VARCHAR(100) DEFAULT NULL;
	DECLARE db_b VARCHAR(100) DEFAULT NULL;
	DECLARE db_s VARCHAR(100) DEFAULT NULL;
	DECLARE `mId` VARCHAR(60)  DEFAULT NULL;
	DECLARE `mId1` VARCHAR(60)  DEFAULT NULL;


/*
START TRANSACTION;
INSERT INTO plogs (Function_Name,parameter) VALUES ('v3_initial_mission',CONCAT_WS(',',QUOTE(`expid_`),QUOTE(`missionid_`),QUOTE(`sealNo_`),QUOTE(`pageId_`)));
COMMIT;
*/



	CASE
			WHEN expid_ IS NULL THEN
					SELECT NULL;LEAVE `l`;
			WHEN missionid_ IS NULL THEN
					SELECT NULL;LEAVE `l`;

			ELSE 
         SET @initial_body =NULL;
	END CASE;


	SET `mId1` = NewMId(`missionid_`,1),
			`mId` = NewMId(`missionid_`,0);


	SET @ai = NULL,@bi = NULL,
			db_a = IF(`mId1` IS NULL,'acc_1','acc_a'),
			db_b = IF(`mId1` IS NULL,expid2b(expid_),'acc_b'),
			db_s = IF(`mId1` IS NULL,'acc_seal_1','acc_seal_c'),
			@initial_body =
					CONCAT_WS('',"SELECT \n",
												"b.mission_ask,c.line,\n",
IF(`mId1` IS NULL ,
CONCAT_WS('',
"@ai := CONCAT('{',CONCAT_WS(',',",
Temp_Func('IF(IFNULL(b.init_a??,"")="",NULL,\'"??":"1"\')',1,100,NULL),
"),'}'),\n",
"@i := IF(CHAR_LENGTH(IFNULL(b.init_b1,''))>3 AND b.init_b1<>'{}',1,0),\n",
"@bi := IF(@i,init_b1,CONCAT('{',CONCAT_WS(',',",
'IF(IFNULL(b.init_b1,"")<>"" AND b.init_b1<>"{}" ,\'"1":"1"\',NULL),',
Temp_Func('IF(IFNULL(b.init_b??,"")="",NULL,\'"??":"1"\')',2,49,NULL),
"),'}'))"
),"@ai :=NULL ,@i:=NULL,@bi:=NULL "),
												",\na2.redo_size,\n",
												"a1.classType,\n",
												"IF(a2.redo_size = 99,a2.redo_size,a2.redo_size - IFNULL(c.log_count,0)) AS number,\n",
												"IFNULL(c.log_count,0) AS log_count,\n",
												"c.score,\n",
												"IF(IFNULL(b.line_type,0)=0, 0, 1) AS is_line,\n",
												"IF(IFNULL(b.line_type,0)=0, 0, 1) AS ifLineS,\n",
												"IF(IFNULL(b.line_type,0)=0, 0, IF(IFNULL(c.is_line,0),0,1)) AS ifLineO,\n",
												"b.line_x1,b.line_y1,b.line_x2,b.line_y2,b.line_color,b.line_type,a12.courseNo, \n",
												"d.*\n"
												"FROM exp_experimentclassstudent AS a\n",
												"INNER JOIN exp_experimentclass AS a1 ON a.classNo = a1.classNo\n",
 												"INNER JOIN exp_experimentclass_course AS a12 ON a12.classNo = a1.classNo\n",
 												"INNER JOIN exp_courses_node AS a13 ON a12.courseNo = a13.node_courseNo\n",
 												"INNER JOIN exp_courses_node_content AS a14 ON a14.missionId = ",QUOTE(`mId`)," AND a14.contentNo = a13.contentNo\n", 
												"INNER JOIN mysq1_schema.exp_difficulty AS a2 ON a1.difficulty_level = a2.difficulty_level\n",
												"JOIN acc_mission AS b  ON b.missionId =",QUOTE(`mId`),"\n",
												"LEFT JOIN " ,db_a, " AS c ON b.missionId = c.missionId AND a.expNo = c.expID",
								CONCAT(" AND c.missionId1 = ",quote_d(`mId1`)),
												"\nJOIN (SELECT\n",
												"MIN(IF(b.expID is NULL,a.seal_id,NULL)) AS rpSealId,\n",
												"COUNT(a.seal_id) AS shouldSeal,\n",
												"COUNT(b.expid) AS overSeal,\n",
												"COUNT(a.seal_id) - COUNT(b.expid) AS unSealed \n",
												"FROM acc_mission_seal AS a\n",
												"LEFT JOIN " ,db_s, " AS b ON b.expID = ",QUOTE(expid_),"\n", 
												"AND a.pageId = b.pageId AND a.missionId = b.missionId AND a.seal_id = b.seal_Id \n",
												"WHERE a.missionId =",QUOTE(missionid_)," AND \n",
												CONCAT("a.seal_no ='",sealNo_,"' AND \n"), 
												"a.pageId =",QUOTE(pageId_) ,"\n", 
												") AS d \n",
												"WHERE a.expno =",QUOTE(expid_) 
				);

 
--  SELECT  @initial_body;
	EXECUTE immediate @initial_body;

SET @t  = NULL;

SET @initial_body = 
IF(mid1 IS NULL ,
				CONCAT_WS('',	"SELECT \n",
											"column_json(COLUMN_create(",
Temp_Func("'t??',IF(IFNULL(a.t??,'')='',NULL,a.t??)",1,8,null),
")) AS t,\n",
"@bio :=",QUOTE(@ai),",\n",
-- c
"@c := 0,\n",
'IF(IFNULL(@a := CONCAT_WS(",",',
Temp_Func('IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.a??="",NULL,QD(b.a??,"","\\\"v\\\":"))
,IF(preg_capture(QD(@c,":\\\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.a??,"","\\\"v\\\":"),","),"\\\"c\\\":\\\"1\\\""),
	IF(b.a??="",NULL,QD(b.a??,"","\\\"v\\\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))\n',1,100,null),'),"")="",NULL,
CONCAT("{",@a,"}")) 
 AS a\n'
											"FROM acc_mission AS a \n",
											"LEFT JOIN acc_standard_1 AS a1 ON a.missionId = a1.missionId AND a.missionId = a1.missionId \n",
											"LEFT JOIN ",db_a," AS b ON b.expid = ",QUOTE(expid_)," AND a1.missionId = b.missionId \n"
											"WHERE a.missionid = ",QUOTE(`mId`),CONCAT(" AND b.missionid1 = ",quote_d(`mId1`))
),
-- 第二种 
CONCAT_WS('',"SELECT quotj(\n",
"CONCAT_WS(',',",Temp_Func("qd1(a.a??,??)",1,100,NULL),")) AS a\nFROM acc_a AS a",
"\nWHERE  a.expID = ",QUOTE(expid_)," AND a.missionId = ",QUOTE(`mId`),
" AND a.missionId1 = ",QUOTE(`mId1`)));
-- SELECT  @initial_body;-- SELECT @initial_body;
	PREPARE stmt_initial FROM @initial_body;
	EXECUTE stmt_initial;


IF @t = 	"{0}" THEN 

CALL Audit_1(CONCAT('v3_initial_mission - ',@t),CONCAT_WS(',',QUOTE(`expid_`),QUOTE(`missionid_`),QUOTE(`sealNo_`),QUOTE(`pageId_`)),'ok');
COMMIT;
CALL Error("@twenti");
END if;



	IF DATABASE() = 'qianxue_sjzh' AND `missionid_` IN('qianxue-15123110423612291','qianxue-15123115081130306','qianxue-15123115301023304'/*,'qianxue-15123115374571222'*/ )
 THEN
	pd:BEGIN
			SET @a = CONCAT('{',quote_d('0'),':','{',quote_d("expID"),':',quote_d(`expid_`),',',quote_d('missionId'),':',quote_d(`missionid_`),'}}');

			CASE 
-- 2.1
					WHEN `missionid_` = 'qianxue-15123110423612291' THEN	CALL m_j('5',@a);
-- 3.1
					WHEN `missionid_` = 'qianxue-15123115081130306' THEN	CALL m_j('6',@a);
-- 3.2
					WHEN `missionid_` = 'qianxue-15123115301023304' THEN	CALL m_j('7',@a);
-- 3.3
-- 					WHEN `missionid_` = 'qianxue-15123115374571222' THEN	CALL m_j('8',@a);

					ELSE LEAVE pd;
			END CASE ;
			LEAVE `l`;
		END;
	END IF;


	SET @rowNo = NULL ,
			@initial_body =
 IF(mid1 IS NULL ,
				CONCAT_WS('',	"SELECT CONCAT('{',GROUP_CONCAT(a.b),'}') AS b FROM(\nSELECT \n",
											"IF(IFNULL(a1.rowNo,'') = '',b.rowNo ,a1.rowNo) AS rowNo,\n",
-- LINE
"@bio := IF(NOT ",QUOTE(@i),",",QUOTE(@bi),",IF(@bio := preg_capture(QD(a1.rowNo,':{/','/'),@bi) IS NULL ,NULL,je2(@bi,a1.rowNo,NULL))),\n",
-- c
"@c := 0,\n",
'IF(IFNULL(@a := CONCAT_WS(",",',
Temp_Func('IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b??="",NULL,QD(b.b??,"","\\\"v\\\":"))
,IF(preg_capture(QD(@c,":\\\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b??,"","\\\"v\\\":"),","),"\\\"c\\\":\\\"1\\\""),
	IF(b.b??="",NULL,QD(b.b??,"","\\\"v\\\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))\n',1,50,null),
'),"")="",NULL,
qd(a1.rowNo,CONCAT(":{",@a,"}"),"")) 
\n AS b\n'
											"FROM acc_mission AS a \n",
											"LEFT JOIN ",db_b," AS b ON b.expid = ",QUOTE(expid_)," AND b.missionId =",QUOTE(`mid`),"\n",
											"LEFT JOIN acc_standard_n AS a1 ON a.missionId = a1.missionId AND (CASE WHEN  IFNULL(b.rowNo,'') <> '' AND IFNULL(b.rowNo,'') <> ''THEN a1.rowno = b.rowNo WHEN IFNULL(b.rowNo,'') <> '' THEN b.rowNo ELSE a1.rowno END)",
											"WHERE a.missionid = ",QUOTE(`mid`),"\n",
') AS a WHERE a.b IS NOT NULL'
),
-- 第二种 
CONCAT_WS('',"SELECT quotj(GROUP_CONCAT(qd2(rowNo ,@a))) AS b\n",
"FROM acc_b AS a",
"\nWHERE  a.expID = ",QUOTE(expid_)," AND a.missionId = ",QUOTE(`mId`),
" AND a.missionId1 = ",QUOTE(`mId1`)," AND \n",
"(@a := CONCAT_WS(',',",Temp_Func("qd1(a.b??,??)",1,50,NULL),")",
"\n) IS NOT NULL AND @a <> '' "
)

);
-- SELECT @initial_body;
	PREPARE stmt_initial FROM @initial_body;
	EXECUTE stmt_initial;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `v5_autoFlow`
-- ----------------------------
DROP PROCEDURE IF EXISTS `v5_autoFlow`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `v5_autoFlow`(in n_expID VARCHAR(50),in n_missionId VARCHAR(50),in isSelf int)
aflowlab:BEGIN

	declare shouldSeals int;  declare overSeals int; declare _PKid VARCHAR(50); declare _sealNo VARCHAR(3); declare _roleID VARCHAR(50); 
	declare _actionNo VARCHAR(2); declare _nRoleId VARCHAR(50); declare _nSealNo VARCHAR(3); declare xSealNo int; declare xnSealNo int;
/*
START TRANSACTION;CALL Audit_1('v5_autoFlow',CONCAT_WS(',',quote(`n_expID`),quote( `n_missionId`),quote( `isSelf`)),'ok');COMMIT;


*/	

	SET @_roleID = NULL,
			@v5stmt = CONCAT_WS('',"SELECT DISTINCT b.roleID\n","	into @_roleID\n",
															"FROM acc_mission_seal AS a\n","INNER JOIN acc_enter_seal AS b ON a.seal_id = b.sealID\n",
															"where a.missionId = ",QUOTE(n_missionId)," and b.seal_content='操作' limit 0,1");
		PREPARE stmt_v5 FROM @v5stmt;
		EXECUTE stmt_v5 ;

 IF @_roleID is not null then 
--  SELECT CONCAT_WS(',',QUOTE(n_expID),QUOTE(n_missionId),QUOTE(@_roleID)); leave aflowlab;
   call v5_autoSeal(n_expID,n_missionId,@_roleID); 
 END IF;


 select count(*) into overSeals from acc_seal_1 where acc_seal_1.expID=n_expID and acc_seal_1.missionId=n_missionId ;
 SELECT count(*) into shouldSeals FROM acc_mission_seal INNER JOIN acc_enter_seal ON acc_mission_seal.seal_id = acc_enter_seal.sealID
 where acc_mission_seal.missionId=n_missionId  ;
 
 IF shouldSeals=overSeals THEN 
  update exp_stu_mission set exp_stu_mission.overStatu='1' where exp_stu_mission.expId=n_expID and exp_stu_mission.missionId=n_missionId ;
  
  update exp_stu_mission set exp_stu_mission.key_mission_Done=exp_stu_mission.key_mission_Done+1 where exp_stu_mission.expId=n_expID and exp_stu_mission.missionId IN
   (select amb.missionId FROM acc_mission_back_information amb where amb.type='bk' and amb.quoteid=n_missionId);
 ELSE 
  
  if isSelf=0 THEN 
    select case when exp_stu_mission.nSealNo is null then -1 else exp_stu_mission.nSealNo end INTO xSealNo from exp_stu_mission where exp_stu_mission.expId=n_expID  and exp_stu_mission.missionId=n_missionId ;     
  ELSE 
    select case when exp_stu_mission.sealNo is null then -1 else exp_stu_mission.sealNo end INTO xSealNo from exp_stu_mission where exp_stu_mission.expId=n_expID  and exp_stu_mission.missionId=n_missionId ;
  end if;
  
  if xSealNo=-1 THEN
    update exp_stu_mission set exp_stu_mission.overStatu='1' where exp_stu_mission.expId=n_expID and exp_stu_mission.missionId=n_missionId ;
  else 
     select 
       seal1.PKid,
       case when seal05.roleID is null then seal1.roleID else seal05.roleID end as roleID,
       case when seal05.sealNo is null then seal1.sealNo else seal05.sealNo end as sealNo,
       case when seal05.nodeSealId is null THEN seal1.actionNo else seal05.nodeSealId end as actionNo,
       case when seal05.roleID is not null then seal1.roleID  when seal05.roleID is null and seal15.roleID is not null then seal15.roleID else seal2.roleID end as nRoleId,
       case when seal05.sealNo is not null then seal1.sealNo  when seal05.sealNo is null and seal15.sealNo is not null then seal15.sealNo else seal2.sealNo end as nSealNo 
      into _PKid,_roleID,_sealNo,_actionNo,_nRoleId,_nSealNo 
     from 
     (
       select min(ams.PKid) PKid,aes.roleID,ams.seal_no as sealNo,ams.vstatu actionNo FROM acc_mission_seal ams left JOIN acc_enter_seal aes ON aes.sealID = ams.seal_id where ams.seal_no=(xSealNo+1) and ams.missionId=n_missionId
     ) seal1
     LEFT JOIN
     (
      select min(ams.PKid) PKid,aes.roleID,ams.seal_no as sealNo FROM acc_mission_seal ams left JOIN acc_enter_seal aes ON aes.sealID = ams.seal_id where ams.seal_no=(xSealNo+2) and ams.missionId=n_missionId 
     ) seal2 on 1=1
     LEFT JOIN
     (
      select aesa.missionId,aesa.PKid,aesa.roleID,aesa.sealNo as sealNo,aesa.nodeSealId FROM acc_mission_seal_assist aesa where aesa.sealNo=(xSealNo+0.5) and aesa.missionId=n_missionId 
     ) seal05 on 1=1
     LEFT JOIN
     (
      select aesa.missionId,aesa.PKid,aesa.roleID,aesa.sealNo as sealNo,aesa.nodeSealId FROM acc_mission_seal_assist aesa where aesa.sealNo=(xSealNo+1.5) and aesa.missionId=n_missionId
     ) seal15 on 1=1;
    
    update exp_stu_mission set exp_stu_mission.PKid=_PKid,exp_stu_mission.roleID=_roleID,exp_stu_mission.sealNo=_sealNo,exp_stu_mission.nodeSealId=_actionNo,exp_stu_mission.nRoleId=_nRoleId,exp_stu_mission.nSealNo=_nSealNo
     where exp_stu_mission.expId=n_expID and exp_stu_mission.missionId=n_missionId;
  end if;
 end if;
 commit;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `v5_autoSeal`
-- ----------------------------
DROP PROCEDURE IF EXISTS `v5_autoSeal`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `v5_autoSeal`(in expID VARCHAR(50),in missionId VARCHAR(50),in roleID VARCHAR(50))
autoseal:BEGIN
-- 半自动签章（处理为存储过程）
-- 0)保存签章（在此处理）
-- 1)判断是否已经签章，
-- 2)已经签章则不做处理，未签章则添加数据
/* 
-- start TRANSACTION;

CALL Audit_1('v5_autoSeal',CONCAT_WS(',',quote(`expID`),quote( `missionId`),quote( `roleID`)),'no blob');


COMMIT;
*/
 

	SET @expID = NULL,
			@sealed = NULL,
			@ASB = CONCAT_WS('','SELECT c.expID,IF(c1.missionId IS NULL, CONCAT_WS(",",QUOTE(a1.seal_id),QUOTE(a1.pageId),QUOTE(a1.PKid)),NULL)\n',
																	'INTO @expID,@sealed\n',
													'FROM acc_mission AS a INNER JOIN acc_mission_seal AS a1 ON a1.missionId = a.missionId\n','INNER JOIN acc_enter_seal AS b ON a1.seal_id = b.sealID\n','LEFT JOIN acc_1 AS c ON c.expID = ',QUOTE( expID),' AND a.missionId = c.missionId\n','LEFT JOIN acc_seal_1 AS c1 ON c1.expID = c.expID AND c1.missionId = a1.missionId AND c1.seal_Id = a1.seal_id AND c1.pageId = a1.pageId AND c1.missionId = a.missionId\n',
													'WHERE a.missionId = ', QUOTE(missionId) ,'  AND b.roleID = ',QUOTE(roleID),' AND c1.seal_Id IS NULL');

-- a.expID =', QUOTE(expID),'AND

	PREPARE stmt FROM @ASB ;
	EXECUTE stmt ;

  IF @expID IS NULL THEN
		SET @expID = CONCAT_WS(',',QUOTE(expID),QUOTE(missionId)),
				@asb = CONCAT_WS('',"INSERT acc_1(expID,missionId) VALUES(",@expID,")");
		PREPARE stmt FROM @ASB ;
		EXECUTE stmt ;

	END IF;

	IF @sealed IS NULL THEN

		SET @expID = CONCAT_WS('',QUOTE(expID),QUOTE(missionId)),
				@asb = CONCAT_WS('',"INSERT acc_1(expID,missionId,seal_Id,pageId,PKid) VALUES(",@expID,",",@sealed,")");

		PREPARE stmt FROM @ASB ;
		EXECUTE stmt ;
	END IF;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `v5_bk_bill_d`
-- ----------------------------
DROP PROCEDURE IF EXISTS `v5_bk_bill_d`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `v5_bk_bill_d`(in _id VARCHAR(50))
p:BEGIN
-- 用于背景表单 bb
-- 1、获取背景表单划线联次信息
-- 2、获取背景表单TA数据
-- 3、获取背景表单B数据
-- 4、获取背景表单签章数据
 
-- 获取背景表单划线联次信息

 START TRANSACTION;
CALL Audit_1('v5_bk_bill_d',CONCAT_WS(',',QUOTE(`_id`)),'ok');COMMIT;/*LEAVE p;
-- 
*/
SET @sql=CONCAT_WS('\n'
,'SELECT'
,'a.missionId,	 bk.sort AS step_label, a.missionLabel,	a.bill_Id,	a.pageId,	a.is_line,	a.line_x1,	a.line_y1,	a.line_x2,	a.line_y2,	a.line_color,	a.line_type,
b.standard_jsp,b.max_page,b.page_title1,b.page_title2,b.page_title3,b.page_title4,b.page_title5,b.page_title6,b.page_title7,b.page_title8'
,'FROM 	acc_mission_backbill_1 AS a
INNER JOIN mysq1_schema.bill_list AS b ON a.bill_Id = b.billId
LEFT JOIN acc_mission_back_information AS bk on a.missionid = bk.quoteid' 
,CONCAT_WS('','where a.missionId=' ,QUOTE(_id)));

EXECUTE immediate @sql;

-- 获取背景表单TA数据
SELECT a.missionId, t1,a.t2,a.t3,a.t4,a.t5,a.t6,a.t7,a.t8,
a.a1,a.a2,a.a3,a.a4,a.a5,a.a6,a.a7,a.a8,a.a9,a.a10,a.a11,a.a12,a.a13,a.a14,a.a15,a.a16,a.a17,a.a18,a.a19,a.a20,a.a21,a.a22,a.a23,a.a24,a.a25,
a.a26,a.a27,a.a28,a.a29,a.a30,a.a31,a.a32,a.a33,a.a34,a.a35,a.a36,a.a37,a.a38,a.a39,a.a40,a.a41,a.a42,a.a43,a.a44,a.a45,a.a46,a.a47,a.a48,a.a49,a.a50,
a.a51,a.a52,a.a53,a.a54,a.a55,a.a56,a.a57,a.a58,a.a59,a.a60,a.a61,a.a62,a.a63,a.a64,a.a65,a.a66,a.a67,a.a68,a.a69,a.a70,a.a71,a.a72,a.a73,a.a74,a.a75,
a.a76,a.a77,a.a78,a.a79,a.a80,a.a81,a.a82,a.a83,a.a84,a.a85,a.a86,a.a87,a.a88,a.a89,a.a90,a.a91,a.a92,a.a93,a.a94,a.a95,a.a96,a.a97,a.a98,a.a99,a.a100
FROM  acc_mission_backbill_1 AS a
where  a.missionId=_id;

-- 获取背景表单B数据
SELECT
a.missionId,a.rowId,
a.b1,a.b2,a.b3,a.b4,a.b5,a.b6,a.b7,a.b8,a.b9,a.b10,a.b11,a.b12,a.b13,a.b14,a.b15,a.b16,a.b17,a.b18,a.b19,a.b20,
a.b21,a.b22,a.b23,a.b24,a.b25,a.b26,a.b27,a.b28,a.b29,a.b30,a.b31,a.b32,a.b33,a.b34,a.b35,a.b36,a.b37,a.b38,a.b39,a.b40,
a.b41,a.b42,a.b43,a.b44,a.b45,a.b46,a.b47,a.b48,a.b49,a.b50
FROM acc_mission_backbill_n AS a
where a.missionId=_id  ORDER BY a.rowId;

-- 获取背景表单签章数据
SELECT
b.missionId, b.seal_Id, b.content,b.shape,b.x,b.y,b.w,b.h,b.color,b.font,b.seal_ARC,b.seal_ARC_FONT,
b.seal_BOTTOM,b.seal_BOTTOM_FONT,b.enter_simname,b.seal_name,b.pageNo,b.is_seal
FROM
acc_mission_backbill_seal b 
INNER JOIN acc_mission_backbill_1 a on a.missionId=b.missionId and a.pageId=b.pageNo
where b.missionId=_id; 
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `v5_bk_bill_m`
-- ----------------------------
DROP PROCEDURE IF EXISTS `v5_bk_bill_m`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `v5_bk_bill_m`(in _expId VARCHAR(60), in _id VARCHAR(50),in _pageNo VARCHAR(5))
l:BEGIN
-- 用于背景表单(任务表单)
-- 1、获取背景表单划线联次信息T数据
-- 2、获取背景表单A数据
-- 3、获取背景表单B数据
-- 4、获取背景表单签章数据

	DECLARE `i` TINYTEXT  DEFAULT NULL;
/*
 START TRANSACTION;
CALL Audit_1('v5_bk_bill_m',CONCAT_WS(',',QUOTE(`_expId`),QUOTE(`_id`),QUOTE(`_pageNo`)),'ok');
 COMMIT;

LEAVE l;
*/

		SET @a := 0;
-- IF json_valid(_id) AND json_value(_id,'$[0]') THEN CALL v5_bk_bill_d();END IF;

		SET @stmt_body = CONCAT_WS('','set @stmt_body = (SELECT bk.quoteid FROM acc_mission_back_information AS bk WHERE bk.quoteid = ',QUOTE(_id),' AND type ="bb"limit 1)');
	  EXECUTE immediate @stmt_body; 

		IF FOUND_ROWS() THEN 

					SET `i` = 1 ;

				ELSE 
					SET @stmt_body =CONCAT_WS('',"SELECT \nCASE WHEN e2.classNo IS NULL THEN 1 \nWHEN IFNULL(a1.is_bk_read_answer,0) = 0 THEN 0\nWHEN IFNULL(b.score,0) < a2.max_score_size THEN 0 \nELSE 1 END\nINTO @a\nFROM exp_experimentclassstudent AS a\nLEFT JOIN exp_experimentclass AS a1 ON a.classNo = a1.classNo\nINNER JOIN `mysq1_schema`.exp_difficulty AS a2 ON a1.difficulty_level = a2.difficulty_level\nLEFT JOIN acc_1 AS b ON b.missionId = ",QUOTE(_id)," AND b.expID = a.expNo\nLEFT JOIN exp_courses_node_content AS e ON e.missionid = ",QUOTE(_id),"\nleft JOIN exp_courses_node AS e1 ON e.contentNo = e1.contentNo\nLEFT JOIN  exp_experimentclass_course AS e2 ON e2.classNo = a1.classNo AND e1.node_courseNo = e2.courseNo\nWHERE a.expNo = ",QUOTE(_expid)) ;

					EXECUTE immediate @stmt_body;
					IF ! ISNULL(_expId) AND  @a= 0  THEN

						CALL polling_mission(_expid,_id, _pageNo);
						LEAVE l;
					END IF;
		END if;

		SET @stmt_body = CONCAT("SELECT ",
										CONCAT_WS(',',"	a.missionId","a.billId AS billId ","a.pageNo pageNo","a.is_line",
													"\n		a.line_x1","a.line_y1","a.line_x2","a.line_y2",
													"\n		a.is_line","a.line_color","a.line_type\n		",
													Temp_Func("a.t??",1,8,NULL),
													"\n		b.standard_jsp","b.max_page\n		",
													"\n		IF(IFNULL(b.max_page,1) = 1,'',b.page_title1) AS `page_title1`",
													Temp_Func("b.page_title??",2,7,NULL)),
													"\nFROM acc_mission AS a\n",
													"INNER JOIN mysq1_schema.bill_list AS b ON a.billId = b.billId\n",
													"WHERE a.missionId = ",QUOTE(_id));
		IF i THEN SET @stmt_body = REPLACE(REPLACE(REPLACE(@stmt_body,'a.billId','a.bill_Id'),'a.pageNo','a.pageid'),'acc_mission','acc_mission_backbill_1');END IF;

		exECUTE immediate @stmt_body;
		


		SET @stmt_body = CONCAT("SELECT a.missionId,\n",
															Temp_Func("a.a??",1,100,NULL),"\n",
														"FROM acc_standard_1 AS a\n",
														"where a.missionId = ",QUOTE(_id));
		IF i THEN SET @stmt_body = REPLACE(@stmt_body,'acc_standard_1','acc_mission_backbill_1');END IF;


		EXECUTE immediate @stmt_body;
		 
		SET @stmt_body = CONCAT("SELECT a.missionId, a.rowno AS rowNo ,\n",
															Temp_Func("a.b??",1,50,NULL),"\n",
														"FROM acc_standard_n AS a\n",
														"where a.missionId = ",QUOTE(_id));
		IF i THEN SET @stmt_body = REPLACE(REPLACE(@stmt_body,'acc_standard_n' ,'acc_mission_backbill_n'),'a.rowno','a.rowid');END IF;

		EXECUTE immediate @stmt_body;


		SET @stmt_body = CONCAT("SELECT a.missionId, a.seal_id,a.x,a.y,\n\t\t",
														"b.sealID,b.roleID,b.seal_name,b.seal_content,b.seal_shape,\n\t\t",
														"b.seal_w AS w,b.seal_h AS h,\n\t\t",
														"b.seal_color,b.seal_font,b.seal_content_arc,b.seal_content_arc_font,\n\t\t",
														"b.seal_content_bottom,b.seal_content_bottom_font\n\t\t",
														"FROM acc_mission_seal AS a \n",
														"INNER JOIN acc_enter_seal AS b ON a.seal_id = b.sealID \n",
														"WHERE a.missionId = ",QUOTE(_id )," AND \n\t\t",
														"a.pageId = ",QUOTE(_pageNo)," AND b.seal_content NOT LIKE '%操作%'");
		IF i THEN SET @stmt_body = REPLACE(REPLACE(@stmt_body,'acc_mission_seal' ,'acc_mission_backbill_seal'),'a.pageId','a.pageno');END IF;
-- SELECT  @stmt_body,CURRENT_TIMESTAMP(6),REGEXP_substr(CURRENT_TIMESTAMP(6),'\\d{2}\\..*?$') - @start; LEAVE l;

		EXECUTE immediate @stmt_body;


END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `v5_bk_enter`
-- ----------------------------
DROP PROCEDURE IF EXISTS `v5_bk_enter`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `v5_bk_enter`(in _courseID VARCHAR(50))
    DETERMINISTIC
BEGIN

/*
START TRANSACTION;
				SET @funcid = CONCAT_WS(' ', ' v5_bk_enter' ),
				@pp =CONCAT_WS(',',quote(_courseID));
CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp));COMMIT;
*/


SELECT
  CAST(acc_enter.pkid AS CHAR ) as node,
	CAST(acc_enter.pkid AS CHAR ) as fnode,
	'ee' as type,
	acc_enter.enterSimName as title
FROM
acc_enter where acc_enter.courseNo=_courseID;

SELECT
  CAST(acc_enter.pkid AS CHAR ) as node,
	CAST(acc_enter.pkid AS CHAR ) as fnode,
  'eb' as type,
	'基本资料' as title	
FROM
	acc_enter where acc_enter.courseNo=_courseID
UNION ALL
SELECT
	CAST(bf.EnterBFid AS CHAR ) as node,
	CAST(acc_enter.pkid AS CHAR ) as fnode,
	'ef' as type,
	bf.enterback_title as title
FROM
	acc_enter_backfile bf
INNER JOIN acc_enter on acc_enter.enter=bf.enterId
where bf.enterId IN (SELECT acc_enter.enter FROM acc_enter where acc_enter.courseNo=_courseID)
 UNION ALL
SELECT
	CAST(bt.pkid AS CHAR ) as node,
	CAST(acc_enter.pkid AS CHAR ) as fnode,
  'et' as type,
	bt.enterback_title	as title
FROM
	acc_enter_backtext bt 
INNER JOIN acc_enter on acc_enter.enter=bt.enterId
where bt.enterId IN (SELECT acc_enter.enter FROM acc_enter where acc_enter.courseNo=_courseID);
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `v5_bk_mission`
-- ----------------------------
DROP PROCEDURE IF EXISTS `v5_bk_mission`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `v5_bk_mission`(in _missionId VARCHAR(60))
BEGIN
-- 用于背景资料
-- 1、获取任务背景资料（第一层）
-- 2、获取任务背景资料（第而层）


  DECLARE CONTINUE HANDLER FOR  SQLSTATE '23000', SQLSTATE	'42000'	, SQLSTATE	'42S22' , SQLSTATE	'HY000'-- ,SQLSTATE	'22007'
	BEGIN GET DIAGNOSTICS CONDITION 1 @`sqlstate` = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;SET  @`sqlstate` = JSON_OBJECT('sqlstate',@`sqlstate`,'errno',@errno,'text',@text);
				SET @`errsql` = NULL;
				SET @funcid = 'Error v5_bk_mission',
				@pp =CONCAT_WS(',',quote( `_missionId`));
				CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp,'SQL',@`errsql`,'err',@`sqlstate`));
	END;
/*
START TRANSACTION;
				SET @`errsql` = NULL;
				SET @funcid =  'v5_bk_mission',
				@pp =CONCAT_WS(',',quote( `_missionId`));
				CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp,'SQL',@`errsql`,'err',@`sqlstate`));COMMIT;
*/

-- 背景文字、背景文件、前者任务（第一层）
SELECT
	CONCAT_WS(' ',sort,title) AS title,
	a.quoteid as node,
  a.missionid as fnode,
	IF(a.type = 'bk','bb',a.type) AS type,
	a.sort,
  1 as layer,
  CAST(a.pageNo AS CHAR )  as pageNo
FROM
acc_mission_back_information AS a
LEFT JOIN acc_mission_backbill_1 AS b1 ON a.quoteid = b1.missionId
LEFT JOIN acc_mission_backfile AS b2 ON a.quoteid = b2.Pkid
LEFT JOIN acc_mission_backtext AS b3 ON a.quoteid = b3.Pkid
LEFT JOIN acc_mission AS b4 ON b4.missionId = a.quoteid
WHERE
a.missionid = _missionId
AND IFNULL(CONCAT_WS('',b1.missionId,
b2.Pkid,
b3.Pkid,
b4.missionid
),'') != '' 
-- GROUP BY a.quoteid ,a.missionid
ORDER BY
a.sort ASC;

/*
-- 背景任务的背景（第二层）
SELECT
	'表单' as title,
	a.quoteid as node,
  a.quoteid as fnode,
	'bd' as type,
	a.sort,
  2 as layer,
  CAST(a.pageNo AS CHAR ) as pageNo
FROM
	acc_mission_back_information a
where a.missionid=_missionId and a.type in ('bk')
 union all
SELECT
	CAST(CONCAT('付',a.sort,': ',a.title) AS CHAR) AS title,
	a.quoteid as node,
  a.missionid as fnode,
	case when a.type='bk' then 'bd' else a.type end as type,
  a.sort,
  2 as layer,
 CAST(a.pageNo AS CHAR ) as pageNo
FROM
	acc_mission_back_information a 
where a.missionid in (SELECT a.quoteid FROM acc_mission_back_information a where a.missionid=_missionId and a.type in ('bk'));
*/
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `v5_copy_answer`
-- ----------------------------
DROP PROCEDURE IF EXISTS `v5_copy_answer`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `v5_copy_answer`(IN `expid_` varchar(60),IN `missionid_` varchar(60))
label:BEGIN
	#Routine body goes here...

  CASE
			WHEN IFNULL(expid_,'') = '' THEN
					SELECT NULL;
					LEAVE label; 
			WHEN IFNULL(missionid_,'') = '' THEN
					SELECT NULL;
					LEAVE label;
			ELSE
				SELECT 1 
				INTO @a
				FROM acc_1 AS a
				WHERE a.expID = expid_ AND a.missionId = missionId_;
	END CASE;


	IF FOUND_ROWS() >0 THEN
      SET @copy_stat = 
								CONCAT_WS('',"UPDATE acc_1 AS a ,acc_standard_1 AS b\n",
								"\t\tset\t ",Temp_Func("a.a?? = b.a?? ",1,100,NULL),"\n",
								"WHERE  a.expid = ",QUOTE(expid_),"\n",
								"\t\t  AND a.missionid =",QUOTE(missionid_),"\n"
								"\t\t  AND b.missionId =",QUOTE(missionid_),"\n"
								);
		ELSE
			SET @copy_stat = 
								CONCAT_WS('',"INSERT INTO acc_1 ",
								"(\n\t\t expid,missionid,\n",
								Temp_Func("a??",1,100,NULL),"\n)\n",
								"SELECT\n",
								"\t\t ",QUOTE(expid_),",",QUOTE(missionid_),",\n",
								"\t\t",Temp_Func("b.a??",1,100,NULL),"\n"
								"FROM acc_mission AS a\n",
								"INNER JOIN acc_standard_1 AS b ON a.missionId = b.missionId\n"
								"WHERE a.missionId =",QUOTE(missionid_)
								);
	END IF;

	PREPARE stmt_copy FROM @copy_stat;
	EXECUTE stmt_copy;
	
	SET @copy_stat = 
						CONCAT_WS('',"DELETE a.* \n",
						"FROM ",expid2b(expid_)," AS a\n",
						"WHERE a.expid = ",QUOTE(expid_),"\n",
						"\t\t AND a.missionid =",QUOTE(missionid_)
						);
	PREPARE stmt_copy FROM @copy_stat;
	EXECUTE stmt_copy;
	

	SET @copy_stat =CONCAT_WS("","INSERT INTO ",expid2b(expid_),"\n",
															"\t\t( expid,missionid,rowNo,\n",
															"\t\t ",Temp_Func("b??",1,50,NULL),"\n\t\t)\n",
															"SELECT ",QUOTE(expid_),",",QUOTE(missionid_),",a.rowno,\n",
															"\t\t\t",Temp_Func("a.b??",1,50,NULL),"\n",
															"FROM acc_standard_n AS a\n",
															"WHERE a.missionid = ",QUOTE(missionid_)
															);
	PREPARE stmt_copy FROM @copy_stat;
	EXECUTE stmt_copy;
	
-- 	SELECT  @copy_stat;LEAVE label;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `v5_expStuMission`
-- ----------------------------
DROP PROCEDURE IF EXISTS `v5_expStuMission`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `v5_expStuMission`(in studentNo VARCHAR(50),in classNo VARCHAR(50),in courseNo VARCHAR(50),in expId VARCHAR(50))
expStuMlab:BEGIN
-- 为流程添加实验用户及任务（处理为存储过程）
-- 1)判断用户是否存在
-- 2)不存在，则不处理
-- 3)存在，则添加实验用户及任务

/*
 CALL Audit_1('v5_expStuMission',CONCAT_WS(',',QUOTE(`studentNo `),QUOTE(`_id`),QUOTE(`expId `)),'ok');

*/

	SET @vCnt = NULL ,
			@stmt_v5 = CONCAT_WS('',"SELECT Count(*) into @vCnt\n","FROM exp_stu_mission AS a\n",
									"WHERE a.expId = ",QUOTE(expId)," AND a.stuNo =  ",QUOTE(studentNo)); 

	PREPARE stmt_v5 FROM @stmt_v5;
	EXECUTE stmt_v5 ;
	
  IF IFNULL(@vCnt,0) <> 0 then LEAVE expStuMlab; END IF;


	SET @stmt_v5 = CONCAT_WS('',"INSERT INTO exp_stu_mission(","expId,stuNo,classNo,courseNo,groupId,\n","overStatu,missionId,Vdate,missionLabel,mission_ask,\n","billId,billType,key_mission_Done,key_mission_Total,roleID,\n",
"sealNo,nRoleId,nSealNo,PKid,nodeSealId,nodeNo)\n",
    "SELECT ",CONCAT_WS(',',QUOTE(expId),QUOTE(studentNo),QUOTE(classNo),QUOTE(courseNo)),",'0' as groupId,
      '0' as overStatu,acc_mission.missionId,acc_mission.Vdate,acc_mission.missionLabel,acc_mission.mission_ask,
      mysq1_schema.bill_list.billId,mysq1_schema.bill_list.billType,0 as key_mission_Done,case when backkey.bCount is null then 0 else backkey.bCount end key_mission_Total,seal.roleID,
      seal.sealNo,seal.nRoleId,seal.nSealNo,seal.PKid,seal.actionNo,
      CONCAT_WS('.',exp_courses_node.node_No,exp_courses_node_content.typesort) as nodeNo
    FROM
      acc_mission
      INNER JOIN exp_courses_node_content ON acc_mission.missionId = exp_courses_node_content.missionid
      INNER JOIN exp_courses_node ON exp_courses_node_content.contentNo = exp_courses_node.contentNo
      left JOIN mysq1_schema.bill_list ON acc_mission.billId = mysq1_schema.bill_list.billId
      left JOIN (SELECT amb.missionId,count(*) bCount FROM acc_mission_back_information amb where amb.type='bk' group by amb.missionId) backkey ON backkey.missionId = acc_mission.missionId
      left JOIN (
        select seal1.missionId,seal1.PKid,
           case when seal05.roleID is null then seal1.roleID else seal05.roleID end as roleID,
           case when seal05.sealNo is null then seal1.sealNo else seal05.sealNo end as sealNo,
           case when seal05.nodeSealId is null THEN seal1.actionNo else seal05.nodeSealId end as actionNo,
           case when seal05.roleID is not null then seal1.roleID  when seal05.roleID is null and seal15.roleID is not null then seal15.roleID else seal2.roleID end as nRoleId,
           case when seal05.sealNo is not null then seal1.sealNo  when seal05.sealNo is null and seal15.sealNo is not null then seal15.sealNo else seal2.sealNo end as nSealNo
         from (select ams.missionId,min(ams.PKid) PKid,aes.roleID,1 as sealNo,ams.vstatu actionNo FROM acc_mission_seal ams left JOIN acc_enter_seal aes ON aes.sealID = ams.seal_id where ams.seal_no=1 GROUP BY ams.missionId) seal1
         LEFT JOIN (select ams.missionId,min(ams.PKid) PKid,aes.roleID,2 as sealNo FROM acc_mission_seal ams left JOIN acc_enter_seal aes ON aes.sealID = ams.seal_id where ams.seal_no=2 GROUP BY ams.missionId) seal2 on seal1.missionId=seal2.missionId
         LEFT JOIN (select aesa.missionId,aesa.PKid,aesa.roleID,0.5 as sealNo,aesa.nodeSealId FROM acc_mission_seal_assist aesa where aesa.sealNo=0.5 GROUP BY aesa.missionId) seal05 on seal05.missionId=seal1.missionId
         LEFT JOIN (select aesa.missionId,aesa.PKid,aesa.roleID,1.5 as sealNo,aesa.nodeSealId FROM acc_mission_seal_assist aesa where aesa.sealNo=1.5 GROUP BY aesa.missionId) seal15 on seal15.missionId=seal1.missionId
       ) seal  ON seal.missionId = acc_mission.missionId
    WHERE
     exp_courses_node.node_courseNo= ",QUOTE(courseNo));


-- SELECT @stmt_v5;LEAVE expStuMlab;

		PREPARE stmt_v5 FROM @stmt_v5;
		EXECUTE stmt_v5 ;


END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `v5_init4OptButtonLine`
-- ----------------------------
DROP PROCEDURE IF EXISTS `v5_init4OptButtonLine`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `v5_init4OptButtonLine`(in _missionId VARCHAR(50),in _expID VARCHAR(50),in _sealNo Integer,in _pageId Integer)
BEGIN
-- 用于初始化界面
-- 1、获取按钮状态
-- 2、获取划线信息
 
 SELECT
  exp_stu_mission.mission_ask,
  mysq1_schema.exp_difficulty.redo_size,
  mysq1_schema.exp_difficulty.max_score_size missionMaxScore,
  exp_experimentclass.classType,
  case when acc_1.log_count is null then 0 else acc_1.log_count end as number,
  case when acc_1.log_count is null then 0 else acc_1.log_count end as log_count,
  case when acc_1.score is null then 0 else acc_1.score end as  missionScore,
  case when acc_1.is_line is null then 0 else acc_1.is_line end as is_line,
  seals.shouldSeal,
  seals.overSeal,
  roleSeals.roleShouldSeal-roleSeals.roleOverSeal as unSealed,
  case when acc_mission.line_x1 is null then 0 else acc_mission.line_x1 end as line_x1,
  case when acc_mission.line_y1 is null then 0 else acc_mission.line_y1 end as line_y1,
  case when acc_mission.line_x2 is null then 0 else acc_mission.line_x2 end as line_x2,
  case when acc_mission.line_y2 is null then 0 else acc_mission.line_y2 end as line_y2,
  acc_mission.line_color,
  case when acc_mission.line_type is null then 0 else acc_mission.line_type end as line_type,
  case 
   when 
    (acc_mission.line_x1>0 or acc_mission.line_x1<0) and 
    (acc_mission.line_y1>0 or acc_mission.line_y1<0) and 
    (acc_mission.line_x2>0 or acc_mission.line_x2<0) and 
    (acc_mission.line_y2>0 or acc_mission.line_y2<0) and 
    acc_mission.missionId is not null and acc_mission.line_type>0
   then 1
   else 0
  end as ifLineS,
  case when acc_1.is_line is not NULL then 1 else 0 end as ifLineO,
  rpSealId.seal_id as rpSealId,
  exp_stu_mission.courseNo
 FROM
  exp_stu_mission
 INNER JOIN acc_mission on acc_mission.missionId=exp_stu_mission.missionId
 INNER JOIN exp_experimentclass ON exp_stu_mission.classNo = exp_experimentclass.classNo AND exp_stu_mission.courseNo = exp_experimentclass.courseNo
 INNER JOIN mysq1_schema.exp_difficulty ON exp_experimentclass.difficulty_level = mysq1_schema.exp_difficulty.difficulty_level
 LEFT JOIN acc_1 ON exp_stu_mission.expId = acc_1.expID AND exp_stu_mission.missionId = acc_1.missionId
 LEFT JOIN
 ( SELECT ssd.shouldSeal,osd.overSeal 
   from(
    -- 指定角色应该签章情况
    SELECT count(*) as shouldSeal
    FROM acc_mission_seal
    LEFT JOIN acc_enter_seal on acc_enter_seal.sealID=acc_mission_seal.seal_id
    where acc_mission_seal.missionId =_missionId and acc_mission_seal.seal_no=_sealNo and acc_mission_seal.pageId=_pageId and acc_enter_seal.seal_content not like '%操作%'
   ) ssd 
   LEFT JOIN
   (
     -- 指定角色已经签章
     SELECT count(*) as overSeal
     FROM acc_seal_1
     INNER JOIN acc_mission_seal ON acc_mission_seal.missionId = acc_seal_1.missionId AND acc_mission_seal.pageId = acc_seal_1.pageId 
       AND acc_mission_seal.seal_id = acc_seal_1.seal_Id 
     LEFT JOIN acc_enter_seal on acc_enter_seal.sealID=acc_seal_1.seal_Id
     where acc_seal_1.missionId =_missionId  and acc_seal_1.expID=_expID and acc_seal_1.pageId=_pageId and acc_mission_seal.seal_no=_sealNo and acc_enter_seal.seal_content not like '%操作%'
   ) osd on 1=1
  )seals on 1=1
 LEFT JOIN
 ( SELECT ssd.shouldSeal as roleShouldSeal,osd.overSeal as roleOverSeal
   from(
    -- 指定角色应该签章情况
    SELECT count(*) as shouldSeal
    FROM acc_mission_seal
    LEFT JOIN acc_enter_seal on acc_enter_seal.sealID=acc_mission_seal.seal_id
    where acc_mission_seal.missionId =_missionId and acc_mission_seal.seal_no=_sealNo and acc_enter_seal.seal_content not like '%操作%'
   ) ssd 
   LEFT JOIN
   (
     -- 指定角色已经签章
     SELECT count(*) as overSeal
     FROM acc_seal_1
     INNER JOIN acc_mission_seal ON acc_mission_seal.missionId = acc_seal_1.missionId 
       AND acc_mission_seal.seal_id = acc_seal_1.seal_Id 
     LEFT JOIN acc_enter_seal on acc_enter_seal.sealID=acc_seal_1.seal_Id
     where acc_seal_1.missionId =_missionId  and acc_seal_1.expID=_expID and acc_mission_seal.seal_no=_sealNo and acc_enter_seal.seal_content not like '%操作%'
   ) osd on 1=1
  )roleSeals on 1=1
  LEFT JOIN
  (SELECT  min(m.seal_id) as seal_id
   FROM acc_mission_seal m 
   where m.missionId=_missionId and m.seal_no=_sealNo and m.pageId=_pageId  and not EXISTS 
    (select s.expID from acc_seal_1  s where s.expID=_expID and s.missionId=m.missionId and s.pageId=m.pageId and s.seal_Id=m.seal_id)
   ) rpSealId on 1=1
 where exp_stu_mission.missionId=_missionId and exp_stu_mission.expId=_expID;
  -- and acc_1.missionId=_missionId and acc_1.expID=_expID;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `v5_init4Seals`
-- ----------------------------
DROP PROCEDURE IF EXISTS `v5_init4Seals`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `v5_init4Seals`(ajson varchar(2000))
init4Seals:BEGIN
-- 用于初始化界面
-- 1、获取签章信息
-- sealStat 0 不能签的，1 可以签 2 已签章 3 其他人签章
/*
start transaction;
CALL Audit_1('v5_init4Seals',CONCAT_WS(',',QUOTE(`ajson`)),'ok');
 COMMIT;
*/

	SET @init4Seals = CONCAT_WS('\n'
		,"SELECT CASE"
		,"WHEN  a.seal_id IS NOT NULL  THEN '2'"
		,"WHEN  c.seal_id IS NOT NULL  THEN '1'"
		,"ELSE '0' END AS sealStat"
		,	",d.sealID,d.roleID,c.seal_no ,"
		,CONCAT(json_extract(ajson,"$.seal_no")," as sealNo,")
		,"c.pageId,"
		,"d.seal_shape,d.seal_content,d.seal_content_arc,"
		,"d.seal_content_arc_font,d.seal_content_bottom,d.seal_content_bottom_font,"
		,"c.x AS seal_x,c.y AS seal_y,d.seal_w,d.seal_h,d.seal_font,d.seal_color"
		,"FROM acc_enter_role AS d0"
		,CONCAT_WS(' '
				,"INNER JOIN acc_enter_seal AS d ON d.roleID = d0.roleID\nLEFT JOIN acc_mission_seal AS c ON"
					,CONCAT_WS(' AND '
						, CONCAT('c.seal_no = ',JSON_EXTRACT(ajson,"$.seal_no"))
						, CONCAT('c.pageId = ',JSON_EXTRACT(ajson,"$.pageId"))
						,CONCAT('c.missionId = ',JSON_EXTRACT(ajson,"$.missionId"))
						,"c.seal_id = d.sealID"))
		,CONCAT_WS(' ',"LEFT JOIN acc_seal_1 AS a ON "
			,CONCAT_WS(' AND '
						, CONCAT('a.missionId = ',JSON_EXTRACT(ajson,"$.missionId"))
						, CONCAT('a.expId = ',JSON_EXTRACT(ajson,"$.expId"))
						,"c.seal_id = a.seal_Id AND c.pageId = a.pageId")
						)
		 ,CONCAT_WS('\n',"WHERE "
				,CONCAT_WS(" AND "
					,CONCAT("d0.roleID = " ,JSON_EXTRACT(ajson,"$.roleId"))
					,"d.seal_name NOT LIKE '%none%' AND d.seal_name NOT LIKE '%操作%' AND d.seal_content NOT LIKE '%操作%'")
					,"AND IFNULL(seal_color,'')!='black'")
	);
-- SELECT 	CAST(@init4Seals AS CHAR); LEAVE init4Seals;SELECT @init4Seals;
-- 	
EXECUTE immediate @init4Seals;
	


END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `v5_init4Seals_p`
-- ----------------------------
DROP PROCEDURE IF EXISTS `v5_init4Seals_p`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `v5_init4Seals_p`(in _missionId VARCHAR(50),in _expId VARCHAR(50),in _pageId Integer, in sealNo varchar(5))
init4Seals:BEGIN
/*
用于初始化界面
1、获取签章信息
 sealStat 0 不能签的，1 可以签 2 已签章 3 其他人签章
*//*
START TRANSACTION;
CALL Audit_1('v5_init4Seals_p',CONCAT_WS(',',QUOTE(`_missionId`),QUOTE(`_expId`),QUOTE(`_pageId`),QUOTE(`sealNo`)),'ok');
COMMIT; 
*/
  IF IFNULL(_pageId,0) = 0 THEN SET _pageId = 1 ;END IF ;
	SET @init4Seals = CONCAT("SELECT 	IF(e.missionId IS NOT NULL,IF(c.missionId IS NULL,'1','3'),'0') AS sealStat,d.sealID,b.roleID,a.seal_no,",`sealNo`," as sealNo,\n",
																		"d.seal_shape,d.seal_content,d.seal_content_arc,\n\t\t\n",
																		"d.seal_content_arc_font,d.seal_content_bottom,d.seal_content_bottom_font,\n\t\t",
																		"a.x AS seal_x,a.y AS seal_y,d.seal_w,d.seal_h,d.seal_font,d.seal_color\n",
																		"FROM	acc_mission_seal AS a \n",
																		"INNER JOIN acc_enter_seal AS b ON a.seal_id = b.sealID\n",
																		"INNER JOIN acc_enter_role AS d0 ON b.roleID = d0.roleID\n",
																		"INNER JOIN acc_enter_seal AS d ON d.roleID = d0.roleID\n",
																		"LEFT JOIN acc_mission_seal AS e ON d.sealID = e.seal_id AND e.missionId = ",QUOTE(_missionId)," AND a.seal_no = ",`sealNo`," AND e.pageId = ",QUOTE(_pageId),"\n",
																		"LEFT JOIN acc_seal_1 AS c ON c.missionId = e.missionId AND c.expID = ", QUOTE(_expId)," AND e.seal_id = c.seal_Id AND e.pageId = c.pageId \n",
																		"WHERE b.seal_name NOT LIKE '%none%' AND\n\t\t",
																		"a.seal_no = ",`sealNo`," AND a.pageId = ",QUOTE(_pageId)," AND  a.missionId = ",QUOTE(_missionId),"  AND\n\t\t",
																		"b.seal_name NOT LIKE '%操作%' AND b.seal_content NOT LIKE '%操作%'\n",
																		"GROUP BY d.roleID,d.sealID");

 -- SELECT 	CAST(@init4Seals AS CHAR);

	PREPARE stmt_init4Seals FROM @init4Seals;
	EXECUTE stmt_init4Seals;
	DEALLOCATE PREPARE stmt_init4Seals;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `v5_initMissionSealAssist`
-- ----------------------------
DROP PROCEDURE IF EXISTS `v5_initMissionSealAssist`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `v5_initMissionSealAssist`(in coursesNo VARCHAR(50),in fMng int,in gMng int)
BEGIN

 declare n_missionId VARCHAR(50); declare n_Vdate VARCHAR(50); declare n_missionLabel VARCHAR(200);
 declare n_mission_ask VARCHAR(500); declare n_billId VARCHAR(50); declare n_billType VARCHAR(50);
 declare n_bCount int; declare n_node_courseNo VARCHAR(50); declare n_nodeNo VARCHAR(50); declare monId VARCHAR(50);

 declare done int(10);
 declare taskCursor cursor for
		SELECT a.missionId, a.Vdate, a.missionLabel, a.mission_ask,d.billId, d.billType,
		IFNULL( e.bCount,0 ) AS bCount, c.node_courseNo, CONCAT_WS('.',c.node_No,b.typesort) AS nodeNo
		FROM qianxue_v5.acc_mission AS a
		INNER JOIN qianxue_v5.exp_courses_node_content AS b ON a.missionId = b.missionid
		INNER JOIN qianxue_v5.exp_courses_node AS c ON b.contentNo = c.contentNo
		LEFT JOIN mysq1_schema.bill_list AS d ON a.billId = d.billId
		LEFT JOIN ( SELECT Count(*) AS bCount, e.missionid FROM acc_mission_back_information AS e WHERE e.type = 'bk' GROUP BY e.missionid ) AS e ON e.missionId= a.missionId
		where c.node_courseNo=coursesNo;

 declare continue handler for not found set done=1;

/*
CALL Audit_1('v5_init4Seals',CONCAT_WS(',',QUOTE(`coursesNo`),QUOTE(`fMng`),QUOTE(`gMng`)),'ok');
*/
 
delete from acc_mission_seal_assist where acc_mission_seal_assist.courseNo=coursesNo;

-- 查询 猪脚 ？

SELECT a.roleID 
into  monId
FROM acc_enter_role AS a INNER JOIN acc_enter AS b ON a.enter = b.enter
WHERE b.courseID = coursesNo AND a.role REGEXP '出纳' LIMIT 0,1;

 open taskCursor;
 loop_label:LOOP
  fetch taskCursor into n_missionId,n_Vdate,n_missionLabel,n_mission_ask,n_billId,n_billType,n_bCount,n_node_courseNo,n_nodeNo;
  if done = 1 then 
   leave loop_label; 
  else 
    
    if fMng=1 then
     insert into acc_mission_seal_assist (missionId,vdate,missionLabel,mission_ask,billId,billType,key_mission_Total,courseNo,nodeNo,roleId,sealNo,nRoleId,nSealNo,PKid,nodeSealId)
     SELECT n_missionId,n_Vdate,n_missionLabel,n_mission_ask,n_billId,n_billType,n_bCount,n_node_courseNo,n_nodeNo,
      case when fRole.roleID is null then monId else fRole.roleID end roleID,
      (sealRoles.seal_no-0.5) as sealNo,aer.roleID as nRoleId,sealRoles.seal_no as nSealNo,sealRoles.PKid,'1' as actionNo 
      FROM 
     (SELECT missionId,seal_no,min(PKid) as PKid,roleID from (
                                                         select acc_mission_seal.missionId,acc_mission_seal.seal_no,acc_mission_seal.PKid,acc_enter_seal.roleID from acc_mission_seal 
                                                          LEFT JOIN acc_enter_seal ON acc_enter_seal.sealID = acc_mission_seal.seal_id
                                                         where acc_mission_seal.missionId=n_missionId
                                                        ) sealRole GROUP BY sealRole.missionId,sealRole.seal_no,sealRole.roleID
      ) sealRoles
      LEFT JOIN acc_enter_role aer on aer.roleID=sealRoles.roleID
      LEFT JOIN 
      (
        SELECT DISTINCT acc_mission_seal.missionId,acc_enter_seal.roleID,acc_enter_seal.sealID,acc_mission_seal.seal_no FROM acc_enter_seal INNER JOIN acc_mission_seal ON acc_enter_seal.sealID = acc_mission_seal.seal_id where acc_mission_seal.missionId='qianxue-13050611303025958' and acc_mission_seal.seal_no=1
         and  acc_enter_seal.roleID IN
          (SELECT aer.roleID FROM acc_enter_role aer
             INNER JOIN acc_enter ON aer.enter = acc_enter.enter
           where acc_enter.courseID=coursesNo and not (aer.role like '%银行%' or aer.role like '%国税%' or aer.role like '%地税%' or aer.role like '%工商%' or aer.role like '%证券%' or aer.role like '%海关%' or aer.role like '%保险%')
          )
       ) fRole on fRole.missionId=sealRoles.missionId
     where sealRoles.missionId=n_missionId and aer.role like '%财务经理%' order by sealRoles.seal_no;
    end if;
    
    if gMng=1 then
     insert into acc_mission_seal_assist (missionId,vdate,missionLabel,mission_ask,billId,billType,key_mission_Total,courseNo,nodeNo,roleId,sealNo,nRoleId,nSealNo,PKid,nodeSealId)
     SELECT n_missionId,n_Vdate,n_missionLabel,n_mission_ask,n_billId,n_billType,n_bCount,n_node_courseNo,n_nodeNo,
      case when fRole.roleID is null then monId else fRole.roleID end roleID,
      (sealRoles.seal_no-0.5) as sealNo,aer.roleID as nRoleId,sealRoles.seal_no as nSealNo,sealRoles.PKid,'2' as actionNo
      FROM 
      (SELECT missionId,seal_no,min(PKid) as PKid,roleID from (
                                                         select acc_mission_seal.missionId,acc_mission_seal.seal_no,acc_mission_seal.PKid,acc_enter_seal.roleID from acc_mission_seal 
                                                          LEFT JOIN acc_enter_seal ON acc_enter_seal.sealID = acc_mission_seal.seal_id
                                                         where acc_mission_seal.missionId=n_missionId
                                                        ) sealRole GROUP BY sealRole.missionId,sealRole.seal_no,sealRole.roleID
      ) sealRoles
      LEFT JOIN acc_enter_role aer on aer.roleID=sealRoles.roleID
      LEFT JOIN 
      (
        SELECT DISTINCT acc_mission_seal.missionId,acc_enter_seal.roleID,acc_enter_seal.sealID,acc_mission_seal.seal_no FROM acc_enter_seal INNER JOIN acc_mission_seal ON acc_enter_seal.sealID = acc_mission_seal.seal_id where acc_mission_seal.missionId='qianxue-13050611303025958' and acc_mission_seal.seal_no=1
         and  acc_enter_seal.roleID IN
          (SELECT aer.roleID FROM acc_enter_role aer
             INNER JOIN acc_enter ON aer.enter = acc_enter.enter
           where acc_enter.courseID=coursesNo and not (aer.role like '%银行%' or aer.role like '%国税%' or aer.role like '%地税%' or aer.role like '%工商%' or aer.role like '%证券%' or aer.role like '%海关%' or aer.role like '%保险%')
          )
       ) fRole on fRole.missionId=sealRoles.missionId
     where sealRoles.missionId=n_missionId and aer.role like '%总经理%' order by sealRoles.seal_no;
    end if;
    
    insert into acc_mission_seal_assist (missionId,vdate,missionLabel,mission_ask,billId,billType,key_mission_Total,courseNo,nodeNo,roleId,sealNo,nRoleId,nSealNo,PKid,nodeSealId)
    SELECT n_missionId,n_Vdate,n_missionLabel,n_mission_ask,n_billId,n_billType,n_bCount,n_node_courseNo,n_nodeNo,
       case when fRole.roleID is null then monId else fRole.roleID end roleID,
       (sealRoles.seal_no-0.5) as sealNo,aer.roleID as nRoleId,sealRoles.seal_no as nSealNo,sealRoles.PKid,
       case 
        when INSTR(aer.role,'银行') and acc_enter.enter_type='2' then '3' 
        when INSTR(aer.role,'银行') and acc_enter.enter_type='3' then '4' 
        when INSTR(aer.role,'国税') then '5' 
        when INSTR(aer.role,'地税') then '6' 
        when INSTR(aer.role,'工商') then '7' 
        when INSTR(aer.role,'证券') then '8' 
        when INSTR(aer.role,'海关') then '9' 
        when INSTR(aer.role,'保险') then '10'
        else '-1' 
       end  as actionNo
      FROM 
      
      (SELECT missionId,seal_no,min(PKid) as PKid,roleID from (
                                                         select acc_mission_seal.missionId,acc_mission_seal.seal_no,acc_mission_seal.PKid,acc_enter_seal.roleID from acc_mission_seal 
                                                          LEFT JOIN acc_enter_seal ON acc_enter_seal.sealID = acc_mission_seal.seal_id
                                                         where acc_mission_seal.missionId=n_missionId
                                                        ) sealRole GROUP BY sealRole.missionId,sealRole.seal_no,sealRole.roleID
      ) sealRoles
      LEFT JOIN acc_enter_role aer on aer.roleID=sealRoles.roleID
      LEFT JOIN acc_enter on acc_enter.enter=aer.enter
      LEFT JOIN 
      (
        SELECT DISTINCT acc_mission_seal.missionId,acc_enter_seal.roleID,acc_enter_seal.sealID,acc_mission_seal.seal_no FROM acc_enter_seal INNER JOIN acc_mission_seal ON acc_enter_seal.sealID = acc_mission_seal.seal_id where acc_mission_seal.missionId='qianxue-13050611303025958' and acc_mission_seal.seal_no=1
         and  acc_enter_seal.roleID IN
          (SELECT aer.roleID FROM acc_enter_role aer
             INNER JOIN acc_enter ON aer.enter = acc_enter.enter
           where acc_enter.courseID=coursesNo and not (aer.role like '%银行%' or aer.role like '%国税%' or aer.role like '%地税%' or aer.role like '%工商%' or aer.role like '%证券%' or aer.role like '%海关%' or aer.role like '%保险%')
          )
       ) fRole on fRole.missionId=sealRoles.missionId
     where sealRoles.missionId=n_missionId and (aer.role like '%银行%' or aer.role like '%国税%' or aer.role like '%地税%' or aer.role like '%工商%' or aer.role like '%证券%' or aer.role like '%海关%' or aer.role like '%保险%') order by sealRoles.seal_no;   
  end if;  
 end LOOP;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `v5_query_mission`
-- ----------------------------
DROP PROCEDURE IF EXISTS `v5_query_mission`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `v5_query_mission`(IN `expid_` varchar(60) ,in `type_` text,IN `keyword` longtext,in `page` int(4),in `num` int(6))
    READS SQL DATA
label:BEGIN

/*
 1054 1064 SQLSTATE 1139 - Got error 'empty (sub)expression' from regexp
 锁定课程 
*/

	DECLARE  old_type VARCHAR(60) DEFAULT 'no';

  DECLARE CONTINUE HANDLER FOR  SQLSTATE '23000', SQLSTATE	'42000'	, SQLSTATE	'42S22' , SQLSTATE	'HY000'-- ,SQLSTATE	'22007'
	BEGIN GET DIAGNOSTICS CONDITION 1 @`sqlstate` = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;SET  @`sqlstate` = JSON_OBJECT('sqlstate',@`sqlstate`,'errno',@errno,'text',@text);
				SET @`errsql` = @stmtbody3;
				SET @funcid = CONCAT_WS(' ','Error: ', ' v5_query_mission' ),
				@pp = CONCAT_WS(',',QUOTE(`expid_`),QUOTE(`type_`),QUOTE(`keyword`),`page` ,`num` );
				CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp,'SQL',@`errsql`,'err',@`sqlstate`));
	END;
/*start TRANSACTION;
				SET @`errsql` = @stmtbody3;
				SET @funcid = CONCAT_WS(' ',' v5_query_mission' ),
				@pp = CONCAT_WS(',',QUOTE(`expid_`),QUOTE(`type_`),QUOTE(`keyword`),`page` ,`num` );
				CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp));
COMMIT;

*/


	SET  @a = NULL,	@a = DATABASE();

	IF @a = 'qianxue_sjzh' THEN
		CALL  v5_query_mission_bk(`expid_` ,`type_`, `keyword`, `page` ,`num`);
		LEAVE label;
	END IF;

	set @stmtbody = NULL ,				@totalnum = 0,				@stmtbody1 = NULL ,				@stmtbody2 = NULL ,				@stmtbody3 = '' ;

	IF page <1 THEN 
			set @offset1 = 1;
		ELSE
			SET @offset1 =(page-1)* num  ;
	END IF;

	set @allmis = '^原(始凭证)?[[:space:]|.|,|。|，]+|^^原(始凭证)?$|^y[[:space:]|.|,|。|，]*|^y$',
			@stmtbody1= "
			SELECT
			a1.missionId,
			a1.expID,
			c1.missionLabel,
			c1.pageNo,

			IF(INSTR(@allmis,a1.missionid) ,'0',
			@allmis :=CONCAT_WS(',',QUOTE(IFNULL(a1.missionId,'')),@allmis)) AS missionids,
			@course := b4.node_courseNo AS `courseno`",
			@stmtbody2  = CONCAT("
				FROM 
				acc_1 AS a1
				LEFT JOIN ",expid2b(expid_)," AS a2 ON a1.missionId = a2.missionId
				INNER JOIN exp_experimentclassstudent AS b1 ON a1.expID = b1.expNo
				INNER JOIN exp_experimentclass AS b2 ON b1.classNo = b2.classNo
				INNER JOIN exp_experimentclass_course AS b21 ON b2.classNo = b21.classNo
				INNER JOIN mysq1_schema.exp_difficulty AS b3 ON b2.difficulty_level = b3.difficulty_level
				INNER JOIN exp_courses_node AS b4 ON b21.courseNo = b4.node_courseNo
				INNER JOIN exp_courses_node_content AS b5 ON b5.contentNo = b4.contentNo
				INNER JOIN acc_mission AS c1 ON b5.missionId = c1.missionId AND a1.missionId = b5.missionid
				INNER JOIN mysq1_schema.bill_list AS c2 ON c1.billId = c2.billId
				INNER JOIN mysq1_schema.bill_type AS c3 ON c2.billType = c3.billType
				WHERE a1.expID =", QUOTE(expid_));


	CASE 
		WHEN type_ ="yspz"  THEN
				SET type_ = CONCAT("c3.billtype NOT IN ('kjpz','kjbb','kjzb')");

		WHEN type_ ="kjzb1" THEN
				SET type_ =CONCAT("c3.billtype =", QUOTE('kjzb')," AND c2.billname NOT LIKE '%总账%'");
		WHEN type_ = "kjzb2" THEN
				SET type_ = CONCAT("c3.billtype =", QUOTE('kjzb')," AND c2.billname LIKE '%总账%'");
		ELSE 
				SET old_type = type_,
						type_ =CONCAT("c3.billtype = ", QUOTE(type_));
	END CASE;

	IF IFNULL(keyword ,'') != '' THEN 
		SET keyword = REPLACE(REPLACE(REPLACE(trim(keyword),' ','.*'),',','|'),'，','|');

		SET  @stmtbody3  = concat("
					and  case 
										when CAST(CONCAT_WS(CONCAT(b4.node_no,',',b5.typesort,c2.billname),c3.billTypeSay,c1.mission_ask,"			
											,	Temp_Func('c1.t??',1,8,NULL),") as char) REGEXP ",concat('\'',keyword,'\'')," then 1
										when CAST(CONCAT_WS('',",Temp_Func('c2.page_title??',1,8,NULL),") as char) REGEXP ",concat('\'',keyword,'\'') ," then 1	
										when CAST(CONCAT_WS('',",Temp_Func('a1.a??',1,100,null),") AS CHAR) REGEXP ",concat('\'',keyword,'\'')," then 1	
										when CAST(CONCAT_WS('',",Temp_Func('a2.b??',1,50,NULL),")AS CHAR) REGEXP ",concat('\'',keyword,'\'')," then 1
									else 0 
								end ");
	END IF;

	SET @stmtbody3 = CONCAT(" AND ",type_, @stmtbody3,"\nGROUP BY a1.expid,a1.missionid",
	    "\nORDER BY c3.billTypeSay,c2.billname,nabc(CONCAT(b4.node_no,'.',b5.typesort))");


	SET @allmis = '' ,

			@stmtbody = concat(@stmtbody1,@stmtbody2,@stmtbody3);


/*
  SELECT @stmtbody;
 LEAVE label;

*/
	EXECUTE immediate  @stmtbody ;

	
	SET @stmtbody1 = NULL,
			@stmtbody2 = NULL,
			@stmtbody3 = 
					CONCAT_WS('',	"SELECT ",
												"a.missionid,a.missionid AS quoteid,'bd',\n",
												"\t\tCAST(CONCAT(a1.billname,' - ',c1.node_No,'.',c2.typesort,' - ',a.missionLabel) AS CHAR) AS title,\n",
												"\t\t a.pageNo,@course AS courseno \n",
												"FROM exp_experimentclassstudent AS b\n",
												"INNER JOIN exp_experimentclass_course AS b1 ON b.classNo = b1.classNo\n",
												"INNER JOIN exp_courses_node AS c1 ON b1.courseNo = c1.node_courseNo\n",
												"INNER JOIN exp_courses_node_content AS c2 ON c2.contentNo = c1.contentNo\n",
												"LEFT JOIN  acc_mission AS a ON c2.missionid = a.missionId\n",
												"INNER JOIN mysq1_schema.bill_list AS a1 ON a.billId = a1.billId\n"
												"WHERE b.expNO =", QUOTE(expid_)," AND c1.contentNo IS NOT NULL AND INSTR(@allmis,c2.missionid) ");

	CASE old_type
			WHEN 'kjpz' THEN  -- 凭证
				label1:BEGIN
						SET @stmtbody3 = CONCAT_WS('', @stmtbody3,"\n",
											"\n\t\t\t UNION ALL \n",
											"SELECT a.missionid,a.quoteid,IF(a.type = 'bk','bd',a.type),\n",
											"CAST(CONCAT('附',a.sort,': ', \n",
											"IF(a.type IN ('bb','bk'), b1.billname,a.title) \n",
											") AS CHAR) AS title,a.pageNo,@course AS courseno \n",
											"FROM acc_mission_back_information AS a\n",
											"LEFT JOIN acc_mission AS e ON a.quoteid = e.missionId \n",
											"LEFT JOIN acc_mission_backbill_1 AS b ON a.missionid = b.referencedID AND a.quoteid = b.missionId \n",
											"LEFT JOIN `mysq1_schema`.bill_list AS b1 ON b.bill_id = b1.billid OR e.billId = b1.billId \n",
											"WHERE INSTR(@allmis,a.missionid)"
									);
				END label1;
			ELSE 
						SET @stmtbody3 = @stmtbody3;
	END CASE ;

	EXECUTE immediate  @stmtbody3 ;


END label
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `v5_query_mission_bk`
-- ----------------------------
DROP PROCEDURE IF EXISTS `v5_query_mission_bk`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `v5_query_mission_bk`(IN `expid_` varchar(60) ,in `type_` text,IN `keyword` longtext,in `page` int(4),in `num` int(6))
    READS SQL DATA
label:BEGIN

	DECLARE  old_type VARCHAR(10) DEFAULT 'no';
/*
START TRANSACTION;
CALL Audit_1('v5_query_mission_bk',CONCAT_WS(',',QUOTE(`expid_`),QUOTE(`type_`),QUOTE(`keyword`),`page` ,`num` ),'ok');	
commit;LEAVE label;
*/
	set 				
				
				@qbkbody = NULL ,
				@totalnum = 0,
				@qbkbody1 = NULL ,
				@qbkbody2 = NULL ,
				@qbkbody3 = '' ;

	IF page <1 THEN 
			set page = 1;
		ELSE
			SET page =(page-1)* num  ;
	END IF;

	set @allmis = '^原(始凭证)?[[:space:]|.|,|。|，]+|^^原(始凭证)?$|^y[[:space:]|.|,|。|，]*|^y$',
			@qbkbody1= "
SELECT
@allmis := NULL,
a.node_courseNo,
c.missionId,
NULL AS expID,
CONCAT_WS('  ',CONCAT(IF(IFNULL(c1.a4,'')='','记',c1.a4),'-',c1.a5),CONCAT_WS('-',c1.a1,c1.a2,c1.a3),c.missionLabel) AS missionLabel,
c.pageNo,
c.billId,
NULL AS `courseno` ",
			@qbkbody2  = CONCAT_WS('',
"\nFROM qianxue_sjzh.exp_courses_node AS a
INNER JOIN qianxue_sjzh.exp_courses_node_content AS b ON b.contentNo = a.contentNo
INNER JOIN qianxue_sjzh.acc_mission AS c ON b.missionid = c.missionId
LEFT JOIN qianxue_sjzh.acc_standard_1 AS c1 ON c1.missionId = c.missionId\n",
	IF(IFNULL(keyword ,'') != '',CONCAT_WS('',
"LEFT JOIN qianxue_sjzh.acc_standard_n AS c2 ON c2.missionId = c.missionId\n",
"INNER JOIN mysq1_schema.bill_list AS d ON c.billId = d.billId\n",
"INNER JOIN mysq1_schema.bill_type AS d1 ON d.billType = d1.billType\n"),NULL),
"WHERE a.node_courseNo = 'sj-2' AND c.billId LIKE 'kjpz_jzpz00_ty%'"
);


	CASE 
		WHEN type_ ="yspz"  THEN
				SET type_ = CONCAT("c3.billtype NOT IN ('kjpz','kjbb','kjzb')");

		WHEN type_ ="kjzb1" THEN
				SET type_ =CONCAT("c3.billtype =", QUOTE('kjzb')," AND c2.billname NOT LIKE '%总账%'");
		WHEN type_ = "kjzb2" THEN
				SET type_ = CONCAT("c3.billtype =", QUOTE('kjzb')," AND c2.billname LIKE '%总账%'");
		ELSE 
				SET old_type = type_,
						type_ = NULL;

	END CASE;

	IF IFNULL(keyword ,'') != '' THEN 
		SET  @qbkbody3  = concat("\nAND  case","\n", 
										"when CAST(CONCAT_WS(CONCAT(a.node_no,',',b.typesort,d.billname),d1.billTypeSay,c.mission_ask,","\n\t\t", 		
											Temp_Func('c.t??',1,8,NULL),") as char) REGEXP ",QUOTE(keyword)," then 1","\n\t",
										"when CAST(CONCAT_WS('',",Temp_Func('d.page_title??',1,8,NULL),") as char) REGEXP ",concat('\'',keyword,'\'') ," then 1",	"\n\t",
										"when CAST(CONCAT_WS('',",Temp_Func('c1.a??',1,100,null),") AS CHAR) REGEXP ",concat('\'',keyword,'\'')," then 1	","\n\t",
										"when CAST(CONCAT_WS('',",Temp_Func('c2.b??',1,50,NULL),")AS CHAR) REGEXP ",concat('\'',keyword,'\'')," then 1","\n\t",
									"ELSE 0 \nEND ");
	END IF;

	SET @qbkbody3 = C(CONCAT(CONCAT_WS(" AND ",type_ ), @qbkbody3,"\nGROUP BY c.missionid",
	    "\nORDER BY c1.a2+0,c1.a3+0,c1.a4,c1.a5 +0 ",
			"\nLIMIT ",`page` ,',',IF(IFNULL(`num`,'')= '',10,`num`)));


	SET @allmis = NULL,

			@qbkbody = CONCAT_WS('','SELECT a.*,@allmis := CONCAT_WS("",QUOTE(a.missionId),@allmis) AS missionids\nFROM(',
										@qbkbody1,@qbkbody2,@qbkbody3,'\n) AS a' );
/*
 SELECT  @qbkbody;
LEAVE label;
 */

	PREPARE stmt from  @qbkbody ;
	EXECUTE stmt ;
-- CONCAT(a1.billname,' - ',c1.node_No,'.',c2.typesort,' - ',a.missionLabel
	SET @qbkbody1 = NULL,
			@qbkbody2 = NULL,
			@qbkbody3 = 
					CONCAT_WS('',	"
SELECT a.missionid,a.missionid AS quoteid,'bd',
		CAST('记账凭证' AS CHAR) AS title,
		 a.pageNo,@course AS courseno 
FROM 
exp_courses_node AS c1 
INNER JOIN exp_courses_node_content AS c2 ON c2.contentNo = c1.contentNo
LEFT JOIN  acc_mission AS a ON c2.missionid = a.missionId
INNER JOIN mysq1_schema.bill_list AS a1 ON a.billId = a1.billId
WHERE c1.contentNo IS NOT NULL AND INSTR(@allmis,c2.missionid) 
");

	CASE old_type
			WHEN 'kjpz' THEN  -- 凭证
				label1:BEGIN
						SET @qbkbody3 = CONCAT_WS('', @qbkbody3,"\n",
											"\n\t\t\t UNION ALL \n",
											"SELECT a.missionid,a.quoteid,IF(a.type = 'bk','bd',a.type),\n",
											"CAST(CONCAT('附',a.sort,': ', \n",
											"IF(a.type IN ('bb','bk'), b1.billname,a.title) \n",
											") AS CHAR) AS title,a.pageNo,@course AS courseno \n",
											"FROM acc_mission_back_information AS a\n",
											"LEFT JOIN acc_mission AS e ON a.quoteid = e.missionId \n",
											"LEFT JOIN acc_mission_backbill_1 AS b ON a.missionid = b.referencedID AND a.quoteid = b.missionId \n",
											"LEFT JOIN `mysq1_schema`.bill_list AS b1 ON b.bill_id = b1.billid OR e.billId = b1.billId \n",
											"WHERE INSTR(@allmis,a.missionid)"
									);
				END label1;
			ELSE 
						SET @qbkbody3 = @qbkbody3;
	END CASE ;

-- 	SET @qbkbody3 = CONCAT_WS("\n","CREATE TABLE temp_query_mission_2 AS",@qbkbody3); 	
/*			SELECT @qbkbody3 ; 
	LEAVE label;
*/

	PREPARE stmt from  @qbkbody3 ;
	EXECUTE stmt ;
  DEALLOCATE PREPARE stmt;
/*SELECT
a.missionid,
a.quoteid,
a.bd,
a.title,
a.pageNo,
a.courseno
FROM
temp_query_mission_2 AS a;


	SELECT  a.* FROM temp_query_mission_2 AS a ;
*/
END label
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `v5_retreat_action`
-- ----------------------------
DROP PROCEDURE IF EXISTS `v5_retreat_action`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `v5_retreat_action`(in n_expID VARCHAR(50),in n_missionId VARCHAR(50),in isSelf int)
BEGIN
-- 流程回退
-- 0)已经及时的流程，直接返回
-- 1)删除该角色的签章
-- 2)获取回退的当前角色和下一角色
-- 3)修改流程信息
 
 declare _PKid VARCHAR(50);
 declare _sealNo VARCHAR(3);
 declare _roleID VARCHAR(50);
 declare _actionNo VARCHAR(2);
 declare _nRoleId VARCHAR(50);
 declare _nSealNo VARCHAR(3);
 declare xSealNo FLOAT;
 declare xnSealNo FLOAT;
 declare xRoleId VARCHAR(50);


 -- 删除该角色的签章
  -- 1) 获取当前角色No和角色ID    
  if isSelf=0 THEN -- 半自动
    select case when exp_stu_mission.SealNo is null then -1 else exp_stu_mission.SealNo end,exp_stu_mission.nRoleId INTO xSealNo,xRoleId from exp_stu_mission where exp_stu_mission.expId=n_expID  and exp_stu_mission.missionId=n_missionId ;     
  ELSE -- 手动
    select case when exp_stu_mission.SealNo is null then -1 else exp_stu_mission.SealNo end,exp_stu_mission.roleId INTO xSealNo,xRoleId from exp_stu_mission where exp_stu_mission.expId=n_expID  and exp_stu_mission.missionId=n_missionId ;
  end if; 

  -- 删除当前角色签章
  delete from acc_seal_1 where acc_seal_1.expID=n_expID and acc_seal_1.missionId=n_missionId and acc_seal_1.seal_Id in 
   (select acc_enter_seal.sealID from acc_enter_seal where acc_enter_seal.roleID=xRoleId);
  -- 2)如果当前角色No为-1，表明当前流程已经结束
  if xSealNo>1 THEN
    if isSelf=0 THEN -- 半自动
     select 
       case when seal05.roleID is null then seal1.PKid else seal05.PKid end as PKid,
       case when seal05.roleID is null then seal1.roleID else seal05.roleID end as roleID,
       case when seal05.roleID is null then seal1.sealNo else seal05.sealNo end as sealNo,
       case when seal05.roleID is null THEN seal1.nodeSealId else seal05.actionNo end as actionNo,
       xRoleId as nRoleId,
       xSealNo as nSealNo 
      into _PKid,_roleID,_sealNo,_actionNo,_nRoleId,_nSealNo 
     from 
     (
       select min(ams.PKid) PKid,aes.roleID,ams.seal_no as sealNo,ams.vstatu actionNo FROM acc_mission_seal ams left JOIN 
        (
         select acc_enter_seal.* from acc_enter_seal where not EXISTS 
          ( select * FROM acc_mission_seal_assist aesat where aesat.missionId=n_missionId and aesat.nRoleId=acc_enter_seal.roleID)
        ) aes ON aes.sealID = ams.seal_id where ams.seal_no=(xSealNo-0.5) and ams.missionId=n_missionId
     ) seal05
     LEFT JOIN
     (
      select aesa.missionId,aesa.PKid,aesa.roleID,aesa.sealNo as sealNo,aesa.nodeSealId FROM acc_mission_seal_assist aesa where aesa.sealNo=(xSealNo-1) and aesa.missionId=n_missionId 
     ) seal1 on 1=1;
    ELSE
     select 
       seal1.PKid,
       case when seal05.roleID is null then seal1.roleID else seal05.roleID end as roleID,
       case when seal05.sealNo is null then seal1.sealNo else seal05.sealNo end as sealNo,       
       case when seal05.nodeSealId is null THEN seal1.actionNo else seal05.nodeSealId end as actionNo,
       xRoleId as nRoleId,
       xSealNo as nSealNo 
      into _PKid,_roleID,_sealNo,_actionNo,_nRoleId,_nSealNo 
     from 
     (
       select min(ams.PKid) PKid,aes.roleID,ams.seal_no as sealNo,ams.vstatu actionNo FROM acc_mission_seal ams left JOIN acc_enter_seal aes ON aes.sealID = ams.seal_id where ams.seal_no=(xSealNo-1) and ams.missionId=n_missionId
     ) seal1
     LEFT JOIN
     (
      select aesa.missionId,aesa.PKid,aesa.roleID,aesa.sealNo as sealNo,aesa.nodeSealId FROM acc_mission_seal_assist aesa where aesa.sealNo=(xSealNo-0.5) and aesa.missionId=n_missionId 
     ) seal05 on 1=1;
    end if;
    -- 修改数据
    update exp_stu_mission set exp_stu_mission.PKid=_PKid,exp_stu_mission.roleID=_roleID,exp_stu_mission.sealNo=_sealNo,exp_stu_mission.nodeSealId=_actionNo,exp_stu_mission.nRoleId=_nRoleId,exp_stu_mission.nSealNo=_nSealNo
     where exp_stu_mission.expId=n_expID and exp_stu_mission.missionId=n_missionId;
    -- 删除上一角色签章
    delete from acc_seal_1 where acc_seal_1.expID=n_expID and acc_seal_1.missionId=n_missionId and acc_seal_1.seal_Id in 
    (select acc_enter_seal.sealID from acc_enter_seal where acc_enter_seal.roleID=_roleID or acc_enter_seal.roleID=_nRoleId);
  end if;
  commit;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `v5_retreat_check`
-- ----------------------------
DROP PROCEDURE IF EXISTS `v5_retreat_check`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `v5_retreat_check`(IN `expId_` varchar(60),IN `missionId_` varchar(60))
BEGIN
	#Routine body goes here...
		SELECT
		CASE 
			WHEN a.score IS NULL THEN '1'
			WHEN a.score<d.pass_score_size*IFNULL(ROUND(k.sealNo),0)/COUNT(DISTINCT g.seal_no,g.pageId,g.seal_id)  THEN '0'
		ELSE '1'
		END AS isOK,
		CASE 
			WHEN a.score IS NULL THEN CONCAT_WS('','这是您的',TRIM(f.billname),'请收好!')
			WHEN IFNULL(a.score,0)<d.pass_score_size*IFNULL(ROUND(k.sealNo),0)/COUNT(DISTINCT g.seal_no,g.pageId,g.seal_id) THEN 
		CONCAT_WS('',TRIM(f.billname),'填写有错误!,请重新填写!')
		ELSE concat_ws('',TRIM(f.billname),'已办理!') 
		END AS results
		INTO @isok , @results
		FROM
		acc_1 AS a
		INNER JOIN exp_experimentclassstudent AS b ON a.expID = b.expNo
		INNER JOIN exp_experimentclass AS c ON b.classNo = c.classNo
		INNER JOIN mysq1_schema.exp_difficulty AS d ON c.difficulty_level = d.difficulty_level
		INNER JOIN acc_mission AS e ON a.missionId = e.missionId
		INNER JOIN mysq1_schema.bill_list AS f ON e.billId = f.billId
		LEFT JOIN acc_mission_seal AS g ON e.missionId = g.missionId
		INNER JOIN exp_stu_mission AS k ON a.expID = k.expId AND a.missionId = k.missionId
		WHERE a.expid = expid_ AND a.missionid =missionId_
		GROUP BY
		a.expID,
		a.missionId;

		IF FOUND_ROWS() = 0 THEN
				SET 
				@isok  = '1' ,
				@results = '已办理!';
		END IF;

		SELECT expid_ AS expid, missionid_ AS missionid , @isok AS isok, @results as results;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `ware_insert`
-- ----------------------------
DROP PROCEDURE IF EXISTS `ware_insert`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `ware_insert`(IN `s` varchar(30),IN `fp` tinytext,IN `sT` varchar(1))
wil:BEGIN
	#Routine body goes here...
/* 
'qianxue_cn',"E:\\eclipseWorkspace\\qianxue_v3\\WebContent"
*/

	DECLARE i INT(5) DEFAULT 0;

IF IFNULL(st,0) = 0 OR st =1 THEN   
	SET		@s = NULL,
				@s = preg_capture('/(?<=_)\\w+/',s),
				@s = IF(IFNULL(@s,'') ='',s,@s),
				@stmt1 = CONCAT_WS('',"DROP  TABLE IF EXISTS `ware_",@s,"`");
	
	PREPARE stmt1 FROM @stmt1;
	EXECUTE stmt1 ;
 
	SET	@rid = 0,
			@stmt1 = CONCAT_WS('',"CREATE  TABLE `ware_",@s,"`\n",
														"AS\n",
														"SELECT\n",
														"@rid := @rid+1 AS id,\n",
														"LOAD_FILE(CONCAT(",QUOTE(CONCAT(`fp`,'\\')),",a.fileID)) AS dblob,\n",
														"@a := preg_capture(",QUOTE("/(?<=\\/)[\\w.]+$/"),",a.fileID) AS tmp1,\n",
														"@a := json_add('{}','fName',@a) AS tmp2,\n",
														"@a := json_add(@a,'contId',b.contentNo)AS tmp3,\n",
														"@a := json_add(@a,'title',a.title)AS tmp4,\n",
														"@a := json_add(@a,'Mission_ID',a.unique_id) AS tmp5,\n",
														"@a := json_add(@a,'sort',IFNULL(a.sort,'0')) AS json,\n",
														"CONCAT_WS(',',QUOTE('1'),QUOTE(@a)) AS summary\n",
														"FROM `",s,"`.exp_courseware_cells AS a\n",
														"LEFT JOIN `",s,"`.exp_courses_node_content AS b ON a.unique_id = b.missionid\n",
														"WHERE a.edit0_file1_url2 = 1\n");
-- SELECT CAST(@stmt1 AS CHAR) ; LEAVE wil;
	PREPARE stmt1 FROM @stmt1;
	EXECUTE stmt1 ;
END IF;

IF IFNULL(st,0) = 0 OR st =2 THEN
	r1:REPEAT

		SET	i = i+1,
				@stmt1 = CONCAT_WS('',"SELECT a.summary,a.dblob\n",
															"INTO @summary,@dbLob\n",
															"FROM `ware_",@s,"` AS a\n",
															"WHERE a.id =",i);

		PREPARE stmt1 FROM @stmt1;
		EXECUTE stmt1 ;

		SET @stmt1 = CONCAT_WS('',"CALL `",s,"`.manu_ware","(",@summary,",@dblob)");

		PREPARE stmt1 FROM @stmt1;
		EXECUTE stmt1 ;
	 

	 UNTIL i = @rid

	END  REPEAT r1;
END if;
  DEALLOCATE PREPARE stmt1 ;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `_f`
-- ----------------------------
DROP FUNCTION IF EXISTS `_f`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `_f`(`p` LONGBLOB,`r` text) RETURNS longblob
    DETERMINISTIC
BEGIN
	DECLARE `rs`,`ts`,		`jrs`,	`抓拍`,`trs`, env  LONGBLOB DEFAULT NULL;

	DECLARE `arr`,调试 TEXT DEFAULT NULL;
	DECLARE 次数 int(3) DEFAULT 0;

	DECLARE callf  CONDITION FOR 666;

	DECLARE CONTINUE HANDLER FOR callf
	BEGIN
	DECLARE fn TINYTEXT DEFAULT NULL;
	GET DIAGNOSTICS CONDITION 1 fn = MESSAGE_TEXT;

								set trs  = IF(fn = 'f_else',f_else(JSON_ARRAY(p,rs)),f_react(JSON_ARRAY(p,rs)));

								CASE WHEN  json_valid(trs) && JSON_EXTRACT(trs,'$.RETURNED_SQLSTATE') is NOT NULL || JSON_EXISTS(trs,'$.tiaoShi') THEN 
										SET 调试 = JSON_value(trs,'$.tiaoShi');

													SET @RETURNED_SQLSTATE = CONCAT('f_else',json_value(trs,'$.RETURNED_SQLSTATE')),
															@MYSQL_ERRNO =  json_value(trs,'$.MYSQL_ERRNO'),
															@MESSAGE_TEXT = json_value(trs,'$.MESSAGE_TEXT');

													RETURN _s(json_array(@MYSQL_ERRNO,@MESSAGE_TEXT));
											WHEN   json_valid(trs) && JSON_EXISTS(trs, '$.p') THEN

												 SET p = IF(JSON_EXISTS(trs, '$.p'),json_value(trs,'$.p'),trs),
														 rs = CAST(IF(JSON_EXISTS(trs, '$.rs'),json_value(trs,'$.rs'),rs) AS CHAR);

									ELSE  

												SET p = trs, rs ='["f_else","未处理"]';
												
								END  case;	

							

	END;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '22001',SQLSTATE '23000',		SQLSTATE '42000',		SQLSTATE '42S22',		SQLSTATE 'HY000',SQLSTATE	'22007'

		bl : BEGIN
			GET DIAGNOSTICS CONDITION 1 @`sqlstate` = RETURNED_SQLSTATE,
			@errno = MYSQL_ERRNO,
			@TEXT = MESSAGE_TEXT;
	
		SET @`sqlstate` = JSON_OBJECT( 'sqlstate', @`sqlstate`, 'errno', @errno, 'text', @TEXT );
		RETURN CONCAT_WS( '\n'
		,CASE WHEN 调试 IS NULL THEN CONCAT(@errno,',',@TEXT)
		      else 调试 END
		,CONCAT(@RETURNED_SQLSTATE, @TEXT)
		,CONCAT(@`sqlstate`)
);
END;

	多个动作:WHILE  次数=0  DO
	SET 次数 = 1;
	CASE 
	WHEN IFNULL(p,'')='' || p = 'null' THEN
			SET p = NULL; 
	WHEN IFNULL(r,'')='' THEN 
		SET p = null;	
	WHEN  (not json_valid(r)) && IFNULL(R,'')!=''  THEN 
		SET p = REGEXP_substr(p,r);	
	WHEN json_valid(p) && JSON_DEPTH(p)>1 && JSON_EXISTS(p, '$.p')THEN
	

			  SET     env =   CAST(JSON_value(p,'$.env') AS CHAR); 
				SET p  = json_value(p,'$.p'),
						次数=0;

		ITERATE 多个动作;
	WHEN not json_valid(r) THEN

		 SET p = CONCAT('[',p,']'),次数=0;
		ITERATE 多个动作;
	WHEN json_length(r)>0 && p IS NOT NULL THEN

       IF  JSON_DEPTH(r)<3 || r REGEXP '^\\s*\\[\\s*[^\\[]'THEN SET r = CONCAT('[',r,']') ; END IF;


			BEGIN  
			DECLARE 次数1 int(3) DEFAULT 0;

			label: LOOP

				IF json_length(`r`)<1 || p IS NULL || JSON_DEPTH(r)<3 THEN 				LEAVE label; 			END IF; 

				SET  @数组_自用 = JSON_QUERY(`r`,'$[0]'),r = JSON_REMOVE(`r`,'$[0]');

				label2: LOOP    
				
			
				SET 次数1 = 次数1+1;

							IF JSON_VALID(@数组_自用) && json_length(@数组_自用)<1 || p IS NULL THEN	LEAVE label2; 			END IF; 

							SET		@自用表达式_rp = json_value(@数组_自用,'$[0]');


							CASE 
								WHEN  p = 'null' THEN RETURN null;
								WHEN @自用表达式_rp REGEXP '^R3$' THEN

											SET @数组_自用 =  JSON_REMOVE(@数组_自用,'$[0]');

								WHEN @自用表达式_rp REGEXP '^\\s*CALL变量\\s*$' &&  JSON_LENGTH(@数组_自用)>1  THEN

											SET @自用表替换_rp = json_value(@数组_自用,'$[1]');
											SET @自用表达式_rp  := JSON_VALUE(ENV, CONCAT('$.',@自用表替换_rp)),
													@自用表达式_rp = e(@自用表达式_rp);
											
											SET	 @数组_自用 =  JSON_REMOVE(@数组_自用,'$[0]','$[0]');


								WHEN @自用表达式_rp REGEXP '^\\s*f_react' &&  JSON_LENGTH(@数组_自用)>1  THEN
											SET @自用表替换_rp = json_value(@数组_自用,'$[1]');

											SET rs =  JSON_MERGE(JSON_ARRAY('来自','react'),JSON_REMOVE(@数组_自用,'$[0]')) ;



											SET		p= f(p,rs) ,@数组_自用 = '[]'; 

											ITERATE label;
											
								WHEN @自用表达式_rp REGEXP '^\\s*(?:UPPER|LOWER)' &&  JSON_LENGTH(@数组_自用)>1  THEN

											SET @自用表替换_rp = json_value(@数组_自用,'$[1]');

											SET rs = JSON_ARRAY('1','react',@自用表替换_rp,
											CONCAT('(?#',TRIM(@自用表达式_rp),')'
											, regEXP_substr(@自用表替换_rp,'\\\\K\\K.+$')),'\\1');

											SET @auusd8dsuusd8ds := _s(json_array(666,'f_react'));

											SET		@数组_自用 =  JSON_REMOVE(@数组_自用,'$[0]','$[0]');

											
								WHEN @自用表达式_rp = '抓取' &&  JSON_LENGTH(@数组_自用)>1  THEN

											SET @自用表替换_rp = JSON_EXTRACT(@数组_自用,'$[1]');

											SET @自用表替换_rp = IF(JSON_DEPTH(@自用表替换_rp) =1 ,CONCAT('[',@自用表替换_rp,']'),@自用表替换_rp);

											SET rs = REGEXP_replace(@自用表替换_rp,'^\\s*\\[\\s*"','["","","(?#抓取)') ;

											SET @auusd8dsuusd8ds := _s(json_array(666,'f_else'));
-- return p;
											SET		@数组_自用 =  JSON_REMOVE(@数组_自用,'$[0]','$[0]');


								WHEN @自用表达式_rp REGEXP '^变数组$'    THEN

											SET p = CONCAT_WS('\n','[', 
															REGEXP_replace(
																	REGEXP_replace(p,'^\\s+|\\s+$',''),
																				'(?<!\\\\)""','",\n"')
															,']');

											
											SET		@数组_自用 =  JSON_REMOVE(@数组_自用,'$[0]');


								WHEN @自用表达式_rp REGEXP '^\\s*删除\\s*'  &&  JSON_LENGTH(@数组_自用)>1   THEN
											SET @自用表替换_rp = json_value(@数组_自用,'$[1]');

											SET @自用表达式_rp = e(CONCAT('del ' ,json_QUOTE(@自用表替换_rp)));
											
											SET		@数组_自用 =  JSON_REMOVE(@数组_自用,'$[0]','$[0]');


								WHEN @自用表达式_rp REGEXP '^\\s*2?SELECT\\s*'  &&  JSON_LENGTH(@数组_自用)>1   THEN
											SET @自用表替换_rp = json_value(@数组_自用,'$[1]');
											
											SET p = CONCAT('\n','SELECT' ,JSON_QUOTE(p),'INTO DUMPFILE' ,QUOTE(@自用表替换_rp));
											
											SET		@数组_自用 =  JSON_REMOVE(@数组_自用,'$[0]','$[0]');

								ELSE 
										CASE 
												WHEN @自用表达式_rp REGEXP '\\Q(?#\\E(?:调试|debug)'   THEN
												
														RETURN CONCAT_WS('\n\n',REGEXP_substr(p,@自用表达式_rp),QUOTE(@自用表达式_rp));

												WHEN @自用表达式_rp REGEXP '\\Q(?#\\E(?:抓取|substr|grep)' || mod(JSON_LENGTH(@数组_自用),2)>0   THEN
														SET  @MOD_自用 =1;
												ELSE
														SET  @MOD_自用 =0;
										END CASE;

										SET 	@自用表替换_rp = IF( @MOD_自用 ,NULL,json_value(@数组_自用,'$[1]'));


										SET		@数组_自用 = IF(@自用表替换_rp IS NULL ,JSON_REMOVE(@数组_自用,'$[0]'),JSON_REMOVE(@数组_自用,'$[0]','$[0]'));
								 


										SET p = CASE	WHEN @自用表替换_rp IS NULL  THEN 	
																REGEXP_substr(p,@自用表达式_rp)
													ELSE 
															 REGEXP_replace(p,@自用表达式_rp,@自用表替换_rp) 
													END ;
												
							END CASE;




				END LOOP label2;


			END LOOP label;END;
	

	ELSE
		 SET p = p;
	END CASE;
	END while 多个动作;


	RETURN IF(p = 'null' || p=''   ,null, p);
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `_j`
-- ----------------------------
DROP FUNCTION IF EXISTS `_j`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `_j`(p LONGBLOB) RETURNS longblob
    DETERMINISTIC
BEGIN
	DECLARE  k blob DEFAULT  REGEXP_substr(p,'^\\s*@?\\K[^\\.\\s,]+');
	DECLARE  v longblob DEFAULT  REGEXP_substr(p,'[\\s\\.,]\\K[^\\.,\\s]+(?=\\s*$)');
-- RETURN CONCAT_WS('____',k,v);
	RETURN 
					CASE	WHEN  IFNULL(p,'') = ''  THEN NULL
								WHEN  IFNULL(k,'') = ''  THEN p
								WHEN  k = 'env'  THEN JSON_EXTRACT(@env, CONCAT_ws('.','$',v))
						ELSE p
					END ;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `_r`
-- ----------------------------
DROP FUNCTION IF EXISTS `_r`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `_r`(`r` text) RETURNS text CHARSET utf8mb3
    NO SQL
BEGIN
	DECLARE
		次数 int(5) DEFAULT 1;

	set @r3自用 =  NULL;
	多个动作:WHILE  次数>0  DO

			SET 次数 = 0;
			CASE
					WHEN r IS NULL THEN RETURN NULL;
					
					WHEN  json_valid(r) && JSON_DEPTH(r)=2 && r REGEXP'^\\s*\\[' || r REGEXP '^\\w+(?:,\\w+)*$' THEN
						SET  r = _f(r,JSON_ARRAY(
						'"\\s*,\\s*"','|',
						'^\\s*(?:\\[")?|(?:"\\s*\\])?\\s*$',''
						));
					WHEN  r REGEXP @_r3自用:=o('(?&message) message') THEN 

						SET r  = _f(r,JSON_ARRAY(
												o('(?&替换的) message')
												,'路径为“',':'
												,'”',''
												,'\\\\(.)','\\1'
												,'，',',\n'	));
					
					WHEN r REGEXP '^\\s*npm\\b' THEN 
						SET r  = _f(r,JSON_ARRAY( 
											'(?i)\\s*npm\\s+I(?:NSTALL)?','yarn add'  
											,'(?i)(?:\\-\\-?s(ave)?)\\b',''
											,'(?i)\\-?\\-dev\\b','-D'))
											;
					
					WHEN CHAR_LENGTH(r)>500 THEN return r;
					WHEN @r3自用 IS NOT NULL && r REGEXP @r3自用 THEN
					   SET r =  REGEXP_replace(REGEXP_replace(r ,  @r3自用,'import from "@site\\1" '),'\\.js(?=")','')
									,次数 = 0
									,@r3自用 = null
									;

					WHEN r REGEXP o('(?&path) path') THEN 
						CASE  WHEN r REGEXP '\\\\' THEN
										SET r = REGEXP_replace(r ,'\\\\','/');
										IF r  REGEXP @r3自用:=  o('(?x)^(?&分割)?[w]((?:(?&分割)(?&path0))+) path') THEN
										SET 次数=1; END IF;

								ELSE 
										SET r = REGEXP_replace(r ,'/','\\\\');
						END CASE;
					WHEN r REGEXP '^`\w+`$' THEN
						SET r = R1(r);
					WHEN r REGEXP '(?<=\\(\\?)((?:&)(\\w+))(?=\\))|(?<=\\\\)((?:g\\{)(\\w+)\\})' THEN 
						SET r = REGEXP_replace(r,'(?<=\\(\\?)((?:&)(\\w+))(?=\\))','R<\\2>'),
								r = REGEXP_replace(r,'(?<=\\\\)((?:g\\{)(\\w+)\\})','k<\\2>');
					
					WHEN r REGEXP '(?<=\\(\\?)((?:R<)(\\w+))(?:>)(?=\\))|(?<=\\\\)((?:k\\<)(\\w+)\\>)' THEN
						SET r = REGEXP_replace(r,'(?<=\\(\\?)((?:R\\<)(\\w+))(?:\\>)(?=\\))','&\\2'),
								r = REGEXP_replace(r,'(?<=\\\\)((?:k\\<)(\\w+)\\>)','g{\\2}');
					WHEN r REGEXP "^([^$]*(\\$)\\d{1,3}[^$]*)*$" THEN
						SET r = REGEXP_replace(r, '(?<=[^$]|^)(\\$)(?=[^$]|$)',REPEAT('\\',2));
					WHEN r REGEXP "^(?:[^\\\\]*\\\\\\d{1,9}[^\\\\]*)*$" THEN 
						SET r = REGEXP_replace(r, '(?<=[^\\\\]|^)(\\\\)(\\d{1,9})','$\\2');

				ELSE SET r = r;	
			END CASE;

	END while 多个动作;

	RETURN r;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `_RESIGNAL`
-- ----------------------------
DROP FUNCTION IF EXISTS `_RESIGNAL`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `_RESIGNAL`(`no` tinyblob,`MESSAGE` TINYTEXT) RETURNS longblob
    DETERMINISTIC
BEGIN
	DECLARE exit HANDLER FOR SQLEXCEPTION

	SET	no= IF(IFNULL(no,'')='','5555',no),
			MESSAGE= IF(IFNULL(MESSAGE,'')='','no message',MESSAGE);
			
	RESIGNAL 
   SET MYSQL_ERRNO = no, MESSAGE_TEXT = `MESSAGE`;
	RETURN '{返回}';
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `_S`
-- ----------------------------
DROP FUNCTION IF EXISTS `_S`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `_S`(P LONGBLOB ) RETURNS longblob
    DETERMINISTIC
BEGIN
  DECLARE `no` tinyblob DEFAULT json_value(p,'$[0]');
	DECLARE `MESSAGE` TEXT DEFAULT json_value(p,'$[1]'); 

	SET	no= IF(IFNULL(no,'')='','5555',no),
			MESSAGE= IF(IFNULL(MESSAGE,'')='','no message',MESSAGE);
			
	SIGNAL SQLSTATE 'HY000' 
   SET MYSQL_ERRNO = no, MESSAGE_TEXT = `MESSAGE`;
	RETURN  P;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `_SIGNAL`
-- ----------------------------
DROP FUNCTION IF EXISTS `_SIGNAL`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `_SIGNAL`(`no` tinyblob,`MESSAGE` TINYTEXT) RETURNS longblob
    DETERMINISTIC
BEGIN
	DECLARE exit HANDLER FOR SQLEXCEPTION

	SET	no= IF(IFNULL(no,'')='','5555',no),
			MESSAGE= IF(IFNULL(MESSAGE,'')='','no message',MESSAGE);
			
	RESIGNAL 
   SET MYSQL_ERRNO = no, MESSAGE_TEXT = `MESSAGE`;
	RETURN '{返回}';
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `分类`
-- ----------------------------
DROP FUNCTION IF EXISTS `分类`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `分类`(`p` text) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	
	CASE 
			WHEN `p`  REGEXP '记账凭证' THEN 
				SET `p` = 'kjpz';
				
			WHEN p REGEXP '成本' THEN 
				SET `p` = 'kjgz';
			WHEN p REGEXP '税务' THEN 
				SET `p` = 'kjns';
		ELSE 
			SET `p` = NULL;
	END CASE;
  

	RETURN `p`;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `取整`
-- ----------------------------
DROP FUNCTION IF EXISTS `取整`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `取整`(`d` int(5),`a` longtext) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	DECLARE  v TINYBLOB DEFAULT NULL ;
SET 	v  = jk("税b",`d` ,`a` );

IF v   REGEXP '\\-?\\d+\\.\\d{3,}' THEN 
SET  a = REGEXP_replace(`a`,CONCAT('(?x)\\[
(?+1)
(?:,\\s*(?+1)){',`d`-1,'}
,\\s*\\K("[^"]*"|null|\\-?[\\d\\.]+)'),CONCAT_WS('','"',ROUND(`v`,2),'"'));
END IF ;
	RETURN CAST(a as CHAR) ;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `执行`
-- ----------------------------
DROP PROCEDURE IF EXISTS `执行`;
DELIMITER ;;
CREATE DEFINER=`root`@`::1` PROCEDURE `执行`(IN `p` longblob)
p:BEGIN
	#Routine body goes here...
	DECLARE i INT(5) DEFAULT 0;DECLARE l INT(5) DEFAULT 0;
	DECLARE `funcid` VARCHAR(100) DEFAULT 'funcid';DECLARE `b`,`n`MEDIUMBLOB DEFAULT NULL;
	DECLARE `mod` VARCHAR(100) DEFAULT NULL; DECLARE 取参数 TINYTEXT DEFAULT "\\s*\\-{1,2}slint\\s*$";
	DECLARE CONTINUE HANDLER FOR  SQLSTATE '21S01', SQLSTATE '23000', SQLSTATE	'42000'	, SQLSTATE	'42S22' ,SQLSTATE '21000', SQLSTATE	'HY000'-- ,SQLSTATE	'22007'
	bl:BEGIN GET DIAGNOSTICS CONDITION 1 @`sqlstate` = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;SET  @`sqlstate` = JSON_OBJECT('sqlstate',@`sqlstate`,'errno',@errno,'text',CONCAT(i,@text));
CASE WHEN ( @errno='1091' || @errno='1360' )&& 0 THEN SET @不记录 =0,@继续执行 = 1 ;
		ELSE
SELECT @`sqlstate` 出错;
				IF(b REGEXP 'Done：' )  THEN SET @不记录 =0,@继续执行 = 0 ;ELSE SET @不记录 = null;END IF;
				SET @`errsql` =b,@funcid =  NULL;
				SET @funcid = CONCAT_WS(' ','Error: ',(SELECT CONCAT_WS(', ',a.note,CONCAT_WS('',UPPER(SUBSTR(a.`name`,1,1)),LOWER(substr(a.`name`,2))),a.id) FROM mysq1_schema.qs AS a WHERE a.`name` = `funcid`)
									, ' 执行' ),
				@pp = QUOTE(p);
				CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp,'SQL',@`errsql`,'err',@`sqlstate`,'l',1,"继续执行",IFNULL(@继续执行,0),'记录',IFNULL(@不记录,1)));END CASE ;END;

/*
START TRANSACTION;
SET @funcid = CONCAT_WS(' ',(SELECT CONCAT_WS(', ',a.note,CONCAT_WS('',UPPER(SUBSTR(a.`name`,1,1)),LOWER(substr(a.`name`,2))),a.id) FROM mysq1_schema.qs AS a WHERE a.`name` = `funcid`)
							, ' 执行' ),
		@pp = QUOTE(`p`);

CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp));COMMIT;*/

SET `mod` = REGEXP_substr(p,取参数),p=REGEXP_replace(p,取参数,'');

SET @开始时间 = SYSDATE(6);
IF p IS NULL THEN LEAVE p;end if;
IF  !json_valid(p) THEN 

IF  p NOT REGEXP '^\\s*+"' THEN  SET p = json_quote(CAST(p AS CHAR) );END IF;

SET p = CONCAT('[',p ,']');
END IF; 

-- SELECT CAST(json_extract(p,'$[0]') AS CHAR);

SET @FOREIGN_key_checks = 0 ;


IF  p is NOT null AND json_valid(p) THEN 
 
		l:LOOP

			SET `B` = CAST(json_value(p,'$[0]') AS CHAR),p= json_remove(p,'$[0]');
			
			IF( b IS NULL  ) THEN  SELECT p ;LEAVE l;END IF;
			
			SET n = REGEXP_substr(CAST(b AS CHAR), '(?i)\\s*^\\s*CALL\\s+`?执行`?\\(\\K.+?(?=\\)[\\s;]*(?-m)$)'
);

			IF  IFNULL(n,'') != ''  THEN 
					SET @`执行专用n` = NULL;

					EXECUTE  immediate  CAST(CONCAT(' ','set @`执行专用n` =',n) AS CHAR);
					SET n = @`执行专用n` ;

					IF IFNULL(n,'') != '' && JSON_valid(n)&&JSON_DEPTH(n)>1  && JSON_LENGTH(n)>0 THEN
	-- SELECT json_length(p),p,JSON_MERGE(n,p);
						SET p = JSON_MERGE(n,p),n=NULL ;

						ELSE 
						SIGNAL SQLSTATE 'HY000' SET  MYSQL_ERRNO =1003,MESSAGE_TEXT = '不可递归调用，n不是有效数组';
						LEAVE p;
					END IF ;
	-- SELECT p ,'JSON_LENGTH(p)'; LEAVE p;
				ITERATE l;

				
				
			END IF;  
			
			CASE  
					WHEN @p0调试 is NOT NULL && @p0调试  THEN 

							EXECUTE  immediate  CAST(CONCAT('SELECT CAST(b AS char) ',i,' - 语句')AS CHAR); 

					WHEN    b != '' THEN  
			
						EXECUTE immediate  b;
			  
			END CASE;
					



			SET l = l+FOUND_ROWS();
			SET i = i +1;
		END LOOP;
	
	ELSE 	SET b = CONCAT('执行结果:',i,'/','不是json ','NULL');	LEAVE p;
END IF;
 IF @执行安静 is NOT null  AND   @执行安静 REGEXP 取参数 ||`mod` IS NOT NULL  THEN 
 SET@执行安静 =  NULL;  SET  @p0调试 =  NULL;
 LEAVE p; 
 END IF;
 
	SELECT CONCAT('Done：',IFNULL(JSON_LENGTH(p),'NULL'),'/',i,'/',l,'/',FORMAT(exetime(@开始时间),3));
	-- SIGNAL SQLSTATE 'HY000' SET  MYSQL_ERRNO =1003,MESSAGE_TEXT = b;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `插入json`
-- ----------------------------
DROP PROCEDURE IF EXISTS `插入json`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `插入json`(`p` longblob)
p:BEGIN
	DECLARE onep LONGBLOB DEFAULT NULL; -- (?<![\w`"'])([a-z])(?![\w`"'])
	DECLARE `i` INT(5) DEFAULT 0;
	DECLARE `l` INT(5) DEFAULT 0;

  DECLARE CONTINUE HANDLER FOR  SQLSTATE '21S01', SQLSTATE '23000', SQLSTATE	'42000'	, SQLSTATE	'42S22' , SQLSTATE	'HY000'-- ,SQLSTATE	'22007'
	bl:BEGIN GET DIAGNOSTICS CONDITION 1 @`sqlstate` = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;SET  @`sqlstate` = JSON_OBJECT('sqlstate',@`sqlstate`,'errno',@errno,'text',@text);
				SET @`errsql` = @sql_body,@funcid =  NULL,@`errsql` := @`sql`;
				SET @funcid = CONCAT_WS(' ','插入json','Error: ' ),
				@pp = QUOTE(`p`);
				CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp,'SQL',@`errsql`,'err',@`sqlstate`,"继续执行",1));END;/**/

/*
START TRANSACTION;
				SET @funcid = CONCAT_WS(' ','插入json','记录参数' ),
				@pp = QUOTE(`p`);
				CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp,'SQL',@`errsql`,'err',@`sqlstate`,'`l`',1));

*/

	IF IFNULL(`p`,'') ='' THEN LEAVE p;END IF;

	IF !json_valid(`p`) OR json_depth(`p`) <4 THEN SET `p` = CONCAT_WS('','[',`p`,']');END IF;

	IF !json_valid(`p`) OR json_depth(`p`) <4  THEN SET @funcid = CONCAT_WS(' ','插入json',' 问题参数 ' ),@pp = QUOTE(`p`);			CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp,'SQL',@`errsql`,'err',@`sqlstate`,'`l`',1)); LEAVE `p`;END IF;

	SET `l` = json_length(`p`);

	l0:LOOP

		IF `i`>=`l` THEN LEAVE l0;END IF;
		SET onep = json_query(CAST(`p` AS CHAR) ,'$[0]');

		BEGIN DECLARE `y` int(5) DEFAULT 0 ;DECLARE `x` int(5) DEFAULT 0 ;DECLARE `vs` LONGTEXT DEFAULT json_query(onep,'$.v');DECLARE `v` LONGTEXT DEFAULT NULL;DECLARE `k` LONGTEXT DEFAULT NULL;DECLARE `j` LONGTEXT DEFAULT NULL; 
				

				l1:LOOP

						IF json_length(vs) =0 THEN LEAVE l1;END IF;


						SET `k` = json_keys(`vs`),

								`v` = REGEXP_replace(REGEXP_replace(json_extract(json_extract(CAST(`onep` AS CHAR),'$.关键字'),'$.*'),'^\\[|\\]$',''),'"(?:行|@\\w\\s*:=.*?)"',`x`+1),
								`y` = 0;

						
				
						l2:LOOP

									IF `y` >= json_length(`k`) OR ISNULL(json_length(`k`)) THEN LEAVE l2;END IF;
									-- IF `y` >= 2 THEN LEAVE l1;END IF;

									SET @v := REGEXP_replace(REGEXP_substr(CAST(vs AS CHAR ),
													CONCAT_WS(''
													,json_quote(json_value(`k`,CONCAT_WS('','$[',`y`,']')))
															,':\\s*(?:"(?:(?=\\\\).{2}|[^\\\\"]++)*?"|null|[\\d\\-\\.\\,]+)'
													)),'"[^"]+":\\s*','')
										;

									SET `v` = CONCAT_WS(', ',`v`,IF(IFNULL(@v,'')!='',@v,'null')); 


									 SET `y` = `y`+1;
						END loop;


						IF CAST(onep as CHAR) REGEXP "(?i)UPDATE" THEN 

								SET @sql = CONCAT_WS(IF(IFNULL(@优化,'')!='',@优化,'	')
																		,json_value(CAST(onep AS CHAR),'$.表')
																		,CONCAT_WS(IF(IFNULL(@优化,'')!='',@优化,'	')
																			,'set'
																			,REGEXP_replace(REGEXP_replace(REGEXP_replace(json_merge(vs,json_extract(CAST(onep AS CHAR),'$.关键字'))
																			,'"([^"]+)":','\\1 = '),'^\\{|\\}$','')
																			,CONCAT_WS('',',(\\s*',json_value(json_keys(CAST(onep AS CHAR),'$.关键字'),'$[0]'),')(?=\\s*=\\s*)')
																			,' where \\1'))
																		
													);

						ELSE 	
								SET @sql = CAST(CONCAT_WS(IF(IFNULL(@优化,'')!='',@优化,'	')
																			,CONCAT_WS('',json_value(CAST(onep AS CHAR),'$.表'),'(',REGEXP_replace(json_merge(json_keys(json_extract(CAST(onep AS CHAR),'$.关键字')),json_keys(vs)),'^\\[|\\]$|"',''),')')
																			,CONCAT_WS('','VALUES(',`v`,')')
																			)as char);

						END IF;

						EXECUTE immediate @`sql`;

						SET  @sql = CONCAT_WS('','set @`sql` := json_remove(',QUOTE(vs),',',REGEXP_replace(REGEXP_replace(`k`,'(?<=\\[|,\\s|,)"','"$.'),'^\\[|\\]$',''),')');

						EXECUTE immediate @`sql`;

						SET vs = @sql,`x`=`x`+1;


			END LOOP;

			END ;


		SET `i` = `i`+1,`p` =json_REMOVE(`p`,'$[0]');


	END LOOP;


END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `插入字段名`
-- ----------------------------
DROP FUNCTION IF EXISTS `插入字段名`;
DELIMITER ;;
CREATE DEFINER=`root`@`::1` FUNCTION `插入字段名`(`b` longblob,`s` blob) RETURNS longblob
    NO SQL
    DETERMINISTIC
BEGIN

	DECLARE i INT(5) DEFAULT 0;DECLARE f BLOB  DEFAULT NULL;
	DECLARE s1 VARCHAR(200) ;DECLARE r0 VARCHAR(200) DEFAULT '((?<q>["\'])(?:(?=\\\\).{2}|(?!\\k<q>).)*?\\k<q>(?!\\s*as))';
	DECLARE r VARCHAR(400) DEFAULT '(?s)^(?:(?=(["\']))\\g-1(?:(?=\\\\).{2}|(?!\\g-1).)*?\\1|[^\\r\\n"\']+)+[\\r\\n]';
  DECLARE 第一行 MEDIUMBLOB DEFAULT NULL;DECLARE rs MEDIUMBLOB DEFAULT NULL;
	SET r0 = '(?ism)(?<=select|,)\\s*(?:(?:(["\'])(?:(?=\\\\).{2}|(?!\\g-1).)*?\\g-1)|[^\\s,]+)(?=\\s*,|\\s*union)';

	CASE
		WHEN IFNULL(b,'') ='' THEN 
			RETURN NULL; 
		WHEN NOT json_valid(s) THEN
		  SET s = IF( S REGEXP '^([\\w_]+)(,(?1))*+$',CONCAT('["',REGEXP_replace(s,',','","'),'"]'),NULL);
	END CASE;

SET 第一行 = REGEXP_substr(b,r),b = REGEXP_replace(b,CONCAT('\\Q',第一行,'\\E'),'');
-- RETURN b;

	Loop1:LOOP

		IF 第一行 NOT REGEXP r0 OR  i > 10  THEN LEAVE Loop1; END IF;
		SET f = REGEXP_substr(第一行,r0),rs = CONCAT_WS('',rs,REGEXP_substr(第一行,CONCAT('^.*?(?=\\Q',f,'\\E|$)')))
				,第一行 = REGEXP_replace(第一行,CONCAT('^.*?(?:\\Q',f,'\\E|$)'),'');
		SET  s1 = json_value(s,CONCAT('$[',i,']'));

		SET  rs = CONCAT_WS('',rs, CONCAT(f,' AS ',IF(IFNULL(s1,'')!='' ,s1,CONCAT('`c',i+1,'`'))));

		SET i=i+1;

		END LOOP ;#Loop1:

		SET b = CONCAT_WS('',rs,第一行,b);

	RETURN b;-- CAST(b AS CHAR);
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `数组2sql`
-- ----------------------------
DROP FUNCTION IF EXISTS `数组2sql`;
DELIMITER ;;
CREATE DEFINER=`root`@`::1` FUNCTION `数组2sql`(`b` longblob) RETURNS longblob
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	DECLARE r varchar(100) DEFAULT '(?s)((?:(")(?:(?=\\\\).{2}|(?!\\g-1).)*?\\g-1|[^,\\[\\]]+|,)*?)(?:\\](?:,\\[))';
	DECLARE type VARCHAR(1) DEFAULT NULL; DECLARE s TINYTEXT DEFAULT NULL;
	

	
  
  SET b = REGEXP_replace(b,'[\\n\\r]+','\\\\n');

	CASE 
		WHEN json_valid(b) THEN SET type = '1';
		WHEN json_valid(CONCAT('[',b,']')) THEN SET type ='2';
   ELSE RETURN NULL;
	END CASE;


	IF b REGEXP '"keys"' THEN 
	

	 SET s =  JSON_value(b,'$[0].keys') ,
	      b = JSON_COMPACT(json_remove(b,'$[0]'));	
		  SET type=2;
	 ELSE SET type =1;
	END IF;
	

	SET b = CONCAT("SELECT ",REGEXP_replace(
REGEXP_replace(b,r,'\\1 UNION ALL\nSELECT ')
 ,"^\\[{1,2}|\\]{1,2}$",''))
;



	RETURN IF( type =1,b, 插入字段名(b,S));
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `正则抓取`
-- ----------------------------
DROP FUNCTION IF EXISTS `正则抓取`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `正则抓取`(b longblob,r text) RETURNS longblob
    NO SQL
    DETERMINISTIC
BEGIN
	DECLARE rs text DEFAULT NULL;

 

	RETURN 0;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `生成`
-- ----------------------------
DROP FUNCTION IF EXISTS `生成`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `生成`(`p` text) RETURNS text CHARSET utf8mb3
    DETERMINISTIC
BEGIN
	#Routine body goes here...
	DECLARE  r TINYTEXT DEFAULT  '^\\s*\\w{1,2}[\\.\\s]+||[,\\s]+\\w{1,2}\\s*$';
	DECLARE  profix VARCHAR(10) DEFAULT REGEXP_substr(p,r);
	
	SET  profix = IF(profix <=> '',NULL, REGEXP_substr(profix,'\\w+')),
			`p`  = REGEXP_replace(p,CONCAT('\\s+|',r),'');
	
	SET  p  = (SELECT  
CONCAT('JSON_OBJECT(',GROUP_CONCAT(QUOTE(s.COLUMN_NAME),',',CONCAT_WS('.',profix,s.COLUMN_NAME)  ORDER BY  s.ORDINAL_POSITION),')') 
FROM
	information_schema.`COLUMNS` AS s
	INNER JOIN
	information_schema.`TABLES` AS s1
	ON 
-- 		s1.TABLE_COMMENT != 'view' AND 
		s.TABLE_SCHEMA = s1.TABLE_SCHEMA AND
		s.TABLE_NAME = s1.TABLE_NAME

	LEFT JOIN
	information_schema.`COLUMNS` AS p
	ON 
		s.TABLE_SCHEMA = p.TABLE_SCHEMA AND
		s.TABLE_NAME = p.TABLE_NAME AND
		if(`s`.ordinal_position=1 ,0,`s`.ORDINAL_POSITION = p.ORDINAL_POSITION+1)
WHERE
	s.TABLE_SCHEMA = DATABASE() 	
AND 	s.TABLE_NAME = p 
);
	RETURN p;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `生成reg`
-- ----------------------------
DROP PROCEDURE IF EXISTS `生成reg`;
DELIMITER ;;
CREATE DEFINER=`root`@`::1` PROCEDURE `生成reg`(IN `p` longblob)
BEGIN
	#Routine body goes here...
SELECT count(*)  ,@语句 = JSON_ARRAYagg(语句) 语句 FROM(
SELECT
Id ,json

,@语句 :=CONCAT_WS('\n'
,'UPDATE	mysq1_schema.regc AS a '
,CONCAT('SET  a.Reg =  ',json)
,CONCAT(' ,stat  = NULL' )
,CONCAT( 'WHERE a.id =', QUOTE(Id),';' )
)语句

FROM
	mysq1_schema.regc AS a
WHERE
	a.json IS NOT NULL
	&& a.stat is not null
-- 
) AS a ;

call 执行(@语句);

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `视图优化`
-- ----------------------------
DROP PROCEDURE IF EXISTS `视图优化`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `视图优化`()
BEGIN
	#Routine body goes here...
call v2t('acc_mission_seal_detalv0,1',null);


END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `语句变数组`
-- ----------------------------
DROP FUNCTION IF EXISTS `语句变数组`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `语句变数组`(p longblob) RETURNS longblob
    DETERMINISTIC
p:BEGIN

		IF json_valid(p)&& JSON_DEPTH(p)>1 THEN RETURN p;END IF; 

		SET p = REGEXP_replace(p,O('(?x)(?:"(?:(?=\\\\).{2}|[^"])*?")(*SKIP)(*FAIL)|(?&zs3)|(?&zs4) es6'),'');

		SET p := f(p ,
		json_array('来自','react',o('(?x)((?:(?&v)|[^;])+?); es6')
		,'(?#quote)(?s)(^.+?);$','\\1')
		);


		SET p = _f(p,'["变数组"]');
		RETURN `p` ;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `调试`
-- ----------------------------
DROP FUNCTION IF EXISTS `调试`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `调试`(`p` longblob) RETURNS longblob
    DETERMINISTIC
BEGIN
	#Routine body goes here...

	RETURN JSON_OBJECT('tiaoShi' , `p` );
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `键长`
-- ----------------------------
DROP FUNCTION IF EXISTS `键长`;
DELIMITER ;;
CREATE DEFINER=`root`@`::1` FUNCTION `键长`(`k` longblob) RETURNS int(5)
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...

	RETURN LENGTH(REGEXP_REPLACE(k,'[^,]+',''))+1;
END
;;
DELIMITER ;

-- ----------------------------
--  Records 
-- ----------------------------
