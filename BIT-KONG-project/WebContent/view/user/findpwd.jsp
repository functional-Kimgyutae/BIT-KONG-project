<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/font.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/findpwd.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/bootstrap-icons-1.8.3/fonts/bootstrap-icons.woff">
</head>
<body>
<%
	String m_id = request.getParameter("m_id");
	MemberDAO dao = new MemberDAO();
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
                        <form class="login" action="<%=request.getContextPath() %>/view/user/findpwd_new.jsp" method="post" name="fom" onsubmit="return loginbts();">
                            <div class="logo">
                                <a href="<%=request.getContextPath()%>/user/login"><img src="<%=request.getContextPath() %>/resoures/image/logos.png" alt=""></a>
                            </div>
                            <div class="input-group">
                            	<div class="input-title">
	                            	<h2>비밀번호 찾기</h2>
    	                        	<span>기존에 가입하신 이메일을 입력하시면,<br> 비밀번호 변경 메일을 발송해드립니다.</span>
                            	</div>
                            	<div class="find-emails">
	                                <input type="text" class="input-email" name="m_id" id="m_id" required>
	                                <label class="find-email"><span>이메일 주소</span></label>
                            	</div>
                            </div>
                            <div class="form-btn">
                                <button id="login-btn" onclick="emailCheck()">비밀번호 변경 이메일 보내기</button>
                                <div class="line"></div>
                            </div>
                            <div class="find-btn">
                                <ul>
                                    <li><a href="<%=request.getContextPath()%>/user/login">돌아가기</a></li>
                                    <li><a href="<%=request.getContextPath()%>/user/findlogin">아이디 찾기</a></li>
                                </ul>
                            </div>
                        </form>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
    let email_check = false;
    function loginbts() {
		if(!document.fom.m_id.value.trim()){
			alert("찾고자 하는 이메일을 입력하세요.");
			document.fom.m_id.focus();
			return false;
		}
		console.log(email_check);
		if(email_check == false){
			alert("이메일로 가서 확인을 눌러주세요.");
			return false;
		}
		return true;
	}
    function emailCheck() {
		if(document.fom.m_id.value == ""){
			alert("ID를 입력하세요");
			document.fom.m_id.focus();
			return;
		}
		let email = document.fom.m_id.value;
		num = setPass();
		subject = "비트콩식 인증코드";
		content = "";
		sendEmail(email,subject,num,content);
		document.fom.emailconfirm.type="text";
		document.fom.emailsok.type="button";
	}
	function setPass() {
		let str = ''
			  for (let i = 0; i < 6; i++) {
			    str += Math.floor(Math.random() * 10)
			  }
			  return str
	}
	function sendEmail(email,subject,content) {
		$.ajax({
			type : "POST",
			url : "http://34.64.56.248:3000/mail/s",
			data : {"email":email,"subject":subject},
			dataType:"json",
			success :  res => {console.log("성공"+res)},
			error: log =>{console.log("실패"+log)}	
		})
	}
	function comfirmEmail() {
		let nums = document.fom.emailconfirm.value;
		console.log(nums);
		console.log(num);
		if(num == nums && nums != 0){
			alert("이메일 인증통과");
			email_check = true;
		}else{
			alert("값이 비어 있거나 똑같지 않음.")
		}
	}
    </script>
</body>
</html>