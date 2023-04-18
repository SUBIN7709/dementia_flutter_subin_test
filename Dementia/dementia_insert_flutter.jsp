<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>        
<%
	request.setCharacterEncoding("utf-8");
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	String user_name = request.getParameter("user_name");
	String user_brith = request.getParameter("user_brith");
	String user_sex = request.getParameter("user_sex");		
	String user_educ = request.getParameter("user_educ");	
	String user_ses = request.getParameter("user_ses");	
	
		
//------
	String url_mysql = "jdbc:mysql://localhost/dementia?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
	String id_mysql = "root";
	String pw_mysql = "qwer1234";

	PreparedStatement ps = null;
	try{
	    Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection conn_mysql = DriverManager.getConnection(url_mysql,id_mysql,pw_mysql);
	    Statement stmt_mysql = conn_mysql.createStatement();
	
	    String A = "insert into users (user_id, user_pw, user_name, user_brith, user_sex, user_educ, user_ses";
	    String B = ") values ('" +user_id + "','" + user_pw + "','" +user_name+ "','" +user_brith +  "','" ;
		String C = user_sex +"','"+user_educ+"','"+user_ses+ "')";
	
	    ps = conn_mysql.prepareStatement(A+B+C);
	  
	    
	    ps.executeUpdate();
	
	    conn_mysql.close();
	} 
	
	catch (Exception e){
	    e.printStackTrace();
	}
%>

