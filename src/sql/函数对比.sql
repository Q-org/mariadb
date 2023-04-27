-- SELECT CONCAT('{',GROUP_CONCAT(a.b),'}') AS b FROM(
SELECT 
IF(IFNULL(a1.rowNo,'') = '',b.rowId ,a1.rowNo) AS rowNo,
@bio := IF(NOT '0','{"1":"1","2":"1"}',IF(@bio := preg_capture(QD(a1.rowNo,':{/','/'),@bi) IS NULL ,NULL,je2(@bi,a1.rowNo,NULL))),
@c := 0,
IF(IFNULL(@a := CONCAT_WS(",",IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b1="",NULL,QD(b.b1,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b1,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b1="",NULL,QD(b.b1,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b2="",NULL,QD(b.b2,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b2,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b2="",NULL,QD(b.b2,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b3="",NULL,QD(b.b3,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b3,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b3="",NULL,QD(b.b3,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b4="",NULL,QD(b.b4,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b4,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b4="",NULL,QD(b.b4,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b5="",NULL,QD(b.b5,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b5,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b5="",NULL,QD(b.b5,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b6="",NULL,QD(b.b6,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b6,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b6="",NULL,QD(b.b6,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b7="",NULL,QD(b.b7,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b7,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b7="",NULL,QD(b.b7,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b8="",NULL,QD(b.b8,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b8,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b8="",NULL,QD(b.b8,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b9="",NULL,QD(b.b9,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b9,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b9="",NULL,QD(b.b9,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b10="",NULL,QD(b.b10,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b10,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b10="",NULL,QD(b.b10,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b11="",NULL,QD(b.b11,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b11,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b11="",NULL,QD(b.b11,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b12="",NULL,QD(b.b12,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b12,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b12="",NULL,QD(b.b12,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b13="",NULL,QD(b.b13,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b13,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b13="",NULL,QD(b.b13,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b14="",NULL,QD(b.b14,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b14,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b14="",NULL,QD(b.b14,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b15="",NULL,QD(b.b15,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b15,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b15="",NULL,QD(b.b15,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b16="",NULL,QD(b.b16,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b16,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b16="",NULL,QD(b.b16,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b17="",NULL,QD(b.b17,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b17,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b17="",NULL,QD(b.b17,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b18="",NULL,QD(b.b18,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b18,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b18="",NULL,QD(b.b18,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b19="",NULL,QD(b.b19,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b19,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b19="",NULL,QD(b.b19,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b20="",NULL,QD(b.b20,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b20,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b20="",NULL,QD(b.b20,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b21="",NULL,QD(b.b21,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b21,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b21="",NULL,QD(b.b21,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b22="",NULL,QD(b.b22,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b22,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b22="",NULL,QD(b.b22,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b23="",NULL,QD(b.b23,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b23,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b23="",NULL,QD(b.b23,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b24="",NULL,QD(b.b24,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b24,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b24="",NULL,QD(b.b24,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b25="",NULL,QD(b.b25,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b25,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b25="",NULL,QD(b.b25,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b26="",NULL,QD(b.b26,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b26,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b26="",NULL,QD(b.b26,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b27="",NULL,QD(b.b27,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b27,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b27="",NULL,QD(b.b27,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b28="",NULL,QD(b.b28,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b28,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b28="",NULL,QD(b.b28,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b29="",NULL,QD(b.b29,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b29,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b29="",NULL,QD(b.b29,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b30="",NULL,QD(b.b30,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b30,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b30="",NULL,QD(b.b30,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b31="",NULL,QD(b.b31,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b31,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b31="",NULL,QD(b.b31,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b32="",NULL,QD(b.b32,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b32,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b32="",NULL,QD(b.b32,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b33="",NULL,QD(b.b33,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b33,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b33="",NULL,QD(b.b33,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b34="",NULL,QD(b.b34,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b34,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b34="",NULL,QD(b.b34,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b35="",NULL,QD(b.b35,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b35,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b35="",NULL,QD(b.b35,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b36="",NULL,QD(b.b36,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b36,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b36="",NULL,QD(b.b36,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b37="",NULL,QD(b.b37,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b37,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b37="",NULL,QD(b.b37,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b38="",NULL,QD(b.b38,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b38,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b38="",NULL,QD(b.b38,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b39="",NULL,QD(b.b39,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b39,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b39="",NULL,QD(b.b39,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b40="",NULL,QD(b.b40,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b40,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b40="",NULL,QD(b.b40,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b41="",NULL,QD(b.b41,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b41,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b41="",NULL,QD(b.b41,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b42="",NULL,QD(b.b42,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b42,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b42="",NULL,QD(b.b42,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b43="",NULL,QD(b.b43,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b43,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b43="",NULL,QD(b.b43,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b44="",NULL,QD(b.b44,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b44,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b44="",NULL,QD(b.b44,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b45="",NULL,QD(b.b45,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b45,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b45="",NULL,QD(b.b45,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b46="",NULL,QD(b.b46,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b46,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b46="",NULL,QD(b.b46,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b47="",NULL,QD(b.b47,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b47,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b47="",NULL,QD(b.b47,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b48="",NULL,QD(b.b48,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b48,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b48="",NULL,QD(b.b48,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b49="",NULL,QD(b.b49,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b49,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b49="",NULL,QD(b.b49,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
,IF(IFNULL(@a := CONCAT_WS(",",
IF(@bio+(@c:=@c+1)IS NULL,
	IF(b.b50="",NULL,QD(b.b50,"","\"v\":"))
,IF(preg_capture(QD(@c,":\"/","/"),@bio) IS NOT NULL,CONCAT_WS("",CONCAT(QD(a1.b50,"","\"v\":"),","),"\"c\":\"1\""),
	IF(b.b50="",NULL,QD(b.b50,"","\"v\":"))
))),"")="",NULL,qd(@c,CONCAT(":{",@a,"}"),""))
),"")="",NULL,
qd(a1.rowNo,CONCAT(":{",@a,"}"),"")) 

 AS b
FROM acc_mission AS a 
LEFT JOIN acc_n_3 AS b ON b.expid = '23030516030936031323' AND b.missionId ='qianxue-15123115374571222'
LEFT JOIN acc_standard_n AS a1 ON a.missionId = a1.missionId AND (CASE WHEN  IFNULL(b.rowId,'') <> '' AND IFNULL(b.rowId,'') <> ''THEN a1.rowno = b.rowId WHEN IFNULL(b.rowId,'') <> '' THEN b.rowId ELSE a1.rowno END)WHERE a.missionid = 'qianxue-15123115374571222'
-- ) AS a WHERE a.b IS NOT NULL
