<%@page import="vo.RegisterVO"%>
<%@page import="dao.BoardDAO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDAO dao = new MemberDAO();
	BoardDAO daos = new BoardDAO();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해더푸터</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/font.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/header.css">
</head>
<body>
<%
RegisterVO userVO = (RegisterVO)session.getAttribute("userVO");
	if(session.getAttribute("userVO") == null){
%>
<script type="text/javascript">
alert("로그인을 하세요.");
location.href = "/user/login";
</script>
<%
}else {
%>
	<script>   
    <%
      if(session.getAttribute("alert") != null) {
           String data = (String)session.getAttribute("alert");
        %>
           alert('<%= data %>');
      <%
         session.removeAttribute("alert");
      }
   	%>
    </script>
    <header>
        <div class="logo">
            <a href="<%=request.getContextPath()%>/index"><img src="<%=request.getContextPath() %>/resoures/image/white_logo.png" alt="로고"></a>
        </div>
        <div class="name-tag">
            <h5><%= userVO.getM_name() %></h5>
        </div>
        <nav>
            <ul>
                <li><a href="/index">거래소</a></li>
                <li><a href="/coin/coin_wallet">보유코인</a></li>
                <li><a href="/board">코인별 게시판</a></li>
                <li><a href="/coin/coin_receipt">거래내역</a></li>
                <li><a href="<%=request.getContextPath()%>/view/pay/pay.jsp">충전</a></li>
                <li><a href="/notice">고객센터</a></li>
            </ul>
        </nav>
        <div id='pop'><div class="loader">Loading...</div></div>
		
        <footer>
            <a href="/user/logout">로그아웃</a>
            <h4>COPYRIGHT&copy;콩콩식식 <br>ALL RIGHTS RESERVED</h4>
        </footer>
    </header>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<% } %>