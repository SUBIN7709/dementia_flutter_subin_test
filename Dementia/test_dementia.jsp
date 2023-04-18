<%@page import="org.rosuda.REngine.Rserve.RConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");


	double tAge  = Double.parseDouble(request.getParameter("Age"));
	double tMMSE  = Double.parseDouble(request.getParameter("MMSE"));
	double tEDUC  = Double.parseDouble(request.getParameter("EDUC"));
	double tSES  = Double.parseDouble(request.getParameter("SES"));
	double tSexCode  = Double.parseDouble(request.getParameter("SexCode"));
	
	RConnection conn = new RConnection();
	
	conn.voidEval("library(randomForest)");
	conn.voidEval("rf <- readRDS(url('http://localhost:8080/Rserve/randomForest_dementia_final_82.rds','rb'))");

	conn.voidEval("result <- as.character(predict(rf, (list(Age=" + tAge + ", EDUC=" + tEDUC + ","
	+ "SES=" + tSES + ", MMSE=" + tMMSE + ", SexCode=" + tSexCode + "))))");

	String result = conn.eval("result").asString();
%>
{"result":"<%=result %>"}	
