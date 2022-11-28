<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 찾기</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/font.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/findlogin.css">
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
                        <form class="login" action="<%=request.getContextPath() %>/user/findlogin_rs" method="post" name="fom" onsubmit="return loginbts();">
                        <input type="hidden" name="m_id">
                            <div class="logo">
                                <a href="<%=request.getContextPath()%>/user/login"><img src="<%=request.getContextPath() %>/resoures/image/logos.png" alt=""></a>
                            </div>
                           	<div class="input-title">
                            	<h2>아이디 찾기</h2>
                            	<span>가입했을때 당시 이름과 전화번호로 찾을수 있습니다.</span>
                           	</div>
                            <div class="input-group">
                            	<div class="find-name">
	                                <input type="text" class="input-name" name="m_name" required>
	                                <label class="find-names"><span>이름</span></label>
                            	</div>
                            	<div class="find-phone">
	                                <input type="text" class="input-phone" name="m_phone_number" maxlength="11" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required>
	                                <label class="find-phonenum"><span>전화번호</span></label>
                            	</div>
                            </div>
                            <div class="form-btn">
                                <button type="submit" id="login-btn">아이디 찾기</button>
                                <div class="line"></div>
                            </div>
                            <div class="find-btn">
                                <ul>
                                    <li><a href="<%=request.getContextPath()%>/user/login">돌아가기</a></li>
                                    <li><a href="<%=request.getContextPath()%>/user/findpwd">비밀번호 찾기</a></li>
                                </ul>
                            </div>
                        </form>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    function loginbts() {
		if(!document.fom.m_name.value.trim()){
			alert("이름을 입력하세요.");
			document.fom.m_name.focus();
			return false;
		}
		if(!document.fom.m_phone_number.value.trim()){
			alert("전화번호를 입력하세요.");
			document.fom.m_phone_number.focus();
			return false;
		}	
		return true;
	}
    </script>
</body>
</html>