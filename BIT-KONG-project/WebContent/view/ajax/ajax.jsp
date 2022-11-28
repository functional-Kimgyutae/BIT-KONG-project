<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		Enumeration<String> list = request.getAttributeNames();
		JSONObject ob = new JSONObject();
		
		while(list.hasMoreElements()){
			String name = list.nextElement();
			String value = String.valueOf(request.getAttribute(name));
			ob.put(name,value);
			
		}	
		out.print(ob);
%>