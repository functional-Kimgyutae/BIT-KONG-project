<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>첫페이지 로그인페이지</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/font.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/style.css">
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
                        <form class="login" action="<%=request.getContextPath() %>/user/login_rs" method="post" name="fom" onsubmit="return loginbts();">
                            <div class="logo">
                                <a href="<%=request.getContextPath()%>/user/login"><img src="<%=request.getContextPath() %>/resoures/image/logos.png" alt=""></a>
                            </div>
                            <div class="input-group">
                            	<div class="email-form">
    	                            <input type="text" class="input-email" name="m_id" required>
	                            	<label class="login-email"><span>이메일 주소</span></label>
                            	</div>
                                <div class="pwd-form">
	                                <input type="password" class="input-password" name="m_password" required>
	                                <label class="login-password"><span>비밀번호</span></label>
                                </div>
                            </div>
                            <div class="form-btn">
                                <button type="submit" id="login-btn">로그인</button>
                                <div class="line"></div>
                            </div>
                            <div class="find-btn">
                                <ul>
                                    <li><a href="<%=request.getContextPath()%>/user/findlogin">아이디 찾기</a></li>
                                    <li><a href="<%=request.getContextPath()%>/user/findpwd">비밀번호 찾기</a></li>
                                    <li><a href="<%=request.getContextPath() %>/user/register">회원가입</a></li>
                                </ul>
                            </div>
                        </form>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    function loginbts() {
		if(!document.fom.m_id.value.trim()){
			alert("이메일을 입력하세요.");
			document.fom.m_id.focus();
			return false;
		}
		if(!document.fom.m_password.value.trim()){
			alert("비밀번호를 입력하세요.");
			document.fom.m_password.focus();
			return false;
		}	
		return true;
	}
    </script>
</body>
</html>