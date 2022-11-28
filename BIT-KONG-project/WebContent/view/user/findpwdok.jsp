<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String m_id = request.getParameter("m_id");
	System.out.println("이메일" + m_id);
	String m_password = request.getParameter("m_password");
	MemberDAO dao = new MemberDAO();
	int n = dao.findpwd(m_id, m_password);
%>
<%if(n != 0) {%>
<script>
	alert("새 비밀번호 변경이 완료되었습니다.");
	location.href="/user/login";
</script>
<%}else{ %>
<script>
	alert("오류 발생");
	history.back();
</script>
<%} %>
</body>
</html>