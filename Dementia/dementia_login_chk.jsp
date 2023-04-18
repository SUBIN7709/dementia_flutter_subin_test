<%@page import="java.sql.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	String login_userId = request.getParameter("user_id");
	String login_userPw = request.getParameter("user_pw");

		
//------
	String url_mysql = "jdbc:mysql://localhost/dementia?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
 	String id_mysql = "root";
 	String pw_mysql = "qwer1234";

    String WhereDefault = "select user_id, user_pw, user_name, user_ses, user_educ, user_sex, user_brith from users where user_id = '" + login_userId + "' and user_pw = '" +login_userPw + "'; ";
  
    
    JSONObject jsonList = new JSONObject();
    JSONArray itemList = new JSONArray();
    

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        Statement stmt_mysql = conn_mysql.createStatement();

        ResultSet rs = stmt_mysql.executeQuery(WhereDefault); 

        if (rs.next()){
            JSONObject tempJson = new JSONObject();
            tempJson.put("user_id", rs.getString(1));
            tempJson.put("user_pw", rs.getString(2));
            tempJson.put("user_name", rs.getString(3));
            tempJson.put("user_ses", rs.getString(4));
            tempJson.put("user_educ", rs.getString(5));
            tempJson.put("user_sex", rs.getString(6));
            tempJson.put("user_brith", rs.getString(7));
           

            itemList.add(tempJson);
        }

        jsonList.put("results",itemList);
        conn_mysql.close();
        out.print(jsonList);

    } catch (Exception e) {
        e.printStackTrace();
    }
%>
