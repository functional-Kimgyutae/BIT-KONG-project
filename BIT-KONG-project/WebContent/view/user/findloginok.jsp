<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/font.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/findloginok.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/bootstrap-icons-1.8.3/fonts/bootstrap-icons.woff">
</head>
<body>
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
   	<%
   	String m_id = (String)session.getAttribute("m_id");
   	System.out.println(m_id);
   	%>
    </script>
    <div class="main">
        <div class="main-menu">
            <div class="main-left">
                <div class="text-bar">
                    <h1>가상 신뢰받는 양디고 비공식 <br>
                        디지털 자산 거래소</h1>
                    <span>안전하고 신속하고 편리한 거래환경을 제공합니다.</span>
                </div>
            </div>
            <div class="main-right">
                <div class="login-menu">
                        <form class="login" action="<%=request.getContextPath() %>/view/user/findpwdok.jsp" method="post" name="fom">
                            <div class="logo">
                                <a href="<%=request.getContextPath()%>/user/login"><img src="<%=request.getContextPath() %>/resoures/image/logos.png" alt=""></a>
                            </div>
                            <div class="id-input">
                               	<div class="id-title">
                               	<i class="bi bi-check-circle-fill"></i>
                               	<br>
                               	<h2>사용하고 계시는 아이디 정보 입니다.</h2>
                               	<hr>
                               	<br>
                               	<span><%=m_id%></span>
                               	</div>
                            </div>
                            <div class="find-btn">
                                <ul>
                                    <li><a class="back"href="<%=request.getContextPath()%>/user/findpwd">돌아가기</a></li>
                                </ul>
                            </div>
                        </form>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>