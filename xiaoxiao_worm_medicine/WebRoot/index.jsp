<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<%@page import="com.xpf.database.ConDB" %>
<%@page import="java.sql.*" %>

<% 
	Connection conn = null;
	PreparedStatement ps = null;
	PreparedStatement ps2 = null;
	PreparedStatement ps3 = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;
	String sql = "select * from xpf_medicine";
	String sql2 = "select * from xpf_device";
	String sql3 = "select * from xpf_books";
	ConDB condb = new ConDB();
	
	try
	{
		conn = condb.getCon();
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery(sql);
		
		ps2 = conn.prepareStatement(sql2);
		rs2 = ps2.executeQuery(sql2);
		
		ps3 = conn.prepareStatement(sql3);
		rs3 = ps3.executeQuery(sql3);
		

%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.css"></link>
	<link rel="stylesheet" type="text/css" href="css/jquery.dataTables_themeroller.css"></link>
	<link rel="stylesheet" type="text/css" href="css/demo_page.css"></link>
	<link rel="stylesheet" type="text/css" href="css/demo_table_jui.css"></link>
	<link rel="stylesheet" type="text/css" href="css/demo_table.css"></link>
	<link rel="stylesheet" type="text/css" href="css/xpf_med_manage.css"></link>
	
	<script type="text/javascript" language="javascript" src="js/jquery.js"></script>
    <script type="text/javascript" language="javascript" src="js/jquery.dataTables.min.js"></script>
    
    <script>
    	function opendiv(div1, div2)
		{
			document.getElementById(div1).style.display = 'block';
			document.getElementById(div2).style.display = 'block';
		}
		
		function closediv(div1, div2)
		{
			document.getElementById(div1).style.display = 'none';
			document.getElementById(div2).style.display = 'none';
		}
		
		
		function showmed(id)
		{
			var xpf_med_name = "xpf_med_name_" + id;
    		var xpf_med_number = "xpf_med_number_" + id;
    		var xpf_med_kind = "xpf_med_kind_" + id;
    		var xpf_med_property = "xpf_med_property_" + id;
    		var xpf_med_begintime = "xpf_med_begintime_" + id;
    		var xpf_med_endtime = "xpf_med_endtime_" + id;
    		var xpf_med_buytime = "xpf_med_buytime_" + id;
    		var xpf_med_dutypeople = "xpf_med_dutypeople_" + id;
    		var xpf_med_buymount = "xpf_med_buymount_" + id;
    		var xpf_med_nowmount = "xpf_med_nowmount_" + id;
    		var xpf_med_mountdanwei = "xpf_med_mountdanwei_" + id;
    		var xpf_med_location = "xpf_med_location_" + id;
    		var xpf_med_belongto = "xpf_med_belongto_" + id;
    		var xpf_med_other = "xpf_med_other_" + id;
    		var xpf_med_time = "xpf_med_time_" + id;
    		//alert(document.getElementById(xpf_med_name).textContent);
    	//	alert(document.getElementById(xpf_med_name).outerHTML);
    		//alert(document.getElementById(xpf_med_name).outerText);
    	//	alert(document.getElementById(xpf_med_name).innerHTML);
    		//alert(document.getElementById(xpf_med_name).innerText);
    		document.getElementById('xpf_med_show_up').innerHTML = "<table border=2><tr><td>药品名称:</td><td>"
    		 +document.getElementById(xpf_med_name).innerHTML+ "</td></tr><tr><td>药品编号:</td><td>"
    		  +document.getElementById(xpf_med_number).innerHTML+ "</td></tr><tr><td>药品种类:</td><td>" 
    		  +document.getElementById(xpf_med_kind).innerHTML+ "</td></tr><tr><td>药品性质:</td><td>" 
    		  +document.getElementById(xpf_med_property).innerHTML+ "</td></tr><tr><td>药品生产时间:</td><td>" 
    		  +document.getElementById(xpf_med_begintime).innerHTML+ "</td></tr><tr><td>药品过期时间:</td><td>" 
    		  +document.getElementById(xpf_med_endtime).innerHTML+ "</td></tr><tr><td>药品购入时间:</td><td>" 
    		  +document.getElementById(xpf_med_buytime).innerHTML+ "</td></tr><tr><td>药品负责人:</td><td>" 
    		  +document.getElementById(xpf_med_dutypeople).innerHTML+ "</td></tr><tr><td>药品购入时数量:</td><td>" 
    		  +document.getElementById(xpf_med_buymount).innerHTML+ "</td></tr><tr><td>药品剩余数量:</td><td>" 
    		  +document.getElementById(xpf_med_nowmount).innerHTML+ "</td></tr><tr><td>药品计量单位:</td><td>" 
    		  +document.getElementById(xpf_med_mountdanwei).innerHTML+ "</td></tr><tr><td>药品存放位置:</td><td>" 
    		  +document.getElementById(xpf_med_location).innerHTML+ "</td></tr><tr><td>药品所属部门:</td><td>" 
    		  +document.getElementById(xpf_med_belongto).innerHTML+ "</td></tr><tr><td>备注:</td><td>" 
    		  +document.getElementById(xpf_med_other).innerHTML+ "</td></tr><tr><td>药品录入时间:</td><td>" 
    		  +document.getElementById(xpf_med_time).innerHTML+ "</td></tr></table>";

    		
    		opendiv('xpf_med_show', 'xpf_total_bg');
		}
		
		function altermed(id)
		{
			var xpf_medicine_number = "xpf_medicine_number_" + id; 
			var xpf_med_name = "xpf_med_name_" + id;
    		var xpf_med_number = "xpf_med_number_" + id;
    		var xpf_med_kind = "xpf_med_kind_" + id;
    		var xpf_med_property = "xpf_med_property_" + id;
    		var xpf_med_begintime = "xpf_med_begintime_" + id;
    		var xpf_med_endtime = "xpf_med_endtime_" + id;
    		var xpf_med_buytime = "xpf_med_buytime_" + id;
    		var xpf_med_dutypeople = "xpf_med_dutypeople_" + id;
    		var xpf_med_buymount = "xpf_med_buymount_" + id;
    		var xpf_med_nowmount = "xpf_med_nowmount_" + id;
    		var xpf_med_mountdanwei = "xpf_med_mountdanwei_" + id;
    		var xpf_med_location = "xpf_med_location_" + id;
    		var xpf_med_belongto = "xpf_med_belongto_" + id;
    		var xpf_med_other = "xpf_med_other_" + id;
    		var xpf_med_time = "xpf_med_time_" + id;
    		
    	
    		
    		document.getElementById('xpf_med_alter_up').innerHTML = "<form id='alter_med_form' name='alter_med_form' method='post' action='AlterMed' ><table border=2><tr><td>药品名称:</td><td><input name='xpf_med_name' value='"
    		 +document.getElementById(xpf_med_name).innerHTML+ "' /></td></tr><tr><td>药品编号:</td><td><input name='xpf_med_number' value='"
    		  +document.getElementById(xpf_med_number).innerHTML+ "' /></td></tr><tr><td>药品种类:</td><td><input name='xpf_med_kind' value='" 
    		  +document.getElementById(xpf_med_kind).innerHTML+ "' /></td></tr><tr><td>药品性质:</td><td><input name='xpf_med_property' value='" 
    		  +document.getElementById(xpf_med_property).innerHTML+ "' /></td></tr><tr><td>药品生产时间:</td><td><input name='xpf_med_begintime' value='" 
    		  +document.getElementById(xpf_med_begintime).innerHTML+ "' /></td></tr><tr><td>药品过期时间:</td><td><input name='xpf_med_endtime' value='" 
    		  +document.getElementById(xpf_med_endtime).innerHTML+ "' /></td></tr><tr><td>药品购入时间:</td><td><input name='xpf_med_buytime' value='" 
    		  +document.getElementById(xpf_med_buytime).innerHTML+ "' /></td></tr><tr><td>药品负责人:</td><td><input name='xpf_med_dutypeople' value='" 
    		  +document.getElementById(xpf_med_dutypeople).innerHTML+ "' /></td></tr><tr><td>药品购入时数量:</td><td><input name='xpf_med_buymount' value='" 
    		  +document.getElementById(xpf_med_buymount).innerHTML+ "' /></td></tr><tr><td>药品剩余数量:</td><td><input name='xpf_med_nowmount' value='" 
    		  +document.getElementById(xpf_med_nowmount).innerHTML+ "' /></td></tr><tr><td>药品计量单位:</td><td><input name='xpf_med_mountdanwei' value='" 
    		  +document.getElementById(xpf_med_mountdanwei).innerHTML+ "' /></td></tr><tr><td>药品存放位置:</td><td><input name='xpf_med_location' value='" 
    		  +document.getElementById(xpf_med_location).innerHTML+ "' /></td></tr><tr><td>药品所属部门:</td><td><input name='xpf_med_belongto' value='" 
    		  +document.getElementById(xpf_med_belongto).innerHTML+ "' /></td></tr><tr><td>备注:</td><td><textarea name='xpf_med_other'>" 
    		  +document.getElementById(xpf_med_other).innerHTML+ "</textarea></td></tr><tr><td>药品录入时间:</td><td><input name='xpf_med_time' readonly value='" 
    		  +document.getElementById(xpf_med_time).innerHTML+ "' /><input type='hidden' name='xpf_medicine_number' value='"+document.getElementById(xpf_medicine_number).value+"' /></td></tr></table></form>";
    		  
    		  opendiv('xpf_med_alter', 'xpf_total_bg');
		}
		
		
		function alter_med_up()
		{
			document.getElementById('alter_med_form').submit();
		}
		
		
		function deletemed(id)
		{
			var xpf_medicine_number = "xpf_medicine_number_" + id;
			document.getElementById('xpf_medicine_number').value = document.getElementById(xpf_medicine_number).value;
			
			opendiv('xpf_med_delete', 'xpf_total_bg');
		}
		
		function delete_med_sure()
		{
			document.getElementById('delete_med_form').submit();
		}
		
		
		
		
		function showdev(id)
		{
    		var xpf_dev_name = "xpf_dev_name_" + id;
 			var xpf_dev_number = "xpf_dev_number_" + id;
    		var xpf_dev_property = "xpf_dev_property_" + id;
    		var xpf_dev_begintime = "xpf_dev_begintime_" + id;
    		var xpf_dev_endtime = "xpf_dev_endtime_" + id;
    		var xpf_dev_buytime = "xpf_dev_buytime_" + id;
    		var xpf_dev_dutypeople = "xpf_dev_dutypeople_" + id;
    		var xpf_dev_buymount = "xpf_dev_buymount_" + id;
    		var xpf_dev_nowmount = "xpf_dev_nowmount_" + id;
    		var xpf_dev_lendmount = "xpf_dev_lendmount_" + id;
    		var xpf_dev_inmount = "xpf_dev_inmount_" + id;
    		var xpf_dev_mountdanwei = "xpf_dev_mountdanwei_" + id;
    		var xpf_dev_location = "xpf_dev_location_" + id;
    		var xpf_dev_belongto = "xpf_dev_belongto_" + id;
    		var xpf_dev_other = "xpf_dev_other_" + id;
    		var xpf_dev_time = "xpf_dev_time_" + id;
    		
    		
    		
    		document.getElementById('xpf_dev_show_up').innerHTML = "<table border=2><tr><td>器械名称:</td><td>"
    		 +document.getElementById(xpf_dev_name).innerHTML+ "</td></tr><tr><td>器械编号:</td><td>"
    		  +document.getElementById(xpf_dev_number).innerHTML+ "</td></tr><tr><td>器械性质 :</td><td>" 
    		  +document.getElementById(xpf_dev_property).innerHTML+ "</td></tr><tr><td>器械生产时间:</td><td>" 
    		  +document.getElementById(xpf_dev_begintime).innerHTML+ "</td></tr><tr><td>器械过期时间:</td><td>" 
    		  +document.getElementById(xpf_dev_endtime).innerHTML+ "</td></tr><tr><td>器械购入时间:</td><td>" 
    		  +document.getElementById(xpf_dev_buytime).innerHTML+ "</td></tr><tr><td>器械负责人:</td><td>" 
    		  +document.getElementById(xpf_dev_dutypeople).innerHTML+ "</td></tr><tr><td>器械购入数量:</td><td>" 
    		  +document.getElementById(xpf_dev_buymount).innerHTML+ "</td></tr><tr><td>器械现有总数量:</td><td>" 
    		  +document.getElementById(xpf_dev_nowmount).innerHTML+ "</td></tr><tr><td>器械借出数量:</td><td>" 
    		  +document.getElementById(xpf_dev_lendmount).innerHTML+ "</td></tr><tr><td>器械在库数量:</td><td>" 
    		  +document.getElementById(xpf_dev_inmount).innerHTML+ "</td></tr><tr><td>器械计量单位:</td><td>" 
    		  +document.getElementById(xpf_dev_mountdanwei).innerHTML+ "</td></tr><tr><td>器械存放位置:</td><td>" 
    		  +document.getElementById(xpf_dev_location).innerHTML+ "</td></tr><tr><td>器械所属部门:</td><td>" 
    		  +document.getElementById(xpf_dev_belongto).innerHTML+ "</td></tr><tr><td>备注:</td><td>" 
    		  +document.getElementById(xpf_dev_other).innerHTML+ "</td></tr><tr><td>时间:</td><td>"
    		  +document.getElementById(xpf_dev_time).innerHTML+ "</td></tr></table>";
    		  
    		  
    		  opendiv('xpf_dev_show', 'xpf_total_bg');
		}
		
		function alterdev(id)
		{
			var xpf_device_number = "xpf_device_number_" + id;
			var xpf_dev_name = "xpf_dev_name_" + id;
 			var xpf_dev_number = "xpf_dev_number_" + id;
    		var xpf_dev_property = "xpf_dev_property_" + id;
    		var xpf_dev_begintime = "xpf_dev_begintime_" + id;
    		var xpf_dev_endtime = "xpf_dev_endtime_" + id;
    		var xpf_dev_buytime = "xpf_dev_buytime_" + id;
    		var xpf_dev_dutypeople = "xpf_dev_dutypeople_" + id;
    		var xpf_dev_buymount = "xpf_dev_buymount_" + id;
    		var xpf_dev_nowmount = "xpf_dev_nowmount_" + id;
    		var xpf_dev_lendmount = "xpf_dev_lendmount_" + id;
    		var xpf_dev_inmount = "xpf_dev_inmount_" + id;
    		var xpf_dev_mountdanwei = "xpf_dev_mountdanwei_" + id;
    		var xpf_dev_location = "xpf_dev_location_" + id;
    		var xpf_dev_belongto = "xpf_dev_belongto_" + id;
    		var xpf_dev_other = "xpf_dev_other_" + id;
    		var xpf_dev_time = "xpf_dev_time_" + id;
    		
    		
    		
    		document.getElementById('xpf_dev_alter_up').innerHTML = "<form id='alter_dev_form' name='alter_dev_form' method='post' action='AlterDev'><table border=2><tr><td>器械名称:</td><td><input name='xpf_dev_name' value='"
    		 +document.getElementById(xpf_dev_name).innerHTML+ "' /></td></tr><tr><td>器械编号:</td><td><input name='xpf_dev_number' value='"
    		  +document.getElementById(xpf_dev_number).innerHTML+ "' /></td></tr><tr><td>器械性质 :</td><td><input name='xpf_dev_property' value='" 
    		  +document.getElementById(xpf_dev_property).innerHTML+ "' /></td></tr><tr><td>器械生产时间:</td><td><input name='xpf_dev_begintime' value='" 
    		  +document.getElementById(xpf_dev_begintime).innerHTML+ "' /></td></tr><tr><td>器械过期时间:</td><td><input name='xpf_dev_endtime' value='" 
    		  +document.getElementById(xpf_dev_endtime).innerHTML+ "' /></td></tr><tr><td>器械购入时间:</td><td><input name='xpf_dev_buytime' value='" 
    		  +document.getElementById(xpf_dev_buytime).innerHTML+ "' /></td></tr><tr><td>器械负责人:</td><td><input name='xpf_dev_dutypeople' value='" 
    		  +document.getElementById(xpf_dev_dutypeople).innerHTML+ "' /></td></tr><tr><td>器械购入数量:</td><td><input name='xpf_dev_buymount' value='" 
    		  +document.getElementById(xpf_dev_buymount).innerHTML+ "' /></td></tr><tr><td>器械现有总数量:</td><td><input name='xpf_dev_nowmount' value='" 
    		  +document.getElementById(xpf_dev_nowmount).innerHTML+ "' /></td></tr><tr><td>器械借出数量:</td><td><input name='xpf_dev_lendmount' value='" 
    		  +document.getElementById(xpf_dev_lendmount).innerHTML+ "' /></td></tr><tr><td>器械在库数量:</td><td><input name='xpf_dev_inmount' value='" 
    		  +document.getElementById(xpf_dev_inmount).innerHTML+ "' /></td></tr><tr><td>器械计量单位:</td><td><input name='xpf_dev_mountdanwei' value='" 
    		  +document.getElementById(xpf_dev_mountdanwei).innerHTML+ "' /></td></tr><tr><td>器械存放位置:</td><td><input name='xpf_dev_location' value='" 
    		  +document.getElementById(xpf_dev_location).innerHTML+ "' /></td></tr><tr><td>器械所属部门:</td><td><input name='xpf_dev_belongto' value='" 
    		  +document.getElementById(xpf_dev_belongto).innerHTML+ "' /></td></tr><tr><td>备注:</td><td><textarea name='xpf_dev_other'>" 
    		  +document.getElementById(xpf_dev_other).innerHTML+ "</textarea></td></tr><tr><td>时间:</td><td><input readonly name='xpf_dev_time' value='"
    		  +document.getElementById(xpf_dev_time).innerHTML+ "' /><input type='hidden' name='xpf_device_number' value='"
    		  +document.getElementById(xpf_device_number).value+"' /></td></tr></table></form>";
    		
			
			opendiv('xpf_dev_alter', 'xpf_total_bg');
		}
		
		function alter_dev_up()
		{
			document.getElementById('alter_dev_form').submit();
		}
		
		function deletedev(id)
		{
			var xpf_device_number = "xpf_device_number_" + id;
			document.getElementById('xpf_device_number').value = document.getElementById(xpf_device_number).value;
			
		//	alert(document.getElementById(xpf_device_number).value);
			
			opendiv('xpf_dev_delete', 'xpf_total_bg');
		}
		
		
		function delete_dev_sure()
		{
			document.getElementById('delete_dev_form').submit();
		}
		
		
		
		
		
		function showbook(id)
		{
    		var xpf_book_name = "xpf_book_name_" + id;
    		var xpf_book_number = "xpf_book_number_" + id;
    		var xpf_book_kind = "xpf_book_kind_" + id;
    		var xpf_book_begintime = "xpf_book_begintime_" + id;
    		var xpf_book_buytime = "xpf_book_buytime_" + id;
    		var xpf_book_dutypeople = "xpf_book_dutypeople_" + id;
    		var xpf_book_buymount = "xpf_book_buymount_" + id;
    		var xpf_book_nowmount = "xpf_book_nowmount_" + id;
    		var xpf_book_lendmount = "xpf_book_lendmount_" + id;
    		var xpf_book_inmount = "xpf_book_inmount_" + id;
    		var xpf_book_location = "xpf_book_location_" + id;
    		var xpf_book_belongto = "xpf_book_belongto_" + id;
    		var xpf_book_other = "xpf_book_other_" + id;
    		var xpf_book_time = "xpf_book_time_" + id;
    		
    		
    		document.getElementById('xpf_book_show_up').innerHTML = "<table border=2><tr><td>书本名称:</td><td>"
    		 +document.getElementById(xpf_book_name).innerHTML+ "</td></tr><tr><td>书本编号:</td><td>"
    		  +document.getElementById(xpf_book_number).innerHTML+ "</td></tr><tr><td>书本种类 :</td><td>" 
    		  +document.getElementById(xpf_book_kind).innerHTML+ "</td></tr><tr><td>书本出版时间:</td><td>" 
    		  +document.getElementById(xpf_book_begintime).innerHTML+ "</td></tr><tr><td>书本购入时间:</td><td>" 
    		  +document.getElementById(xpf_book_buytime).innerHTML+ "</td></tr><tr><td>书本负责人:</td><td>" 
    		  +document.getElementById(xpf_book_dutypeople).innerHTML+ "</td></tr><tr><td>书本购入数量:</td><td>" 
    		  +document.getElementById(xpf_book_buymount).innerHTML+ "</td></tr><tr><td>书本现有总数量:</td><td>" 
    		  +document.getElementById(xpf_book_nowmount).innerHTML+ "</td></tr><tr><td>书本借出数量:</td><td>" 
    		  +document.getElementById(xpf_book_lendmount).innerHTML+ "</td></tr><tr><td>书本在库数量:</td><td>" 
    		  +document.getElementById(xpf_book_inmount).innerHTML+ "</td></tr><tr><td>书本存放位置:</td><td>" 
    		  +document.getElementById(xpf_book_location).innerHTML+ "</td></tr><tr><td>书本所属部门:</td><td>" 
    		  +document.getElementById(xpf_book_belongto).innerHTML+ "</td></tr><tr><td>备注:</td><td>" 
    		  +document.getElementById(xpf_book_other).innerHTML+ "</td></tr><tr><td>时间 :</td><td>" 
    		  +document.getElementById(xpf_book_time).innerHTML+ "</td></tr></table>";
    		  
    		  
    		  opendiv('xpf_book_show', 'xpf_total_bg');
    		
		}
		
		
		function alterbook(id)
		{
			var xpf_books_number = "xpf_books_number_" + id;
			var xpf_book_name = "xpf_book_name_" + id;
    		var xpf_book_number = "xpf_book_number_" + id;
    		var xpf_book_kind = "xpf_book_kind_" + id;
    		var xpf_book_begintime = "xpf_book_begintime_" + id;
    		var xpf_book_buytime = "xpf_book_buytime_" + id;
    		var xpf_book_dutypeople = "xpf_book_dutypeople_" + id;
    		var xpf_book_buymount = "xpf_book_buymount_" + id;
    		var xpf_book_nowmount = "xpf_book_nowmount_" + id;
    		var xpf_book_lendmount = "xpf_book_lendmount_" + id;
    		var xpf_book_inmount = "xpf_book_inmount_" + id;
    		var xpf_book_location = "xpf_book_location_" + id;
    		var xpf_book_belongto = "xpf_book_belongto_" + id;
    		var xpf_book_other = "xpf_book_other_" + id;
    		var xpf_book_time = "xpf_book_time_" + id;
    		
    		
    		document.getElementById('xpf_book_alter_up').innerHTML = "<form id='alter_book_form' name='alter_book_form' method='post' action='AlterBook'><table border=2><tr><td>书本名称:</td><td><input name='xpf_book_name' value='"
    		 +document.getElementById(xpf_book_name).innerHTML+ "' /></td></tr><tr><td>书本编号:</td><td><input name='xpf_book_number' value='"
    		  +document.getElementById(xpf_book_number).innerHTML+ "' /></td></tr><tr><td>书本种类 :</td><td><input name='xpf_book_kind' value='" 
    		  +document.getElementById(xpf_book_kind).innerHTML+ "' /></td></tr><tr><td>书本出版时间:</td><td><input name='xpf_book_begintime' value='" 
    		  +document.getElementById(xpf_book_begintime).innerHTML+ "' /></td></tr><tr><td>书本购入时间:</td><td><input name='xpf_book_buytime' value='" 
    		  +document.getElementById(xpf_book_buytime).innerHTML+ "' /></td></tr><tr><td>书本负责人:</td><td><input name='xpf_book_dutypeople' value='" 
    		  +document.getElementById(xpf_book_dutypeople).innerHTML+ "' /></td></tr><tr><td>书本购入数量:</td><td><input name='xpf_book_buymount' value='" 
    		  +document.getElementById(xpf_book_buymount).innerHTML+ "' /></td></tr><tr><td>书本现有总数量:</td><td><input name='xpf_book_nowmount' value='" 
    		  +document.getElementById(xpf_book_nowmount).innerHTML+ "' /></td></tr><tr><td>书本借出数量:</td><td><input name='xpf_book_lendmount' value='" 
    		  +document.getElementById(xpf_book_lendmount).innerHTML+ "' /></td></tr><tr><td>书本在库数量:</td><td><input name='xpf_book_inmount' value='" 
    		  +document.getElementById(xpf_book_inmount).innerHTML+ "' /></td></tr><tr><td>书本存放位置:</td><td><input name='xpf_book_location' value='" 
    		  +document.getElementById(xpf_book_location).innerHTML+ "' /></td></tr><tr><td>书本所属部门:</td><td><input name='xpf_book_belongto' value='" 
    		  +document.getElementById(xpf_book_belongto).innerHTML+ "' /></td></tr><tr><td>备注:</td><td><textarea name='xpf_book_other'>" 
    		  +document.getElementById(xpf_book_other).innerHTML+ "</textarea></td></tr><tr><td>时间 :</td><td><input readonly name='xpf_book_time' value='" 
    		  +document.getElementById(xpf_book_time).innerHTML+ "' /><input type='hidden' name='xpf_books_number' value='"
    		  +document.getElementById(xpf_books_number).value+"' ></td></tr></table></form>";
    		  
    		  
    		  opendiv('xpf_book_alter', 'xpf_total_bg');
		}
		
		
		function alter_book_up()
		{
			document.getElementById('alter_book_form').submit();
		}
		
		function deletebook(id)
		{
			var xpf_books_number = "xpf_books_number_" + id;
			document.getElementById('xpf_books_number').value = document.getElementById(xpf_books_number).value;
			
		//	alert(document.getElementById(xpf_device_number).value);
			
			opendiv('xpf_book_delete', 'xpf_total_bg');
		}
		
		
		function delete_book_sure()
		{
			document.getElementById('delete_book_form').submit();
		}
		
		
		
		
		
		function select(option)
		{
			if(option == "药品管理")
			{
				document.getElementById('xpf_total_body_med').style.display = "";
				document.getElementById('xpf_total_body_dev').style.display = "none";
				document.getElementById('xpf_total_body_book').style.display = "none";
			}
			else if(option == "器械管理")
			{
				document.getElementById('xpf_total_body_med').style.display = "none";
				document.getElementById('xpf_total_body_dev').style.display = "";
				document.getElementById('xpf_total_body_book').style.display = "none";
			}
			else if(option == "书本管理")
			{
				document.getElementById('xpf_total_body_med').style.display = "none";
				document.getElementById('xpf_total_body_dev').style.display = "none";
				document.getElementById('xpf_total_body_book').style.display = "";
			}
		}
		
		
		$(document).ready(	
 		function()
 		{
 			$("#example").dataTable();
 			$("#example2").dataTable();
 			$("#example3").dataTable();
 		});
		
    </script>
	
  </head>
  
  <body>
  		<div id="xpf_total_bg">
  		
  		</div>
    	<div id="xpf_total">
    	
    		<div id="xpf_total_head">
    			<select id="xpf_select" onchange="select(this.value)">
    				<option>药品管理</option>
    				<option>器械管理</option>
    				<option>书本管理</option>
    			</select>
    		</div>
    		
    		<br>
    		
    		<div id="xpf_total_body_med">
    			
    			<table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
    				<thead>
    					<tr>
    						<th>
    							药品名称
    						</th>
    						<th>
    							药品编号
    						</th>
    						<th>
    							药品种类
    						</th>
    						<th>
    							药品性质
    						</th>
    						<th>
    							药品生产时间
    						</th>
    						<th>
    							药品过期时间
    						</th>
    						<th>
    							药品购入时间
    						</th>
    						<th>
    							药品负责人
    						</th>
    						<th>
    							药品购入时数量
    						</th>
    						<th>
    							药品剩余总量
    						</th>
    						<th>
    							药品计量单位
    						</th>
    						<th>
    							药品存放位置
    						</th>
    						<th>
    							药品所属部门
    						</th>
    						<th>
    							备注
    						</th>
    						<th>
    							药品录入时间
    						</th>
    						<th>
    							操作
    						</th>
    					</tr>
    				</thead>
    				<tbody>
    					<% 
    					//	int id = 0;
    						while(rs.next())
    						{
    							String xpf_medicine_number = "xpf_medicine_number_" + rs.getString("id");
    							String xpf_med_name = "xpf_med_name_" + rs.getInt("id");
    							String xpf_med_number = "xpf_med_number_" + rs.getInt("id");
    							String xpf_med_kind = "xpf_med_kind_" + rs.getInt("id");
    							String xpf_med_property = "xpf_med_property_" + rs.getInt("id");
    							String xpf_med_begintime = "xpf_med_begintime_" + rs.getInt("id");
    							String xpf_med_endtime = "xpf_med_endtime_" + rs.getInt("id");
    							String xpf_med_buytime = "xpf_med_buytime_" + rs.getInt("id");
    							String xpf_med_dutypeople = "xpf_med_dutypeople_" + rs.getInt("id");
    							String xpf_med_buymount = "xpf_med_buymount_" + rs.getInt("id");
    							String xpf_med_nowmount = "xpf_med_nowmount_" + rs.getInt("id");
    							String xpf_med_mountdanwei = "xpf_med_mountdanwei_" + rs.getInt("id");
    							String xpf_med_location = "xpf_med_location_" + rs.getInt("id");
    							String xpf_med_belongto = "xpf_med_belongto_" + rs.getInt("id");
    							String xpf_med_other = "xpf_med_other_" + rs.getInt("id");
    							String xpf_med_time = "xpf_med_time_" + rs.getInt("id");
    					%>
    					<tr>
    						<td><span id="<%=xpf_med_name%>"><%=rs.getString("xpf_med_name") %></span></td>
    						<td><span id="<%=xpf_med_number%>"><%=rs.getString("xpf_med_number") %></span></td>
    						<td><span id="<%=xpf_med_kind%>"><%=rs.getString("xpf_med_kind") %></span></td>
    						<td><span id="<%=xpf_med_property%>"><%=rs.getString("xpf_med_property") %></span></td>
    						<td><span id="<%=xpf_med_begintime%>"><%=rs.getString("xpf_med_begintime") %></span></td>
    						<td><span id="<%=xpf_med_endtime%>"><%=rs.getString("xpf_med_endtime") %></span></td>
    						<td><span id="<%=xpf_med_buytime%>"><%=rs.getString("xpf_med_buytime") %></span></td>
    						<td><span id="<%=xpf_med_dutypeople%>"><%=rs.getString("xpf_med_dutypeople") %></span></td>
    						<td><span id="<%=xpf_med_buymount%>"><%=rs.getInt("xpf_med_buymount") %></span></td>
    						<td><span id="<%=xpf_med_nowmount%>"><%=rs.getInt("xpf_med_nowmount") %></span></td>
    						<td><span id="<%=xpf_med_mountdanwei%>"><%=rs.getString("xpf_med_mountdanwei") %></span></td>
    						<td><span id="<%=xpf_med_location%>"><%=rs.getString("xpf_med_location") %></span></td>
    						<td><span id="<%=xpf_med_belongto%>"><%=rs.getString("xpf_med_belongto") %></span></td>
    						<td><span id="<%=xpf_med_other%>"><%=rs.getString("xpf_med_other") %></span></td>
    						<td><span id="<%=xpf_med_time%>"><%=rs.getString("xpf_med_time") %></span></td>
    						<td><input type="hidden" id="<%=xpf_medicine_number %>" value="<%=rs.getString("xpf_medicine_number") %>" /><a id="<%=rs.getInt("id") %>" href="javascript:void(0)" onclick="showmed(this.id)" >查看</a> <a id="<%=rs.getInt("id") %>" href="javascript:void(0)" onclick="altermed(this.id)" >修改</a> <a id="<%=rs.getInt("id") %>" href="javascript:void(0)" onclick="deletemed(this.id)" >删除</a></td>
    					</tr>
    					<%
    						}
    					%>
    				
    				</tbody>
    			
    			</table>
    			<br>
    			<br>
    			<a href="javascript:void(0)" onclick="opendiv('xpf_med_add', 'xpf_total_bg')" >添加药品</a>
    			
    		</div>
    		
    		
    		
    		<div id="xpf_total_body_dev" style="display:none">
    			
    			<table cellpadding="0" cellspacing="0" border="0" class="display" id="example2">
    				<thead>
    					<tr>
    						<th>器械名称</th>
    						<th>器械编号</th>
    						<th>器械属性</th>
    						<th>器械生产时间</th>
    						<th>器械过期时间</th>
    						<th>器械购入时间</th>
    						<th>器械负责人</th>
    						<th>器械购入数量</th>
    						<th>器械现有总数量</th>
    						<th>器械借出数量</th>
    						<th>器械在库数量</th>
    						<th>器械计量单位</th>
    						<th>器械存放位置</th>
    						<th>器械所属部门</th>
    						<th>备注</th>
    						<th>器械录入时间</th>
    						<th>操作</th>
    					</tr>
    				</thead>
    				<tbody>
    					<% 
    						//int id2 = 0;
    						while(rs2.next())
    						{
    							String xpf_device_number = "xpf_device_number_" + rs2.getInt("id");
    							String xpf_dev_name = "xpf_dev_name_" + rs2.getInt("id");
    							String xpf_dev_number = "xpf_dev_number_" + rs2.getInt("id");
    							String xpf_dev_property = "xpf_dev_property_" + rs2.getInt("id");
    							String xpf_dev_begintime = "xpf_dev_begintime_" + rs2.getInt("id");
    							String xpf_dev_endtime = "xpf_dev_endtime_" + rs2.getInt("id");
    							String xpf_dev_buytime = "xpf_dev_buytime_" + rs2.getInt("id");
    							String xpf_dev_dutypeople = "xpf_dev_dutypeople_" + rs2.getInt("id");
    							String xpf_dev_buymount = "xpf_dev_buymount_" + rs2.getInt("id");
    							String xpf_dev_nowmount = "xpf_dev_nowmount_" + rs2.getInt("id");
    							String xpf_dev_lendmount = "xpf_dev_lendmount_" + rs2.getInt("id");
    							String xpf_dev_inmount = "xpf_dev_inmount_" + rs2.getInt("id");
    							String xpf_dev_mountdanwei = "xpf_dev_mountdanwei_" + rs2.getInt("id");
    							String xpf_dev_location = "xpf_dev_location_" + rs2.getInt("id");
    							String xpf_dev_belongto = "xpf_dev_belongto_" + rs2.getInt("id");
    							String xpf_dev_other = "xpf_dev_other_" + rs2.getInt("id");
    							String xpf_dev_time = "xpf_dev_time_" + rs2.getInt("id");
    						
    					%>
    					<tr>
    						<td><span id="<%=xpf_dev_name%>"><%=rs2.getString("xpf_dev_name") %></span></td>
    						<td><span id="<%=xpf_dev_number%>"><%=rs2.getString("xpf_dev_number") %></span></td>
    						<td><span id="<%=xpf_dev_property%>"><%=rs2.getString("xpf_dev_property") %></span></td>
    						<td><span id="<%=xpf_dev_begintime%>"><%=rs2.getString("xpf_dev_begintime") %></span></td>
    						<td><span id="<%=xpf_dev_endtime%>"><%=rs2.getString("xpf_dev_endtime") %></span></td>
    						<td><span id="<%=xpf_dev_buytime%>"><%=rs2.getString("xpf_dev_buytime") %></span></td>
    						<td><span id="<%=xpf_dev_dutypeople%>"><%=rs2.getString("xpf_dev_dutypeople") %></span></td>
    						<td><span id="<%=xpf_dev_buymount%>"><%=rs2.getInt("xpf_dev_buymount") %></span></td>
    						<td><span id="<%=xpf_dev_nowmount%>"><%=rs2.getInt("xpf_dev_nowmount") %></span></td>
    						<td><span id="<%=xpf_dev_lendmount%>"><%=rs2.getInt("xpf_dev_lendmount") %></span></td>
    						<td><span id="<%=xpf_dev_inmount%>"><%=rs2.getInt("xpf_dev_inmount") %></span></td>
    						<td><span id="<%=xpf_dev_mountdanwei%>"><%=rs2.getString("xpf_dev_mountdanwei") %></span></td>
    						<td><span id="<%=xpf_dev_location%>"><%=rs2.getString("xpf_dev_location") %></span></td>
    						<td><span id="<%=xpf_dev_belongto%>"><%=rs2.getString("xpf_dev_belongto") %></span></td>
    						<td><span id="<%=xpf_dev_other%>"><%=rs2.getString("xpf_dev_other") %></span></td>
    						<td><span id="<%=xpf_dev_time%>"><%=rs2.getString("xpf_dev_time") %></span></td>
    						<td><input id="<%=xpf_device_number %>" type="hidden" value="<%=rs2.getString("xpf_device_number") %>" ><a id="<%=rs2.getInt("id") %>" href="javascript:void(0)" onclick="showdev(this.id)">查看</a> <a id="<%=rs2.getInt("id") %>" href="javascript:void(0)" onclick="alterdev(this.id)">修改</a> <a id="<%=rs2.getInt("id") %>" href="javascript:void(0)" onclick="deletedev(this.id)">删除</a></td>
    					</tr>
    					<% 
    						}
    						ps2.close();
    						rs2.close();
    					%>
    				</tbody>
    			</table>
    			<br>
    			<br>
    			<a href="javascript:void(0)" onclick="opendiv('xpf_dev_add', 'xpf_total_bg')" >添加器械</a>
    			
    		</div>
    		
    		
    		
    		<div id="xpf_total_body_book" style="display:none">
    		
    			<table cellpadding="0" cellspacing="0" border="0" class="display" id="example3">
    				<thead>
    					<tr>
    						<th>书本名称</th>
    						<th>书本编号</th>
    						<th>书本种类</th>
    						<th>书本出版时间</th>
    						<th>书本购入时间</th>
    						<th>书本负责人</th>
    						<th>书本购入数量</th>
    						<th>书本现有总数量</th>
    						<th>书本借出数量</th>
    						<th>书本在库数量</th>
    						<th>书本存放位置</th>
    						<th>书本所属部门</th>
    						<th>备注</th>
    						<th>书本录入时间</th>
    						<th>操作</th>
    					</tr>
    				</thead>
    				<tbody>
    					<% 
    						while(rs3.next())
    						{
    							String xpf_books_number = "xpf_books_number_" + rs3.getInt("id");
    							String xpf_book_name = "xpf_book_name_" + rs3.getInt("id");
    							String xpf_book_number = "xpf_book_number_" + rs3.getInt("id");
    							String xpf_book_kind = "xpf_book_kind_" + rs3.getInt("id");
    							String xpf_book_begintime = "xpf_book_begintime_" + rs3.getInt("id");
    							String xpf_book_buytime = "xpf_book_buytime_" + rs3.getInt("id");
    							String xpf_book_dutypeople = "xpf_book_dutypeople_" + rs3.getInt("id");
    							String xpf_book_buymount = "xpf_book_buymount_" + rs3.getInt("id");
    							String xpf_book_nowmount = "xpf_book_nowmount_" + rs3.getInt("id");
    							String xpf_book_lendmount = "xpf_book_lendmount_" + rs3.getInt("id");
    							String xpf_book_inmount = "xpf_book_inmount_" + rs3.getInt("id");
    							String xpf_book_location = "xpf_book_location_" + rs3.getInt("id");
    							String xpf_book_belongto = "xpf_book_belongto_" + rs3.getInt("id");
    							String xpf_book_other = "xpf_book_other_" + rs3.getInt("id");
    							String xpf_book_time = "xpf_book_time_" + rs3.getInt("id");
    							
    					%>
    					<tr>
    						<td><span id="<%=xpf_book_name%>"><%=rs3.getString("xpf_book_name") %></span></td>
    						<td><span id="<%=xpf_book_number%>"><%=rs3.getString("xpf_book_number") %></span></td>
    						<td><span id="<%=xpf_book_kind%>"><%=rs3.getString("xpf_book_kind") %></span></td>
    						<td><span id="<%=xpf_book_begintime%>"><%=rs3.getString("xpf_book_begintime") %></span></td>
    						<td><span id="<%=xpf_book_buytime%>"><%=rs3.getString("xpf_book_buytime") %></span></td>
    						<td><span id="<%=xpf_book_dutypeople%>"><%=rs3.getString("xpf_book_dutypeople") %></span></td>
    						<td><span id="<%=xpf_book_buymount%>"><%=rs3.getInt("xpf_book_buymount") %></span></td>
    						<td><span id="<%=xpf_book_nowmount%>"><%=rs3.getInt("xpf_book_nowmount") %></span></td>
    						<td><span id="<%=xpf_book_lendmount%>"><%=rs3.getInt("xpf_book_lendmount") %></span></td>
    						<td><span id="<%=xpf_book_inmount%>"><%=rs3.getInt("xpf_book_inmount") %></span></td>
    						<td><span id="<%=xpf_book_location%>"><%=rs3.getString("xpf_book_location") %></span></td>
    						<td><span id="<%=xpf_book_belongto%>"><%=rs3.getString("xpf_book_belongto") %></span></td>
    						<td><span id="<%=xpf_book_other%>"><%=rs3.getString("xpf_book_other") %></span></td>
    						<td><span id="<%=xpf_book_time%>"><%=rs3.getString("xpf_book_time") %></span></td>
    						<td><input id="<%=xpf_books_number %>" type="hidden" value="<%=rs3.getString("xpf_books_number") %>" /><a id="<%=rs3.getInt("id") %>" href="javascript:void(0)" onclick="showbook(this.id)">查看</a> <a id="<%=rs3.getInt("id") %>" href="javascript:void(0)" onclick="alterbook(this.id)" >修改</a> <a id="<%=rs3.getInt("id") %>" href="javascript:void(0)" onclick="deletebook(this.id)" >删除</a></td>
    					</tr>
    					<% 
    						}
    						
    						ps3.close();
    						rs3.close();
    					%>
    				</tbody>
    			</table>
    			<br>
    			<br>
    			<a href="javascript:void(0)" onclick="opendiv('xpf_book_add', 'xpf_total_bg')"  >添加书本</a>
    		</div>
    		
    	</div>
<% 
	}catch(Exception e)
	{
		e.printStackTrace();
	}finally
	{
		condb.toClose(rs, ps, conn);
	}
%>    	
    	
    	<div id="xpf_med_add" style="display:none">
    		<div style="text-align:center;">添加药品</div>
    		<form method="post" action="AddMed">
    			<table>
    				<tr>
    					<td>药品名称:</td>
    					<td><input name="xpf_med_name" /></td>
    				</tr>
    				<tr>
    					<td>药品编号:</td>
    					<td><input name="xpf_med_number" /></td>
    				</tr>
    				<tr>
    					<td>药品种类:</td>
    					<td><input name="xpf_med_kind" /></td>
    				</tr>
    				<tr>
    					<td>药品性质:</td>
    					<td><input name="xpf_med_property" /></td>
    				</tr>
    				<tr>
    					<td>药品生产时间:</td>
    					<td><input name="xpf_med_begintime" /></td>
    				</tr>
    				<tr>
    					<td>药品过期时间:</td>
    					<td><input name="xpf_med_endtime" /></td>
    				</tr>
    				<tr>
    					<td>药品购入时间:</td>
    					<td><input name="xpf_med_buytime" /></td>
    				</tr>
    				<tr>
    					<td>药品负责人:</td>
    					<td><input name="xpf_med_dutypeople" /></td>
    				</tr>
    				<tr>
    					<td>药品购入数量:</td>
    					<td><input name="xpf_med_buymount" /></td>
    				</tr>
    				<tr>
    					<td>药品剩余数量:</td>
    					<td><input name="xpf_med_nowmount" /></td>
    				</tr>
    				<tr>
    					<td>药品计量单位:</td>
    					<td><input name="xpf_med_mountdanwei" /></td>
    				</tr>
    				<tr>
    					<td>药品存放位置:</td>
    					<td><input name="xpf_med_location" /></td>
    				</tr>
    				<tr>
    					<td>药品所属部门:</td>
    					<td><input name="xpf_med_belongto" /></td>
    				</tr>
    				<tr>
    					<td>备注:</td>
    					<td><textarea name="xpf_med_other" style="height:150px; width:200px;"></textarea></td>
    				</tr>
    				<tr>
    					<td></td>
    					<td><input type="submit" value="添加" /> <input type="button" value="关闭窗口" onclick="closediv('xpf_med_add', 'xpf_total_bg')"  /></td>
    				</tr>
    			</table>
    		</form>
    	</div>
    	
    	<div id="xpf_med_show" style="display:none">
    		<div id="xpf_med_show_up"></div>
    		<div id="xpf_med_show_down" style="text-align:center">
    				<a href="javascript:void(0)" onclick="closediv('xpf_med_show', 'xpf_total_bg')">关闭窗口</a>
    		</div>
    	</div>
    	
    	<div id="xpf_med_alter" style="display:none">
    		<div id="xpf_med_alter_up"></div>
    		<div id="xpf_med_alter_down" style="text-align:center" ><a href="javascript:void(0)" onclick="alter_med_up()">提交修改</a> <a href="javascript:void(0)" onclick="closediv('xpf_med_alter', 'xpf_total_bg')">关闭窗口</a></div>
    	</div>
    	
    	<div id="xpf_med_delete" style="display:none">
    		<div id="xpf_med_delete_up" style="display:none">
    			<form id="delete_med_form" name="delete_med_form" method="post" action="DeleteMed">
    				<input type="text" id="xpf_medicine_number" name="xpf_medicine_number" />
    			</form>
    		</div>
    		<div id="xpf_med_delete_down">
    			<input type="button" onclick="delete_med_sure()" value="确定删除" /> <input type="button" onclick="closediv('xpf_med_delete', 'xpf_total_bg')" value="关闭窗口" />
    		</div>
    	</div>
    	
    	
    	
    	
    	
    	<div id="xpf_dev_add" style="display:none">
    		<div style="text-align:center;">添加器械</div>
    		<form method="post" action="AddDev">
    			<table>
    				<tr>
    					<td>器械名称:</td>
    					<td><input name="xpf_dev_name" /></td>
    				</tr>
    				<tr>
    					<td>器械编号:</td>
    					<td><input name="xpf_dev_number" /></td>
    				</tr>
    				<tr>
    					<td>器械性质:</td>
    					<td><input name="xpf_dev_property" /></td>
    				</tr>
    				<tr>
    					<td>器械生产时间:</td>
    					<td><input name="xpf_dev_begintime" /></td>
    				</tr>
    				<tr>
    					<td>器械过期时间:</td>
    					<td><input name="xpf_dev_endtime" /></td>
    				</tr>
    				<tr>
    					<td>器械购入时间:</td>
    					<td><input name="xpf_dev_buytime" /></td>
    				</tr>
    				<tr>
    					<td>器械负责人:</td>
    					<td><input name="xpf_dev_dutypeople" /></td>
    				</tr>
    				<tr>
    					<td>器械购入数量:</td>
    					<td><input name="xpf_dev_buymount" /></td>
    				</tr>
    				<tr>
    					<td>器械现有数量:</td>
    					<td><input name="xpf_dev_nowmount" /></td>
    				</tr>
    				<tr>
    					<td>器械借出数量:</td>
    					<td><input name="xpf_dev_lendmount" /></td>
    				</tr>
    				<tr>
    					<td>器械在库数量:</td>
    					<td><input name="xpf_dev_inmount" /></td>
    				</tr>
    				<tr>
    					<td>器械计量单位:</td>
    					<td><input name="xpf_dev_mountdanwei" /></td>
    				</tr>
    				<tr>
    					<td>器械存放位置:</td>
    					<td><input name="xpf_dev_location" /></td>
    				</tr>
    				<tr>
    					<td>器械所属部门:</td>
    					<td><input name="xpf_dev_belongto" /></td>
    				</tr>
    				<tr>
    					<td>备注:</td>
    					<td><textarea name="xpf_dev_other"></textarea></td>
    				</tr>
    				<tr>
    					<td></td>
    					<td><input type="submit" value="添加" /> <input type="button" onclick="closediv('xpf_dev_add', 'xpf_total_bg')" value="关闭窗口" /></td>
    				</tr>
    			</table>
    		</form>
    	</div>
    	
    	<div id="xpf_dev_show" style="display:none">
    		<div id="xpf_dev_show_up"></div>
    		<div id="xpf_dev_show_down" style="text-align:center">
    				<a href="javascript:void(0)" onclick="closediv('xpf_dev_show', 'xpf_total_bg')">关闭窗口</a>
    		</div>
    	</div>
    	
    	<div id="xpf_dev_alter" style="display:none">
    		<div id="xpf_dev_alter_up"></div>
    		<div id="xpf_dev_alter_down" style="text-align:center" ><a href="javascript:void(0)" onclick="alter_dev_up()">提交修改</a> <a href="javascript:void(0)" onclick="closediv('xpf_dev_alter', 'xpf_total_bg')">关闭窗口</a></div>
    	</div>
    	
    	<div id="xpf_dev_delete" style="display:none">
    		<div id="xpf_dev_delete_up" style="display:none">
    			<form id="delete_dev_form" name="delete_dev_form" method="post" action="DeleteDev">
    				<input type="text" id="xpf_device_number" name="xpf_device_number" />
    			</form>
    		</div>
    		<div id="xpf_dev_delete_down">
    			<input type="button" onclick="delete_dev_sure()" value="确定删除" /> <input type="button" onclick="closediv('xpf_dev_delete', 'xpf_total_bg')" value="关闭窗口" />
    		</div>
    	</div>
    	
    	
    	
    	
    	
    	
    	<div id="xpf_book_add" style="display:none">
    		<div style="text-align:center;">添加书籍</div>
    		<form method="post" action="AddBook">
    			<table>
    				<tr>
    					<td>书本名称:</td>
    					<td><input name="xpf_book_name" /></td>
    				</tr>
    				<tr>
    					<td>书本编号:</td>
    					<td><input name="xpf_book_number" /></td>
    				</tr>
    				<tr>
    					<td>书本种类:</td>
    					<td><input name="xpf_book_kind" /></td>
    				</tr>
    				<tr>
    					<td>书本出版时间:</td>
    					<td><input name="xpf_book_begintime" /></td>
    				</tr>
    				<tr>
    					<td>书本购入时间:</td>
    					<td><input name="xpf_book_buytime" /></td>
    				</tr>
    				<tr>
    					<td>书本负责人:</td>
    					<td><input name="xpf_book_dutypeople" /></td>
    				</tr>
    				<tr>
    					<td>书本购入数量:</td>
    					<td><input name="xpf_book_buymount" /></td>
    				</tr>
    				<tr>
    					<td>书本现有总数量:</td>
    					<td><input name="xpf_book_nowmount" /></td>
    				</tr>
    				<tr>
    					<td>书本借出数量:</td>
    					<td><input name="xpf_book_lendmount" /></td>
    				</tr>
    				<tr>
    					<td>书本在库数量:</td>
    					<td><input name="xpf_book_inmount" /></td>
    				</tr>
    				<tr>
    					<td>书本存放位置:</td>
    					<td><input name="xpf_book_location" /></td>
    				</tr>
    				<tr>
    					<td>书本所属部门:</td>
    					<td><input name="xpf_book_belongto" /></td>
    				</tr>
    				<tr>
    					<td>备注:</td>
    					<td><textarea name="xpf_book_other"></textarea></td>
    				</tr>
    				<tr>
    					<td></td>
    					<td><input type="submit" value="添加" /> <input type="button" value="关闭窗口" onclick="closediv('xpf_book_add', 'xpf_total_bg')" /></td>
    				</tr>
    			</table>
    		</form>
    	</div>
    	
    	<div id="xpf_book_show" style="display:none">
    		<div id="xpf_book_show_up"></div>
    		<div id="xpf_book_show_down" style="text-align:center">
    				<a href="javascript:void(0)" onclick="closediv('xpf_book_show', 'xpf_total_bg')">关闭窗口</a>
    		</div>
    	</div>
    	
    	<div id="xpf_book_alter" style="display:none">
    		<div id="xpf_book_alter_up"></div>
    		<div id="xpf_book_alter_down" style="text-align:center" ><a href="javascript:void(0)" onclick="alter_book_up()">提交修改</a> <a href="javascript:void(0)" onclick="closediv('xpf_book_alter', 'xpf_total_bg')">关闭窗口</a></div>
    	</div>
    	
    	
    	<div id="xpf_book_delete" style="display:none">
    		<div id="xpf_book_delete_up" style="display:none">
    			<form id="delete_book_form" name="delete_book_form" method="post" action="DeleteBook">
    				<input type="text" id="xpf_books_number" name="xpf_books_number" />
    			</form>
    		</div>
    		<div id="xpf_book_delete_down">
    			<input type="button" onclick="delete_book_sure()" value="确定删除" /> <input type="button" onclick="closediv('xpf_book_delete', 'xpf_total_bg')" value="关闭窗口" />
    		</div>
    	</div>
    	
    	
    	
  </body>
</html>
