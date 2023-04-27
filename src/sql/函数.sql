/*
MARIADB Backup
Source Server Version: 10.6.5
Source Database: qianxue_sjzh
Date: 2023/4/27 13:12:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Procedure definition for `2page`
-- ----------------------------
DROP FUNCTION IF EXISTS `2page`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `2page`(`p` blob) RETURNS varchar(8) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
l:BEGIN
	
	DECLARE `pageno` VARCHAR(8) DEFAULT j(p,'pageno');
	DECLARE `max_page` VARCHAR(2000) DEFAULT j(p,'max_page');



	RETURN 	CASE 
						WHEN IFNULL(`pageno`,'')=0 THEN RPAD(1,`max_page`,1)
						WHEN `pageno` = '1' THEN RPAD(1,`max_page`,0)
						WHEN `pageno` REGEXP '^[01]+$' THEN SUBSTR(`pageno`,1,`max_page`)

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
	DECLARE len INT(5) DEFAULT 0 ; 
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
/*
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
															@one,',',ir," AS rowId \n"
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
LEFT JOIN ",expid2b(@expID)," AS c0 ON b0.missionId = c0.missionId AND b0.rowNo = c0.rowId
LEFT JOIN (\n",@3in1_body,"\n) AS c1 ON b1.missionId = c1.missionId AND b1.rowNo = c1.rowId
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

SET len = CHAR_LENGTH(REGEXP_replace(@a_row,'\\w+',''))+1;
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
						IF ir IS NULL || i > len THEN 	 LEAVE fetch_recode; END IF;
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

SET len = CHAR_LENGTH(REGEXP_replace(@a_row,'\\w+',''))+1;
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
															ir," AS rowId,",
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
						
						IF ir IS NULL || i>len THEN 	 LEAVE fetch_recode; END IF; -- SELECT  @3in1_body,rownum,i,ir,ia;
						SET @3in1_body = CONCAT_WS('\nunion\n',@3in1_body,'');
					END LOOP;

					SET @3in1_body = CONCAT_ws('',"INSERT INTO ",@db_b,
									"(expid,missionid,",
								IF(mid1 IS NULL,NULL,'missionid1,'),"\n",
									"rowid," ,
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
						SET @one = CONCAT('a.line  = ',j(dblob,'line')),
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
--  Procedure definition for `3in1_copy`
-- ----------------------------
DROP PROCEDURE IF EXISTS `3in1_copy`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3in1_copy`(IN `funcid` varchar(100),IN `key_names` varchar(100),IN `key_values` varchar(200),IN `field_names` longtext,IN `field_values` longtext,in `rowids` varchar(300), dblob blob)
    DETERMINISTIC
`l`:BEGIN

	DECLARE rownum varchar(300);	DECLARE IS5 VARCHAR(1) DEFAULT 0;	DECLARE i INT(3);  DECLARE ir INT(3);	DECLARE ia INT(3);	DECLARE mid1 varchar(60) DEFAULT NULL;
	DECLARE len INT(5) DEFAULT 0 ; 
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
/*
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
															@one,',',ir," AS rowId \n"
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
LEFT JOIN ",expid2b(@expID)," AS c0 ON b0.missionId = c0.missionId AND b0.rowNo = c0.rowId
LEFT JOIN (\n",@3in1_body,"\n) AS c1 ON b1.missionId = c1.missionId AND b1.rowNo = c1.rowId
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

SET len = CHAR_LENGTH(REGEXP_replace(@a_row,'\\w+',''))+1;
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
						IF ir IS NULL || i > len THEN 	 LEAVE fetch_recode; END IF;
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

SET len = CHAR_LENGTH(REGEXP_replace(@a_row,'\\w+',''))+1;
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
															ir," AS rowId,",
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
						
						IF ir IS NULL || i>len THEN 	 LEAVE fetch_recode; END IF; -- SELECT  @3in1_body,rownum,i,ir,ia;
						SET @3in1_body = CONCAT_WS('\nunion\n',@3in1_body,'');
					END LOOP;

					SET @3in1_body = CONCAT_ws('',"INSERT INTO ",@db_b,
									"(expid,missionid,",
								IF(mid1 IS NULL,NULL,'missionid1,'),"\n",
									"rowid," ,
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
						SET @one = CONCAT('a.line  = ',j(dblob,'line')),
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
--  Procedure definition for `ab`
-- ----------------------------
DROP FUNCTION IF EXISTS `ab`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `ab`(`ab` varchar(20000),`init` varchar(20000),`blur` varchar(1200)) RETURNS text CHARSET utf8mb4
    NO SQL
    DETERMINISTIC
BEGIN

 DECLARE `e` TINYTEXT DEFAULT '\\[\\]\\-(){}.*?+$';
 DECLARE `rep` VARCHAR(200) DEFAULT '\\\\\\1';
 SET `e` = CONCAT_WS('','((?<!\\\\)[',`e`,']|\\\\(?![',`e`,']))');


	SET `ab` = TRIM(`ab`),
			`blur` = TRIM(`blur`);

	SET `ab` =IF(IFNULL(`ab`,'') REGEXP '^\\s*$',NULL,preg_replace('/(?=\\(|\\)|\\*)/','\\\\',`ab`)),
			`init` = IF(IFNULL(`init` ,'') REGEXP '^[[:space:]]*$',NULL,'1'),
			`blur` = IF(IFNULL(`blur` ,'')  REGEXP '^[[:space:]]*$',NULL,PREG_REPLACE('/\\s/','[[:space:]]+',`blur`));
	SET @oab =`ab`;


	CASE
							WHEN `init` = 1 		THEN  RETURN NULL;
							WHEN IFNULL(`ab`,'')='' AND  IFNULL(`init`,'') ='' THEN RETURN NULL;
						WHEN `blur` REGEXP '\\*{4}'THEN 
							SET `init` = CONCAT_WS('','^(?:\\s*|',REGEXP_substr(`blur`,'(?<=\\*{4})\\d*(\\.\\d+)?'),')$');

              WHEN `blur` LIKE '*%' THEN  RETURN '[[:alnum:]]+';
						WHEN `blur` REGEXP '(?i)\\{y(?:md\\}?)?|@@' THEN

								CASE 
										WHEN IFNULL(`ab`,'') = '' THEN SET `ab` = '^\\d{1,4}$';
										WHEN	`ab` REGEXP '^(?:0|零|〇).$' THEN  SET	`init` = REGEXP_SUBSTR(`ab`,'(?<=0|零|〇).$');
										WHEN	`ab` REGEXP '^.$' THEN SET	`init` = CONCAT('(?:0|零|〇)',`ab`);

									ELSE SET `init` = REGEXP_SUBSTR(`ab`,'.{2}$');
								END CASE ;
	
						WHEN `blur` REGEXP '^\\s*\\={2}\\s*$' THEN  
							SET 	`ab` = CONCAT('^',REGEXP_replace(`ab`,e,`rep`),'$');
						WHEN `blur` REGEXP '=[\\^!]' THEN  
							SET `init` = REGEXP_replace(REGEXP_replace(REGEXP_replace(`blur`,`e`,`rep`),'=[\\^!]','|'),'^\\||\\$','');
							SET `init` = CONCAT_WS('','^(?!.*?(?:',`init`,'))');
							SET `ab` = CONCAT_WS('',`init`,REGEXP_replace(`ab`,e,`rep`)),`init` = NULL;

							WHEN `ab` is NULL THEN   
								CASE
									WHEN `blur` is null THEN RETURN NULL;
									ELSE SET `ab` = '^[[:space:]]*$',`init` = b2r(`blur`,null);
								END CASE;
					WHEN `blur` REGEXP '#{2}' THEN
						 SET `init` = REGEXP_SUBSTR(`blur`,'(?<=#{2})(\\-|￥|\\$)?\\d+(\\.\\d+)');
						IF IFNULL(`init`,'') = '' THEN
							SET `ab` = Is_amount(`ab`);
						ELSE SET `init` = Is_amount(`init`); END IF;

							WHEN `blur` is null THEN RETURN Is_amount(`ab`);
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
--  Procedure definition for `ab_copy`
-- ----------------------------
DROP FUNCTION IF EXISTS `ab_copy`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `ab_copy`(`ab_` varchar(20000),`init_` varchar(20000),`blur_` varchar(1200)) RETURNS mediumtext CHARSET utf8mb4
    NO SQL
    DETERMINISTIC
BEGIN
	
 DECLARE `e` TINYTEXT DEFAULT '\\[\\]\\-(){}.*?+$';
 SET `e` = CONCAT_WS('','((?<!\\\\)[',`e`,']|\\\\(?![',`e`,']))');
 
	SET ab_ = TRIM(ab_),
			blur_ = TRIM(blur_);

	SET ab_ =IF(IFNULL(ab_,'') REGEXP '^[[:space:]]*$',NULL,preg_replace('/(?=\\(|\\)|\\*)/','\\\\',ab_)),
			init_ = IF(IFNULL(init_ ,'') REGEXP '^[[:space:]]*$',NULL,'1'),
			blur_ = IF(IFNULL(blur_ ,'')  REGEXP '^[[:space:]]*$',NULL,PREG_REPLACE('/\\s/','[[:space:]]+',blur_));
	
	RETURN 	
					CASE
							WHEN init_ = 1 		THEN NULL
              WHEN blur_ LIKE '*%' THEN  '[[:alnum:]]+'
							WHEN ab_ is NULL THEN   
								CASE
									WHEN blur_ is null THEN NULL
									ELSE concat('^[[:space:]]*$','|',b2r(blur_,null))
								END
							WHEN blur_ is null THEN Is_amount(ab_)
							WHEN substr(@tb_:=b2r(blur_,ab_),1,2)='^[' THEN CONCAT(Is_amount(ab_),'|',@tb_)

							ELSE CONCAT(ab_,'|',@tb_)
					END  ; 
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
	


	SET @`code` = NULL,
			@`code` = preg_capture('/^\\d*/',`account` ),
			@`account1` = NULL, 
			@`account1` = preg_capture('/^([0-9]+\\s*)*(.+?)(?=$| \\- )/',`account`,2) ,
			@`account2` = NULL, 
			@`account2` = preg_capture('/(?<= \\- ).+$/',`account`);

  IF	IFNULL(@`code`,'') = '' OR CONCAT_WS('',@`account2`,@`account1`) = ''THEN 
			SELECT 'no code' ;LEAVE asll;
  END IF;
	

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
CREATE DEFINER=`root`@`%` PROCEDURE `accslgl`(IN `funid` varchar(60) ,IN `keyword` longtext)
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
		SET @`errsql` = @stmtbody;SET @funid :=  NULL,
				@funid = CONCAT_WS(' ','Error：',REGEXP_substr("0	总分类账-科目表\n1 明细账-科目表\n2 科目汇总表\n3 明细账\n4 总分类账 \n6 报表项目明细 \n7 经济业务 \n8 期初余额\n9 科目代码表",CONCAT_WS('','(?ism)^\\s*' ,`funid` ,'\\s*[^\\d\\s]+'))
										,' Accslgl'),
				@pp = CONCAT_WS(',',QUOTE(`funid`),QUOTE(`p`));
		CALL `Audit_3`(COLUMN_create('m',@funid,'pp',@pp,'SQL',@`errsql`,'err',@`sqlstate`,'l',1));
END;/* */

start TRANSACTION;
SET @funid :=NULL,
		@funid = CONCAT_WS(' ',REGEXP_substr("0	总分类账-科目表\n1 明细账-科目表\n2 科目汇总表\n3 明细账\n4 总分类账 \n6 报表项目明细 \n7 经济业务 \n8 期初余额\n9 科目代码表",CONCAT_WS('','(?ism)^\\s*' ,`funid` ,'\\s*[^\\d\\s]+'))

                ,' Accslgl'),
		@pp = CONCAT_WS(',',QUOTE(`funid`),QUOTE(`keyword`));
-- CALL `Audit_3`(COLUMN_create('m',@funid,'pp',@pp));COMMIT;

INSERT INTO plogs (Function_Name,parameter) VALUES (@funid,@pp);
commit;
/**/
	SET		@stmtbody = NULL;

SET keyword = REPLACE(keyword,'"category":"负载类%"','"category":"负债类%"');
	CASE  


			WHEN funid = '9' THEN

						SET		@stmtbody = CONCAT('LIMIT ',IF((@sn := CONCAT_WS(',',j5(`keyword`,"start"),j5(`keyword`,"number")))='' ,NULL,@sn)),
									@bnote = @bnote,
									@`WHERE` = CONCAT_WS(' AND ',CONCAT("b0.category LIKE  ",quotd(j5(`keyword`,'category'))),
																							 CONCAT("CONCAT_WS('',a.`code`,a.account,a.yefx,a.fsefx,a.note) REGEXP ", quotd(j5(`keyword`,'searchVal'))));
			
						SET		@stmtbody = CONCAT_WS('',	"
SELECT
a.id,
a.`code`,
a.account,
a.yefx,
a.fsefx,
a.note,
(c(@bnote := IF(IFNULL(b.note,'')='',@bnote,b.note))) AS account_title,
b0.category,
b0.note AS category_title
FROM
accountcode AS a
LEFT JOIN mysq1_schema.account AS b ON a.`code` = b.`code`
LEFT JOIN mysq1_schema.accountcode_category AS b0 ON SUBSTR(a.`code`,1,1)= b0.`code`",
CONCAT('\nWhere ',IF(IFNULL(@`WHERE`,'') = '',NULL,@`WHERE`)),"
ORDER BY a.`code`
",@stmtbody
);


			WHEN funid = '8' THEN

						SET @`WHERE` = CONCAT_WS(' AND ',CONCAT("CONCAT_WS('',a.`code`,a.account,a.yefx,a.fsefx,c.balance,FORMAT(c.balance,2),c.creditAccumulated,FORMAT(c.creditAccumulated,2),c.debitAccumulated,FORMAT(c.debitAccumulated,2),c.quantityAccumulated,FORMAT(c.quantityAccumulated,2)) REGEXP ", quotd(j5(`keyword`,'searchVal'))));
						SET @stmtbody = CONCAT_WS('',"
SELECT
'322' AS TOTAL,
c.id,
c.`code`,
c.account,
c.jd,
FORMAT(c.balance,2) AS balance,
c.creditAccumulated,
c.debitAccumulated,
c.quantityAccumulated
FROM
accountcode AS a
LEFT JOIN initibalance AS c ON a.`code` = c.`code`"
,CONCAT('\nWhere ',IF(IFNULL(@`WHERE`,'') = '',NULL,@`WHERE`))
);		

						
						SET	@stmtbody = CONCAT_WS('',@stmtbody,CONCAT("\nLIMIT ",j(`keyword`, "start"),',',j(`keyword` ,"number")));

			WHEN funid = '0' OR  funid = '1'  THEN

					SET @stmtbody = CONCAT_WS('',	"SELECT
CAST(a.`code` AS CHAR) AS missionIds,
CONCAT_WS('',a.`code`,' ',a.account) AS km
FROM initibalance AS a\n");

					IF funid = '0' THEN 
						SET @stmtbody = CONCAT_WS('',@stmtbody,"WHERE PREG_RLIKE(",QUOTE("/^\\d{4,4}$/"),",a.`code`)");
					END IF;


			WHEN funid = '2' THEN 

					SET @mo = json_extra(keyword,'a2');
					SET @stmtbody = CONCAT_WS('',"SELECT CONCAT_WS('',a.k2,' ',a.k3) AS account,money(a.k1) AS credit,money(a.k4) AS debit,a.k5 AS mo\n",
					"FROM temp_km AS a ",CONCAT("WHERE a.k5 =",@mo),"\n",
					"ORDER BY IF(a.k2 REGEXP '^[0-9]',a.k2,'hj')\n");

			WHEN funid = '3' OR funid = '4' THEN

					
					SET @a1 = json_extra(keyword,'a1'),
							@a2 = json_extra(keyword,'a2'),
							@account = json_extra(keyword,'account');

					SET @`code`= REGEXP_substr(j(keyword,'account'),'^[^\\s]+(?=\\s)');

					SET 
							@stmtbody = CONCAT_WS('',		"SELECT a.missionId , a.`code` AS `code` , a.account,\n",
																					"			@tdate := DATE(CONCAT_WS('-',a.a1,a.a2,a.a3)) AS DATE,CONCAT_WS(' - ',a.classic,a.num) AS  classic,a.note,\n",
																					"			FORMAT(a.debit,2) AS debit,FORMAT(a.credit,2) AS credit,money(SUM(@da := IFNULL(a.da,0)	+	IFNULL(a.debit	,0))) AS da,money(SUM(@ca :=	IFNULL(a.ca,0)	+	IFNULL(a.credit	,0))) AS ca,\n",
																					"			a.cord,money(ABS(@remain := IFNULL(a.remain,0)*IF(a.cord = '借',1,-1))) AS remain,\n",
																					"			money(@bda := 0) AS bda, money(@bca := 0) AS bca,\n",
																					"			LPAD('1',2,0) AS `month`\n",
																					"FROM inibalance AS a\n",
																					"WHERE a.`code` LIKE ",QUOTE(CONCAT_WS('',@`code`,"%"))),
							@sb_mo = CONCAT_WS('',	"SELECT  a.missionId,a.`code`,a.`code1`AS account,\n",
																			"			@tdate := COLUMN_get(a.acc_b,'date' AS DATE) AS `DATE`,CONCAT_WS(' - ',IF(IFNULL(b.a4,'') ='','记', b.a4),b.a5) AS classic,COLUMN_get(a.acc_b,0 AS char) AS note,\n",
																			"			money(a.b4) AS debit, money(a.b5) AS credit,\n",
																			"			NULLIF(FORMAT(@da :=	IFNULL(@da,0) + IFNULL(a.b4,0),2),0) AS da,NULLIF(FORMAT(@ca :=  IFNULL(@ca,0) + IFNULL(a.b5,0),2),0) AS ca,\n",
																			"			@fx := IF((@re:= @remain + @da -@ca) > 0 ,'借',IF(@re < 0,'贷','平'))	AS cord,money(ABS(@re)) AS remain,\n",
																			"			NULLIF(FORMAT(@bda := IF(@mo <> b.a2 +0 ,0,IFNULL(@bda,0)+ IFNULL(a.b4,0)),2),0)  AS bda,NULLIF(FORMAT(@bca := IF(@mo <> b.a2+0,0,@bca) + IFNULL(a.b5,0),2),0) AS bca,\n",
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

				IF funid = '4' THEN
					SET @stmtbody = CONCAT_WS('',@stmtbody," AND  a.missionId IS NULL");
				END IF;




			WHEN  funid = '6' THEN 
				SET @stmtbody = CONCAT_WS('',	"SELECT a.b1 \nFROM acc_standard_n AS a\nWHERE a.missionId = 'qianxue-15123115081130306' AND preg_rlike('/:|：|合计|总计/',a.b1) =0 ");


		else SELECT CONCAT("SOMEthing wrong, OR NO funid ON ",QUOTE(`funid`));

	END case;

	PREPARE stmt from  @stmtbody;
	EXECUTE stmt ;


END accslgl
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `accslgl_copy`
-- ----------------------------
DROP PROCEDURE IF EXISTS `accslgl_copy`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `accslgl_copy`(IN `funid` varchar(60) ,IN `keyword` longtext)
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
		SET @`errsql` = @stmtbody;SET @funid :=  NULL,
				@funid = CONCAT_WS(' ','Error：',REGEXP_substr("0	总分类账-科目表\n1 明细账-科目表\n2 科目汇总表\n3 明细账\n4 总分类账 \n6 报表项目明细 \n7 经济业务 \n8 期初余额\n9 科目代码表",CONCAT_WS('','(?ism)^\\s*' ,`funid` ,'\\s*[^\\d\\s]+'))
										,' Accslgl'),
				@pp = CONCAT_WS(',',QUOTE(`funid`),QUOTE(`p`));
		CALL `Audit_3`(COLUMN_create('m',@funid,'pp',@pp,'SQL',@`errsql`,'err',@`sqlstate`,'l',1));
END;/* */
/*
start TRANSACTION;
SET @funid :=NULL,
		@funid = CONCAT_WS(' ',REGEXP_substr("0	总分类账-科目表\n1 明细账-科目表\n2 科目汇总表\n3 明细账\n4 总分类账 \n6 报表项目明细 \n7 经济业务 \n8 期初余额\n9 科目代码表",CONCAT_WS('','(?ism)^\\s*' ,`funid` ,'\\s*[^\\d\\s]+'))

                ,' Accslgl'),
		@pp = CONCAT_WS(',',QUOTE(`funid`),QUOTE(`keyword`));
-- CALL `Audit_3`(COLUMN_create('m',@funid,'pp',@pp));COMMIT;

INSERT INTO plogs (Function_Name,parameter) VALUES (@funid,@pp);
commit;

LEAVE accslgl;
*/
	SET		@stmtbody = NULL;

SET keyword = REPLACE(keyword,'"category":"负载类%"','"category":"负债类%"');
	CASE  


			WHEN funid = '9' THEN

						SET		@stmtbody = CONCAT('LIMIT ',IF((@sn := CONCAT_WS(',',j5(`keyword`,"start"),j5(`keyword`,"number")))='' ,NULL,@sn)),
									@bnote = @bnote,
									@`WHERE` = CONCAT_WS(' AND ',CONCAT("b0.category LIKE  ",quotd(j5(`keyword`,'category'))),
																							 CONCAT("CONCAT_WS('',a.`code`,a.account,a.yefx,a.fsefx,a.note) REGEXP ", quotd(j5(`keyword`,'searchVal'))));
			
						SET		@stmtbody = CONCAT_WS('',	"
SELECT
a.id,
a.`code`,
a.account,
a.yefx,
a.fsefx,
a.note,
(c(@bnote := IF(IFNULL(b.note,'')='',@bnote,b.note))) AS account_title,
b0.category,
b0.note AS category_title
FROM
accountcode AS a
LEFT JOIN mysq1_schema.account AS b ON a.`code` = b.`code`
LEFT JOIN mysq1_schema.accountcode_category AS b0 ON SUBSTR(a.`code`,1,1)= b0.`code`",
CONCAT('\nWhere ',IF(IFNULL(@`WHERE`,'') = '',NULL,@`WHERE`)),"
ORDER BY a.`code`
",@stmtbody
);


			WHEN funid = '8' THEN

						SET @`WHERE` = CONCAT_WS(' AND ',CONCAT("CONCAT_WS('',a.`code`,a.account,a.yefx,a.fsefx,c.balance,FORMAT(c.balance,2),c.creditAccumulated,FORMAT(c.creditAccumulated,2),c.debitAccumulated,FORMAT(c.debitAccumulated,2),c.quantityAccumulated,FORMAT(c.quantityAccumulated,2)) REGEXP ", quotd(j5(`keyword`,'searchVal'))));
						SET @stmtbody = CONCAT_WS('',"
SELECT
'322' AS TOTAL,
c.id,
c.`code`,
c.account,
c.jd,
FORMAT(c.balance,2) AS balance,
c.creditAccumulated,
c.debitAccumulated,
c.quantityAccumulated
FROM
accountcode AS a
LEFT JOIN initibalance AS c ON a.`code` = c.`code`"
,CONCAT('\nWhere ',IF(IFNULL(@`WHERE`,'') = '',NULL,@`WHERE`))
);		

						
						SET	@stmtbody = CONCAT_WS('',@stmtbody,CONCAT("\nLIMIT ",j(`keyword`, "start"),',',j(`keyword` ,"number")));

			WHEN funid = '0' OR  funid = '1'  THEN

					SET @stmtbody = CONCAT_WS('',	"SELECT
CAST(a.`code` AS CHAR) AS missionIds,
CONCAT_WS('',a.`code`,' ',a.account) AS km
FROM initibalance AS a\n");

					IF funid = '0' THEN 
						SET @stmtbody = CONCAT_WS('',@stmtbody,"WHERE PREG_RLIKE(",QUOTE("/^\\d{4,4}$/"),",a.`code`)");
					END IF;


			WHEN funid = '2' THEN 

					SET @mo = json_extra(keyword,'a2');
					SET @stmtbody = CONCAT_WS('',"SELECT CONCAT_WS('',a.k2,' ',a.k3) AS account,money(a.k1) AS credit,money(a.k4) AS debit,a.k5 AS mo\n",
					"FROM temp_km AS a ",CONCAT("WHERE a.k5 =",@mo),"\n",
					"ORDER BY IF(a.k2 REGEXP '^[0-9]',a.k2,'hj')\n");

			WHEN funid = '3' OR funid = '4' THEN

					
					SET @a1 = json_extra(keyword,'a1'),
							@a2 = json_extra(keyword,'a2'),
							@account = json_extra(keyword,'account');

					SET @`code`= REGEXP_substr(j(keyword,'account'),'^[^\\s]+(?=\\s)');

					SET 
							@stmtbody = CONCAT_WS('',		"SELECT a.missionId , a.`code` AS `code` , a.account,\n",
																					"			@tdate := DATE(CONCAT_WS('-',a.a1,a.a2,a.a3)) AS DATE,CONCAT_WS(' - ',a.classic,a.num) AS  classic,a.note,\n",
																					"			FORMAT(a.debit,2) AS debit,FORMAT(a.credit,2) AS credit,money(SUM(@da := IFNULL(a.da,0)	+	IFNULL(a.debit	,0))) AS da,money(SUM(@ca :=	IFNULL(a.ca,0)	+	IFNULL(a.credit	,0))) AS ca,\n",
																					"			a.cord,money(ABS(@remain := IFNULL(a.remain,0)*IF(a.cord = '借',1,-1))) AS remain,\n",
																					"			money(@bda := 0) AS bda, money(@bca := 0) AS bca,\n",
																					"			LPAD('1',2,0) AS `month`\n",
																					"FROM inibalance AS a\n",
																					"WHERE a.`code` LIKE ",QUOTE(CONCAT_WS('',@`code`,"%"))),
							@sb_mo = CONCAT_WS('',	"SELECT  a.missionId,a.`code`,a.`code1`AS account,\n",
																			"			@tdate := COLUMN_get(a.acc_b,'date' AS DATE) AS `DATE`,CONCAT_WS(' - ',IF(IFNULL(b.a4,'') ='','记', b.a4),b.a5) AS classic,COLUMN_get(a.acc_b,0 AS char) AS note,\n",
																			"			money(a.b4) AS debit, money(a.b5) AS credit,\n",
																			"			NULLIF(FORMAT(@da :=	IFNULL(@da,0) + IFNULL(a.b4,0),2),0) AS da,NULLIF(FORMAT(@ca :=  IFNULL(@ca,0) + IFNULL(a.b5,0),2),0) AS ca,\n",
																			"			@fx := IF((@re:= @remain + @da -@ca) > 0 ,'借',IF(@re < 0,'贷','平'))	AS cord,money(ABS(@re)) AS remain,\n",
																			"			NULLIF(FORMAT(@bda := IF(@mo <> b.a2 +0 ,0,IFNULL(@bda,0)+ IFNULL(a.b4,0)),2),0)  AS bda,NULLIF(FORMAT(@bca := IF(@mo <> b.a2+0,0,@bca) + IFNULL(a.b5,0),2),0) AS bca,\n",
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

				IF funid = '4' THEN
					SET @stmtbody = CONCAT_WS('',@stmtbody," AND  a.missionId IS NULL");
				END IF;




			WHEN  funid = '6' THEN 
				SET @stmtbody = CONCAT_WS('',	"SELECT a.b1 \nFROM acc_standard_n AS a\nWHERE a.missionId = 'qianxue-15123115081130306' AND preg_rlike('/:|：|合计|总计/',a.b1) =0 ");


		else SELECT CONCAT("SOMEthing wrong, OR NO funid ON ",QUOTE(`funid`));

	END case;
SELECT  @stmtbody; LEAVE accslgl;
	PREPARE stmt from  @stmtbody;
	EXECUTE stmt ;


END accslgl
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `accslgl_n`
-- ----------------------------
DROP PROCEDURE IF EXISTS `accslgl_n`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `accslgl_n`(IN `funcid` varchar(60) ,IN `p` longtext)
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

INSERT INTO plogs (Function_Name,parameter) VALUES (@funcid,@pp);
commit;
/*
LEAVE accslgl;
*/
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
		
						SET		@stmtbody = CONCAT_WS('\n',	"SELECT\na.id,\na.`code`,\nTRIM(a.account) AS account,\na.yefx,\na.fsefx,\na.note,\n(c(@bnote := IF(ifnulll(b.note,'')='',@bnote,b.note))) AS account_title,\nb0.category,\nb0.note AS category_title","FROM\naccountcode AS a\nLEFT JOIN mysq1_schema.account AS b ON a.`code` = b.`code`\nLEFT JOIN mysq1_schema.accountcode_category AS b0 ON SUBSTR(a.`code`,1,1)= b0.`code`"),
									@bnote = j0(`p`,"codefield") ;

						
							CASE 
									WHEN ifnulll(@bnote,'') = '' THEN
											SET @stmtbody = @stmtbody ;
									WHEN @bnote = 'b2' THEN
											SET @`WHERE` = CONCAT_WS(' AND\n',@`WHERE`, 'CHAR_LENGTH(a.`code`) <=4');
									WHEN @bnote = 'b3' THEN 
											SET @stmtbody = CONCAT_WS('\n',@stmtbody,"INNER JOIN accountcode AS c ON CHAR_LENGTH(c.`code`) <= 4 AND a.`code` LIKE  CONCAT(c.`code`,'%') "),
													@`WHERE` = CONCAT_WS(' AND\n',@`WHERE`, 'CHAR_LENGTH(a.`code`) >4',CONCAT("c.`account` LIKE ",QUOTEj(CONCAT('%',j5( `p`,"b2"),'%'))));
							END CASE;


						SET		@stmtbody = CONCAT_WS('\n',@stmtbody,CONCAT('Where ',IF(ifnulll(@`WHERE`,'') = '',NULL,@`WHERE`)),"ORDER BY a.`code`",@`limit`);


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

				IF ifnulll(period,'') ='' THEN
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
																					"			FORMAT(a.debit,2) AS debit,FORMAT(a.credit,2) AS credit,money(SUM(@da := ifnulll(a.da,0)	+	ifnulll(a.debit	,0))) AS da,money(SUM(@ca :=	ifnulll(a.ca,0)	+	ifnulll(a.credit	,0))) AS ca,\n",
																					"			a.cord,money(ABS(@remain := ifnulll(a.remain,0)*IF(a.cord = '借',1,-1))) AS remain,\n",
																					"			money(@bda := 0) AS bda, money(@bca := 0) AS bca,\n",
																					"			LPAD('1',2,0) AS `month`\n",
																					"FROM inibalance AS a\n"
																					,@`where`
																							),
							@sb_mo = CONCAT_WS('',	"SELECT  a.missionId,a.`code`,a.`code1`AS account,\n",
																			"			@tdate := COLUMN_get(a.acc_b,'date' AS DATE) AS `DATE`,CONCAT_WS(' - ',IF(ifnulll(b.a4,'') ='','记', b.a4),b.a5) AS classic,COLUMN_get(a.acc_b,0 AS char) AS note,\n",
																			"			money(a.b4) AS debit, money(a.b5) AS credit,\n",
																			"			money(@da :=	ifnulll(@da,0) + ifnulll(a.b4,0)) AS da,money(@ca :=  ifnulll(@ca,0) + ifnulll(a.b5,0)) AS ca,\n",
																			"			@fx := IF((@re:= @remain + @da -@ca) > 0 ,'借',IF(@re < 0,'贷','平'))	AS cord,money(ABS(@re)) AS remain,\n",
																			"			money(@bda := IF(@mo <> b.a2 +0 ,0,ifnulll(@bda,0)) + ifnulll(a.b4,0)) AS bda,money(@bca := IF(@mo <> b.a2+0,0,@bca) + ifnulll(a.b5,0)) AS bca,\n",
																			"			LPAD(@mo := IF(ifnulll(@mo,0) <> b.a2+0,b.a2,@mo),2,0) AS `month`\n",
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
SELECT @stmtbody; LEAVE accslgl;
-- SELECT @stmtbody;
				PREPARE accslgl_stmt from  @stmtbody;	EXECUTE accslgl_stmt ;DEALLOCATE PREPARE accslgl_stmt ; LEAVE accslgl;

			END;

			WHEN	funcid = '7' THEN
				BEGIN
					DECLARE `i` VARCHAR(5) DEFAULT NULL;

					SET i =IF(ifnulll(j0(`p` ,"expid"),'') = '',NULL,1);

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
									WHEN ifnulll(`SQL`,'') = '' OR `SQL` REGEXP '(?i)select'  THEN 
											IF ifnulll(@enter,"") <> '' THEN
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


	SET @vaule = NULL,

		@vaule = CONCAT("INSERT INTO plogs(Function_Name,Summary,statu)
										VALUES(",QUOTE(NAME_),",",QUOTE(Summary),",",QUOTE(statu),")");


PREPARE stmt FROM @vaule ;
EXECUTE stmt ;
DEALLOCATE PREPARE stmt;


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


	SET @vaule = NULL,
	 		@DBLOB =DBLOB,

		@vaule = CONCAT("INSERT INTO plogs(Function_Name,Summary,DBLOB)
										VALUES(",QUOTE(NAME_),",",if(`Summary` IS NULL AND dblob IS NOT NULL,QUOTE(dblob),QUOTE(Summary)),",?)");

PREPARE stmt FROM @vaule ;
EXECUTE stmt USING @DBLOB;
DEALLOCATE PREPARE stmt;


END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Audit_3`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Audit_3`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Audit_3`(IN `p` longblob)
Audit_3:BEGIN	DECLARE err text DEFAULT NULL ;DECLARE eno INT DEFAULT 0;


	IF JSON_VALID(p) THEN  	SET @am = CONCAT_WS('','set @am = COLUMN_create(',REGEXP_replace(p,'(?s).*?("(?3)"):("((?:\\\\.|[^"])+)")(?:(,)|})','\\1,\\2\\4'),')'); EXECUTE IMMEDIATE @am; SET p = @am;  END IF ;

START TRANSACTION;
	IF ! COLUMN_check(p) THEN INSERT INTO	plogs(Function_Name,summary,parameter)VALUE('Audit_3','',`p`); END IF;

	SET err = column_get(p,'err'AS CHAR ),@am = NULL;

	SET @am = CONCAT_WS('   ',COLUMN_get(p,'m' AS CHAR )
							,IF(IFNULL(column_get(`p`,'l' AS CHAR),'') = '' ,NULL,CONCAT_WS(': ','Level',column_get(`p`,'l' AS CHAR)))),
			@aparameter =column_get(p,'pp' AS CHAR ),
			@`summ` := column_get(p,'summ' AS CHAR ),
			@`summ` =IF(IFNULL(err,'') = '' AND IFNULL(@`summ`,'') = '','记录参数',CONCAT_WS(',',@`summ`,CONCAT_WS(' - ',json_value(err,'$.errno'),json_value(err,'$.text')))),
			@`SQL` = NULLIF(COLUMN_get(p,'SQL'AS CHAR),'');

	UPDATE plogs AS a SET 			a.number = IFNULL(a.number,0) +1, a.summary = @`summ`,		a.parameter = @`aparameter`,a.`sql`=@`SQL`
,a.dblob = COLUMN_get(p ,'dblob' AS BINARY )
	WHERE a.Function_Name = @am AND a.`function_name` = @am
	AND IF(IFNULL(column_get(`p`,'l' AS CHAR),'') = '' ,1, a.parameter = @`aparameter`)
; 

	IF ROW_COUNT() = 0 THEN 				
		INSERT INTO	plogs(Function_Name,summary,parameter,`SQL`,number,dblob) VALUE(@`am`,@`summ`,@aparameter,@`SQL`,1,COLUMN_get(p ,'dblob' AS BINARY ));
	END IF;	
	SET @am = NULL, @`aparameter` = NULL , @`summ` = NULL;

COMMIT;

	IF IFNULL(err,'') <> '' THEN 
			SET  eno =  json_value(err,'$.errno'),
					err= IFNULL(SUBSTR(IFNULL(json_value(err,'$.text'),''),1,120),'MESSAGE_TEXT  is null');
			SIGNAL SQLSTATE 'HY000' SET MYSQL_ERRNO =eno , MESSAGE_TEXT = err ;
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
	

	DECLARE p2 VARCHAR(2000) DEFAULT j(b,'p2');

	IF IFNULL(p2,'') = '' THEN LEAVE bl;END IF;
	BEGIN

		DECLARE `funid` VARCHAR(1) DEFAULT NULL ;
		DECLARE `billid` VARCHAR(30) DEFAULT NULL ;
 
		SET `funid` = j(p2,'funid'), `billid` = j(p2,'billid');
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
				DECLARE `v4k` VARCHAR(2000) DEFAULT Eltm(`kn`,CONCAT_WS(',',quotn(j(p2,Fetch_Elt(1,`kfield`))),quotn(j(p2,Fetch_Elt(2,`kfield`))),quotn(j(p2,Fetch_Elt(3,`kfield`)))));


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

),

				@stmt2 =	CONCAT('SELECT ',`v4k`,',',f2(@r,@stmt2),IF(dfield IS NULL,' ',')'));

				SET @stmt2 :=	CONCAT_WS(' UNION\n',CONCAT_WS('\t','SELECT',REGEXP_replace(`field`,r('4elt2'),'NULL AS \\1\\2')),@stmt2),
						@stmt2 = CONCAT_WS('','SELECT a.* FROM (\n',@stmt2,'\n)AS a WHERE ',`WHERE`);



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

							PREPARE stmt2 FROM @stmt1;					EXECUTE stmt2; 
							SET i:=i+1;
					END LOOP;

				END;

			END;
		ELSE SELECT NULL;
	END CASE;



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
	

	DECLARE p2 VARCHAR(2000) DEFAULT j(b,'p2');


SELECT 

@k := 't_flow_question_task' AS `keywod`
,@r0 := COLUMN_create(1,column_create(1, CONCAT('(?ims)(^',@rhead,@k,'\\(.*?(?<=values\\()',r('4elt5'),'(?:,(?&f))*\\).*?</sql>[\\n\\r]+)|.'),2,'\\1')) AS `REG0`
,@a0 :=f(@r0,@a) AS `抓数据`
,@a0 
,@f :=CONCAT_WS('',REGEXP_substr(@a0,'^.+?\\(\\K(.+?)(?=\\)valu)'),'')AS `oFIELDs`,@r1 :=  NULL
 
AS r1 ,@f := f(@r1,@f)AS `2FIELDS` 
,CONCAT('(?m)((?:',r('4elt'), ',){3})((?:(?&f),){11})((?:(?&f),){4})(.*?(?=[\\r\\n]+|$))')
,@`ttable` := '' ,@`tfields` := IF(IFNULL(@`ttable`,'') ='', @f,CONCAT(
'' 
,',dblob')) as tfields
,@n := Eltm(0,@`tfields`) AS `tn`,@sn := Eltm(0,@`f`) AS `sn`,@dn := IF(@n = @sn,NULL,@sn - @n+1) AS `dn`,@`dfield` := IF(@`dn` IS NULL ,NULL,Eltm(-@n+1,@f)) AS `dfields`
,CONCAT('(?i)(?:[^\'"\\r\\n]+values\\((?=[\'"]))|(?:\\s*\\]\\]></sql>)')
,@r := COLUMN_create(
1,COLUMN_create(1,CONCAT_WS('','(?i)(?:[^\'"\\r\\n]+values\\((?=[\'"]))|(?:',IF(@`dn` IS NULL,@`dn`,'\\('),'\\s*\\]\\]></sql>)')) 
 
,20,COLUMN_create( 1,CONCAT('(?ism)',r('4elt3'),'((?:,(?&f)){',@dn,'}\\))([\\n\\r]*)'),2,CONCAT('\\1,column_create(@i:=0,',QUOTE(@`dfield`),'\\2\\3'))
,30,COLUMN_create(1,CONCAT(r('4elt5'),'(?=(?:\,(?&f)){0,',@dn-1,'}\\))'),2,'@i:=@i+1,\\3\\1')

) REG
,@a2 := f(@r,@a0) AS result

,CONCAT_WS(';\n',CONCAT_WS('\n'  ,IF(IFNULL(@`ttable`,'') <> '', CONCAT_WS(' ',"REPLACE INTO",@`ttable`,"(",@`tfields`,")"), IF((SELECT  a.TABLE_SCHEMA FROM information_schema.`TABLES` AS a WHERE a.TABLE_SCHEMA = DATABASE() AND a.TABLE_NAME = @k) IS NULL  ,CONCAT_WS(' ',"CREATE TABLE",@k,'AS') 	,CONCAT_WS(' ',"REPLACE INTO",@k,CONCAT('(',@`tfields`,')')))),"SELECT a.* FROM(SELECT a.* FROM(",CONCAT_WS(' ',"SELECT	",REGEXP_REPLACE(@`tfields`,CONCAT(r('4elt3'),'(?=,|$)'),'NULL AS \\1'),"UNION" )  ,CONCAT("SELECT	",@a2)  ,CONCAT_WS(' ',") AS a WHERE" ,CONCAT("a.",Eltm(1,@`tfields`)),"IS NOT NULL) AS a"))) AS `SQL`

;


	
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
			SET `d` = j(`d`,'b');
			
		ELSE SET @ok = 'ok';
	END CASE;



	label:LOOP
				SET `res0` = REGEXP_substr(`d`,`r0`);

				IF `res0` = '' THEN LEAVE label;END IF;

				SET	`r` =  CONCAT(REGEXP_replace(`res0`,`r0`,'\\1')),
						`r` =  CONCAT('(?:^,)?(?:((?iJx),?',`r`,':"(?:\\\\.|[^"])*")|((?:,?"\\w+")(?::"(?:\\\\.|[^"])*")))(?:,$)?'),
						`res` = CONCAT_WS(',',`res`,filter1(CONCAT(`r`,'\t\\1'),`d`)),
						`d` = filter1(CONCAT(`r`,'\t\\2'),`d`)
;

	
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

				nece ='==,||,&&,##￥,^^';



		SET	field_br = REPLACE(field_br,'//','||'),
				field_br = TRIM(field_br),
				field_  = TRIM(field_), 

				field_br = REPLACE(field_br,'====','^^');

				



		IF FIND_IN_SET(SUBSTR(field_br,1,2),nece)=0 THEN
				SET field_br = concat('??',field_br);
		END IF;

		SET field_br = replace(field_br,'??','||');
	

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

			SET _frag ='',
					field_br = substr(field_br,v1+1);

		UNTIL field_br = ''	
		END REPEAT ;



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
	

	DECLARE `id` VARCHAR(5) DEFAULT  j(p,'id');
	DECLARE expId VARCHAR(60) DEFAULT j3(p,"expId");
	



  DECLARE CONTINUE HANDLER FOR  SQLSTATE '23000', SQLSTATE	'42000'	, SQLSTATE	'42S22'
	BEGIN GET DIAGNOSTICS CONDITION 1 @`sqlstate` = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;SET  @`sqlstate` = JSON_OBJECT('sqlstate',@`sqlstate`,'errno',@errno,'text',@text);
			 	SET @funcid := `id`;
				CALL `Audit_3`(COLUMN_create('m',CONCAT_WS(' ','Error: ',@funcid, ' busy' ),'err',@`sqlstate`,'SQL',@`p1_body`,'pp',QUOTE(`p`)));
	END;



	SET @s1=NULL,@s2 = NULL,@s20 = NULL,@s3 = NULL,@s4 = NULL,
			@manu = NULL;
	CASE
		WHEN IFNULL(expid,'') <> '' OR `id` = 7 THEN 

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
		
		IF  IFNULL(j(`p`,"backInfo"),'') = 'bk' THEN
				SET s20 = "LEFT JOIN acc_mission_back_information AS b25 ON b2.contentType = 'kj' AND b25.type = 'bk' AND b2.missionid = b25.missionid\nLEFT JOIN acc_mission AS b3 ON b2.contentType = 'kj' AND b2.missionid = b3.missionId OR b25.quoteid = b3.missionId\nLEFT JOIN  `mysq1_schema`.bill_list AS b30 ON b2.contentType = 'kj' AND b3.billid =  b30.billid\nLEFT JOIN exp_courseware_cells AS b4 ON b2.missionid = b4.unique_id\nLEFT JOIN mysq1_schema.media_library AS b5 ON b2.contentType = 'edit' AND b4.unique_id = b5.missionID",
             s0 = "CONCAT_WS('.',b1.node_No,b2.typesort) AS `CODE`,\n@sort := IF(b25.quoteid = b3.missionId,b25.sort,NULL)AS sort,\n CONCAT_WS('.',b2.typesort,@sort) AS typesort,\nIF(b25.quoteid = b3.missionId,b3.missionlabel,IF(b2.title IS NOT NULL ,b2.title ,IFNULL(IF(b2.contentType = 'kj',b3.missionLabel,b4.title),''))) AS title,\nIF(b2.contentType = 'kj' AND FIND_IN_SET(b3.billId,'kjan_a-e,kjan_a-f,kjan_abcd,kjan_dtb,kjqt_kjfl00_kjfl'),'test',IF(b25.quoteid = b3.missionId,'bk',b2.contentType))  AS contentType",
						@s4 ="ORDER BY CONCAT_WS('.',b1.node_No,b2.typesort,IF(b25.quoteid = b3.missionId,b25.sort,NULL))" ;

		END IF;

		SET @s = NULL,
				@s1 = CONCAT_WS(',',s0,s1) ;
		SET @s = CONCAT_WS('\n','SELECT',@s1,'FROM',@s2,s2,@s20,s20,'WHERE',CONCAT_WS('\tAND\n',s3,@s3),@s4,CONCAT('LIMIT ',j(`P`,'LIMIT')));
  
		PREPARE s FROM @s;
		EXECUTE s ;
		DEALLOCATE PREPARE s;
	END;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `busy_copy`
-- ----------------------------
DROP PROCEDURE IF EXISTS `busy_copy`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `busy_copy`(IN `p` varchar(200))
    DETERMINISTIC
busyl:BEGIN
	

	DECLARE `id` VARCHAR(5) DEFAULT  j(p,'id');
	DECLARE expId VARCHAR(60) DEFAULT j3(p,"expId");
	
	




	SET @s1=NULL,@s2 = NULL,@s20 = NULL,@s3 = NULL ;
	CASE
		WHEN IFNULL(expid,'') <> '' OR `id` = 7 THEN 

			BEGIN
				DECLARE `classNo` VARCHAR(60) DEFAULT j3(p,'classNo');
				IF `classNo` IS NULL OR `expid` IS NULL THEN SELECT '7';LEAVE busyl; END IF;
				SET @s2 = 'exp_experimentclassstudent AS a\nINNER JOIN exp_experimentclass AS a0 ON a.classNo = a0.classNo\nINNER JOIN exp_experimentclass_course AS a1 ON a1.classNo = a0.classNo\nINNER JOIN exp_courses AS b0 ON a1.courseNo = b0.courseNo',
						@s20 = 'LEFT JOIN qianxue_test.exp_cour_node_cont AS b20 ON b20.contentNo = b2.contentNo AND b20.typesort = b2.typesort AND b20.missionid = b2.missionid AND b20.classNo = a1.classNo AND b20.courseNo = a1.courseNo',
						@s3 = CONCAT_WS('\tAND\n',CONCAT('a.expNo = ',expId),CONCAT('a.classNo = ',`classNo`),'b20.classNo IS NULL');
			END;


		
	 ELSE  SET @s2='exp_courses AS b0';
	END case;

	BEGIN
		DECLARE s1 VARCHAR(1000) DEFAULT "b1.node_courseNo,\nb1.contentNo,\nb2.missionid,\nCONCAT_WS('.',b1.node_No,b2.typesort) AS `CODE`,\nb2.typesort,\nb2.contentType,\nIF(b2.contentType = 'kj' AND FIND_IN_SET(b3.billId,'kjan_a-e,kjan_a-f,kjan_abcd,kjan_dtb,kjqt_kjfl00_kjfl'),'test',b2.contentType)  AS N,\nIF(b2.contentType = 'kj',b3.referencedId,b4.referencedID) AS referencedID,\nIF(b2.title IS NOT NULL ,b2.title ,IFNULL(IF(b2.contentType = 'kj',b3.missionLabel,b4.title),'')) AS title,\nb4.fileID AS fileURL,\nb4.edit0_file1_url2,\nb4.url,\nb4.detail,\n'说明' AS file_detail,\nIF(b2.contentType = 'edit' AND b5.fileName IS NULL ,'wenzi.pdf', b5.fileName) AS fileName,\nNULL AS dblob";
		DECLARE s2 VARCHAR(1000) DEFAULT "INNER JOIN exp_courses_node AS b1 ON b1.node_courseNo = b0.courseNo\nINNER JOIN exp_courses_node_content AS b2 ON b2.contentNo = b1.contentNo";
		DECLARE s20 VARCHAR(1000) DEFAULT "LEFT JOIN acc_mission AS b3 ON b2.contentType = 'kj' AND b2.missionid = b3.missionId\nLEFT JOIN exp_courseware_cells AS b4 ON b2.missionid = b4.unique_id\nLEFT JOIN mysq1_schema.media_library AS b5 ON b2.contentType = 'edit' AND b4.unique_id = b5.missionID";
    DECLARE s3 VARCHAR(1000) DEFAULT CONCAT_WS('\tAND\n',CONCAT('b1.node_courseNo = ',j3(p,'courseNo')),CONCAT('b1.contentNo = ',j3(p,"contentNo")),CONCAT('b2.contentType = ',j3(p,'contentType')));
		SET @s = NULL;
		SET @s = CONCAT_WS('\n','SELECT',s1,'FROM',@s2,s2,@s20,s20,'WHERE',CONCAT_WS('\tAND\n',s3,@s3));


		PREPARE s FROM @s;
		EXECUTE s ;
		DEALLOCATE PREPARE s;
	END;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `c`
-- ----------------------------
DROP FUNCTION IF EXISTS `c`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `c`(`w` longblob) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	

	RETURN w;
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
CREATE DEFINER=`root`@`localhost` FUNCTION `calcuscore`(classno varchar(20),expno varchar(60)) RETURNS varchar(200) CHARSET utf8mb3
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN

			CASE 
				when  classno is not null  then 
							SET @classno = classno, @expno = '' ;

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


DROP TEMPORARY TABLE IF EXISTS cur1;
CREATE TEMPORARY TABLE cur1
AS
										SELECT
										a.expNo,

										d.mission_total as total ,
										Sum(c.score) AS score,
										Sum(c.read_ans_size) AS read_ans_size,
										Sum(c.mission_result) AS mission_result,
										Sum(c.log_count) AS log_count,

										count(c.score) AS done ,
										sum(Inscore(IFNULL(c.score,0) ,0,60)) AS bad, 
										SUM(inscore(c.score,60,70)) as good,
										SUM(inscore(c.score,70,80)) AS better,
										SUM(inscore(c.score,90,150)) as perfect,
										a.statu  
										FROM exp_experimentclassstudent AS a
										INNER JOIN acc_1 AS c ON a.expNo = c.expid

										INNER JOIN exp_experimentclass as d on a.classNo = d.classNo
										WHERE 
										
										a.statu is not NULL  AND 
										instr(a.expno , @expno)AND 
										instr(a.classno , @classno)
										GROUP BY
										a.expNo;


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
							a.statu = null 
		where a.expNo = b.expNo  ;

		if FOUND_ROWS() = 0 OR  (@classno is null and  expno )then 
				return concat('3-RecS:',FOUND_ROWS(),'Deal--Exp',IFNULL(expno, 'null'),'--ClaNo:',IFNULL(@classno,'NULL'));
		end if ;

DROP TEMPORARY TABLE IF EXISTS cur1;

   
   



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
			set a.rowid = b.rowid1
			WHERE a.expno = b.expno ;

  UPDATE exp_experimentclass as a
		set a.statu = null
	WHERE a.statu is not NULL  AND instr(a.classno , @classno);

RETURN  concat('5-DealRecS',FOUND_ROWS()) ;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `capt`
-- ----------------------------
DROP FUNCTION IF EXISTS `capt`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `capt`(`r` varchar(200),`v` blob) RETURNS text CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	
  SET `r` = preg_replace('/\\s*/','',`r`);
	IF NOT preg_rlike('/^\\/.*\\/[is]*$/',`r`) THEN
			SET `r` =CONCAT('/',`r`,'/');
			IF	NOT preg_rlike('/^\\/.*\\/$/',`r`) THEN 
					RETURN NULL;
		END IF;
	END IF;

	IF NOT preg_check(`r`) THEN RETURN NULL; END IF;
	RETURN preg_capture(`r`,`v`);

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `capture`
-- ----------------------------
DROP FUNCTION IF EXISTS `capture`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `capture`(`r` varchar(200),`v` blob) RETURNS text CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	
  SET `r` = preg_replace('/\\s*/','',`r`);
	IF NOT preg_rlike('/^\\/.*\\/[is]*$/',`r`) THEN
			SET `r` =CONCAT('/',`r`,'/');
			IF	NOT preg_rlike('/^\\/.*\\/$/',`r`) THEN 
					RETURN NULL;
		END IF;
	END IF;

	IF NOT preg_check(`r`) THEN RETURN NULL; END IF;
	RETURN preg_capture(`r`,`v`);

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
--  Procedure definition for `changeOrder_copy`
-- ----------------------------
DROP FUNCTION IF EXISTS `changeOrder_copy`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `changeOrder_copy`(`k` tinytext, `a`  tinytext,`b`  tinytext,`av` longtext,`bv` longtext) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	
	DECLARE y TINYINT DEFAULT 0 ;DECLARE x TINYINT DEFAULT 0;
	DECLARE r LONGTEXT DEFAULT NULL;DECLARE rs LONGTEXT DEFAULT NULL;



  IF k IS NULL AND  a IS NULL AND b IS NULL OR NOT PREG_RLIKE('/^\\w+(,\\w+)*$/',CONCAT_WS(',',k,a,b))  THEN
		RETURN a;
	END IF;


	SET av = Fetch_Sub(k,av);RETURN 'ok';
	IF av IS NULL OR preg_rlike('/^(?<F>\"\\\'\\d\\\',NULL(,NULL)*\")(,\\g<F>)*$/',av) THEN RETURN a;END IF;
	SET bv = Fetch_Sub(k,bv);
	IF bv IS NULL OR preg_rlike('/^(?<F>\"\\\'\\d\\\',NULL(,NULL)*\")(,\\g<F>)*$/',bv)THEN RETURN a;END IF;

	y:LOOP
		SET y = y + 1;

		IF Fetch_Elt(y,a) IS NULL THEN LEAVE y; END IF; 
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
	

	RETURN preg_replace('/((?>"((?:[^\\\\"]|\\\\.)*)"))|([:,{}])|[\\s]/','$1$3',v) ;
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
set @period = period ,
	@a = 1;
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
							a.period =  (UNIX_TIMESTAMP( a.endtime )-UNIX_TIMESTAMP(a.starttime))/a.cycle,
							updatetime = @a ;
			
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
--  Procedure definition for `dom2j`
-- ----------------------------
DROP FUNCTION IF EXISTS `dom2j`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `dom2j`(`d` mediumblob) RETURNS mediumtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	
	DECLARE `0` VARCHAR(2000) DEFAULT NULL;
	DECLARE `r` VARCHAR(1000) DEFAULT '^"`[0123]`":["{]';

	IF d REGEXP `r` THEN

		CASE	WHEN `d` REGEXP '^"`[0]`":["{]' THEN
						SET `0` = CONCAT('"`0`":{',j(`d`,"`0`"),'}');
					WHEN d REGEXP '^"`[1]`":["{]' THEN
						SET `0` = CONCAT('"`1`":',j2(`d`,"`1`"));
					WHEN d REGEXP '^"`[2]`":["{]' THEN
						SET `0` = CONCAT('"`2`":',j2(`d`,"`2`"));
					WHEN d REGEXP '^"`3`":["{]' THEN

						SET `0` = CONCAT(	'"`3`":',j2(`d`,"`3`"));

			ELSE SET `0` = NULL ; 
		END CASE;

		IF `0` IS NOT NULL THEN SET	`d` = REGEXP_REPLACE(`d`,CONCAT('(?:,?(?:"(?&c)":)',r('`json1`'),'\s*)*'),''); END IF;

	END IF;

	IF 	IFNULL(`d`,'') = '' THEN RETURN NULL; END IF;

	SET `d` = f2(REG2('`Dom2kwn`'),`d`);

	IF `0` IS NOT NULL AND IFNULL(j(`0`,'`1`'),'') <> '' THEN

			SET	d = f2(j(`0`,'`1`'),d);

	END IF;

	SET	`d` = CONCAT_WS(','
	 						,if(`d` REGEXP '"a\\d{1,3}"'  ,CONCAT('"a":{',filter1(REG2('`geta`'),`d`),'}'),NULL)
							,if(`d` REGEXP '"b\\d{1,3}"'  ,CONCAT('"b":',b2j(filter1(REG2('`getb`'),`d`)),''),NULL)
	 						,if(`d` REGEXP '"t\\d{1,3}"'  ,CONCAT('"t":{',filter1(REG2('`gett`'),`d`),'}'),NULL)
						);
	SET		`d` = filter1(r('`,`\t'),`d`);

	IF `0` IS NOT NULL AND IFNULL(j(`0`,'`2`'),'') <> '' THEN
			SET d = f2(j(`0`,'`2`'),`d`);
	END IF;


	IF `0` IS NOT NULL AND IFNULL(j(`0`,'`3`'),'') <> '' THEN

			SET d = f2(j(`0`,'`3`'),`d`);
	END IF;
	RETURN `d`;

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
									SET i := REGEXP_replace(i,'(^\\s*-)','') ,r = CONCAT('(?s)^(?&c)(,',r,CONCAT(')*?(?=,',i,')')),i=-1;
							ELSE	SET r = CONCAT('(?s)^(?&c)(,',r,CONCAT(')*?(?=,',i,')')),i=1;
						END CASE;
				WHEN IFNULL(i,0) = 0   THEN RETURN CHAR_LENGTH(REGEXP_replace(v,CONCAT(r,'(,|$)'),'\\2'))+1;
				WHEN ABS(i) =1 THEN SET r = CONCAT('(?s)^',r);
 				WHEN ABS(i) =2 THEN SET r = CONCAT('(?s)^(?&c)\\s*,',r);
			ELSE 	SET r = CONCAT('(?s)^\\s*(?&c)\\s*(?:,\\s*(?&c)){',ABS(i)-2,'}\\s*,',r);
   END CASE;


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
	
	DECLARE i INT(5) DEFAULT NULL;
	DECLARE `ak` TINYBLOB DEFAULT NULL;


	SET `ak` = column_get(v ,0 AS CHAR);

	IF `k` IS NOT NULL  THEN
			SET i = FIND_IN_SET(`k`,`ak`);


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
--  Procedure definition for `Error`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Error`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Error`(IN `m` longtext)
BEGIN
	

		SIGNAL SQLSTATE 'HY000' SET MESSAGE_TEXT =  m; 
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
CREATE DEFINER=`root`@`%` FUNCTION `f`(`k` blob,`t` mediumblob) RETURNS mediumtext CHARSET utf8mb3
    READS SQL DATA
    DETERMINISTIC
BEGIN
	
  
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
	
  
	RETURN filter2(`k`,`t`);
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

	END LOOP label1 ;

	RETURN @word;


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
	
	 DECLARE EXIT  HANDLER FOR  SQLSTATE '42S22' SET results_ =null; 
 	 DECLARE EXIT  HANDLER FOR  SQLSTATE '42000' SET results_ =null; 

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
	
	 DECLARE EXIT  HANDLER FOR  SQLSTATE '42S22'  SET results_ =null; 
 	 DECLARE EXIT  HANDLER FOR  SQLSTATE '42000'  SET results_ =null; 

		CASE 
      WHEN  x IS  NULL THEN  
				LEAVE p1;
			WHEN IFNULL(vstring,'') = '' THEN 
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
	
	DECLARE n INT(2);
	SET n = 1,@results = NULL;


	label1:LOOP

		CALL Fetch_Set_P(fieldvalues,n,1);

		CASE 
			WHEN @results = fields_ THEN
				CALL Fetch_Set_P(fieldvalues,n,NULL);

				SET fieldvalues = @results,
		
						resultvalues = SUBSTR(fieldvalues,CHAR_LENGTH(FIELDS_ )+4);
					
					
				LEAVE label1;
			WHEN @results is NULL THEN 
				LEAVE label1;
			ELSE 
				SET n= n+1;
		END CASE ;
	END LOOP;

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
	

	SET @fields_ = '',@d='';
	IF  
		sepera  IS NULL  THEN 
			SET sepera =','; 
		ELSEIF sepera REGEXP '^[[:alnum:]]+$' THEN
			SET  sepera = CONCAT( ' ',sepera,' ');
	END IF;

  REPEAT


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

							ELSE ITERATE fetch_value;
			
					END CASE;
					

				END LOOP fetch_value;
				SET @d = substr(fieldsvalue,1,@vp);
			ELSE
				SET @d = 'NULL';
			END IF;


		SET fieldsValue = substr(fieldsvalue,@vp+1),  
					@fields_ = CONCAT(@fields_,'=',@d);


		IF LEFT(fieldsName,1)=',' THEN 
			SET fieldsName = SUBSTR(fieldsName,2);
 			IF LEFT(fieldsValue,1)=',' then 
					SET fieldsValue = SUBSTR(fieldsValue,2),
							@fields_ = CONCAT(@fields_,sepera);
 			END IF;

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
	
	DECLARE a1 VARCHAR(5) DEFAULT NULL;
	DECLARE a2 VARCHAR(5) DEFAULT NULL;
	DECLARE i TINYINT(5) DEFAULT 0;

  IF IFNULL(a,'')  =  '' THEN RETURN a; END IF; 
  IF NOT preg_RLIKE('/^(\\d+,?)+$/',a) THEN RETURN a; END IF;

	SET	i = 1,@r = NULL,a2 =c(preg_capture('/[^,]+/',a,0,1));

	SET	@r = CONCAT_WS('',REPEAT('0,',a2-1),a2);

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

								SET t = j(t,k2);
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
	
	DECLARE k1 VARCHAR(1000) DEFAULT NULL;
	DECLARE k2 VARCHAR(1000) DEFAULT NULL;
	DECLARE k3 VARCHAR(1000) DEFAULT NULL;
	DECLARE i INT(5) DEFAULT 0;

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

								SET t = j(t,k2);
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

 SET t = REGEXP_REPLACE(t,k1,k2); 

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
--  Procedure definition for `flow`
-- ----------------------------
DROP PROCEDURE IF EXISTS `flow`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `flow`(IN `p` blob)
flowl:BEGIN
	



	DECLARE `p2` BLOB DEFAULT j(`p`,'p2');
	DECLARE `funcid` VARCHAR(60) DEFAULT j(`p2`,'funcid');


	SET @sql_body = NULL;


	CASE 
			WHEN  `funcid` = 0 THEN 
			BEGIN
				DECLARE `p2` BLOB DEFAULT j(`p`,'p2');

				IF IFNULL(`p2`,'')= '' OR IFNULL(@courseNo := j(`p`,"courseNo"),'')= '' THEN CALL Error('sp:no p2 or courseNo');END IF;

				SET	@sql_body := r4('gangwei'),
						@sql_body = CONVERT(r5( 
IF((@roleids := j(p,'roleids')) IS  NULL, @sql_body,REGEXP_replace(@sql_body
,@r:='(?is)\\((?=\'enterlis\')(.*?)(?<=CAST\\()(.*?)(?=\\)AS\\s+CHAR\\)as\\sroleli)'
,CONCAT_WS('',"('roleids','",@roleids,"',\\1REGEXP_replace(\\2 ),CONCAT_WS('','(?i)\\\\\\\\s(?=roleid=\"(",@roleids,")\")'),' checked '")
))
,`p`)USING gbk);


			END;



			WHEN `funcid` = 2 THEN

SELECT
a.missionId,
a.seal_no,
a.is_seal,
a.p_write,
b.seal_name,
a.seal_id,
b.roleID,
@post := IF((@role := c.role) REGEXP '^(?!.*/)',
CASE 
WHEN (@duty:= c.duty) REGEXP '银行' THEN 
		CASE WHEN @duty REGEXP '业务|柜员' THEN '柜员'
				WHEN @duty REGEXP '经理' THEN '客服经理'
				 WHEN @duty REGEXP '负责人|行政签章|经理' THEN '柜台主管'
				ELSE '银行'
		END
WHEN @duty REGEXP '会计师' THEN '会计师'
WHEN @duty REGEXP '法人' THEN '总经理'
WHEN @duty REGEXP '财务签章|财务专用章|财务主管' THEN '财务经理'
WHEN @duty REGEXP '发票' THEN '开票'
WHEN @duty REGEXP '出纳' THEN '出纳'
WHEN @duty REGEXP '会计' THEN '会计' 
WHEN @duty REGEXP '制单' THEN '制单' 
WHEN @duty REGEXP '制单' THEN '制单'
WHEN @duty REGEXP '审核' THEN '审核'
WHEN @duty REGEXP '记账' THEN '记账'
END
,REGEXP_substr(@role,'(?<=/).+$')
) AS post,
CAST(CASE (@action:=b.action)<>'' 
WHEN a.seal_no = 1 AND a.p_write = 1 THEN
			CASE  WHEN @action REGEXP (@r:='签章|^会计$') THEN  REGEXP_replace(@action,@r,'制单')
			ELSE @action
			END 
ELSE @action
END AS CHAR) AS action
,b.action
FROM
acc_mission_seal AS a
INNER JOIN acc_enter_seal AS b ON a.seal_id = b.sealID
INNER JOIN acc_enter_role AS c ON b.roleID = c.roleID
WHERE a.missionid = j(p2,'missionid')
GROUP BY
a.missionId,
a.seal_no,
b.roleID,
b.sealID;
SELECT @sql_body; LEAVE flowl;

		ELSE SET @sql_body = 'someting wrong!';
	END CASE;


	PREPARE sql_stmt from  @sql_body;
	EXECUTE sql_stmt ;
	DEALLOCATE PREPARE sql_stmt ;

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
--  Procedure definition for `FUNC_QUERY`
-- ----------------------------
DROP PROCEDURE IF EXISTS `FUNC_QUERY`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `FUNC_QUERY`(IN `keyword` longtext)
BEGIN
	
SET KEYWORD = CONCAT('%',KEYWORD,'%');
SELECT
b0.courseName AS `课程`,
b1.node_courseNo AS `课程编号`,
CAST(CONCAT_WS('.',b1.node_No,b2.typesort) AS CHAR) AS `任务号`,
a.missionId AS `任务id`,
a.missionLabel AS `任务标题`,
a.mission_ask AS `任务要求`,
c1.billname AS `表单名称`,
a.Vdate AS `虚拟日期`,
c1.billId AS `表单编号`,
c2.billTypeSay AS `表单类型`
FROM
acc_mission AS a
INNER JOIN exp_courses_node_content AS b2 ON a.missionId = b2.missionid
INNER JOIN exp_courses_node AS b1 ON b2.contentNo = b1.contentNo
INNER JOIN exp_courses AS b0 ON b1.node_courseNo = b0.courseNo
INNER JOIN mysq1_schema.bill_list AS c1 ON a.billId = c1.billId
INNER JOIN mysq1_schema.bill_type AS c2 ON c1.billType = c2.billType
WHERE 
CASE
	WHEN CAST(CONCAT_WS('',b1.node_courseNo,b0.courseName,b1.node_No,'.',b2.typesort,b0.courseName,b1.node_courseNo) AS CHAR) LIKE keyword THEN 1
	WHEN a.missionLabel LIKE keyword THEN 1
	WHEN a.mission_ask LIKE keyword THEN 1
	WHEN c1.billname LIKE keyword THEN 1
	WHEN a.Vdate LIKE keyword THEN 1
	WHEN c2.billTypeSay  LIKE keyword THEN 1
END;
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
e1.billname,e1.billId,e2.billTypeSay,
a.mission_ask
FROM
acc_mission AS a
INNER JOIN exp_courses_node_content AS b ON a.missionId = b.missionid
INNER JOIN exp_courses_node AS c ON b.contentNo = c.contentNo
INNER JOIN exp_courses AS d ON c.node_courseNo = d.courseNo
LEFT JOIN mysq1_schema.bill_list AS e1 ON e1.billId = a.billId
LEFT JOIN mysq1_schema.bill_type AS e2 ON e1.billType = e2.billType
WHERE 
CASE
		WHEN a.missionId REGEXP  keyword THEN 1
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
e.cclassName,
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
	CASE
			WHEN a.stuNo LIKE CONCAT('%',keyword,'%') THEN 1
			WHEN d.classNo  LIKE CONCAT('%',keyword,'%') THEN 1
			WHEN e.className   LIKE CONCAT('%',keyword,'%') THEN 1
			WHEN d.expNo   LIKE CONCAT('%',keyword,'%') THEN 1

		ELSE 0
	END
;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Func_Sys`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Func_Sys`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Func_Sys`(IN `template1` varchar(200),IN `type` varchar(50),in `template2` varchar(200))
BEGIN
	
	
	SET @sb = CONCAT("SELECT
a.",type,"_SCHEMA,
a.",type,"_NAME,
GROUP_CONCAT('",REPLACE(template1,'??',TYPE),"', a.",type,"_NAME ,'",IFNULL(template2,''),"' SEPARATOR ';\n')
FROM
`",type,"S` AS a
WHERE
a.",type,"_SCHEMA = ",QUOTE(DATABASE()));
SELECT  @sb;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `func_z`
-- ----------------------------
DROP FUNCTION IF EXISTS `func_z`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `func_z`(`w` tinytext) RETURNS tinytext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	

	RETURN preg_replace('/(?<=\.|^)0\\d?(?=[0-9])/','',w);
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
--  Procedure definition for `ganerate_answer`
-- ----------------------------
DROP PROCEDURE IF EXISTS `ganerate_answer`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ganerate_answer`()
BEGIN
	
SET @stmtbody = '';
DROP TEMPORARY TABLE IF EXISTS cura1;
SET
@stmtbody :=concat("CREATE TEMPORARY TABLE cura1
AS
SELECT a.missionId,a.billid,
0 as a_t,",
Temp_Func("
ab(b.a??,a.init_a??,c.blur_a??) as a??
",1,100,','),"
FROM
acc_mission AS a
INNER JOIN acc_standard_1 AS b ON a.missionId = b.missionId
INNER JOIN acc_standard_blur_1 AS c ON a.missionId = c.missionId
");


PREPARE stmt1 FROM @stmtbody;
EXECUTE stmt1; 



DROP TEMPORARY TABLE IF EXISTS cura2;
SET @stmtbody2=concat("CREATE TEMPORARY TABLE cura2
AS
SELECT  
a.missionId,a.billid,
a_t, 
sum(",
Temp_Func("IF(a.a?? IS NOT NULL,1,0)",1,100,'+'),
") AS a_n,
concat_ws(',',",
Temp_Func("IF(a.a?? IS NOT NULL,'??',null)",1,100,','),
") AS a_fs,
concat_ws(',',",
Temp_Func("IF(a.a?? IS NOT NULL,LPAD('??',2,'0'),null)",1,100,','),
") AS a_fn,",
Temp_Func("a.a??",1,100,','),
"
FROM cura1 as a
group by a.missionid");

PREPARE stmt2 FROM @stmtbody2;

EXECUTE stmt2; 





DROP TEMPORARY TABLE IF EXISTS curb1;
SET
@stmtbody :=concat("
CREATE TEMPORARY TABLE curb1
AS
SELECT a.missionId,a.billid,
b.rowno as a_t,",
Temp_Func("
ab(b.b??,a.init_b??,c.blur_b??) as a??
",1,50,','),"
FROM
acc_mission AS a
INNER JOIN acc_standard_n AS b ON a.missionId = b.missionId
INNER JOIN acc_standard_blur_n AS c ON a.missionId = c.missionId AND b.rowNo = c.rowno
where concat_ws(",Temp_Func("b.b??",1,50,','),") != '' 
");


PREPARE stmt3 FROM @stmtbody;
EXECUTE stmt3; 




DROP TEMPORARY TABLE IF EXISTS curb2;
SET @stmtbody2=concat("CREATE TEMPORARY TABLE curb2
AS
SELECT  
a.missionId,a.billid,
a_t, 
sum(",
Temp_Func("IF(a.a?? IS NOT NULL,1,0)",1,50,'+'),
") AS a_n,
concat_ws(',',",
Temp_Func("IF(a.a?? IS NOT NULL,'??',null)",1,50,','),
") AS a_fs,
concat_ws(',',",
Temp_Func("IF(a.a?? IS NOT NULL,LPAD('??',2,'0'),null)",1,50,','),
") AS a_fn,",
Temp_Func("a.a??",1,50,','),
"
FROM curb1 as a
group by a.missionId,a.a_t");

PREPARE stmt4 FROM @stmtbody2;

EXECUTE stmt4; 


DROP TEMPORARY TABLE IF EXISTS cura1;
SET @stmtbody3=concat("CREATE TEMPORARY TABLE cura1
AS
SELECT * from cura2
UNION
SELECT *,",Temp_Func("null",51,50,','),
" FROM  curb2");

PREPARE stmt5 FROM @stmtbody3;
EXECUTE stmt5; 

DROP TABLE IF EXISTS answer;

CREATE TABLE answer
AS

SELECT
a.*
,Temp_Func_C("a??",a.a_fs,',') as a_fnz

,CASE when a.a_t = 0 THEN
concat("SELECT ",
Temp_Func_C("(acc_1.a?? REGEXP answer.a??)",a.a_fs,'+'),
" into @sb
FROM acc_1 INNER JOIN answer  ON acc_1.missionId = answer.missionId 
WHERE acc_1.expID = ? AND answer.missionId = '",a.missionId,"' AND answer.a_t = ",a.a_t) 
ELSE 
concat("SELECT ",
Temp_Func_C("(acc_nn.b?? REGEXP answer.a??)",a.a_fs,'+'),
" into @sb
FROM ?? AS acc_nn INNER JOIN answer  ON acc_nn.missionId = answer.missionId 
WHERE acc_nn.expID = ? AND answer.missionId = '",a.missionId,"' AND answer.a_t = ",a.a_t) 
END AS a_row_sq
FROM cura1 AS a
ORDER BY a.missionid,a.a_t;


ALTER TABLE `answer`
MODIFY COLUMN `a_fn`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `a_n`;
ALTER TABLE `answer`
MODIFY COLUMN `a_t`  decimal(10,0) NOT NULL DEFAULT 0 AFTER `missionId`,
ADD PRIMARY KEY (`missionId`, `a_t`),
ADD UNIQUE INDEX `answer-1` USING BTREE (`missionId`, `billid`, `a_t`, `a_n`) ;

ALTER TABLE `answer`
ADD UNIQUE INDEX `answer-2` USING BTREE (`missionId`, `a_t`, `a_n`) ;
ALTER TABLE `answer`
ADD  INDEX `answer-3` USING BTREE (`a_t`, `a_fn`) ;




DEALLOCATE PREPARE stmt1;
DEALLOCATE PREPARE stmt2;
DEALLOCATE PREPARE stmt3;
DEALLOCATE PREPARE stmt4;
DEALLOCATE PREPARE stmt5;

DROP TEMPORARY TABLE IF EXISTS cura1;
DROP TEMPORARY TABLE IF EXISTS cura2;
DROP TEMPORARY TABLE IF EXISTS curb1;
DROP TEMPORARY TABLE IF EXISTS curb2;






END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `generateckey`
-- ----------------------------
DROP FUNCTION IF EXISTS `generateckey`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `generateckey`(`userid` varchar(20),`remark` varchar(10),`pkid` int(10)) RETURNS varchar(160) CHARSET utf8mb3
    NO SQL
BEGIN
	IF IFNULL(remark,'') = '' THEN SET remark = '' ;END IF;
 
  set @keyword = CONCAT(userid , '-',remark,DATE_FORMAT(NOW(),'%y%m%d%H%i%s'),
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
--  Procedure definition for `generatekeyc`
-- ----------------------------
DROP FUNCTION IF EXISTS `generatekeyc`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `generatekeyc`(`userid` varchar(20),`pkid` int(10)) RETURNS varchar(160) CHARSET utf8mb3
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
--  Procedure definition for `generate_back_file`
-- ----------------------------
DROP PROCEDURE IF EXISTS `generate_back_file`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `generate_back_file`(IN `path1` varchar(300),`path2` varchar(300),`filetype` varchar(10),`filecontent` longtext)
BEGIN
	

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `generate_one`
-- ----------------------------
DROP PROCEDURE IF EXISTS `generate_one`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `generate_one`(IN `missionid_` varchar(60),`rowids` varchar(300),OUT status_ varchar(600),out rownum int(5))
la:BEGIN
	


		SET missionid_ = TRIM(missionid_),
				@answer_stmtbody = NULL;

		SELECT a.statu INTO @answer_stmtbody FROM acc_mission AS a WHERE a.missionId = missionid_;

		IF FOUND_ROWS() != 0 AND IFNULL(@answer_stmtbody,'') != '3'  THEN


			DELETE a.* from answer AS a  WHERE a.missionid = missionid_;
			SET @answer_stmtbody :=concat("REPLACE INTO answer(missionId,billid,a_t,a_fnz,a_n,a_fs,",
							Temp_Func("a??",1,100,NULL),")
							SELECT a.missionId,a.billid,
							0,@g :=CONCAT_WS(',',",
							Temp_Func("IF(ab(b.a??,a.init_a??,c.blur_a??) IS NULL,NULL,'a??')",1,100,','),"),
							func_get_string_count(@g,'a') AS a_n,REPLACE(@g,'a',''),"
							,Temp_Func("ab(b.a??,a.init_a??,c.blur_a??)",1,100,','),"
							FROM acc_mission AS a
							LEFT  JOIN acc_standard_1 AS b ON a.missionId = b.missionId
							LEFT  JOIN acc_standard_blur_1 AS c ON a.missionId = c.missionId
							WHERE a.missionid =",QUOTE(missionid_),"
							AND CONCAT_WS(',',",Temp_Func("ab(b.a??,a.init_a??,c.blur_a??)",1,100,','),") != ''");

					PREPARE stmt_insert_answer FROM @answer_stmtbody;
					EXECUTE stmt_insert_answer ;

		 
					SET @answer_stmtbody :=concat("INSERT INTO answer(missionId,billid,a_t,a_fnz,a_n,a_fs,",
								Temp_Func("a??",1,50,NULL),")
									SELECT a.missionId,a.billid,b.rowno,@g :=CONCAT_WS(',',",
									Temp_Func("IF(ab(b.b??,a.init_b??,c.blur_b??) IS NULL,NULL,'a??')",1,50,','),"),
									func_get_string_count(@g,'a') AS a_n,REPLACE(@g,'a',''),
									",Temp_Func("ab(b.b??,a.init_b??,c.blur_b??)",1,50,','),"
									FROM acc_mission AS a
									LEFT  JOIN acc_standard_n AS b ON a.missionId = b.missionId
									LEFT  JOIN acc_standard_blur_n AS c ON b.missionId = c.missionId AND b.rowNo = c.rowno
									where a.missionid = ",QUOTE(missionid_)," 
									AND CONCAT_WS(',',",Temp_Func("ab(b.b??,a.init_b??,c.blur_b??)",1,50,','),") != ''");
			 

					PREPARE stmt_insert_answer FROM @answer_stmtbody;
					EXECUTE stmt_insert_answer ;
					DEALLOCATE PREPARE stmt_insert_answer;

					UPDATE acc_mission AS a 
							SET a.statu = 3
					WHERE a.missionId = missionid_ AND IFNULL(a.statu,'') !=3 ;

		END IF;

			SET rowids =CONCAT("'",REPLACE(rowids,',',"','"),"'"),
					@rownnum = NULL,@a_t=NULL,
					@answer_stmtbody = CONCAT("SELECT  \n",
									"COUNT(a.a_t) as rownum,\n",
									"CAST(GROUP_CONCAT(a.a_t) as char) as a_t,\n",
									"CAST(GROUP_CONCAT(DISTINCT a.a_fs SEPARATOR ',') AS CHAR) \n",
									",a.a_fnz as a_sss\n",
									"INTO @rownum ,@a_t,@answer_stmtbody,@a_sss \n",
									"FROM  answer as a \n",
									"WHERE A.MISSIONID =", QUOTE(missionid_),
									IF(FIND_IN_SET("'0'",rowids)>0,"AND a.a_t = 0 \n", " AND a.a_t > 0 \n"),
									"GROUP BY a.missionId");

		PREPARE stmt from  @answer_stmtbody ;
		SET @answer_stmtbody = NULL;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;

		SET	 status_ =Fielter_Set(@answer_stmtbody),
				 rownum =@rownum ;
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
	
 


		SET missionid_ = TRIM(missionid_),
				@answer_stmtbody = NULL;


		CALL Generate_One_En_test(`missionid_`);

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
--  Procedure definition for `Generate_One_En_copy`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Generate_One_En_copy`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Generate_One_En_copy`(IN `missionid_` varchar(60),`rowids` varchar(600),OUT field_names varchar(600),out rownum varchar(400),out `jans` longtext)
la:BEGIN
	
 


		SET missionid_ = TRIM(missionid_),
				@answer_stmtbody = NULL;


		CALL Generate_One_En_test(`missionid_`);

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

		SELECT IF(b.missionId is NULL,'', a.statu),
					CAST(CONCAT_WS(',',IFNULL(A.need_input_a,0),IFNULL(A.need_input_b,0)) AS CHAR) 
			INTO @answer_stmtbody,@A_S
			FROM acc_mission AS a 
			LEFT JOIN answer AS b ON a.missionId = b.missionId
			WHERE a.missionId = missionid_
			GROUP BY a.missionId;

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
 

		END IF;

 

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Generate_One_En_test_copy`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Generate_One_En_test_copy`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Generate_One_En_test_copy`(IN `missionid_` varchar(60))
la:BEGIN

		SELECT IF(b.missionId is NULL,'', a.statu),
					CAST(CONCAT_WS(',',IFNULL(A.need_input_a,0),IFNULL(A.need_input_b,0)) AS CHAR) 
			INTO @answer_stmtbody,@A_S
			FROM acc_mission AS a 
			LEFT JOIN answer AS b ON a.missionId = b.missionId
			WHERE a.missionId = missionid_
			GROUP BY a.missionId;

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



					PREPARE stmt_insert_answer FROM @answer_stmtbody;
					EXECUTE stmt_insert_answer ;

					DEALLOCATE PREPARE stmt_insert_answer;

					UPDATE acc_mission AS a,(SELECT  missionid_  AS missiondid,
																	IF(b.a_t = 0,b.a_n,0) AS in_a ,Sum(IF(b.a_t>0,b.a_n,0)) AS in_b 
																	FROM answer AS b 
																	WHERE  b.missionId = missionid_ )AS b
					SET  a.need_input_a = b.in_a ,
							 a.need_input_b = b.in_b ,
							 a.statu  = 3
					WHERE  a.missionId = b.missiondid  AND IFNULL(a.statu,'') !=3 ;


		END IF;



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
--  Procedure definition for `if0`
-- ----------------------------
DROP FUNCTION IF EXISTS `if0`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `if0`(`i` varchar(20000)) RETURNS varchar(1) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	

	RETURN '0';
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
	

	RETURN '1';
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `ifn`
-- ----------------------------
DROP FUNCTION IF EXISTS `ifn`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `ifn`(`i` varchar(20000)) RETURNS varchar(1) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	

	RETURN NULL;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `ifnulll`
-- ----------------------------
DROP FUNCTION IF EXISTS `ifnulll`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `ifnulll`(`P` blob,v blob) RETURNS blob
    DETERMINISTIC
BEGIN
	#Routine body goes here...

	RETURN CASE 
        WHEN P =''THEN v

else ifnull(p ,v) end;
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

  RETURN IF(@score >= @min and @score < @max,1,0);
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `isnu`
-- ----------------------------
DROP FUNCTION IF EXISTS `isnu`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `isnu`(`m0` blob) RETURNS blob
    NO SQL
    DETERMINISTIC
BEGIN
	#Routine body goes here...
  
	RETURN  REGEXP_replace(CASE WHEN m0 IS NULL || m0 ='0' || m0='' THEN 0
	ELSE m0 END,',','');
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

				WHEN amount REGEXP '^([-]?(0|[1-9][0-9]{0,2})(\\.[0-9]+)?)(%|％)$' THEN 
							set frag_ := PREG_CAPTURE('/^([-]?(0|[1-9][0-9]{0,2})(\\.[0-9]+)?)(%|％)$/',amount ,0);

					
							SET 	 	rear_ := IF(frag_/100 REGEXP '[.]','[0-9]*', '([.][0-9]+)?'),
											front_ := CONCAT(frag_/100,rear_,'$'),
											rear_ := IF(frag_ + 0 REGEXP '[.]','[0-9]*', '([.][0-9]+)?'),
											rear_ 	:= CONCAT(frag_ + 0 ,rear_,'(%|％)?','$'),
										amount := CONCAT_WS('|',front_ ,rear_ ),
										amount := CONCAT('^',amount);

				WHEN amount REGEXP '^[-]?([0-9](,?[0-9]{3}){0,})+(\\.?[0-9]+)?$' THEN


					IF amount REGEXP  '^\\-' THEN 
							SET mins = '-' ,
									amount =  SUBSTR(amount,2);
					END IF;

					SET amount	= REPLACE(amount,',',''),
							front_	= SUBSTRING_INDEX(amount,'.',1),
							rear_ 	= SUBSTRING_INDEX(amount,'.',-1);


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
--  Procedure definition for `Is_Text`
-- ----------------------------
DROP FUNCTION IF EXISTS `Is_Text`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `Is_Text`(`t` longtext) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	
	IF t IS NOT NULL THEN
		SET t = preg_replace('/(?=\\(|\\+|\\*|\\.|\\$)/','\\\\\\',t),
				t = preg_replace('/(,|，|。|:|：|\\s{1,})/','.{0,6}',t);
	END IF;

	RETURN t;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `j`
-- ----------------------------
DROP FUNCTION IF EXISTS `j`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `j`(`j` longblob,k varchar(255)) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
 	IF k IS NULL  THEN RETURN NULL;END IF;

  SET k = clearj(CONCAT('(?i)(?<=(?:"',k,	'":))','(?J)((?>(?:"(?<c>(?:[^\\\\"]|\\\\.)*)")|(?<a>(?:\\s*)\\{(?:\\s*)(?<c>(?<k>(?:"(?<c>(?:[^\\\\"]|\\\\.)*)")(?:\\s*):(?:\\s*)(?:"(?&c)"|(?&a)))?(?:(?:\\s*),(?:\\s*)(?&k))*)\\})))')),
			j = REGEXP_substr(j,k);

	IF j = '' THEN SET j= NULL;END IF;
	IF j REGEXP '^[{]' THEN 
		SET j = REGEXP_REPLACE(j,'^[{]|[}]+$',''); 
		ELSE 

 			SET j = REGEXP_REPLACE(j,'^[\'"]|(?<=[^\\\\])\\\\|[\'"]*$','\\1'); 
		RETURN j;	
	END IF;

	RETURN j;

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
	
  SET j = j(j,k);

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
CREATE DEFINER=`root`@`localhost` FUNCTION `j2`(`j` longtext,k varchar(255)) RETURNS longtext CHARSET utf8mb3
    NO SQL
BEGIN
	
  SET j = j(j,k);

	RETURN IF( IFNULL(j,'') =  '','NULL',quotd(j));
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `j2f`
-- ----------------------------
DROP FUNCTION IF EXISTS `j2f`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `j2f`(`ja` longtext) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	DECLARE `r` VARCHAR(2000) DEFAULT NULL;	DECLARE `f` VARCHAR(2000) DEFAULT NULL;

	IF IFNULL(`ja`,'')=''  THEN RETURN NULL; END IF;
	SET	`r`='(?:"(?<a>(?:\\\\.|[^"])*)(?:":"(?&a)")(?:,"\\g{a}(?:":"(?&a)"))*)'
,`f` = regexp_replace(`ja`,r,'\\1'),
`f` = CONCAT_WS(',',IF(`f` REGEXP ',$',NULL,'')
,REVERSE(`f`)) ,`r`='(?xX)(?<o>,[^,]+)(?=(?&o)*?\\g{o})' 
,`f` = REVERSE(REGEXP_replace(regexp_replace(`f`,r,''),'^,',''));

RETURN f;
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
	
	DECLARE `0` MEDIUMBLOB DEFAULT NULL;
	DECLARE `2` BLOB DEFAULT NULL;
	DECLARE `B` VARCHAR(100)  DEFAULT NULL;
	DECLARE `E` VARCHAR(100)  DEFAULT NULL;

	IF IFNULL(j,'') = '' THEN RETURN NULL; END IF;

	SET `0` = j(`j`,'`0`'),
			`2` = j(`j`,'`2`'),
			`B` = IF(IFNULL(j(`2`,'`B`'),'') = '',"(",j(`2`,'`B`')),
			`E` = IF(IFNULL(j(`2`,'`E`'),'') = '' AND `B` = "(",")",j(`2`,'`E`'));

  IF 	IFNULL(`0`,'') != '' THEN
		SET `j` = j(j,'`1`');

		IF IFNULL(J(`2`,"`filter1`"),'') <> '' THEN

			SET `j` = f2(J(`2`,"`filter1`"),`j`);RETURN J;
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

		IF IFNULL(J(`2`,"`filter2`"),'') <> '' THEN

			SET `j` = f2(J(`2`,"`filter2`"),`j`);RETURN J;
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
	
  SET j = j(j,k);

	RETURN IF(j IS NULL,NULL,quotd(j));
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
	
  SET j = j(j,k);

	RETURN IF(IFNULL(j,'')='',NULL,j);
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `jc`
-- ----------------------------
DROP FUNCTION IF EXISTS `jc`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `jc`(`j` longblob,k varchar(255)) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN

	RETURN j(j,k);

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
	
	IF IFNULL(j,'')='' THEN RETURN NULL; END IF;

  IF IFNULL(`1`,'') <> ''  THEN
   
		
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
--  Procedure definition for `je3`
-- ----------------------------
DROP FUNCTION IF EXISTS `je3`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `je3`(`j` longtext, `1` varchar(255), `2` varchar(255)) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	
	IF IFNULL(j,'')='' THEN RETURN NULL; END IF;

  IF IFNULL(`1`,'') <> ''  THEN
   
		
		SET @d = "[\\\"\\\']", 
				@`}`= "[\\}]", 
				@`{`= "[\\{]", 
				j = preg_capture(CONCAT('/(?<=',@d,`1`,@d,':)',@`{`,'(\.+?)',	@`}`,'(?=[,]|}$)/'),j);
	END IF;

  IF `2` IS NULL OR `2` = 0 THEN RETURN j; END IF;
	
	SET j = json_extra(j,`2`);

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
--  Procedure definition for `jkv`
-- ----------------------------
DROP FUNCTION IF EXISTS `jkv`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `jkv`(`k` varchar(100),`i` varchar(20),`v1` varchar(20000),`v2` varchar(20000)) RETURNS varchar(20500) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	

	SET `v1` = IF(`i` ,`v1`,`v2`),
			`v1` = IF(`v1` IS NULL,NULL,QUOTd(`v1`));

	RETURN CONCAT(quotd(`k`),':',v1);

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `jkv_`
-- ----------------------------
DROP FUNCTION IF EXISTS `jkv_`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `jkv_`(`k` varchar(100),`v` varchar(20000)) RETURNS varchar(20500) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	

	SET `v` = IF(IFNULL(`v`,'')='',NULL,quotd(`v`));

	RETURN CONCAT(quotd(`k`),':',v);

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `js`
-- ----------------------------
DROP FUNCTION IF EXISTS `js`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `js`(`j` longtext,k varchar(255)) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN

	
 	IF k IS NULL  THEN RETURN NULL;END IF;
  SET k = CONCAT('/(?<="',k,'":)(?>("([^\\\\"]|\\\\{2}|\\\\"|\\\\)*")|(\\{((?R1):((?R1)|(?R3)))?(,(?R4))*\\}))/');
	RETURN preg_capture(k,j);

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
--  Procedure definition for `json_add2`
-- ----------------------------
DROP FUNCTION IF EXISTS `json_add2`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `json_add2`(`d` longtext,`k` tinytext,`v` mediumtext) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	
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
	
			
	RETURN j(j,k);
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
--  Procedure definition for `kv`
-- ----------------------------
DROP FUNCTION IF EXISTS `kv`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `kv`(`j` blob,`k` varchar(100),`v` blob) RETURNS mediumtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	
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
--  Procedure definition for `KW`
-- ----------------------------
DROP FUNCTION IF EXISTS `KW`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `KW`(`k` varchar(60) , `s` varchar(30) ,`s1` varchar(30) , `s2` varchar(30)) RETURNS varchar(30) CHARSET utf8mb3
    NO SQL
BEGIN
	

	RETURN SUBSTR(CONCAT(s,MD5(concat(s1,k,s2))),1,30);
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
	
	RETURN REGEXP_substr(`id`,'^.*?(?=\\s)');
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
	

	CALL `mysq1_schema`.`manu_content`(DATABASE(),`Fun_id`, `key_value` ,`dBlob`);
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `manu_ware`
-- ----------------------------
DROP PROCEDURE IF EXISTS `manu_ware`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manu_ware`(IN `Fun_id` varchar(20), IN `key_value` longtext, IN `dBlob`  LONGBLOB)
blol:BEGIN
	


	CALL `mysq1_schema`.`manu_ware`(DATABASE(),`Fun_id`, `key_value` ,`dBlob`);
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
	

	RETURN '';
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `mission_total`
-- ----------------------------
DROP PROCEDURE IF EXISTS `mission_total`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mission_total`(IN `v` text)
mistl:BEGIN
	

		SET @mist_body1 = CONCAT_WS('',	"SELECT a.classNo,b.courseNo,b.courseName,a.className"),
				@mist_body0 = CONCAT_WS('',	"INTO @classNo,@courseNo,@courseName,@className"),
				@mist_body2 = CONCAT_WS('',	"FROM exp_experimentclass AS a\n",
																		"INNER JOIN exp_courses AS b ON a.courseNo = b.courseNo\n",
																		"WHERE b.statu = '9'"),
				@mist_body4 = IF( v IS NULL ,NULL ,CONCAT_WS('\n',"AND CASE ",QUOTE(v), 
																									" WHEN a.classNo THEN 1",
																									" WHEN b.courseNo THEN 1",
																									" WHEN b.courseName THEN 1",
																									" WHEN a.className THEN 1",
																									" ELSE 0 END")), 
				@mist_body  = CONCAT_WS('\n',@mist_body1,@mist_body0,@mist_body2,@mist_body3,@mist_body4,"LIMIT 0,1");

 

	PREPARE stmt_mist FROM @mist_body;
	EXECUTE stmt_mist ;

	IF NOT FOUND_ROWS() THEN 
			LEAVE mistl;
	END IF;

	SET @mist_body1 = CONCAT_WS('\n',"SELECT GROUP_CONCAT(a.classNo) AS classNo,b.courseNo,b.courseName,a.className"),
			@mist_body = CONCAT_WS('\n',	@mist_body1,@mist_body2,@mist_body3,@mist_body4),
			@mist_body1 = CONCAT_WS('\n',	"CREATE TEMPORARY TABLE exp","AS",
																	"SELECT a.classNo,a.courseNo,a.courseName,a.className,COUNT(*) AS total",
																	"FROM (",@mist_body,"GROUP BY b.courseNo) AS a"),
			@mist_body2 = CONCAT_WS('\n',	"INNER JOIN exp_courses_node AS b1 ON b1.node_courseNo = a.courseNo",
																		"INNER JOIN exp_courses_node_content AS b2 ON b2.contentNo = b1.contentNo",
																		"WHERE b2.contentType ='kj'",
																		"GROUP BY a.classNo"),
			@mist_body = CONCAT_WS('\n',@mist_body1,@mist_body2);


  DROP TEMPORARY TABLE IF EXISTS exp;

	PREPARE stmt_mist FROM @mist_body;
	EXECUTE stmt_mist ;

	SET @mist_body = CONCAT_WS('\n',"UPDATE exp AS a",
"INNER JOIN exp_experimentclass AS b ON a.courseNo = b.courseNo AND INSTR(a.classNo , b.classNo)> 0 ",
"INNER JOIN exp_courses AS c ON a.courseNo = c.courseNo",
"SET b.mission_total = a.total,c.statu = NULL");

	PREPARE stmt_mist FROM @mist_body;
	EXECUTE stmt_mist ;

  DROP TEMPORARY TABLE IF EXISTS exp;	
	DEALLOCATE PREPARE stmt_mist;

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
				CASE WHEN `money` IS NULL ||money = '' || `money` = '0'  THEN NULL
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


	SET @dyn_sql = CONCAT('select exp.classNo,exp.className,exp.classType,exp_p.studentNo,exp_p.expNo from exp_experimentclass exp ',
	'INNER JOIN exp_experimentclassstudent exp_p on exp.classNo=exp_p.classNo ' ,
	'and exp_p.classNo=\'',v_class_no,'\' and exp_p.studentNo=\'',v_stu_no,'\'');
  PREPARE stmt_sql FROM @dyn_sql;   
  EXECUTE stmt_sql;


	SET @dyn_sql = CONCAT('SELECT ecd.node_No,ecd.node_text,zmnode.w_contentNo,zmnode.w_node_text from exp_courses_node ecd ',
	'LEFT JOIN ( ',
	
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
			


    PREPARE stmt_sql FROM @dyn_sql;   
    EXECUTE stmt_sql;

		LEAVE c2e;
	END IF;




 if v_type=0 then
    
    SET @dyn_sql = CONCAT('delete from exp_cour_node_cont where classNo=\'',v_classNo,
     '\' and not exists (select * from exp_courses_node_content where exp_courses_node_content.contentNo=exp_cour_node_cont.contentNo and exp_courses_node_content.typesort=exp_cour_node_cont.typesort ',
     ' and exp_courses_node_content.missionid=exp_cour_node_cont.missionid and exp_courses_node_content.contentType=exp_cour_node_cont.contentType and exp_courses_node_content.contentNo in (select distinct contentNo from ',
     ' exp_courses_node where node_courseNo in (',v_course_nos_condition,')))');

    PREPARE stmt_sql FROM @dyn_sql;   
    EXECUTE stmt_sql;

    
    
    
    SET @dyn_sql = CONCAT('insert into exp_cour_node_cont (classNo,contentNo,typesort,missionid,contentType,sort,paramId,contentReferenced,isShow,log_study_proc,fileURL,createdInXxTask,isShotCut,shotCutFrom_ContentId,isProcess,statu)',
     ' select distinct \'',v_classNo,'\' as classNo,contentNo,typesort,missionid,contentType,sort,paramId,contentReferenced,isShow,log_study_proc,fileURL,createdInXxTask,isShotCut,shotCutFrom_ContentId,isProcess,statu from exp_courses_node_content content', 
     ' where content.contentNo in (select distinct contentNo from exp_courses_node node where node.node_courseNo in (',v_course_nos_condition,')) and not exists ( select * from exp_courses_node_content ctx where content.contentNo=ctx.contentNo and ',
     ' content.typesort=ctx.typesort and  content.missionid=ctx.missionid and content.contentType=ctx.contentType and ctx.contentNo in (select distinct n.contentNo from exp_courses_node n where n.node_courseNo in (select DISTINCT ecn.node_courseNo from ',
     ' exp_courses_node ecn where ecn.contentNo in (select DISTINCT contentNo from exp_cour_node_cont ecntxt where ecntxt.classNo=\'',v_classNo,'\'))))') ;
    SELECT @dyn_sql;
    PREPARE stmt_sql FROM @dyn_sql;   
    EXECUTE stmt_sql;
 end if;

 if v_type=1 then
 
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




 


 select CONCAT(node.node_No,'\t',node.node_text) as data,node.contentNo,node.node_Id,node.node_No,node.node_text,node.node_parentNo from exp_courses_node node 
    where node.node_courseNo=v_course_no order by -node.node_parentNo desc,-node.node_No desc;
  

 select DISTINCT CONCAT_WS('|',ctt.contentNo,ctt.typesort,ctt.missionid,ctt.contentType) as id,ctt.contentNo,ctt.typesort,ctt.missionid,ctt.contentType,am.missionLabel,am.mission_ask
   ,case when ecnc.missionid is NULL then '0' else '1' end as ischecked
 from 
   (select contentNo,typesort,missionid,contentType from exp_courses_node_content content where content.contentNo in 
     (select distinct contentNo from exp_courses_node node where node.node_courseNo=v_course_no) 
   )ctt
 LEFT JOIN acc_mission am on am.missionId=ctt.missionid
 LEFT JOIN exp_cour_node_cont ecnc on ecnc.classNo=v_class_no and ecnc.contentNo=ctt.contentNo and ctt.contentType=ecnc.contentType and ctt.missionid=ecnc.missionid and ctt.typesort=ecnc.typesort;   


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








 select exp.classNo,exp.className from exp_experimentclass exp where EndTime>= now() and EXISTS 
 (select * from exp_experimentclassstudent expc where exp.classNo=expc.classNo);


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


 select node_id,node_No,node_parentNo,node.node_courseNo,contentNo,node_type,node_text,node_tip from exp_courses_node node where  node.contentNo is null;


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




		SET @stmt1 = CONCAT_WS('',"SELECT CONCAT(a.node_No,'	',a.node_text) AS `data`,a.contentNo,a.node_Id,a.node_No,a.node_text,a.node_parentNo\n",
															"FROM exp_courses_node AS a\n","WHERE a.node_courseNo = ",QUOTE(v_course_no),"\n","ORDER BY nabc(a.node_parentNo), nabc(a.node_No)");

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
   
  declare done int; 
  DECLARE exp_courses_node_no CURSOR FOR SELECT distinct node_no FROM exp_courses_node where node_NO=`node_no`;
  declare continue handler FOR SQLSTATE '02000' SET done = 1;






SET @dyn_sql = NULL,@a = NULL,@a = DATABASE();

IF @a NOT REGEXP 'taxde$' THEN

		SET @a ='kjan_a-e,kjan_a-f,kjan_abcd,kjan_dtb,kjqt_kjfl00_kjfl';

		IF IFNULL(v_search,'') != '' AND NOT v_search = 'null'  THEN

				SET @b1 = NULL,@b2 = NULL,@b3 = NULL,@b4 = NULL,
						@b1 =  IFNULL(preg_rlike('/(?<=\\s|^)任\\s*务(?=\\s|$)/',v_search),0),
						@b2 =  IFNULL(preg_rlike('/(?<=\\s|^)习\\s*题(?=\\s|$)/',v_search),0),
						@b3 =  IFNULL(preg_rlike('/(?<=\\s|^)任\\s*务(?=\\s|$)/',v_search),0),

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


PREPARE stmt_sql FROM @dyn_sql;
EXECUTE stmt_sql ;

  LEAVE t4l;
END IF;




  
  OPEN exp_courses_node_no;
  
  
  read_loop: LOOP
    
    FETCH exp_courses_node_no INTO `node_no`;
    
    if done THEN
      LEAVE read_loop;
    END if;
   END LOOP;
  
   
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
--  Procedure definition for `myjson`
-- ----------------------------
DROP FUNCTION IF EXISTS `myjson`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `myjson`(`j` blob) RETURNS text CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	

	RETURN '';
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
	DECLARE `r` text DEFAULT NULL;



CALL Audit_1('m_j',CONCAT_WS(',',QUOTE(`FunId`),QUOTE(`dblob`)),'ok');

COMMIT;
/*LEAVE m_j;*/

  SET @stmt_json = NULL,
	 		`0` = j0(dblob,'0'),
			`2` = j0(dblob,'2'),
			`1` = j0(dblob,'1');


	CASE 

			WHEN `FunId` REGEXP '^1' THEN
			CASE 
					WHEN `FunId`= '11' THEN 
						SET @`1C` = '1,2,3,4',
								@`1C` = preg_replace(r('`2c`'),"CONCAT(quotn('$1'),':{\"v\":',quotn(a.$1),'}')$2",@`1C`),
								@stmt_json = CONCAT_WS('',"SELECT a.bdId,a.line,CONCAT_WS('',quotn(a.rowNo),':{',CONCAT_WS(''",",",@`1C`,"),'}') AS b ",'FROM bigdata_ab AS a WHERE a.bdId = "bdId-160604233010318113"'),
								@stmt_json = CONCAT_WS('',"SELECT CONCAT_WS('','{',kv0('bdId',a.bdId,0),kv0('line',COUNT(*),0),GROUP_CONCAT(a.b SEPARATOR ',') ,'}') AS b\n",
'FROM(\n',@stmt_json,'\n)AS a');

				ELSE SET	@stmt_json = CONCAT_WS('','SELECT "Wrong or no `FunId` ',QUOTE(`FunId`),'" AS mes');
			END CASE;

			WHEN `FunId` REGEXP '^0' THEN 
				CASE 
						WHEN	`FunId` = '01' THEN 
									SET	@stmt_json = CONCAT_WS("","INSERT ","acc_enter_backfile",	"(enterId,EnterBFid,enterback_title,file_name,enterback_file,billid)", 	"\nVALUE(",CONCAT_WS(",",
																			j1(`0`,"enterId"),
																			IF(j1(`0`,"EnterBFid") = "NULL" OR j1(`0`,"EnterBFid") = ""  ,QUOTE(gkey("ENTbf")),j1(dblob,"EnterBFid")),
																			j1(`0`,"enterback_title"),j1(`0`,"file_name"), QUOTE(`1`),j1(`0`,"billid")),")");
						WHEN `FunId` = '02' THEN 
											SET @stmt_json = CONCAT_WS("","SELECT c(quotj(CONCAT_WS(',' ,a.`0`,a.`1`))) as file \nFROM(\n", 
													"SELECT ",t_ckv('0',1,'a.enterId,a.EnterBFid,a.enterback_title,a.file_name,a.billid'), 'AS `0`,\n','CONCAT("\\\"a\\\"",":",','a.enterback_file) AS `1`',"\nFROM acc_enter_backfile AS a\nWHERE 1" ,
													preg_replace(REG('R1'),' AND $2 = $4',`0`),'\n) AS a');

						WHEN `FunId`='03' THEN 
											SET @stmt_json = CONCAT_WS("","UPDATE acc_enter_backfile AS a \n SET a.enterback_file =", QUOTE(`1`),
																				IF(IFNULL(`2`,'') = '', NULL,CONCAT(',',preg_replace(REG('R1'),'\n$2 = $3',`2`))),
																								"WHERE 1 \n", preg_replace(REG('R1'),' AND $2 = $4',`0`));

				ELSE	SET	@stmt_json = CONCAT_WS('','SELECT "Wrong or no `FunId` ',QUOTE(`FunId`),'" AS mes');
			END CASE; 

		ELSE 	BEGIN 	DECLARE `acc_b` VARCHAR(10) DEFAULT NULL;
		-- 	
				SET `acc_b` =expid2b(CAST(json_value(dblob,'$.0.expID') AS CHAR));
			CASE			
			WHEN  `FunId`	= '4' THEN 
					SET @stmt_json = CONCAT_WS("","DELETE a.*,b.* FROM acc_a AS a LEFT JOIN ",`acc_b`,"  AS b ON a.expID = b.expID AND a.missionId = b.missionId\nWHERE 1 ",
																		 preg_replace(REG('R1'),' AND  a.$2 = $4 ',`0`));
			WHEN `FunId` = '5' THEN 
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
															"\nFROM ",`acc_b`,"  AS a\n",
															'INNER JOIN acc_mission AS b ON a.missionId = b.missionId\n',
															"WHERE a.expID = ",json_extract(`0`,'$.expID'),
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

			WHEN `FunId` = '6' THEN 
			 BEGIN 

				DECLARE `1C` VARCHAR(2000) DEFAULT NULL;
				DECLARE `2C` VARCHAR(2000) DEFAULT NULL;

-- b
				SET		`1C` = '1,3,4,5,6',
							`r` = '(?ms)"[45]":{"v":\\s*(?:"(?:(?=\\\\).{2}|(?!["\\\\]).)*?"|null|\\-?[\\d,]+(?:\\.\\d+))\\K,\\s*"c":\\s*"1"';

				SET		@stmt_json = CONCAT_WS('',"SELECT b.rowNo,b.b1,","/*@t, 3  b.b3,*/money(CASE @t WHEN 0 THEN b.b3 WHEN 1  THEN @b3  WHEN 2 THEN @z3 END) AS b3,","/*4 c.b3*/money(CASE @t WHEN 0 THEN c.b3 WHEN 1  THEN @b4  WHEN 2 THEN @z4 END)  AS b4,","/*b.b5 c.b4*/money(CASE @t WHEN 0 THEN c.b4 WHEN 1  THEN @b5  WHEN 2 THEN @z5 END)  AS b5,","/*6*/money(CASE @t WHEN 0 THEN isnu(b.b3) + isnu(c.b3) - isnu(c.b4) WHEN 1 THEN @b3 + @b4 -@b5 WHEN 2 THEN @z3 + @z4 -@z5 END) AS b6,\n","/*clear*/CASE @t WHEN 0 THEN if1(@b3 := @b3 + isnu(b.b3)) AND if1(@b4 := @b4 + isnu(c.b3)) AND if1(@b5 := @b5 + isnu(c.b4)) WHEN 1  THEN if1(@z3 := @z3 + @b3) AND if1(@b3:=0) AND if1(@z4 := @z4 + @b4) AND if1(@b4:=0) AND if1(@z5 := @z5 + @b5) AND if1(@b5:=0) WHEN 2 THEN IF(b.b1 LIKE '负债合计%',1,if1(@z3:=0) AND if1(@z4:=0) AND if1(@z5:=0)) END \n",																			"FROM acc_standard_n AS b LEFT JOIN ",`acc_b`,"  AS c ON c.expID = ",json_extract(`0`,'$.expID'), " AND b.b1 = c.b2\n",																			"WHERE b.missionId = ",json_extract(`0`,'$.missionId')," AND if1(@t := CASE WHEN b.b1 LIKE '%合计%' AND NOT b.b1 LIKE '负债合计%'  THEN 1 WHEN b.b1 LIKE '%总计%' OR b.b1 LIKE '负债合计%' THEN 2 ELSE 0 END)" ),
							@stmt_json = CONCAT_WS('',"SELECT  quotd(a.rowNo) AS rowno,quotj(CONCAT_WS(',',",CONCAT_WS(',',preg_replace(REG('2c'),"CONCAT(quotn('$1'),':{\"v\":',quotn(b$1),',\"c\":\"1\"}')$2",`1C`)),')) AS b\n',														"FROM(\n",@stmt_json,"\n) AS a "),
							@stmt_json = CONCAT_WS('',"SELECT c(CONCAT_WS('',CONCAT('{\"line\":',quotd(COUNT(*))),',',GROUP_CONCAT(CONCAT_WS('',a.rowno,':',a.b,'\n')),'}')) AS b\nFROM(\n",													@stmt_json,"\n) AS a ")/**/ ;

				SET		@stmt_json = CONCAT_WS('',"SELECT REGEXP_replace(b,",QUOTE(`r`),",'') b\nFROM(\n",@stmt_json,"\n) AS a ");


				SET @rowId = 0,@t = 0, @b3 = 0.00,@b4 = 0.00,@b5 = 0.00,@b6 = 0.00,@z3 = 0.00,@z4 = 0.00,@z5 = 0.00,@z6 = 0.00;
-- SELECT  c(@stmt_json );  LEAVE m_j;
				EXECUTE  immediate @stmt_json;

				LEAVE m_j;

			END;

			WHEN `FunId`= '7' || `FunId`= '8' THEN 
			 BEGIN 

				DECLARE `1C` VARCHAR(2000) DEFAULT NULL;
				DECLARE `2C` VARCHAR(2000) DEFAULT NULL;
-- b
				SET		`1C` = REPLACE('`1`,`3`,`4`,`5`,`6`','`',''),
							`2C` = REPLACE('`1`,`2`,`3`,`4`','`',''),
							`r` = '(?ms)"[45]":{"v":\\s*(?:"(?:(?=\\\\).{2}|(?!["\\\\]).)*?"|null|\\-?[\\d,]+(?:\\.\\d+))\\K,\\s*"c":\\s*"1"';

				SET		@stmt_json = CONCAT_WS('',"SELECT c.expID,c.missionId,c.rowId,c.b1,c.b2,Sum(c.b3) AS b3,c(GROUP_CONCAT(IF(IFNULL(c.b3,'')!='',REGEXP_substr(a.missionLabel,",QUOTE(R('index')),"),NULL))) AS t3,SUM(c.b4) AS b4 ,c(GROUP_CONCAT(IF(IFNULL(c.b4,'')!='',REGEXP_substr(a.missionLabel,",QUOTE(R('index')),"),NULL))) AS t4 FROM ",`acc_b`,"  AS c INNER JOIN acc_mission AS a ON c.missionId = a.missionId  WHERE c.expID = ",json_extract(`0`,'$.expID'), " GROUP BY TRIM(c.b2)"),
							@stmt_json = CONCAT_WS('',"SELECT b.rowNo,b.b1,NULL AS t1,NULL AS t2, NULL AS t3,NULL AS t6,","/* @t,@b3,b.b3,*/money(@`1`:= if(if1(@b3 := @b3 + @t*isnu(b.b3)) AND @t = '0.0',@b3,b.b3)) AS b3,","/*c.b3 AS b3,@b4,b.b4,*/money(@`2`:= IF(if1(@b4 := @b4 + isnu(c.b3)) AND @t = '0.0',@b4,c.b3)) AS b4,c.t4,","/*c.b3 AS cb3,@b4,*/money(@`3`:= if(if1(@b5 := @b5 + isnu(c.b4)) AND @t = '0.0',@b5,c.b4)) AS b5,c.t4 AS t5,","/*b6,*/money(CASE WHEN @t =1 OR @t ='0.0' THEN isnu(@`1`)-isnu(@`2`)+ isnu(@`3`) ELSE isnu(@`1`)+isnu(@`2`)-isnu(@`3`) END) AS b6\n","FROM acc_standard_n AS b LEFT JOIN(",@stmt_json,")AS c ON INSTR(b.b1,c.b2)\n",	"WHERE b.missionId = ",json_extract(`0`,'$.missionId')," AND if1(@t := CASE WHEN b.b1 REGEXP '^(减)' THEN '-1' WHEN b.b1 REGEXP '^(加)' THEN '1' WHEN b.b1 REGEXP '^其中' THEN '0'WHEN b.b1 REGEXP '^(一|五)' THEN '1' WHEN b.b1 REGEXP CONCAT('^(',R1('〇-九'),')') THEN '0.0' ELSE @t END)" ),
							@stmt_json = CONCAT_WS('',"SELECT  quotd(a.rowNo) AS rowno,quotj(CONCAT_WS(',',",CONCAT_WS(',',preg_replace(REG('2c'),"CONCAT(quotn('$1'),':{\"v\":',quotn(b$1),',\"c\":\"1\"',IF((@tt:=CONCAT(',\"t\":',quotd(t$1)))IS NULL,'',@tt),'}')$2",`1C`)),')) AS b\n',"FROM(\n",@stmt_json,"\n) AS a "),
							@stmt_json = CONCAT_WS('',"SELECT c(CONCAT_WS('',CONCAT('{\"line\":',quotd(COUNT(*))),',',GROUP_CONCAT(CONCAT_WS('',a.rowno,':',a.b,'\n')),'}')) AS b\nFROM(\n",@stmt_json,"\n) AS a ");

				SET		@stmt_json = CONCAT_WS('',"SELECT REGEXP_replace(b,",QUOTE(`r`),",'') b\nFROM(\n",@stmt_json,"\n) AS a ");




					SET @t = '',@b3 = -0.00,@b4 = -0.00,@b5 = -0.00,@`1`=null,@`2`=0,@`3`=0;
-- SELECT  c(@stmt_json );--  LEAVE m_j;
					EXECUTE immediate  @stmt_json;

					LEAVE m_j;

				END;

			WHEN `FunId` ='888' THEN 
			 BEGIN 

				DECLARE `1C` VARCHAR(2000) DEFAULT NULL;
				DECLARE `2C` VARCHAR(2000) DEFAULT NULL;

-- b
				SET		`1C` = REPLACE('`1`,`3`,`4`,`5`,`6`','`',''),
							`2C` = REPLACE('`1`,`2`,`3`,`4`','`',''),
							`r` = '(?ms)"[45]":{"v":\\s*(?:"(?:(?=\\\\).{2}|(?!["\\\\]).)*?"|null|\\-?[\\d,]+(?:\\.\\d+))\\K,\\s*"c":\\s*"1"';

				SET		@stmt_json = CONCAT_WS('',"SELECT c.expID,c.missionId,c.rowId,c.b1,c.b2,Sum(c.b3) AS b3,c(GROUP_CONCAT(IF(IFNULL(c.b3,'')!='',REGEXP_substr(a.missionLabel,",QUOTE(R('index')),"),NULL))) AS t3,SUM(c.b4) AS b4 ,c(GROUP_CONCAT(IF(IFNULL(c.b4,'')!='',REGEXP_substr(a.missionLabel,",QUOTE(R('index')),"),NULL))) AS t4 FROM ",`acc_b`,"  AS c INNER JOIN acc_mission AS a ON c.missionId = a.missionId  WHERE c.expID = ",json_extract(`0`,'$.expID'), " GROUP BY TRIM(c.b2)"),
							@stmt_json = CONCAT_WS('',"SELECT b.rowNo,b.b1,NULL AS t1,NULL AS t2, NULL AS t3,NULL AS t6,","/* @t,@b3,b.b3,*/money(@`1`:= if(if1(@b3 := @b3 + @t*isnu(b.b3)) AND @t = '0.0',@b3,b.b3)) AS b3,","/*c.b3 AS b3,@b4,b.b4,*/money(@`2`:= IF(if1(@b4 := @b4 + isnu(c.b3)) AND @t = '0.0',@b4,c.b3)) AS b4,c.t4,","/*c.b3 AS cb3,@b4,*/money(@`3`:= if(if1(@b5 := @b5 + isnu(c.b4)) AND @t = '0.0',@b5,c.b4)) AS b5,c.t4 AS t5,","/*b6,*/money(CASE WHEN @t =1 OR @t ='0.0' THEN isnu(@`1`)-isnu(@`2`)+ isnu(@`3`) ELSE isnu(@`1`)+isnu(@`2`)-isnu(@`3`) END) AS b6\n","FROM acc_standard_n AS b LEFT JOIN(",@stmt_json,")AS c ON INSTR(b.b1,c.b2)\n",	"WHERE b.missionId = ",json_extract(`0`,'$.missionId')," AND if1(@t := CASE WHEN b.b1 REGEXP '^(减)' THEN '-1' WHEN b.b1 REGEXP '^(加)' THEN '1' WHEN b.b1 REGEXP '^其中' THEN '0'WHEN b.b1 REGEXP '^(一|五)' THEN '1' WHEN b.b1 REGEXP CONCAT('^(',R1('〇-九'),')') THEN '0.0' ELSE @t END)" ),
							@stmt_json = CONCAT_WS('',"SELECT  quotd(a.rowNo) AS rowno,quotj(CONCAT_WS(',',",CONCAT_WS(',',preg_replace(REG('2c'),"CONCAT(quotn('$1'),':{\"v\":',quotn(b$1),',\"c\":\"1\"',IF((@tt:=CONCAT(',\"t\":',quotd(t$1)))IS NULL,'',@tt),'}')$2",`1C`)),')) AS b\n',"FROM(\n",@stmt_json,"\n) AS a "),
							@stmt_json = CONCAT_WS('',"SELECT c(CONCAT_WS('',CONCAT('{\"line\":',quotd(COUNT(*))),',',GROUP_CONCAT(CONCAT_WS('',a.rowno,':',a.b,'\n')),'}')) AS b\nFROM(\n",@stmt_json,"\n) AS a ");

				SET		@stmt_json = CONCAT_WS('',"SELECT REGEXP_replace(b,",QUOTE(`r`),",'') b\nFROM(\n",@stmt_json,"\n) AS a ");




					SET @t = '',@b3 = -0.00,@b4 = -0.00,@b5 = -0.00,@`1`=0,@`2`=0,@`3`=0;
-- SELECT  c(@stmt_json ); LEAVE m_j;
					EXECUTE immediate @stmt_json;

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
--  Procedure definition for `m_j_copy`
-- ----------------------------
DROP PROCEDURE IF EXISTS `m_j_copy`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `m_j_copy`(IN `FunId` varchar(2),in `dblob` LONGBLOB)
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
	DECLARE `r` text DEFAULT NULL;


/*
CALL Audit_1('m_j',CONCAT_WS(',',QUOTE(`FunId`),QUOTE(`dblob`)),'ok');

COMMIT;
/*LEAVE m_j;*/

  SET @stmt_json = NULL,
	 		`0` = j0(dblob,'0'),
			`2` = j0(dblob,'2'),
			`1` = j0(dblob,'1');


	CASE 

			WHEN `FunId` REGEXP '^1' THEN
			CASE 
					WHEN `FunId`= '11' THEN 
						SET @`1C` = '1,2,3,4',
								@`1C` = preg_replace(r('`2c`'),"CONCAT(quotn('$1'),':{\"v\":',quotn(a.$1),'}')$2",@`1C`),
								@stmt_json = CONCAT_WS('',"SELECT a.bdId,a.line,CONCAT_WS('',quotn(a.rowNo),':{',CONCAT_WS(''",",",@`1C`,"),'}') AS b ",'FROM bigdata_ab AS a WHERE a.bdId = "bdId-160604233010318113"'),
								@stmt_json = CONCAT_WS('',"SELECT CONCAT_WS('','{',kv0('bdId',a.bdId,0),kv0('line',COUNT(*),0),GROUP_CONCAT(a.b SEPARATOR ',') ,'}') AS b\n",
'FROM(\n',@stmt_json,'\n)AS a');

				ELSE SET	@stmt_json = CONCAT_WS('','SELECT "Wrong or no `FunId` ',QUOTE(`FunId`),'" AS mes');
			END CASE;

			WHEN `FunId` REGEXP '^0' THEN 
				CASE 
						WHEN	`FunId` = '01' THEN 
									SET	@stmt_json = CONCAT_WS("","INSERT ","acc_enter_backfile",	"(enterId,EnterBFid,enterback_title,file_name,enterback_file,billid)", 	"\nVALUE(",CONCAT_WS(",",
																			j1(`0`,"enterId"),
																			IF(j1(`0`,"EnterBFid") = "NULL" OR j1(`0`,"EnterBFid") = ""  ,QUOTE(gkey("ENTbf")),j1(dblob,"EnterBFid")),
																			j1(`0`,"enterback_title"),j1(`0`,"file_name"), QUOTE(`1`),j1(`0`,"billid")),")");
						WHEN `FunId` = '02' THEN 
											SET @stmt_json = CONCAT_WS("","SELECT c(quotj(CONCAT_WS(',' ,a.`0`,a.`1`))) as file \nFROM(\n", 
													"SELECT ",t_ckv('0',1,'a.enterId,a.EnterBFid,a.enterback_title,a.file_name,a.billid'), 'AS `0`,\n','CONCAT("\\\"a\\\"",":",','a.enterback_file) AS `1`',"\nFROM acc_enter_backfile AS a\nWHERE 1" ,
													preg_replace(REG('R1'),' AND $2 = $4',`0`),'\n) AS a');

						WHEN `FunId`='03' THEN 
											SET @stmt_json = CONCAT_WS("","UPDATE acc_enter_backfile AS a \n SET a.enterback_file =", QUOTE(`1`),
																				IF(IFNULL(`2`,'') = '', NULL,CONCAT(',',preg_replace(REG('R1'),'\n$2 = $3',`2`))),
																								"WHERE 1 \n", preg_replace(REG('R1'),' AND $2 = $4',`0`));

				ELSE	SET	@stmt_json = CONCAT_WS('','SELECT "Wrong or no `FunId` ',QUOTE(`FunId`),'" AS mes');
			END CASE; 

		ELSE 	BEGIN 	DECLARE `acc_b` VARCHAR(10) DEFAULT NULL;
		-- 	
				SET `acc_b` =expid2b(CAST(json_value(dblob,'$.0.expID') AS CHAR));
			CASE			
			WHEN  `FunId`	= '4' THEN 
					SET @stmt_json = CONCAT_WS("","DELETE a.*,b.* FROM acc_a AS a LEFT JOIN ",`acc_b`,"  AS b ON a.expID = b.expID AND a.missionId = b.missionId\nWHERE 1 ",
																		 preg_replace(REG('R1'),' AND  a.$2 = $4 ',`0`));
			WHEN `FunId` = '5' THEN 
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
															"\nFROM ",`acc_b`,"  AS a\n",
															'INNER JOIN acc_mission AS b ON a.missionId = b.missionId\n',
															"WHERE a.expID = ",json_extract(`0`,'$.expID'),
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

			WHEN `FunId` = '6' THEN 
			 BEGIN 

				DECLARE `1C` VARCHAR(2000) DEFAULT NULL;
				DECLARE `2C` VARCHAR(2000) DEFAULT NULL;

-- b
				SET		`1C` = '1,3,4,5,6',
							`r` = '(?ms)"[45]":{"v":\\s*(?:"(?:(?=\\\\).{2}|(?!["\\\\]).)*?"|null|\\-?[\\d,]+(?:\\.\\d+))\\K,\\s*"c":\\s*"1"';

				SET		@stmt_json = CONCAT_WS('',"SELECT b.rowNo,b.b1,","/*@t, 3  b.b3,*/money(CASE @t WHEN 0 THEN b.b3 WHEN 1  THEN @b3  WHEN 2 THEN @z3 END) AS b3,","/*4 c.b3*/money(CASE @t WHEN 0 THEN c.b3 WHEN 1  THEN @b4  WHEN 2 THEN @z4 END)  AS b4,","/*b.b5 c.b4*/money(CASE @t WHEN 0 THEN c.b4 WHEN 1  THEN @b5  WHEN 2 THEN @z5 END)  AS b5,","/*6*/money(CASE @t WHEN 0 THEN isnu(b.b3) + isnu(c.b3) - isnu(c.b4) WHEN 1 THEN @b3 + @b4 -@b5 WHEN 2 THEN @z3 + @z4 -@z5 END) AS b6,\n","/*clear*/CASE @t WHEN 0 THEN if1(@b3 := @b3 + isnu(b.b3)) AND if1(@b4 := @b4 + isnu(c.b3)) AND if1(@b5 := @b5 + isnu(c.b4)) WHEN 1  THEN if1(@z3 := @z3 + @b3) AND if1(@b3:=0) AND if1(@z4 := @z4 + @b4) AND if1(@b4:=0) AND if1(@z5 := @z5 + @b5) AND if1(@b5:=0) WHEN 2 THEN IF(b.b1 LIKE '负债合计%',1,if1(@z3:=0) AND if1(@z4:=0) AND if1(@z5:=0)) END \n",																			"FROM acc_standard_n AS b LEFT JOIN ",`acc_b`,"  AS c ON c.expID = ",json_extract(`0`,'$.expID'), " AND b.b1 = c.b2\n",																			"WHERE b.missionId = ",json_extract(`0`,'$.missionId')," AND if1(@t := CASE WHEN b.b1 LIKE '%合计%' AND NOT b.b1 LIKE '负债合计%'  THEN 1 WHEN b.b1 LIKE '%总计%' OR b.b1 LIKE '负债合计%' THEN 2 ELSE 0 END)" ),
							@stmt_json = CONCAT_WS('',"SELECT  quotd(a.rowNo) AS rowno,quotj(CONCAT_WS(',',",CONCAT_WS(',',preg_replace(REG('2c'),"CONCAT(quotn('$1'),':{\"v\":',quotn(b$1),',\"c\":\"1\"}')$2",`1C`)),')) AS b\n',														"FROM(\n",@stmt_json,"\n) AS a "),
							@stmt_json = CONCAT_WS('',"SELECT c(CONCAT_WS('',CONCAT('{\"line\":',quotd(COUNT(*))),',',GROUP_CONCAT(CONCAT_WS('',a.rowno,':',a.b,'\n')),'}')) AS b\nFROM(\n",													@stmt_json,"\n) AS a ")/**/ ;

				SET		@stmt_json = CONCAT_WS('',"SELECT REGEXP_replace(b,",QUOTE(`r`),",'') b\nFROM(\n",@stmt_json,"\n) AS a ");


				SET @rowId = 0,@t = 0, @b3 = 0.00,@b4 = 0.00,@b5 = 0.00,@b6 = 0.00,@z3 = 0.00,@z4 = 0.00,@z5 = 0.00,@z6 = 0.00;
-- SELECT  c(@stmt_json );  LEAVE m_j;
				EXECUTE  immediate @stmt_json;

				LEAVE m_j;

			END;

			WHEN `FunId`= '7' || `FunId`= '8' THEN 
			 BEGIN 

				DECLARE `1C` VARCHAR(2000) DEFAULT NULL;
				DECLARE `2C` VARCHAR(2000) DEFAULT NULL;
-- b
				SET		`1C` = REPLACE('`1`,`3`,`4`,`5`,`6`','`',''),
							`2C` = REPLACE('`1`,`2`,`3`,`4`','`',''),
							`r` = '(?ms)"[45]":{"v":\\s*(?:"(?:(?=\\\\).{2}|(?!["\\\\]).)*?"|null|\\-?[\\d,]+(?:\\.\\d+))\\K,\\s*"c":\\s*"1"';

				SET		@stmt_json = CONCAT_WS('\n', "SELECT c.expID,c.missionId,c.rowId,c.b1,c.b2,c.b3,c(IF(IFNULL(c.b3,'')!='',REGEXP_substr(a.missionLabel,",QUOTE(R('index')),"),NULL)) AS t3,c.b4 AS b4 ,c(GROUP_CONCAT(IF(IFNULL(c.b4,'')!='',REGEXP_substr(a.missionLabel,",QUOTE(R('index')),"),NULL))) AS t4"
,CONCAT_ws('',"FROM ",`acc_b`,"  AS c")
,CONCAT_ws('',"INNER JOIN acc_mission AS a ON c.missionId = a.missionId")
,CONCAT_ws('',"WHERE c.expID = ",json_extract(`0`,'$.expID'), " GROUP BY TRIM(c.b2)"))
-- 							,@stmt_json = CONCAT_WS('',"SELECT b.rowNo,b.b1,NULL AS t1,NULL AS t2, NULL AS t3,NULL AS t6,","/* @t,@b3,b.b3,*/money(@`1`:= if(if1(@b3 := @b3 + @t*isnu(b.b3)) AND @t = '0.0',@b3,b.b3)) AS b3,","/*c.b3 AS b3,@b4,b.b4,*/money(@`2`:= IF(if1(@b4 := @b4 + isnu(c.b3)) AND @t = '0.0',@b4,c.b3)) AS b4,c.t4,","/*c.b3 AS cb3,@b4,*/money(@`3`:= if(if1(@b5 := @b5 + isnu(c.b4)) AND @t = '0.0',@b5,c.b4)) AS b5,c.t4 AS t5,","/*b6,*/money(CASE WHEN @t =1 OR @t ='0.0' THEN isnu(@`1`)-isnu(@`2`)+ isnu(@`3`) ELSE isnu(@`1`)+isnu(@`2`)-isnu(@`3`) END) AS b6\n","FROM acc_standard_n AS b LEFT JOIN(",@stmt_json,")AS c ON INSTR(b.b1,c.b2)\n",	"WHERE b.missionId = ",json_extract(`0`,'$.missionId')," AND if1(@t := CASE WHEN b.b1 REGEXP '^(减)' THEN '-1' WHEN b.b1 REGEXP '^(加)' THEN '1' WHEN b.b1 REGEXP '^其中' THEN '0'WHEN b.b1 REGEXP '^(一|五)' THEN '1' WHEN b.b1 REGEXP CONCAT('^(',R1('〇-九'),')') THEN '0.0' ELSE @t END)" )
--							,@stmt_json = CONCAT_WS('',"SELECT  quotd(a.rowNo) AS rowno,quotj(CONCAT_WS(',',",CONCAT_WS(',',preg_replace(REG('2c'),"CONCAT(quotn('$1'),':{\"v\":',quotn(b$1),',\"c\":\"1\"',IF((@tt:=CONCAT(',\"t\":',quotd(t$1)))IS NULL,'',@tt),'}')$2",`1C`)),')) AS b\n',"FROM(\n",@stmt_json,"\n) AS a ")
--							,@stmt_json = CONCAT_WS('',"SELECT c(CONCAT_WS('',CONCAT('{\"line\":',quotd(COUNT(*))),',',GROUP_CONCAT(CONCAT_WS('',a.rowno,':',a.b,'\n')),'}')) AS b\nFROM(\n",@stmt_json,"\n) AS a ")
;

-- 				SET		@stmt_json = CONCAT_WS('',"SELECT REGEXP_replace(b,",QUOTE(`r`),",'') b\nFROM(\n",@stmt_json,"\n) AS a ");




					SET @t = '',@b3 = -0.00,@b4 = -0.00,@b5 = -0.00,@`1`=null,@`2`=0,@`3`=0;
-- 
SELECT  c(@stmt_json );--  LEAVE m_j;
					EXECUTE immediate  @stmt_json;

					LEAVE m_j;

				END;

			WHEN `FunId` ='888' THEN 
			 BEGIN 

				DECLARE `1C` VARCHAR(2000) DEFAULT NULL;
				DECLARE `2C` VARCHAR(2000) DEFAULT NULL;

-- b
				SET		`1C` = REPLACE('`1`,`3`,`4`,`5`,`6`','`',''),
							`2C` = REPLACE('`1`,`2`,`3`,`4`','`',''),
							`r` = '(?ms)"[45]":{"v":\\s*(?:"(?:(?=\\\\).{2}|(?!["\\\\]).)*?"|null|\\-?[\\d,]+(?:\\.\\d+))\\K,\\s*"c":\\s*"1"';

				SET		@stmt_json = CONCAT_WS('',"SELECT c.expID,c.missionId,c.rowId,c.b1,c.b2,Sum(c.b3) AS b3,c(GROUP_CONCAT(IF(IFNULL(c.b3,'')!='',REGEXP_substr(a.missionLabel,",QUOTE(R('index')),"),NULL))) AS t3,SUM(c.b4) AS b4 ,c(GROUP_CONCAT(IF(IFNULL(c.b4,'')!='',REGEXP_substr(a.missionLabel,",QUOTE(R('index')),"),NULL))) AS t4 FROM ",`acc_b`,"  AS c INNER JOIN acc_mission AS a ON c.missionId = a.missionId  WHERE c.expID = ",json_extract(`0`,'$.expID'), " GROUP BY TRIM(c.b2)"),
							@stmt_json = CONCAT_WS('',"SELECT b.rowNo,b.b1,NULL AS t1,NULL AS t2, NULL AS t3,NULL AS t6,","/* @t,@b3,b.b3,*/money(@`1`:= if(if1(@b3 := @b3 + @t*isnu(b.b3)) AND @t = '0.0',@b3,b.b3)) AS b3,","/*c.b3 AS b3,@b4,b.b4,*/money(@`2`:= IF(if1(@b4 := @b4 + isnu(c.b3)) AND @t = '0.0',@b4,c.b3)) AS b4,c.t4,","/*c.b3 AS cb3,@b4,*/money(@`3`:= if(if1(@b5 := @b5 + isnu(c.b4)) AND @t = '0.0',@b5,c.b4)) AS b5,c.t4 AS t5,","/*b6,*/money(CASE WHEN @t =1 OR @t ='0.0' THEN isnu(@`1`)-isnu(@`2`)+ isnu(@`3`) ELSE isnu(@`1`)+isnu(@`2`)-isnu(@`3`) END) AS b6\n","FROM acc_standard_n AS b LEFT JOIN(",@stmt_json,")AS c ON INSTR(b.b1,c.b2)\n",	"WHERE b.missionId = ",json_extract(`0`,'$.missionId')," AND if1(@t := CASE WHEN b.b1 REGEXP '^(减)' THEN '-1' WHEN b.b1 REGEXP '^(加)' THEN '1' WHEN b.b1 REGEXP '^其中' THEN '0'WHEN b.b1 REGEXP '^(一|五)' THEN '1' WHEN b.b1 REGEXP CONCAT('^(',R1('〇-九'),')') THEN '0.0' ELSE @t END)" ),
							@stmt_json = CONCAT_WS('',"SELECT  quotd(a.rowNo) AS rowno,quotj(CONCAT_WS(',',",CONCAT_WS(',',preg_replace(REG('2c'),"CONCAT(quotn('$1'),':{\"v\":',quotn(b$1),',\"c\":\"1\"',IF((@tt:=CONCAT(',\"t\":',quotd(t$1)))IS NULL,'',@tt),'}')$2",`1C`)),')) AS b\n',"FROM(\n",@stmt_json,"\n) AS a "),
							@stmt_json = CONCAT_WS('',"SELECT c(CONCAT_WS('',CONCAT('{\"line\":',quotd(COUNT(*))),',',GROUP_CONCAT(CONCAT_WS('',a.rowno,':',a.b,'\n')),'}')) AS b\nFROM(\n",@stmt_json,"\n) AS a ");

				SET		@stmt_json = CONCAT_WS('',"SELECT REGEXP_replace(b,",QUOTE(`r`),",'') b\nFROM(\n",@stmt_json,"\n) AS a ");




					SET @t = '',@b3 = -0.00,@b4 = -0.00,@b5 = -0.00,@`1`=0,@`2`=0,@`3`=0;
-- SELECT  c(@stmt_json ); LEAVE m_j;
					EXECUTE immediate @stmt_json;

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
	
	DECLARE `r` VARCHAR(200) DEFAULT r('nb-1');
	DECLARE `id` VARCHAR(200) DEFAULT REGEXP_replace(`p`,`r`,'\\10\\2');
	DECLARE `subp` VARCHAR(200) DEFAULT REGEXP_replace(`p`,`r`,'\\10\\2\\3');
	DECLARE `fname` VARCHAR(200) DEFAULT REGEXP_replace(`p`,`r`,'\\4') ;

	RETURN IF(`fname` NOT REGEXP '\\.',CONCAT_WS('.',IF(`fname`<>REGEXP_replace(`p`,`r`,'\\1') ,CONCAT(`subp`,`fname`),`id`),'jsp'),CONCAT(`subp`,`fname`));
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `needinput`
-- ----------------------------
DROP FUNCTION IF EXISTS `needinput`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `needinput`(`table1` varchar(20),`table2` varchar(20),`fieldtype` varchar(20),`startno`smallint(2),`num` smallint(2)) RETURNS varchar(9500) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	set @subST = '' , 
			@field1 = CONCAT(trim(table2),'.',trim(fieldtype)), 
			@field2 = CONCAT(trim(table1),'.','init_',trim(fieldtype)); 

		SET @x  =  startno,
				@subst = '';

		while  num > 0 do
				set @y1 =  concat( @field1, @x), 
						@y2 = concat( @field2, @x),
						@subST = concat(@subST , IF(@x=1,'','+'),
"IF(IFNULL(",@y2,",'')='1', 0,IF(IFNULL(",@y1,",'')='',0,1)",')',if(MOD(@x,10)=0,char(10),'')),
				 @x = @x+1,
				 num = num - 1;		
		end WHILE;


	RETURN @subST ;  
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
	DECLARE `r0` VARCHAR(2000) DEFAULT '10(?:十|拾)	20(?:百|佰)	30(?:千|仟)	40万	80亿	160兆	320京	640垓';
	DECLARE `r`  VARCHAR(2000) DEFAULT REGEXP_replace(REGEXP_replace(CONCAT('^(.*?)(?:((?:',`r1`,'))((?:',`r0`,')*))'),'(?:\\s*)(\\d+)','|'),'(?<=:)\\|','');
	DECLARE `p`  VARCHAR(10) DEFAULT NULL;
	DECLARE `p0`  VARCHAR(10) DEFAULT 0;
	DECLARE `c0`  VARCHAR(10) DEFAULT 0;
	DECLARE `re`  VARCHAR(10) DEFAULT NULL;

SET @i=0;
	SET s = REGEXP_replace(s,'(?:元|圆)(?:整|正)?','');
 	l:LOOP 
SET @i=@i+1;
		SET `p`=REGEXP_SUBSTR(`s`,`r`);
/**/
		IF IFNULL(`p`,'') = '' THEN LEAVE l;END IF;

    SET  `s` = REGEXP_replace(`s`,`r`,'');
			
				BEGIN DECLARE `ree`  VARCHAR(1000) DEFAULT REGEXP_replace(`p`,`r`,'\\3');DECLARE `part`  VARCHAR(10) DEFAULT NULL;SET p0=0;l2: LOOP 
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

	RETURN CONCAT(`re`,REPEAT(0,c0), `s`)/**/
;
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
	DECLARE `p2` BLOB DEFAULT j(`p`,'p2'); DECLARE `funcid` VARCHAR(60) DEFAULT j(`p2`,'funcid');DECLARE `b` BLOB DEFAULT NULL;

  DECLARE CONTINUE HANDLER FOR  SQLSTATE '23000', SQLSTATE	'42000'	, SQLSTATE	'42S22' , SQLSTATE	'HY000'
	bl:BEGIN GET DIAGNOSTICS CONDITION 1 @`sqlstate` = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;SET  @`sqlstate` = JSON_OBJECT('sqlstate',@`sqlstate`,'errno',@errno,'text',@text);
				SET @`errsql` = @sql_body,@funcid =  NULL;
				SET @funcid = CONCAT_WS(' ','Error: ',(SELECT CONCAT_WS(', ',a.note,CONCAT_WS('',UPPER(SUBSTR(a.`name`,1,1)),LOWER(substr(a.`name`,2))),a.id) FROM mysq1_schema.qs AS a WHERE a.`name` = `funcid`)
									, ' p' ),
				@pp = QUOTE(`p`);
				CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp,'SQL',@`errsql`,'err',@`sqlstate`,'l',1));END;


START TRANSACTION;
SET @funcid = CONCAT_WS(' ',(SELECT CONCAT_WS(', ',a.note,CONCAT_WS('',UPPER(SUBSTR(a.`name`,1,1)),LOWER(substr(a.`name`,2))),a.id) FROM mysq1_schema.qs AS a WHERE a.`name` = `funcid`)
							, ' p' ),
		@pp = QUOTE(`p`);
CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp));COMMIT;	


	IF IFNULL(`p2`,'')= '' THEN CALL Error('p :no p2 or courseNo');	ELSE SET @p1_body = '';END IF;

	IF j(p2,'keyword') <> '' THEN 

		BEGIN 
			DECLARE k TEXT DEFAULT j(p2,'keyword');DECLARE k1 TEXT DEFAULT NULL;

			SET k1 :=  REGEXP_replace(k,r('hza'),'\\\\\\\\Q\\1\\\\\\\\\E'),
					p2 = REGEXP_replace(p2,'(?i)(?<="keyword":)("(?:\\\\.|[^"])+")',json_quote(k1));
		END;
	END IF;

	IF p2 REGEXP '(?i)"bid":"(?:\\\\.|[^"])+"' THEN
		SET `b` = r8(j(p2,"bid"));

		sc:BEGIN
			DECLARE `pl` VARCHAR(200) DEFAULT REGEXP_replace(REGEXP_replace(COLUMN_list(b),'(?:^|,)`[^`]*(?<!\\d)`(?=,|$)',''),'^,|,$','');
			DECLARE `oP`  VARCHAR(60) DEFAULT NULL; DECLARE `s` BLOB DEFAULT column_get(b,'s'AS CHAR);DECLARE parameter BLOB DEFAULT column_get(b,'parameter'AS CHAR);

			IF IFNULL(parameter,'')<>'' AND IFNULL(s,'')<>'' THEN 
					SET @s = s;
					SET parameter = r5(parameter,p2);
					EXECUTE immediate parameter;
					SET s = @s;
			END IF;

			SET	@p1_body = COLUMN_get(`b`,'sql'AS CHAR);

			IF IFNULL(@p1_body,'') <> '' THEN SET	@p1_body = r5(@p1_body,p2);ELSE LEAVE sc; END IF; 

			IF CAST(@p1_body AS CHAR) IS NULL THEN SET @p1_body = CONVERT(@p1_body USING gbk);END IF;

			PREPARE scp_stmt from  @p1_body;COMMIT;EXECUTE scp_stmt ;		DEALLOCATE PREPARE scp_stmt ;

			l1:LOOP

				SET `oP` = REPLACE(REGEXP_SUBSTR(`pl`, '^`[^`]+`'),'`',''),@s = NULL;

				IF IFNULL(`oP`,'') = ''  THEN  LEAVE l1; ELSE SET `pl` = REGEXP_replace(`pl`, '^`[^`]+`,?','');END IF;

				SET @p1_body := NULL,
						@p1_body = COLUMN_get(b,op AS CHAR);

				IF IFNULL(@p1_body,'') = '' THEN ITERATE l1; END IF;

        IF s <>'' THEN 	SET @p1_body = REGEXP_replace(@p1_body,'(?i)(?<=FROM)\\s*(?:\\(\\s*)?`SQL`(?:\\s*\\))?\\s*(?=as\\s+[\\w]\\b)',CONCAT_WS('\n','\\1(','-- Start',REGEXP_replace(QUOTE(s),'^[\'"]|[\'"]$',''),'-- End',')'));				END IF;

				SET @p1_body = CAST(r5(@p1_body,p2) AS CHAR);

				IF CAST(@p1_body AS CHAR) IS NULL THEN SET @p1_body = CONVERT(@p1_body USING gbk);END IF;



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

					SET @s = s,parameter = r5(parameter,p2);

					EXECUTE immediate parameter;

					IF IFNULL(@s,'') <> ''THEN
						SET s = @s;
					END IF;
			END IF;


      IF s <>'' THEN 	SET @p1_body = REGEXP_replace(@p1_body,'(?i)(?<=FROM)\\s*(?:\\(\\s*)?`SQL`(?:\\s*\\))?\\s*(?=as\\s+[\\w]+\\b)',CONCAT_WS('\n','\\1(','-- Start',REGEXP_replace(QUOTE(s),'^[\'"]|[\'"]$',''),'-- End',')'));				END IF;

			SET @p1_body = CAST(r5(@p1_body,p2)AS CHAR);

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

	 	SET 	@p1_body =CONCAT_WS('\t','SELECT\tCAST(COLUMN_json(COLUMN_create(',QUOTE(IF(IFNULL(COLUMN_get(b,'dom'AS CHAR),'')='','dblob',COLUMN_get(b,'dom'AS CHAR)))
,CONCAT_WS('',',a.dblob))AS CHAR)AS dblob\tFROM(\n',@p1_body,'\n)AS A '));			

		IF CAST(@p1_body AS CHAR) IS NULL THEN SET @p1_body = CONVERT(@p1_body USING gbk);END IF;



	PREPARE p_stmt from  @p1_body;COMMIT;EXECUTE p_stmt ;		DEALLOCATE PREPARE p_stmt ;

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
	


-- 用于背景表单(任务表单)
-- 1、获取背景表单划线联次信息T数据
-- 2、获取背景表单A数据
-- 3、获取背景表单B数据
-- 4、获取背景表单签章数据


START TRANSACTION ;
CALL Audit_1('polling_mission',CONCAT_WS(',',QUOTE(`_expid`),QUOTE(`_id`),QUOTE(`_pageNo`)),'ok');
COMMIT;
SELECT null;LEAVE polling_mission;

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



	

	SET @poll_mission_stat = CONCAT("SELECT 	a.missionId, a.billId,\n",
					QUOTE(_pageno),"AS pageNo,a.is_line,a.line_x1,a.line_y1,a.line_x2,a.line_y2,a.line_color,a.line_type,\n" ,
					Temp_Func("a.t??",1,8,NULL),",b.standard_jsp,b.max_page,\n",
					Temp_Func("b.page_title??",1,8,NULL),"\n"
					"FROM acc_mission AS a\n",
					"INNER JOIN mysq1_schema.bill_list AS b ON a.billId = b.billId\n",
					"WHERE a.missionId=",QUOTE(_id)) ;
		PREPARE stmt_poll FROM @poll_mission_stat;
		EXECUTE stmt_poll;



		SET @poll_mission_stat = CONCAT("SELECT ",QUOTE(_id)," AS missionId ,", Temp_Func("a??",1,100,NULL),"\n", 
													"FROM acc_1 AS a \n",
													"where a.expid=",QUOTE(_expid)," AND a.missionid =",QUOTE(_id));

		PREPARE stmt_poll FROM @poll_mission_stat;
		EXECUTE stmt_poll;



		SET @poll_mission_stat = CONCAT("SELECT a.ROWid,",QUOTE(_id)," AS missionId ,", Temp_Func("b??",1,50,NULL),"\n", 
													"FROM ",expid2b(_expid)," AS a \n",
													"where a.expid=",QUOTE(_expid)," AND a.missionid =",QUOTE(_id));

		PREPARE stmt_poll FROM @poll_mission_stat;
		EXECUTE stmt_poll;
		

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
--  Procedure definition for `psj`
-- ----------------------------
DROP PROCEDURE IF EXISTS `psj`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `psj`(IN `db` LONGBLOB)
psj:BEGIN
	
	DECLARE `0` VARCHAR(1000) DEFAULT NULL;	DECLARE `1` LONGBLOB DEFAULT NULL;DECLARE `2` BLOB DEFAULT NULL;

  SET @stmt_json = NULL,
	 		`0` = j(db,'0'),
			`2` = j(db,'2'),
			`db` = j(db,'1');

	SET @stmt_json = CONCAT_WS('\t',j(`0`,"func"),j(`0`,"TABLE"));

	CASE 
			WHEN @stmt_json REGEXP '(update|INSERT)\\s+[\\S]+' THEN
					SET  `1` = REG2('`fields2`'),
							`db` =  CONCAT('SET ',c(filter1(`1`,db))),
							@stmt_json = CONCAT_WS('\n',@stmt_json,`db`) ;

			WHEN @stmt_json REGEXP '(select|delete)\\s+[\\S]+' THEN
					SET	`1` = REG2('`fields1`'),
							`db` = CONCAT('c(CONCAT("{",',filter1(`1`,`db`),',"}")) AS db'),


							`1` = REG2('`where`'),

							@stmt_json = CONCAT_WS('\n',j(`0`,"func"),`db`
									,CONCAT('from ',j(`0`,"table"))
									,REGEXP_replace(filter1(`1`,`0`),'^and','where'));


		ELSE	SET @stmt_json = "something is wrang...";
				
	END CASE;
	
  


	PREPARE stmt_json FROM @stmt_json;
	EXECUTE stmt_json ;

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
	DECLARE `p2` BLOB DEFAULT json_extract(`p`,'$.p2'); DECLARE `funcid` VARCHAR(60) DEFAULT j(`p2`,'funcId');DECLARE `b` BLOB DEFAULT NULL;

  DECLARE CONTINUE HANDLER FOR  SQLSTATE '23000', SQLSTATE	'42000'	, SQLSTATE	'42S22' , SQLSTATE	'HY000'
	bl:BEGIN GET DIAGNOSTICS CONDITION 1 @`sqlstate` = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;SET  @`sqlstate` = JSON_OBJECT('sqlstate',@`sqlstate`,'errno',@errno,'text',@text);
				SET @`errsql` = @sql_body,@funcid =  NULL;
				SET @funcid = CONCAT_WS(' ','Error: ',(SELECT CONCAT_WS(', ',a.note,CONCAT_WS('',UPPER(SUBSTR(a.`name`,1,1)),LOWER(substr(a.`name`,2))),a.id) FROM mysq1_schema.qs AS a WHERE a.`name` = `funcid`)
									, ' p' ),
				@pp = QUOTE(`p`);
				CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp,'SQL',@`errsql`,'err',@`sqlstate`,'l',1));END;

/*
START TRANSACTION;
SET @funcid = CONCAT_WS(' ',(SELECT CONCAT_WS(', ',a.note,CONCAT_WS('',UPPER(SUBSTR(a.`name`,1,1)),LOWER(substr(a.`name`,2))),a.id) FROM mysq1_schema.qs AS a WHERE a.`name` = `funcid`)
							, ' p' ),
		@pp = QUOTE(`p`);
CALL `Audit_3`(COLUMN_create('m',@funcid,'pp',@pp));COMMIT;	
/**/
	IF IFNULL(`p2`,'')= '' THEN CALL Error('p :no p2 or courseNo');	ELSE SET @p1_body = '';END IF;
SELECT 'fds';leave p;
	IF j(p2,'keyword') <> '' THEN 

		BEGIN 
			DECLARE k TEXT DEFAULT j(p2,'keyword');DECLARE k1 TEXT DEFAULT NULL;

			SET k1 :=  REGEXP_replace(k,r('hza'),'\\\\\\\\Q\\1\\\\\\\\\E'),
					p2 = REGEXP_replace(p2,'(?i)(?<="keyword":)("(?:\\\\.|[^"])+")',json_quote(k1));
		END;
	END IF;

	IF p2 REGEXP '(?i)"bid":"(?:\\\\.|[^"])+"' THEN
		SET `b` = r8(j(p2,"bid"));

		sc:BEGIN
			DECLARE `pl` VARCHAR(200) DEFAULT REGEXP_replace(REGEXP_replace(COLUMN_list(b),'(?:^|,)`[^`]*(?<!\\d)`(?=,|$)',''),'^,|,$','');
			DECLARE `oP`  VARCHAR(60) DEFAULT NULL; DECLARE `s` BLOB DEFAULT column_get(b,'s'AS CHAR);DECLARE parameter BLOB DEFAULT column_get(b,'parameter'AS CHAR);

			IF IFNULL(parameter,'')<>'' AND IFNULL(s,'')<>'' THEN 
					SET @s = s;
					SET parameter = r5(parameter,p2);
					EXECUTE immediate parameter;
					SET s = @s;
			END IF;

			SET	@p1_body = COLUMN_get(`b`,'sql'AS CHAR);

			IF IFNULL(@p1_body,'') <> '' THEN SET	@p1_body = r5(@p1_body,p2);ELSE LEAVE sc; END IF; 

			IF CAST(@p1_body AS CHAR) IS NULL THEN SET @p1_body = CONVERT(@p1_body USING gbk);END IF;

			PREPARE scp_stmt from  @p1_body;COMMIT;EXECUTE scp_stmt ;		DEALLOCATE PREPARE scp_stmt ;

			l1:LOOP

				SET `oP` = REPLACE(REGEXP_SUBSTR(`pl`, '^`[^`]+`'),'`',''),@s = NULL;

				IF IFNULL(`oP`,'') = ''  THEN  LEAVE l1; ELSE SET `pl` = REGEXP_replace(`pl`, '^`[^`]+`,?','');END IF;

				SET @p1_body := NULL,
						@p1_body = COLUMN_get(b,op AS CHAR);

				IF IFNULL(@p1_body,'') = '' THEN ITERATE l1; END IF;

        IF s <>'' THEN 	SET @p1_body = REGEXP_replace(@p1_body,'(?i)(?<=FROM)\\s*(?:\\(\\s*)?`SQL`(?:\\s*\\))?\\s*(?=as\\s+[\\w]\\b)',CONCAT_WS('\n','\\1(','-- Start',REGEXP_replace(QUOTE(s),'^[\'"]|[\'"]$',''),'-- End',')'));				END IF;

				SET @p1_body = CAST(r5(@p1_body,p2) AS CHAR);

				IF CAST(@p1_body AS CHAR) IS NULL THEN SET @p1_body = CONVERT(@p1_body USING gbk);END IF;



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

					SET @s = s,parameter = r5(parameter,p2);

					EXECUTE immediate parameter;

					IF IFNULL(@s,'') <> ''THEN
						SET s = @s;
					END IF;
			END IF;


      IF s <>'' THEN 	SET @p1_body = REGEXP_replace(@p1_body,'(?i)(?<=FROM)\\s*(?:\\(\\s*)?`SQL`(?:\\s*\\))?\\s*(?=as\\s+[\\w]+\\b)',CONCAT_WS('\n','\\1(','-- Start',REGEXP_replace(QUOTE(s),'^[\'"]|[\'"]$',''),'-- End',')'));				END IF;

			SET @p1_body = CAST(r5(@p1_body,p2)AS CHAR);

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

	 	SET 	@p1_body =CONCAT_WS('\t','SELECT\tCAST(COLUMN_json(COLUMN_create(',QUOTE(IF(IFNULL(COLUMN_get(b,'dom'AS CHAR),'')='','dblob',COLUMN_get(b,'dom'AS CHAR)))
,CONCAT_WS('',',a.dblob))AS CHAR)AS dblob\tFROM(\n',@p1_body,'\n)AS A '));			

		IF CAST(@p1_body AS CHAR) IS NULL THEN SET @p1_body = CONVERT(@p1_body USING gbk);END IF;


SELECT @p1_body AS s,REGEXP_substr(@p1_body ,r('`Sart-End`')) AS core,'ok' ;LEAVE p;
	PREPARE p_stmt from  @p1_body;COMMIT;EXECUTE p_stmt ;		DEALLOCATE PREPARE p_stmt ;

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
  DECLARE p2 VARCHAR(2000) DEFAULT j(p,'p2');
	DECLARE type_ VARCHAR(20) DEFAULT j(p2,'type');
	DECLARE page VARCHAR(20) DEFAULT j(p2,'page');
	DECLARE keyword VARCHAR (200) DEFAULT j(p2,'keyword');


	set 				
				
				@qbkbody = NULL ,
				@totalnum = 0,
				@qbkbody1 = NULL ,
				@qbkbody2 = NULL ,
				@qbkbody3 = '' ;


  CASE    
			WHEN IFNULL(j(p2,"funcid" ),'') = ''THEN SET `keyword` = j(p2,'keyword');
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
				
				));


					SET @allmis = NULL,

							@qbkbody = CONCAT_WS('','SELECT a.*,@allmis := CONCAT_WS(",",QUOTE(a.missionId),@allmis) AS missionids\nFROM(',
														@qbkbody1,@qbkbody2,@qbkbody3,'\n) AS a' );
 

					PREPARE stmt from  @qbkbody ;
					EXECUTE stmt ;
				
					SET @qbkbody1 = NULL,
							@qbkbody2 = NULL,
							@qbkbody3 = 
									CONCAT_WS('',	"\nSELECT a.missionid,a.missionid AS quoteid,'bd',
		CAST('记账凭证' AS CHAR) AS title,\n",
				"c(COLUMN_json(column_CREATE(a1.billId,a1.billname))) as dblob,\n",
						 "\na.pageNo,",QUOTEj(j(p2,'courseNo'))," AS courseno 
FROM 
exp_courses_node AS c1 
INNER JOIN exp_courses_node_content AS c2 ON c2.contentNo = c1.contentNo
LEFT JOIN  acc_mission AS a ON c2.missionid = a.missionId
INNER JOIN mysq1_schema.bill_list AS a1 ON a.billId = a1.billId
WHERE c1.contentNo IS NOT NULL AND c2.missionid IN(",@allmis,") 
");

					CASE old_type
							WHEN 'kjpz' THEN  
								label1:BEGIN

										SET @qbkbody3 = CONCAT_WS('\n', 
				
															"SELECT a.missionid,a.quoteid,IF(a.type = 'bk','bd',a.type),\n(CAST(CONCAT('附',a.sort,': ', \nIF(a.type IN ('bb','bk'), b1.billname,a.title) \n) AS CHAR)) AS title,\n(@s := IF(IFNULL(b1.max_page,1)>1,r7(c(COLUMN_json(COLUMN_create('pageno',a.pageNo,'billid',b1.billId,'max_page',b1.max_page AS CHAR,'type','3')))),NULL)) AS tmp,\nc(COLUMN_json(column_CREATE(\n'title',a.title\n,'type',a.type\n,'pageNo',a.pageNo\n,'missionid', a.missionid\n,'quoteid',a.quoteid\n,'sort',a.sort\n,'billId',b1.billId\n,'billname',b1.billname\n,'max_page',IF(IFNULL(b1.max_page,1)>1,b1.max_page,NULL)\n,'select',IF(@s IS NULL ,NULL ,REGEXP_replace(COLUMN_get(b1.page,'value' AS CHAR),j(@s,'reg'),REPLACE(j(@s,'REPLACEm'),'selected','checked')))))) as dblob,\na.pageNo,NULL AS courseno\nFROM acc_mission_back_information AS a\nLEFT JOIN acc_mission AS e ON a.quoteid = e.missionId \nLEFT JOIN acc_mission_backbill_1 AS b ON a.missionid = b.referencedID AND a.quoteid = b.missionId \nLEFT JOIN `mysq1_schema`.bill_list AS b1 ON b.bill_id = b1.billid OR e.billId = b1.billId \nLEFT JOIN mysq1_schema.bill_type AS b2 ON b1.billType = b2.billType",
															CONCAT("WHERE a.missionid IN(",@allmis,")")
													);
								END label1;
							ELSE 
										SET @qbkbody3 = @qbkbody3;
					END CASE ;
			END;

			WHEN IFNULL(j(p2,"funcid" ),'') = "insert" THEN

				SET `p` := ju(`p`,"quoteId",CONCAT('bk-',REGEXP_replace(j2(`p`,"missionId"),'^("[\\w\\-]*?)(\\d{11})(")$','\\2'),CEIL(RAND()*10000))),
						@qbkbody3 := r5(r4('insertbk1'),`p`);

				PREPARE stmt from  @qbkbody3 ;	EXECUTE stmt ;

				SET @qbkbody3 := r5(r4('insertbk2'),`p`);

			WHEN IFNULL(j(p2,"funcid" ),'') = "update" THEN 

					IF IFNULL(j(p2,'missionid'),'')= '' OR IFNULL(j(p2,'quoteid'),'')= '' THEN CALL Error('2id is null');END IF;

					SET @qbkbody3 = r5(R4('updatebk'),p);
			WHEN IFNULL(j(p2,"funcid" ),'') = "delete" THEN 

					SET @qbkbody3 := "DELETE 
a.*
FROM
acc_mission_back_information AS a
WHERE
a.missionid = `missionid` AND
INSTR(`quoteid`,a.quoteid) > 0",
							 @qbkbody3 = r5(@qbkbody3,p);

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


		ELSE CALL Error("SOMETHING IS WORNG");
	END CASE ;




	

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
	

	RETURN CONCAT("'",REPLACE(REPLACE(w,'\\','\\\\'),'\'','\\\''),"'");
	
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `qbill`
-- ----------------------------
DROP PROCEDURE IF EXISTS `qbill`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `qbill`(IN `b` varchar(2000))
qblabel:BEGIN
	



	SET	@stmt_qb = CONCAT_WS(' AND ',CONCAT('a.billType = ', j3(b,"billType")),
																	 CONCAT('CONCAT_WS(",",a.billname)',' like "%',j(b,"keyword"),'%"')),
			@stmt_qb = CONCAT_WS('',"
SELECT a.billId,a.billType,a.billname,a.jsp
FROM mysq1_schema.bill_list AS a INNER JOIN mysq1_schema.bill_type AS b ON a.billType = b.billType
WHERE\n",@stmt_qb) ;


	PREPARE stmt_qb from  @stmt_qb;
	EXECUTE stmt_qb ;

DEALLOCATE PREPARE stmt_qb;

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
	
	RETURN CASE 
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
	
	RETURN CASE 
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
	
	RETURN CONCAT(quotd(`p`) ,':',quotj(w));
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `quodd`
-- ----------------------------
DROP FUNCTION IF EXISTS `quodd`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `quodd`(`w` longblob) RETURNS longtext CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	
  
  IF w REGEXP '^["\']' THEN

  SET w = REGEXP_replace(w,'\\\\((?(?=\\\\)\\\\))|^["\']|["\']$','\\1');

	
	END IF;

	RETURN w ;
	
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
--  Procedure definition for `R`
-- ----------------------------
DROP FUNCTION IF EXISTS `R`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `R`(`k` varchar(2000)) RETURNS varchar(2000) CHARSET utf8mb3
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
		WHEN k REGEXP '\t' THEN
			
			SET `r` = REGEXP_substr(k,'\t[^\n]*'),
					`k` = REGEXP_replace(k,'\t[^\n]*',''),
					`k` = (
SELECT
CAST(CONCAT_WS('\t',a.Reg,IF( `r` REGEXP '^\\s*$',a.`replace` ,`r`))AS CHAR)
FROM mysq1_schema.reg AS a
WHERE 
a.note REGEXP  `k1` OR a.`Code` REGEXP  `k` );

		ELSE
	SET `k` = (SELECT CONVERT(a.Reg USING gbk ) FROM mysq1_schema.reg AS a WHERE a.note REGEXP  `k1` OR a.`Code` REGEXP  `k` );
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
	


	RETURN 	CASE 	WHEN c REGEXP "^[\\d]+$" THEN ( SELECT a.statement FROM `mysq1_schema`.qxsql AS a WHERE a.id = c )
								ELSE ( SELECT a.statement FROM `mysq1_schema`.qxsql AS a WHERE CONCAT(a.`subject`,a.`name`) REGEXP c) END ;

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
	

	RETURN	REG2(`funid` );
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `R3`
-- ----------------------------
DROP FUNCTION IF EXISTS `R3`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `R3`(`r` varchar(2000)) RETURNS varchar(2000) CHARSET utf8mb3
    NO SQL
BEGIN
	

	CASE
			WHEN r IS NULL THEN RETURN NULL;
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
	


	RETURN 	CASE 	WHEN c REGEXP "^[\\d]+$" THEN ( SELECT a.blob FROM `mysq1_schema`.qs AS a WHERE a.id = c )
								ELSE ( SELECT a.blob FROM `mysq1_schema`.qs AS a WHERE a.`subject` = c) END ;

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `r5`
-- ----------------------------
DROP FUNCTION IF EXISTS `r5`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `r5`(`s` blob,`p` blob) RETURNS mediumblob
    NO SQL
    DETERMINISTIC
BEGIN
	

		DECLARE `re`	MEDIUMBLOB DEFAULT NULL;DECLARE `part`	BLOB DEFAULT NULL;DECLARE `r`	VARCHAR(500)DEFAULT
		'(?si)^((?:(?:(?:@|\\bas\\s+|\\w\\.)`[^`]+`)|[^`])*?)(?:((?:(?:(?<![\'"])`)|\\br\\([\'"])((?:(?<=[\'"])`)?(?:\\\\.|[^"`\'])+(?:`(?=[\'"]))?)(?:(?:`(?![\'"]))|[\'"]\\)))|$)';



		IF IFNULL(p,'')='' THEN
				RETURN REGEXP_replace(`s`,REGEXP_REPLACE(`r`,'^\\([^)]+\\)\\K(\\^)',''),'\\1@`\\2`');
		END IF;

		l:LOOP
			SET	`part` = REGEXP_substr(s,r);

			IF IFNULL(`part`,'') = '' THEN LEAVE l; END IF;

			SET	`s`	=	REGEXP_REPLACE(s,r,''),
					`re`	= CONCAT_WS('',`re`	,REGEXP_REPLACE(`part`,r,'\\1')
																		,CASE		WHEN REGEXP_REPLACE(`part`,r,'\\2') = '' THEN NULL
																						WHEN `part` REGEXP '(?i)\\br\\((?:"(?:\\\\.|[^"])+"|\'(?:\\\\.|[^\'])+\')\\)$' THEN IF(IFNULL((@r5part := json_QUOTE(r(REGEXP_REPLACE(`part`,`r`,'\\3')))),'') <> '' ,@r5part,REGEXP_REPLACE(`part`,`r`,'\\2'))
																				ELSE  j2(p,REGEXP_REPLACE(`part`,`r`,'\\3')) 
																			END
														);
		END loop;
		
		RETURN CONCAT_WS('',`re`,`s`);
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `r5_copy`
-- ----------------------------
DROP FUNCTION IF EXISTS `r5_copy`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `r5_copy`(`s` blob,`p` varchar(2000)) RETURNS mediumblob
    NO SQL
    DETERMINISTIC
BEGIN
	


		DECLARE `result`	MEDIUMBLOB DEFAULT NULL;
		DECLARE `part`	BLOB DEFAULT NULL;
		DECLARE `r`	VARCHAR(2000)DEFAULT  '(?s)^(.*?)`(.*?)`';
		
		l:LOOP
			SET	`part` = REGEXP_substr(s,r);
			IF IFNULL(`part`,'') = '' THEN LEAVE l; END IF;
			SET	`s`	=	REGEXP_REPLACE(s,r,''),`result`	= CONCAT_WS('',`result`,REGEXP_REPLACE(`part`,r,'\\1'),
      IF( (@j:= j2(p,@k:=REGEXP_REPLACE(`part`,r,'\\2'))) ='null',CONCAT('`',@k,'`'),@j)

);

		END loop;
		
		RETURN CONCAT_WS('',`result`,`s`) ;
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
	
	DECLARE `result`	MEDIUMBLOB DEFAULT NULL;
	DECLARE `part`	BLOB DEFAULT NULL;
	DECLARE `r`	VARCHAR(2000)DEFAULT  '(?s)^(.*?)`(.*?)`';

	l:LOOP
		SET	`part` = REGEXP_substr(s,r);
		IF IFNULL(`part`,'') = '' THEN LEAVE l; END IF;

		SET	`s`	=	REGEXP_REPLACE(s,r,''),`result`	= CONCAT_WS('',`result`,REGEXP_REPLACE(`part`,r,'\\1'),j(p,REGEXP_REPLACE(`part`,r,'\\2')));

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
	
	DECLARE `pageno` VARCHAR(8) DEFAULT j(p,'pageno');
	DECLARE `rm` VARCHAR(2000) DEFAULT '[^<]+<[^>/]*\\d)(/>[^<]+';




		SET @billid := j(p,'billid') 
		,@max_page := j(p,'max_page')
		,@type = j(p,'type');

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
	
	
	SET @d = NULL; 
	RETURN 	(
SELECT
dblob
FROM(
SELECT
@d:=COLUMN_create('sql',CONVERT( `BLOB`USING gbk)),
IF(IFNULL(parameter,'') = '' ,NULL,@d:=COLUMN_add(@d,'parameter',CONVERT(
CASE WHEN (@r8 := REGEXP_substr( `parameter`, CONVERT('^(?:用|using)\\s+\\K[\\w]+' USING gbk))) <> ''  THEN (SELECT a.`parameter` FROM mysq1_schema.qs AS a WHERE a.`name` = @r8)
ELSE a.`parameter` END USING gbk))),

IF(IFNULL(`sql`,'') = '' ,NULL,@d:=COLUMN_add(@d,'s',CONVERT(
CASE WHEN (@r8 := REGEXP_substr( `SQL`, CONVERT('^(?:用|using)\\s+\\K[\\w]+' USING gbk))) <> ''  THEN (SELECT a.`sql` FROM mysq1_schema.qs AS a WHERE a.`name` = @r8)
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
USING gbk) ),
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
	

	RETURN	CONCAT('/',CASE funid
			WHEN 'R1'   THEN CONCAT_WS('',REG1('`R11`' ),REG1('`R12`'),REG1('`R13`'))
						
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
--  Procedure definition for `REG0`
-- ----------------------------
DROP FUNCTION IF EXISTS `REG0`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `REG0`(`funid` varchar(99)) RETURNS varchar(1000) CHARSET utf8mb4
    NO SQL
    DETERMINISTIC
BEGIN
	
	RETURN	CASE funid
			WHEN '`DOMS`' THEN 
CONCAT_WS('\n'
,CONCAT_WS('\t',REG1('`dom`'),'\t', '\\1=\\2')
,CONCAT(REG1('`dom1`'),'\t', '\"\\1\":"\\2",')
,CONCAT(',\\s*$','\t','')
,'\n')

		ELSE NULL 
  END;
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
	
	RETURN	CASE funid
			WHEN '`R11`' 	THEN '(?:\\{?)' 
					
			WHEN '`R12`' 	THEN '("((?:[^\\\\"]|\\\\{2}|\\\\"|\\\\)*+)")'
						
      WHEN '`R13`'	THEN '(?::(((?R1))\\,?)(?:\\}?))'
						
			WHEN '`""`'	THEN '"((?:[^\\\\"]|\\\\.)*)"'
			WHEN '`"`'	THEN '(?J)(?<c0>"(?<c>(?:\\\\.|[^"])*)")'
			WHEN '`q`'	THEN '(?J)(?<c0>(?:(?<d>")|(?<s>\'))(?(d)(?<c>(?:\\\\.|[^"])*)"|(?(s)(?<c>(?:(\\\\.)|[^\'])*)\')))'
			WHEN '`{}`'	THEN '(?J)(?<a>(?:\\s*)\\{(?:\\s*)(?<c0>(?<k>(?:"(?<c>(?:[^\\\\"]|\\\\.)*)")(?:\\s*):(?:\\s*)(?:"(?&c)"|(?&a)))?(?:(?:\\s*),(?:\\s*)(?&k))*)\\})'
					
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
	

	RETURN REGEXP_replace(v,CONCAT("(\\Q",r,"\\E)"),CONCAT("\\1",REPLACE(a,'\\','\\\\')));
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `reglike`
-- ----------------------------
DROP FUNCTION IF EXISTS `reglike`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `reglike`(`k` varchar(1000),`r` varchar(200),n varchar(2)) RETURNS varchar(200) CHARSET utf8mb3
    NO SQL
BEGIN
	
  SET r = CONCAT('/(?:(?:',r,')(?.*)){',n,'}?/');
	IF preg_check(r) THEN 
		SET r = preg_rlike(r,k);
		ELSE SET r = NULL;
	END IF;
	RETURN r;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `Replace_For_Exp`
-- ----------------------------
DROP FUNCTION IF EXISTS `Replace_For_Exp`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `Replace_For_Exp`(`source_str` varchar(500)) RETURNS varchar(500) CHARSET latin1
    NO SQL
    DETERMINISTIC
BEGIN
	
	SET @word = '',@a = NULL ,source_str = trim(',' FROM TRIM(source_str));
	 
	IF source_str IS NULL OR source_str = '' THEN
		RETURN '.+';
	END IF;
	WHILE CHAR_LENGTH(source_str) != 0 DO
			SET @a = LEFT(source_str,1);

			IF  @a IN ('+','|','\\','*','.','$','[',']','{','}',':','=','<','>') THEN
					SET @word  = CONCAT(@word,'\\\\',@a);
				ELSE
					SET @word  = CONCAT(@word,@a);
			END IF;

			SET source_str = SUBSTR(source_str,CHAR_LENGTH(@a)+1);
			
	END WHILE ;

	RETURN @word;
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
--  Procedure definition for `rp`
-- ----------------------------
DROP FUNCTION IF EXISTS `rp`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `rp`(`k` varchar(2000)) RETURNS varchar(2000) CHARSET utf8mb3
    READS SQL DATA
    DETERMINISTIC
BEGIN
	
	DECLARE `r` VARCHAR(2000) DEFAULT NULL ;

	IF IFNULL(`k`,'')='' THEN RETURN `r`; END IF;

  CASE 
		WHEN k REGEXP '\t' THEN
			
			SET `r` = REGEXP_substr(k,'\t[^\n]*'),
					`k` = REGEXP_replace(k,'\t[^\n]*',''),
					`k` = (
SELECT
CAST(CONCAT_WS('\t',a.Reg,IF( `r` REGEXP '^\\s*$',a.`replace` ,`r`))AS CHAR)
FROM mysq1_schema.reg AS a
WHERE 
CONCAT_WS('',a.`Code`,a.note) REGEXP  `k` );

		ELSE
	SET `k` = (SELECT CONVERT(a.`replace` USING gbk ) FROM mysq1_schema.reg AS a WHERE CONCAT_WS('',a.`Code`,a.note) REGEXP  `k`);
	END CASE;

	RETURN 
CONVERT(`k` USING utf8 )

;

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
CREATE DEFINER=`root`@`%` FUNCTION `s`(`money` varchar(60)) RETURNS varchar(60) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	
	SET `money` = 
				CASE WHEN `money` IS NULL OR `money` =0 THEN NULL
					ELSE FORMAT(`money`,2) END;
						
	RETURN  `money`;
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
--  Procedure definition for `SaveOrUpdate`
-- ----------------------------
DROP PROCEDURE IF EXISTS `SaveOrUpdate`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `SaveOrUpdate`(IN `STATU` varchar(1) ,IN `table_name` varchar(30),IN `key_fields` varchar(140),IN `key_values` varchar(120),IN `field_Names` longtext,IN `field_values` longtext)
    READS SQL DATA
label1:BEGIN
	






	SET @statu = NULL,
			@statu = Fetch_Set(key_values,1,NULL) = "''" OR Fetch_Set(key_values,1,NULL) = 'NULL';

	IF IFNULL(@statu,1) = 1  THEN

		CALL audit('SaveOrUpdate-expid为空',CONCAT_WS(',',QUOTE(STATU) , QUOTE(table_name) , QUOTE(key_fields) , QUOTE(key_values) , QUOTE(field_Names) , QUOTE(field_values)),					QUOTE(STATU) , QUOTE(table_name) , QUOTE(key_fields) , QUOTE(key_values) , QUOTE(field_Names) , QUOTE(field_values));

		SELECT 1,key_fields ,key_values ;

		LEAVE label1;

	END IF ;


	SET @statu = NULL,
			@statu = Fetch_Set(key_values,2,NULL) = "''" OR Fetch_Set(key_values,2,NULL) = 'NULL' ;

	IF IFNULL(@statu,1) = 1 THEN

		CALL audit('SaveOrUpdate-missionid 为空',CONCAT_WS(',',QUOTE(STATU) , QUOTE(table_name) , QUOTE(key_fields) , QUOTE(key_values) , QUOTE(field_Names) , QUOTE(field_values)),					QUOTE(STATU) , QUOTE(table_name) , QUOTE(key_fields) , QUOTE(key_values) , QUOTE(field_Names) , QUOTE(field_values));

		SELECT 1,key_fields ,key_values ;

		LEAVE label1;

	END IF ;



	SET @fields_ = NULL,
			@fields_ = fileds_update_temp(key_fields,key_values,"AND"),
			@stmt_save_update =  NULL,
			@statu = NULL;

	IF @fields_ IS NULL THEN 

		CALL audit('SaveOrUpdate-@fields_为空 异常真多 ！fileds_update_temp ',CONCAT_WS(',',QUOTE(STATU) , QUOTE(table_name) , QUOTE(key_fields) , QUOTE(key_values) , QUOTE(field_Names) , QUOTE(field_values)),					QUOTE(STATU) , QUOTE(table_name) , QUOTE(key_fields) , QUOTE(key_values) , QUOTE(field_Names) , QUOTE(field_values));

		SELECT 1,key_fields ,key_values ;

		LEAVE label1;

	END IF;



	IF `table_name` LIKE 'acc_1' THEN



			SET @stmt_save_update = concat("SELECT 1 \n",
																		 "   into @STATU\n",
																		 "FROM acc_1\n",
																		 "where ", @fields_ ," limit 1");

			PREPARE stmt1 FROM @stmt_save_update;
			EXECUTE stmt1 ;

			IF @statu = 1 THEN


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
 
	PREPARE stmt from  @stmtbody ;
	EXECUTE stmt ;
	DEALLOCATE PREPARE stmt;


	CASE  when  @type = 'bb' then 
					set @stmtbody  = concat("SELECT DISTINCT
@totalnum as totalnum,
@offset1 := @offset1 +1 as rowid ,
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
																@offset1 := @offset1 +1 as rowid ,
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



					set @stmtbody  = concat("
													SELECT DISTINCT
															@totalnum as totalnum,
															@offset1 := @offset1 +1 as rowid ,
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `seacher5`(IN `classNo` varchar(60) ,IN `keyword` varchar(160),in `page` int(4),in `num` int(6))
    READS SQL DATA
sl5:BEGIN



	set 	
				@offset2 = (IF(page=0,1,page)-1)*num,
				@num = num ,											

				@keyword	= if(keyword is null, '', trim(keyword)),	
				@stmtbody = NULL ,
				@classNo = IF(classNo is null ,'%',TRIM(classNo)),  
			@totalnum = 0 ;

				set @totalnum = calcuscore(@classNo,null) ;
				set @stmtbody1  = "
							SELECT count(*) 
							into @totalnum 	
												",
						@stmtbody2  = CONCAT_WS('',
"
FROM exp_experimentclassstudent as a
left join mysq1_schema.exp_classstudent as c on a.studentNo = c.stuNo
left join mysq1_schema.exp_class as d on c.classno = d.classNo
where  a.classNo = ",QUOTE(@classNo),"
and
case 
when @keyword = '' then 1
when CONCAT_WS('',d.classNo,d.className) REGEXP ",QUOTE(@keyword)," then 1
when concat(c.stu_name,a.studentNo) like ",QUOTE(concat('%',@keyword,'%'))," then 1 
else 0
end "),
							@stmtbody  = concat(@stmtbody1,@stmtbody2);



				PREPARE stmt from  @stmtbody ;
				EXECUTE stmt ;



			set @stmtbody1  = "
							SELECT 
										@totalnum as total,
										#ifnull(a.rowid,'--') as rowid,
@rowid := IF(IFNULL(a.missionscore,0) <>@score ,@rowid+1, @rowid) AS rowid,
										a.classNo,
										d.className,
										a.studentNo,
										c.stu_name,
										a.expNo,
@score := IF(ifnull(a.missionscore,0) <>@score,ifnull(a.missionscore,0) ,@score) AS score,
										ifnull(a.read_ans_size,0) AS read_ans_size,
										ifnull(a.mission_result,0) AS mission_result,
										ifnull(a.log_count,0) AS log_count,
										a.teacherScore
											",
					@stmtbody2  = CONCAT(@stmtbody2,"
										ORDER BY case when a.missionscore is null then 1 else 0 end ASC ,a.missionscore DESC,a.studentNo ASC
										LIMIT ?,?"),
					@stmtbody = concat(@stmtbody1,@stmtbody2);
SET @rowid = 0,@score=0 ;

			PREPARE stmt from  @stmtbody ;
			EXECUTE stmt USING  @offset2  , @num;
			DEALLOCATE PREPARE stmt;

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

	set @expid = expid ,@rowid= calcuscore(NULL,expid),@rowid = NULL,@statu= NULL;

						SELECT a.rowid, b.statu INTO @rowid,@statu
							FROM 	exp_experimentclassstudent AS a
							INNER JOIN exp_experimentclass AS b ON a.classNo = b.classNo
							WHERE  a.expNo = @expid;





			IF @statu IS NOt NULL THEN
					SELECT 	count(DISTINCT b.missionscore)+1  INTO @rowid
					FROM exp_experimentclassstudent AS a
					inner JOIN exp_experimentclassstudent AS b ON a.classNo = b.classNo 
					where a.expNo = @expid and a.missionscore < b.missionscore ;
			END IF;

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





			set @stmtbody1  = "
							SELECT 
										@totalnum as total,
										#ifnull(a.rowid,'--') as rowid,

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
--  Procedure definition for `Select_ErrFields`
-- ----------------------------
DROP FUNCTION IF EXISTS `Select_ErrFields`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `Select_ErrFields`(`statu` varchar(1),`a_n` int(3),`a_fnz` varchar(300),`field_Names` varchar(400),`field_values` longtext) RETURNS varchar(2000) CHARSET utf8mb3
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
	

	DECLARE w1 VARCHAR(20);
	DECLARE w2 VARCHAR(200);



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





  DECLARE CONTINUE HANDLER FOR  SQLSTATE '23000', SQLSTATE	'42000'	, SQLSTATE	'42S22' , SQLSTATE	'HY000', SQLSTATE	'22007'
	BEGIN 
		GET DIAGNOSTICS CONDITION 1 @`sqlstate` = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;SET  @`sqlstate` = JSON_OBJECT('sqlstate',@`sqlstate`,'errno',@errno,'text',@text);
		SET @funcid = 'Select_ErrStat',
				@p = CONCAT_WS(',',QUOTE(`STATU`) ,QUOTE(`key_fields`) ,QUOTE(`key_values`),QUOTE(`field_Names`),QUOTE(`field_values`));
		CALL `Audit_3`(COLUMN_create('m',CONCAT_WS(': ','Error',CONCAT_WS(', ',@funcid,'  P2')),'err', @`sqlstate`,'SQL', @select_err_body,'pp',@`p`)	);
	END;







	SET @missionid = null,@a_t = null,@a_n= 0;

  SET @missionid = Fetch_Set(key_values,2,'\''),
			@a_t = Fetch_Set(key_values,3,'\''),
			@select_err_body = 'select null';


		CALL Generate_One_En(@missionid,'0',@a_fields,@a_n,@a_value);


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




	PREPARE err_select FROM @select_err_body;
	EXECUTE err_select;



	SET @a = null,
			@select_err_body =CONCAT("
	SELECT mission_result  INTO @a
	FROM acc_1 WHERE expid = ",Fetch_Set( `key_values` ,1,',')," AND missionid = ",QUOTE(@missionid));
 

	PREPARE err_select FROM @select_err_body;
	EXECUTE err_select;

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

	PREPARE err_select FROM @select_err_body;	EXECUTE err_select;	DEALLOCATE PREPARE err_select;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `SpeedDial`
-- ----------------------------
DROP PROCEDURE IF EXISTS `SpeedDial`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SpeedDial`(IN `funcid` varchar(60),IN `p` varchar(500))
sdl:BEGIN





	SET @sql_body = NULL;


	CASE 
			WHEN  `funcid` = 3 THEN 
			BEGIN
				DECLARE `p2` BLOB DEFAULT j(`p`,'p2');

				IF IFNULL(`p2`,'')= '' OR IFNULL(@courseNo := j(`p`,"courseNo"),'')= '' THEN CALL Error('sp:no p2 or courseNo');END IF;

				SET	@sql_body := r4('gangwei'),
						@sql_body = CONVERT(r5( 
IF((@roleids := j(p,'roleids')) IS  NULL, @sql_body,REGEXP_replace(@sql_body
,@r:='(?is)\\((?=\'enterlis\')(.*?)(?<=CAST\\()(.*?)(?=\\)AS\\s+CHAR\\)as\\sroleli)'
,CONCAT_WS('',"('roleids','",@roleids,"',\\1REGEXP_replace(\\2 ),CONCAT_WS('','(?i)\\\\\\\\s(?=roleid=\"(",@roleids,")\")'),' checked '")
))
,`p`)USING gbk);


			END;

		ELSE
		
 
	SET @sql_body = NULL,@requirement1 = NULL,@requirement2 = NULL,@expId = NULL,@classNo = NULL,@courseNo = NULL,@nodeNo = NULL,@contentNo = NULL;

	SET	@expId = j(`p`,"expId"),
			@classNo = j(`p`,"classNo"),
			@courseNo = j(`p`,"courseNo"),
			@nodeNo = j(`p`,"nodeNo"),
			@contentNo = j(`p`,"contentNo"),
			@nodenum = Stati_ch(@nodeNo,'.');
	SET @requirement1 = CONCAT_WS(' AND\n',CONCAT('a.expNo = ',quote_d(@expId)),
																		CONCAT('a1.classNo = ',quote_d(@classNo)),
																		IF(`funcid` = 0 AND @nodeNo IS NULL,NULL,
																		CONCAT('b.node_courseNo = ',quote_d(@courseNo))
																		)
																);




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



	 	PREPARE sql_body FROM @sql_body;
	 	EXECUTE sql_body ;

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
						"				IF(Sum(b.practic) = 0 ,NULL,CONCAT('实训 - ', Sum(b.practic))),\n",
						"				IF(Sum(b.courseware) = 0 ,NULL,CONCAT('课件 - ', Sum(b.courseware))),\n",
						"				IF(Sum(b.test) !=0 AND Sum(b.courseware) != 0 AND Sum(test)  !=0 ,'<br>',NULL),\n",
						"				IF(Sum(b.test) = 0 ,NULL,CONCAT('习题 - ', Sum(b.test)))\n",
						" )AS CHAR) AS Str_total\n",
						"FROM exp_courses_node AS a\n",
						"LEFT JOIN exp_courses AS a1 ON a.node_courseNo = a1.courseNo\n");

		IF IFNULL(@classNo,'') = '' THEN
					 SET @sql_body = CONCAT_WS('',@sql_body,"LEFT JOIN(\n","SELECT\nc1.contentNo,\nCount(IF(c1.contentType = 'kj' AND c6.billType <> 'kjxt',c1.missionid,NULL)) AS practic,\nCount(IF(c1.contentType = 'kj' AND c6.billType = 'kjxt',c1.missionid,NULL)) AS test,\nSum(IF(c5.billid IS NOT NULL , 1,0)) AS per1,\nCount(c2.unique_id) AS courseware,\nnull AS perRate,\nNULL AS perscore,\na.node_courseNo\nFROM\nqianxue_test.exp_courses_node_content AS c1\nINNER JOIN qianxue_test.exp_courses_node AS a ON c1.contentNo = a.contentNo\nLEFT JOIN qianxue_test.acc_mission AS c5 ON c5.missionId = c1.missionid\nLEFT JOIN mysq1_schema.bill_list AS c6 ON c5.billId = c6.billId\nLEFT JOIN qianxue_test.exp_courseware_cells AS c2 ON c1.missionid = c2.unique_id\nWHERE \na.node_courseNo = ",QUOTE(@courseNo),"\nGROUP BY\nc1.contentNo","\n) AS b ON b.contentNo = a.contentNo");
			ELSE SET	@sql_body = CONCAT_WS('',@sql_body,"INNER JOIN exp_experimentclass_course AS a2 ON a2.classNo = ",quote_d(@classNo)," AND a2.courseNo = a1.courseNo\n",
						"LEFT JOIN abc AS b ON ",@requirement1," AND b.courseNo = a.node_courseNo AND b.node_No = a.node_No AND b.contentNo = a.contentNo");
		END IF;




	SET @requirement1 = CONCAT("a.node_courseNo = ",quote_d(@courseNo)),
			@a = NULL;

	CASE 
			WHEN @nodenum > 0 AND  `funcid` = 0  THEN
					SET @requirement2 = CONCAT_WS('','SUBSTRING_INDEX(a.node_No,".",',@nodenum+1,')'),
							@a = CONCAT_WS('',"/*n0*/SELECT ",QUOTE(@expId)," AS expID,",QUOTE(@classNo)," AS classNo,",
															"a.node_courseNo AS courseNo,a.node_No ,a.node_url,a.contentNo,a.node_Id,a.node_parentNo,a.node_text,",QUOTE(@a)),
							@requirement1 = CONCAT_WS(' AND\n',@requirement1,CONCAT('a.node_courseNo = ',quote_d(@courseNo)),
																								CONCAT('a.node_No LIKE "',SUBSTRING_INDEX(@nodeNo,".",@nodenum),'.%"')),
							@requirement2 = CONCAT_WS(',',CONCAT('cabc(',@requirement2,')'));

			WHEN preg_rlike('/^\\d+/',@nodeNo) AND  `funcid` = 1 THEN
					SET @requirement2 = CONCAT_WS('','SUBSTRING_INDEX(a.node_No,".",',@nodenum+2,')'),
							@a = CONCAT_WS('',"/*n1*/SELECT ",QUOTE(@expId)," AS expID,",QUOTE(@classNo)," AS classNo,",
														"a.node_courseNo AS courseNo,a.node_No,a.node_url,a.contentNo,a.node_Id,a.node_parentNo, a.node_text,",QUOTE(@a)),
							@requirement1 = CONCAT_WS(' AND\n',@requirement1,CONCAT('a.node_courseNo = ',quote_d(@courseNo)),
																				CONCAT('a.node_No LIKE "',@nodeNo,'.%"')),
							@requirement2 = CONCAT_WS(',',CONCAT('cabc(',@requirement2,')'));

			WHEN @nodeNo IS NULL  AND  `funcid` = 1 OR  @nodeNo IS NOT NULL AND `funcid` = 0  OR IFNULL(j(`p`,'cnumber'),0) = 1 THEN

					SET @a := (
SELECT c.json
FROM exp_courses AS a
INNER JOIN exp_experimentclass_course AS b ON b.courseNo = a.courseNo
INNER JOIN mysq1_schema.bill_list AS c ON a.billid = c.billId
WHERE
a.courseNo = @courseNo),
							@a := CONCAT(",\n'domid',case when ifnull(a.node_text,'') = '' then null\n",REPLACE(@a,'`@a`',' when a.node_text'),' end\n'),
							@a = CONCAT_WS('',"\n,CAST(COLUMN_json(COLUMN_CREATE('billid',a.billid,'before_id',a.before_id",@a,"))AS CHAR)");

					SET @requirement2 = CONCAT_WS('','SUBSTRING_INDEX(a.node_No,".",',@nodenum+1,')'),
							@a = CONCAT_WS('',"/*1z*/SELECT ",QUOTE(@expId)," AS expID,",QUOTE(@classNo)," AS classNo,",
														"a.node_courseNo AS courseNo, a.node_No,a.node_url,a.contentNo,a.node_Id,a.node_parentNo, a.node_text\n",@a),
							@requirement1 = IF(IFNULL(@courseNo,'') = '',NULL,CONCAT_WS(' AND\n',@requirement1,CONCAT('a.node_courseNo = ',quote_d(@courseNo)))),
							@requirement2 = CONCAT_WS(',',CONCAT('cabc(',@requirement2,')'));

			WHEN @courseNo IS NULL OR `funcid` = 0 OR @nodeNo IS NULL AND  `funcid` = 0 THEN 
					SET @a = "\n,CAST(COLUMN_json(COLUMN_CREATE('billid',a1.billid,'before_id',a1.before_id))AS CHAR)";
					SET @a = CONCAT_WS('',"/*0c*/SELECT ",QUOTE(@expId)," AS expID,",QUOTE(@classNo)," AS classNo,",
														"a.node_courseNo AS courseNo,NULL AS node_No,a1.img_url AS node_url,a1.courseName AS node_text,",
														"NULL AS contentNo,a.node_Id,0 AS node_parentNo",@a),
							@requirement2 = "CONCAT(IFNULL(a1.sort,''),a.node_courseNo)";
							

		ELSE		SELECT "NOT ok"; LEAVE  sdl;
	END CASE;

 	SET @sql_body = CONCAT_WS('',@a,' AS dblob ',@sql_body,CONCAT("\nWHERE ",@requirement1),"\nGROUP BY ",@requirement2,'\nHAVING str_total <> ""');



	END CASE;

	PREPARE sql_body FROM @sql_body;
	EXECUTE sql_body ;


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

	SET @exp_stmt =CONCAT("select \n",
"		b.statu,\n",
"		b.studentNo as stuNo ,\n", 
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
"LEFT JOIN exp_experimentclass AS c ON b.classNo = c.classNo \n",
"LEFT JOIN exp_experimentclass_course AS c1 ON c.classNo = c1.classNo \n",
"LEFT JOIN mysq1_schema.exp_classstudent AS d ON b.studentNo = d.stuNo \n",
"LEFT JOIN mysq1_schema.exp_class AS e ON d.classNo = e.classNo \n",
"LEFT JOIN mysq1_schema.exp_teacher AS f ON e.teaNo = f.teaNo \n",
"INNER JOIN exp_courses AS h ON c1.courseNo = h.courseNo \n",
"WHERE  b.studentNo = ",QUOTE(@stuno),"\n",
"GROUP BY c.classNo \n",
"order by c.StartTime ,c.EndTime\n") ;

	PREPARE exp_stmt FROM @exp_stmt;
	EXECUTE exp_stmt;
	DEALLOCATE PREPARE exp_stmt;

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
BEGIN

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

							RETURN NULL ;
		end case ;

DROP TEMPORARY TABLE IF EXISTS cur1;
CREATE TEMPORARY TABLE cur1
AS
										SELECT
										a.expNo,

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

										INNER JOIN exp_experimentclass as d on a.classNo = d.classNo
										WHERE 
										a.statu is not NULL  AND 
										instr(a.studentNo , @stuno) AND 
										instr(a.classno , @classno)
										GROUP BY
										a.expNo;

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
CREATE DEFINER=`root`@`%` PROCEDURE `stuscore`(IN `stuno` varchar(30))
    MODIFIES SQL DATA
BEGIN
		set @stuno = stuno ;
	
		

		set @a = stuno2score(null, stuno);
		SELECT 1;

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
--  Procedure definition for `TempFun`
-- ----------------------------
DROP FUNCTION IF EXISTS `TempFun`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `TempFun`(`fields` text) RETURNS text CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	

	DECLARE `json` VARCHAR(100) DEFAULT NULL;
	DECLARE `first` VARCHAR(200) DEFAULT NULL;

	SET `fields` = preg_replace('/\\s+/','',`fields`)	;

	

  IF NOT preg_rlike(CONCAT('/^(',R1('`fields`'),',?){2,}?/'),`fields`) THEN  RETURN NULL; END IF;


	SET	`json` = capture(CONCAT('/^',R1('`fields`'),'(?=,|$)/'),`fields`),
			`fields` = capture('(?<=,).* ',`fields`),
			`first` = capture(CONCAT('/^',R1('`fields`'),'(?=,|$)/'),`fields`),
			`first` = CONCAT_WS(',',QUOTE(preg_capture(R('fields'),`first`,2)),preg_capture(R('fields'),`first`,1)),
			`fields` = capture('(?<=,).*',`fields`);

	IF  preg_rlike(CONCAT('/^(',R1('`fields`'),',?)+?/'),`fields`) THEN  

			SET `fields` = CONCAT(',',preg_replace(CONCAT('/',R1('`fields`'),'(,?)/'),'$2,$1 AS CHAR $3',`fields`));
		ELSE SET `fields` = '';

  END IF;

	RETURN CONCAT_WS('',`json`,' = ','COLUMN_CREATE(',`first`,' AS CHAR',`fields`,')');	


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
	






	DECLARE StrL MEDIUMTEXT DEFAULT NULL;

	DECLARE v1 text;

	DECLARE v2 text;

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


					IF v2 IS NULL THEN SET v2=''; END IF;
					SET  StrL = CAST(CONCAT_WS(',',StrL,
											REPLACE(REPLACE(templates,'???',QUOTE(v2)),'??',v1)
											)AS CHAR);
				ELSE 
					LEAVE LOOPNum;
			END IF;

			SET i= i+1;

  END LOOP ;

		SET results_ = StrL;
 
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
	






	DECLARE a_field VARCHAR(200);
	DECLARE a_value LONGTEXT;

	DECLARE r_value VARCHAR(400);
	DECLARE i INT(3);
	DECLARE ia INT(3);
	DECLARE ir INT(3);


	IF IFNULL(a_fields,'') = '' THEN LEAVE temp3; END IF;

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

					IF IFNULL(a_value,'') !='' THEN
							SET @TYPE = CONCAT(type_,a_field),
  
									ir = FIND_IN_SET(QUOTE(@type),r_fields);
							IF ir > 0 THEN
									CALL Fetch_Set_P1(r_values,ir,r_value);
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

					ELSE LEAVE LOOPNum;
			END IF ;


			SET ia= ia+1;


  END LOOP ;
			
		IF suse IS NOT NULL THEN
			SET @results_2 =CONCAT_WS('','\n',suse,@results_2) ;
		END IF;
		SET 
				results_ = CAST(CONCAT(
										IF(results_ IS NULL ,'',CONCAT(results_,','))
										,IF(IFNULL(@results_2,'') = '','',@results_2) 
										)AS CHAR);

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
--  Procedure definition for `t_ckv`
-- ----------------------------
DROP FUNCTION IF EXISTS `t_ckv`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `t_ckv`(`k` varchar(100),`t` varchar(10),`c`  varchar(20000)) RETURNS varchar(20000) CHARSET utf8mb3
    NO SQL
    DETERMINISTIC
BEGIN
	
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
	
	IF v IS NULL OR v REGEXP '^null$' THEN RETURN NULL;END IF;
	SET v = REGEXP_REPLACE(v,'^[\'"]|(?<=[^\\\\])\\\\|[\'"]*$','\\1');
	RETURN   v;
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
	

	RETURN   REPLACE(REPLACE(SUBSTR(v,2,CHAR_LENGTH(v)-2),'\\\'','\''),'\\\\','\\');
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



START TRANSACTION;
INSERT INTO plogs (Function_Name,parameter) VALUES ('v3_initial_mission',CONCAT_WS(',',QUOTE(`expid_`),QUOTE(`missionid_`),QUOTE(`sealNo_`),QUOTE(`pageId_`)));
COMMIT;/*
/**/



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



	IF DATABASE() = 'qianxue_sjzh' AND `missionid_` IN('qianxue-15123110423612291','q-ianxue-15123115081130306','q-ianxue-15123115301023304'/*,'qianxue-15123115374571222'*/ )
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
--
					WHEN `missionid_` = 'qianxue-15123115374571222' THEN	CALL m_j('8',@a);

					ELSE LEAVE pd;
			END CASE ;
			LEAVE `l`;
		END;
	END IF;


	SET @rowNo = NULL ,
			@initial_body =
 IF(mid1 IS NULL ,
				CONCAT_WS('',	"SELECT CONCAT('{',GROUP_CONCAT(a.b),'}') AS b FROM(\nSELECT \n",
											"IF(IFNULL(a1.rowNo,'') = '',b.rowId ,a1.rowNo) AS rowNo,\n",

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
											"LEFT JOIN acc_standard_n AS a1 ON a.missionId = a1.missionId AND (CASE WHEN  IFNULL(b.rowId,'') <> '' AND IFNULL(b.rowId,'') <> ''THEN a1.rowno = b.rowId WHEN IFNULL(b.rowId,'') <> '' THEN b.rowId ELSE a1.rowno END)",
											"WHERE a.missionid = ",QUOTE(`mid`),"\n",
') AS a WHERE a.b IS NOT NULL'
),
-- 第二种 
CONCAT_WS('',"SELECT c(quotj(GROUP_CONCAT(qd2(rowId ,@a)))) AS b\n",
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
--  Procedure definition for `v3_initial_mission_copy`
-- ----------------------------
DROP PROCEDURE IF EXISTS `v3_initial_mission_copy`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `v3_initial_mission_copy`(IN `expid_` varchar(20000),IN `missionid_` varchar(60),in sealNo_ Integer(3),in pageId_ varchar(30))
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
/**/



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



	IF DATABASE() = 'qianxue_sjzh' AND `missionid_` IN('qianxue-15123110423612291','q-ianxue-15123115081130306','q-ianxue-15123115301023304'/*,'qianxue-15123115374571222'*/ )
 THEN
	pd:BEGIN
			SET @a = CONCAT('{',quote_d('0'),':','{',quote_d("expID"),':',quote_d(`expid_`),',',quote_d('missionId'),':',quote_d(`missionid_`),'}}');
SELECT 'ok';
			CASE 
-- 2.1
					WHEN `missionid_` = 'qianxue-15123110423612291' THEN	CALL m_j('5',@a);
-- 3.1
					WHEN `missionid_` = 'qianxue-15123115081130306' THEN	CALL m_j('6',@a);
-- 3.2
					WHEN `missionid_` = 'qianxue-15123115301023304' THEN	CALL m_j('7',@a);
-- 3.3
--
					WHEN `missionid_` = 'qianxue-15123115374571222' THEN	CALL m_j('8',@a);

					ELSE LEAVE pd;
			END CASE ;
			LEAVE `l`;
		END;
	END IF;

SELECT @bi;
	SET @rowNo = NULL ,
			@initial_body =
 IF(mid1 IS NULL ,
				CONCAT_WS('',	"SELECT CONCAT('{',GROUP_CONCAT(a.b),'}') AS b FROM(\nSELECT \n",
											"IF(IFNULL(a1.rowNo,'') = '',b.rowId ,a1.rowNo) AS rowNo,\n",

"@bio := IF(NOT ",QUOTE(@i),",",QUOTE(@bi),",IF(@bio := preg_capture(QD(a1.rowNo,':{/','/'),@bi) IS NULL ,NULL,je2(@bi,a1.rowNo,NULL))),\n",
-- c
"@c := 0,\n",
'IF(IFNULL(@a := CONCAT_WS(",",',
Temp_Func('IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b??="",NULL,QD(b.b??,"","\\\"v\\\":"))
,IF(preg_capture(QD(@c,":\\\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b??,"","\\\"v\\\":"),","),"\\\"c\\\":\\\"1\\\""),
	IF(b.b??="",NULL,QD(b.b??,"","\\\"v\\\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))\n',1,2,null),
'),"")="",NULL,
qd(a1.rowNo,CONCAT(":{",@a,"}"),"")) 
\n AS b\n'
											"FROM acc_mission AS a \n",
											"LEFT JOIN ",db_b," AS b ON b.expid = ",QUOTE(expid_)," AND b.missionId =",QUOTE(`mid`),"\n",
											"LEFT JOIN acc_standard_n AS a1 ON a.missionId = a1.missionId AND (CASE WHEN  IFNULL(b.rowId,'') <> '' AND IFNULL(b.rowId,'') <> ''THEN a1.rowno = b.rowId WHEN IFNULL(b.rowId,'') <> '' THEN b.rowId ELSE a1.rowno END)",
											"WHERE a.missionid = ",QUOTE(`mid`),"\n",
') AS a WHERE a.b IS NOT NULL'
),
-- 第二种 
CONCAT_WS('',"SELECT c(quotj(GROUP_CONCAT(qd2(rowId ,@a)))) AS b\n",
"FROM acc_b AS a",
"\nWHERE  a.expID = ",QUOTE(expid_)," AND a.missionId = ",QUOTE(`mId`),
" AND a.missionId1 = ",QUOTE(`mId1`)," AND \n",
"(@a := CONCAT_WS(',',",Temp_Func("qd1(a.b??,??)",1,2,NULL),")",
"\n) IS NOT NULL AND @a <> '' "
)

);
-- 
SELECT @initial_body;
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
	

	SET @_roleID = NULL,
			@v5stmt = CONCAT_WS('',"SELECT DISTINCT b.roleID\n","	into @_roleID\n",
															"FROM acc_mission_seal AS a\n","INNER JOIN acc_enter_seal AS b ON a.seal_id = b.sealID\n",
															"where a.missionId = ",QUOTE(n_missionId)," and b.seal_content='操作' limit 0,1");
		PREPARE stmt_v5 FROM @v5stmt;
		EXECUTE stmt_v5 ;

 IF @_roleID is not null then 

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





 

	SET @expID = NULL,
			@sealed = NULL,
			@ASB = CONCAT_WS('','SELECT c.expID,IF(c1.missionId IS NULL, CONCAT_WS(",",QUOTE(a1.seal_id),QUOTE(a1.pageId),QUOTE(a1.PKid)),NULL)\n',
																	'INTO @expID,@sealed\n',
													'FROM acc_mission AS a INNER JOIN acc_mission_seal AS a1 ON a1.missionId = a.missionId\n','INNER JOIN acc_enter_seal AS b ON a1.seal_id = b.sealID\n','LEFT JOIN acc_1 AS c ON c.expID = ',QUOTE( expID),' AND a.missionId = c.missionId\n','LEFT JOIN acc_seal_1 AS c1 ON c1.expID = c.expID AND c1.missionId = a1.missionId AND c1.seal_Id = a1.seal_id AND c1.pageId = a1.pageId AND c1.missionId = a.missionId\n',
													'WHERE a.missionId = ', QUOTE(missionId) ,'  AND b.roleID = ',QUOTE(roleID),' AND c1.seal_Id IS NULL');



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
BEGIN





 



SELECT
a.missionId,	a.step_label,	a.missionLabel,	a.bill_Id,	a.pageId,	a.is_line,	a.line_x1,	a.line_y1,	a.line_x2,	a.line_y2,	a.line_color,	a.line_type,
b.standard_jsp,b.max_page,b.page_title1,b.page_title2,b.page_title3,b.page_title4,b.page_title5,b.page_title6,b.page_title7,b.page_title8
FROM 	acc_mission_backbill_1 AS a
INNER JOIN mysq1_schema.bill_list AS b ON a.bill_Id = b.billId
where a.missionId=_id;


SELECT a.missionId,a.t1,a.t2,a.t3,a.t4,a.t5,a.t6,a.t7,a.t8,
a.a1,a.a2,a.a3,a.a4,a.a5,a.a6,a.a7,a.a8,a.a9,a.a10,a.a11,a.a12,a.a13,a.a14,a.a15,a.a16,a.a17,a.a18,a.a19,a.a20,a.a21,a.a22,a.a23,a.a24,a.a25,
a.a26,a.a27,a.a28,a.a29,a.a30,a.a31,a.a32,a.a33,a.a34,a.a35,a.a36,a.a37,a.a38,a.a39,a.a40,a.a41,a.a42,a.a43,a.a44,a.a45,a.a46,a.a47,a.a48,a.a49,a.a50,
a.a51,a.a52,a.a53,a.a54,a.a55,a.a56,a.a57,a.a58,a.a59,a.a60,a.a61,a.a62,a.a63,a.a64,a.a65,a.a66,a.a67,a.a68,a.a69,a.a70,a.a71,a.a72,a.a73,a.a74,a.a75,
a.a76,a.a77,a.a78,a.a79,a.a80,a.a81,a.a82,a.a83,a.a84,a.a85,a.a86,a.a87,a.a88,a.a89,a.a90,a.a91,a.a92,a.a93,a.a94,a.a95,a.a96,a.a97,a.a98,a.a99,a.a100
FROM  acc_mission_backbill_1 AS a
where  a.missionId=_id;


SELECT
a.missionId,a.rowId,
a.b1,a.b2,a.b3,a.b4,a.b5,a.b6,a.b7,a.b8,a.b9,a.b10,a.b11,a.b12,a.b13,a.b14,a.b15,a.b16,a.b17,a.b18,a.b19,a.b20,
a.b21,a.b22,a.b23,a.b24,a.b25,a.b26,a.b27,a.b28,a.b29,a.b30,a.b31,a.b32,a.b33,a.b34,a.b35,a.b36,a.b37,a.b38,a.b39,a.b40,
a.b41,a.b42,a.b43,a.b44,a.b45,a.b46,a.b47,a.b48,a.b49,a.b50
FROM acc_mission_backbill_n AS a
where a.missionId=_id  ORDER BY a.rowId;


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
label1:BEGIN







		SET @a := NULL;
		SET @stmt_body =CONCAT_WS('',"SELECT \nCASE WHEN e2.classNo IS NULL THEN 1 \nWHEN IFNULL(a1.is_bk_read_answer,0) = 0 THEN 0\nWHEN IFNULL(b.score,0) < a2.max_score_size THEN 0 \nELSE 1 END\nINTO @a\nFROM exp_experimentclassstudent AS a\nLEFT JOIN exp_experimentclass AS a1 ON a.classNo = a1.classNo\nINNER JOIN `mysq1_schema`.exp_difficulty AS a2 ON a1.difficulty_level = a2.difficulty_level\nLEFT JOIN acc_1 AS b ON b.missionId = ",QUOTE(_id)," AND b.expID = a.expNo\nLEFT JOIN exp_courses_node_content AS e ON e.missionid = ",QUOTE(_id),"\nINNER JOIN exp_courses_node AS e1 ON e.contentNo = e1.contentNo\nLEFT JOIN  exp_experimentclass_course AS e2 ON e2.classNo = a1.classNo AND e1.node_courseNo = e2.courseNo\nWHERE a.expNo = ",QUOTE(_expid)) ;



		PREPARE stmt_bkb FROM @stmt_body;
		EXECUTE stmt_bkb;


		IF @a =0  THEN
			CALL polling_mission(_expid,_id, _pageNo);
			LEAVE label1;
		END IF;

		SET @stmt_body = CONCAT("SELECT ",
										CONCAT_WS(',',"	a.missionId","a.billId","a.pageNo","a.is_line",
													"\n		a.line_x1","a.line_y1","a.line_x2","a.line_y2",
													"\n		a.is_line","a.line_color","a.line_type\n		",
													Temp_Func("a.t??",1,8,NULL),
													"\n		b.standard_jsp","b.max_page\n		",
													"\n		IF(IFNULL(b.max_page,1) = 1,'',b.page_title1) AS `page_title1`",
													Temp_Func("b.page_title??",2,7,NULL)),
													"\nFROM acc_mission AS a\n",
													"INNER JOIN mysq1_schema.bill_list AS b ON a.billId = b.billId\n",
													"WHERE a.missionId = ",QUOTE(_id));

		PREPARE stmt_bkb FROM @stmt_body;
		EXECUTE stmt_bkb;


		SET @stmt_body = CONCAT("SELECT a.missionId,\n",
															Temp_Func("a.a??",1,100,NULL),"\n",
														"FROM acc_standard_1 AS a\n",
														"where a.missionId = ",QUOTE(_id));

		PREPARE stmt_bkb FROM @stmt_body;
		EXECUTE stmt_bkb;
		SET @stmt_body = CONCAT("SELECT a.missionId, a.rowno AS ROWid ,\n",
															Temp_Func("a.b??",1,50,NULL),"\n",
														"FROM acc_standard_n AS a\n",
														"where a.missionId = ",QUOTE(_id));

		PREPARE stmt_bkb FROM @stmt_body;
		EXECUTE stmt_bkb;

		SET @stmt_body = CONCAT("SELECT a.missionId, a.seal_id,a.x,a.y,\n\t\t",
														"b.sealID,b.roleID,b.seal_name,b.seal_content,b.seal_shape,\n\t\t",
														"b.seal_w AS w,b.seal_h AS h,\n\t\t",
														"b.seal_color,b.seal_font,b.seal_content_arc,b.seal_content_arc_font,\n\t\t",
														"b.seal_content_bottom,b.seal_content_bottom_font\n\t\t",
														"FROM acc_mission_seal AS a \n",
														"INNER JOIN acc_enter_seal AS b ON a.seal_id = b.sealID \n",
														"WHERE a.missionId = ",QUOTE(_id )," AND \n\t\t",
														"a.pageId = ",QUOTE(_pageNo)," AND b.seal_content NOT LIKE '%操作%'");


		PREPARE stmt_bkb FROM @stmt_body;
		EXECUTE stmt_bkb;
		DEALLOCATE PREPARE stmt_bkb;


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






SELECT
  CAST(acc_enter.pkid AS CHAR ) as node,
	CAST(acc_enter.pkid AS CHAR ) as fnode,
	'ee' as type,
	acc_enter.enterSimName as title
FROM
acc_enter where acc_enter.courseID=_courseID;

SELECT
  CAST(acc_enter.pkid AS CHAR ) as node,
	CAST(acc_enter.pkid AS CHAR ) as fnode,
  'eb' as type,
	'基本资料' as title	
FROM
	acc_enter where acc_enter.courseID=_courseID
UNION ALL
SELECT
	CAST(bf.EnterBFid AS CHAR ) as node,
	CAST(acc_enter.pkid AS CHAR ) as fnode,
	'ef' as type,
	bf.enterback_title as title
FROM
	acc_enter_backfile bf
INNER JOIN acc_enter on acc_enter.enter=bf.enterId
where bf.enterId IN (SELECT acc_enter.enter FROM acc_enter where acc_enter.courseID=_courseID)
 UNION ALL
SELECT
	CAST(bt.pkid AS CHAR ) as node,
	CAST(acc_enter.pkid AS CHAR ) as fnode,
  'et' as type,
	bt.enterback_title	as title
FROM
	acc_enter_backtext bt 
INNER JOIN acc_enter on acc_enter.enter=bt.enterId
where bt.enterId IN (SELECT acc_enter.enter FROM acc_enter where acc_enter.courseID=_courseID);
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `v5_bk_mission`
-- ----------------------------
DROP PROCEDURE IF EXISTS `v5_bk_mission`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `v5_bk_mission`(in _missionId VARCHAR(50))
BEGIN





SELECT
	a.title,
	a.quoteid as node,
  a.missionid as fnode,
	a.type,
	a.sort,
  1 as layer,
  CAST(a.pageNo AS CHAR ) as pageNo
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

ORDER BY
a.sort ASC;



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
															"\t\t( expid,missionid,rowid,\n",
															"\t\t ",Temp_Func("b??",1,50,NULL),"\n\t\t)\n",
															"SELECT ",QUOTE(expid_),",",QUOTE(missionid_),",a.rowno,\n",
															"\t\t\t",Temp_Func("a.b??",1,50,NULL),"\n",
															"FROM acc_standard_n AS a\n",
															"WHERE a.missionid = ",QUOTE(missionid_)
															);
	PREPARE stmt_copy FROM @copy_stat;
	EXECUTE stmt_copy;
	

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
    
    SELECT count(*) as shouldSeal
    FROM acc_mission_seal
    LEFT JOIN acc_enter_seal on acc_enter_seal.sealID=acc_mission_seal.seal_id
    where acc_mission_seal.missionId =_missionId and acc_mission_seal.seal_no=_sealNo and acc_mission_seal.pageId=_pageId and acc_enter_seal.seal_content not like '%操作%'
   ) ssd 
   LEFT JOIN
   (
     
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
    
    SELECT count(*) as shouldSeal
    FROM acc_mission_seal
    LEFT JOIN acc_enter_seal on acc_enter_seal.sealID=acc_mission_seal.seal_id
    where acc_mission_seal.missionId =_missionId and acc_mission_seal.seal_no=_sealNo and acc_enter_seal.seal_content not like '%操作%'
   ) ssd 
   LEFT JOIN
   (
     
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




 


	SET @init4Seals = CONCAT("SELECT 	CASE WHEN  a.seal_id IS NOT NULL  THEN '2' \n	WHEN  c.seal_id IS NOT NULL  THEN '1' \n ELSE '0' END AS sealStat\n",
																		",d.sealID,d.roleID,c.seal_no ,",j3(ajson,"seal_no")," as sealNo,c.pageId,\n",
																		"d.seal_shape,d.seal_content,d.seal_content_arc,\n\t\t\n",
																		"d.seal_content_arc_font,d.seal_content_bottom,d.seal_content_bottom_font,\n\t\t",
																		"c.x AS seal_x,c.y AS seal_y,d.seal_w,d.seal_h,d.seal_font,d.seal_color\n",
																		"FROM acc_enter_role AS d0\n",
																		"INNER JOIN acc_enter_seal AS d ON d.roleID = d0.roleID\n",
																		"LEFT JOIN acc_mission_seal AS c ON ",
CONCAT_WS(' AND ', CONCAT('c.seal_no = ',j3(ajson,"seal_no")), CONCAT('c.pageId = ',j3(ajson,"pageId")),CONCAT('c.missionId = ',j3(ajson,"missionId")),"c.seal_id = d.sealID\n"),
																		"LEFT JOIN acc_seal_1 AS a ON ",
CONCAT_WS(' AND ', CONCAT('a.missionId = ',j3(ajson,"missionId")), CONCAT('a.expId = ',j3(ajson,"expId")),"c.seal_id = a.seal_Id AND c.pageId = a.pageId\n"),

																		"WHERE ",
CONCAT_WS(" AND ",CONCAT("d0.roleID = " ,j3(ajson,"roleID"), "\n"),
																		"d.seal_name NOT LIKE '%none%' AND d.seal_name NOT LIKE '%操作%' AND d.seal_content NOT LIKE '%操作%'"));



	PREPARE stmt_init4Seals FROM @init4Seals;
	EXECUTE stmt_init4Seals;
	DEALLOCATE PREPARE stmt_init4Seals;

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


 
delete from acc_mission_seal_assist where acc_mission_seal_assist.courseNo=coursesNo;



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



	DECLARE  old_type VARCHAR(10) DEFAULT 'no';


	SET  @a = NULL,
				@a = DATABASE();

	IF @a = 'qianxue_sjzh' THEN

		CALL  v5_query_mission_bk(`expid_` ,`type_`, `keyword`, `page` ,`num`);
		LEAVE label;
	END IF;

	set 				
				
				@stmtbody = NULL ,
				@totalnum = 0,
				@stmtbody1 = NULL ,
				@stmtbody2 = NULL ,
				@stmtbody3 = '' ;

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
	    "\nORDER BY c3.billTypeSay,c2.billname,nabc(CONCAT(b4.node_no,',',b5.typesort))");


	SET @allmis = '' ,

			@stmtbody = concat(@stmtbody1,@stmtbody2,@stmtbody3);



	PREPARE stmt from  @stmtbody ;
	EXECUTE stmt ;
	
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
			WHEN 'kjpz' THEN  
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

	PREPARE stmt from  @stmtbody3 ;
	EXECUTE stmt ;
  DEALLOCATE PREPARE stmt;

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


	PREPARE stmt from  @qbkbody ;
	EXECUTE stmt ;

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
			WHEN 'kjpz' THEN  
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




	PREPARE stmt from  @qbkbody3 ;
	EXECUTE stmt ;
  DEALLOCATE PREPARE stmt;

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





 
 declare _PKid VARCHAR(50);
 declare _sealNo VARCHAR(3);
 declare _roleID VARCHAR(50);
 declare _actionNo VARCHAR(2);
 declare _nRoleId VARCHAR(50);
 declare _nSealNo VARCHAR(3);
 declare xSealNo FLOAT;
 declare xnSealNo FLOAT;
 declare xRoleId VARCHAR(50);


 
  
  if isSelf=0 THEN 
    select case when exp_stu_mission.SealNo is null then -1 else exp_stu_mission.SealNo end,exp_stu_mission.nRoleId INTO xSealNo,xRoleId from exp_stu_mission where exp_stu_mission.expId=n_expID  and exp_stu_mission.missionId=n_missionId ;     
  ELSE 
    select case when exp_stu_mission.SealNo is null then -1 else exp_stu_mission.SealNo end,exp_stu_mission.roleId INTO xSealNo,xRoleId from exp_stu_mission where exp_stu_mission.expId=n_expID  and exp_stu_mission.missionId=n_missionId ;
  end if; 

  
  delete from acc_seal_1 where acc_seal_1.expID=n_expID and acc_seal_1.missionId=n_missionId and acc_seal_1.seal_Id in 
   (select acc_enter_seal.sealID from acc_enter_seal where acc_enter_seal.roleID=xRoleId);
  
  if xSealNo>1 THEN
    if isSelf=0 THEN 
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
    
    update exp_stu_mission set exp_stu_mission.PKid=_PKid,exp_stu_mission.roleID=_roleID,exp_stu_mission.sealNo=_sealNo,exp_stu_mission.nodeSealId=_actionNo,exp_stu_mission.nRoleId=_nRoleId,exp_stu_mission.nSealNo=_nSealNo
     where exp_stu_mission.expId=n_expID and exp_stu_mission.missionId=n_missionId;
    
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
--  Records 
-- ----------------------------
