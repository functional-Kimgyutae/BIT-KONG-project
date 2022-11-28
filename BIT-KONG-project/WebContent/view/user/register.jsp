<%@page import="dao.MemberDAO"%>
<%@page import="util.MailUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/register.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resoures/css/font.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/bootstrap-icons-1.8.3/fonts/bootstrap-icons.woff">
</head>
<body>
<%
	String m_id = request.getParameter("m_id");
	MemberDAO dao = new MemberDAO();
%>
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
                        <form class="login" action="<%=request.getContextPath() %>/user/register_rs" name="frm" onsubmit="return check();" method="post">
                            <div class="logo">
                                <a href="<%=request.getContextPath()%>/user/login"><img src="<%=request.getContextPath() %>/resoures/image/logos.png" alt=""></a>
                            </div>
                            <div class="email-input">
                                <input type="text" class="input-email" name="m_id" id="m_id" required>
                                <label class="register-email"><span>이메일 주소</span></label>
                                <div class="checkps"><font id="checkemail" size="2"></font></div>
    	                        <button type="button" id="over"class="overlap" disabled="disabled" name="confirm_id" onclick="buttons()">중복확인</button>
        	                    <input type="hidden" name="chk" value="0">
                            </div>
                            <div class="email-button">
	                            <input type="text" name="emailconfirm" id="emailconfirm" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="6" required>
	                            <label class="register-emailconfirm"><span>인증번호를 입력하세요.</span></label>
		 						<button type="button" class="overlap" id="emailok" name="emailconfirm_btn" onclick="emailCheck()" disabled="disabled">인증번호 요청</button>
		  	   				</div>
                            <div class="pwd-input">
                                <input type="password" name="m_password" class="pw" id="password_1" required>
                                <label class="register-password"><span>비밀번호</span></label>
                                <div class="checkpwd"><font id="checkPws" size="2"></font></div>
								<div class="valid-feedback"></div>
                            </div>
                            <div class="pwds-input">
                                <input type="password" name="m_password2" class="pw" id="password_2" required>
                                <label class="register-passwords"><span>비밀번호 확인</span></label>
                                <div class="checkps"><font id="checkPw" size="2"></font></div>
                            </div>
                            <div class="name-input">
                                <input type="text" name="m_name" required=>
                                <label class="register-name"><span>이름</span></label>
                            </div>
                            <div class="call-input">
                                <input type="text" maxlength="11" name="m_phone_number" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required>
                                <label class="register-phonenum"><span>전화번호</span></label>
                            </div>
                            <div class="form-btn">
                                <button type="submit" id="registerbtn">회원가입</button>
                            </div>
                        </form>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/resoures/javascript/emailcode.js"></script>
    	<script type="text/javascript">
    	let id_check = false;
    	let email_check = false;
		var email_auth_cd = '';
	function check() {
		if(!document.frm.m_id.value.trim()){
			alert("이메일이 입력되지 않았습니다!");
			$("#checkemail").html('이메일을 입력해주세요.');
			$("#checkemail").attr('color', '#dc3545');
			document.frm.m_id.focus();	
			return false;
		}
		if(!document.frm.m_password.value.trim()){
			alert("비밀번호가 입력되지 않았습니다!");
			document.frm.m_password.focus();
			return false;
		}
		if(!document.frm.m_password2.value.trim()){
			alert("비밀번호 확인이 입력되지 않았습니다!");
			document.frm.m_password2.focus();
			return false;
		}
		if(!document.frm.m_name.value.trim()){
			alert("이름이 입력되지 않았습니다!");
			document.frm.m_name.focus();
			return false;
		}
		if(!document.frm.m_phone_number.value.trim()){
			alert("전화번호가 입력되지 않았습니다!");
			document.frm.m_phone_number.focus();
			return false;
		}
		if(!document.frm.emailconfirm.value.trim()){
			alert("인증번호를 입력해주세요.");
			document.frm.emailconfirm.focus();
			return false;
		}
		if(document.frm.m_password.value != document.frm.m_password2.value){
			alert("비밀번호가 일치하지 않습니다!");
			document.frm.m_password2.focus();
			return false;
		}
		if(id_check == false){
			alert("중복체크를 해주세요.");
			return false;
		}
		if(document.frm.emailconfirm.value != email_auth_cd){
			alert("인증번호가 일치하지 않습니다!");
			document.frm.emailconfirm.focus();
			return false;
		}
		return true;
	}
	$(".input-email").keyup(function() {
		email = $('#m_id').val();
		var regEmail = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		
		if($(".input-email").val() == ""){
			$("#checkemail").css({"display":"none"});
			document.frm.over.disabled=true;
			document.frm.emailok.disabled=true;
			id_check = false;
			return;
		}
		if(regEmail.test(email)){
			$("#checkemail").html("");
			$(".overlap").addClass("on");
			if($(".overlap").addClass("on")){
				document.frm.over.disabled=false;	
			}
		}else{
			$("#checkemail").css({"display":"block"});
			$("#checkemail").html('잘못된 형식의 이메일 주소입니다.');
			$("#checkemail").attr('color', '#dc3545');
			$(".overlap").removeClass("on");
			if($(".overlap").removeClass("on")){
				document.frm.over.disabled=true;
				document.frm.emailok.disabled=true;
				id_check = false;
			}
		}
	})
	$(".pw").keyup(function(){
		let pass1 = document.getElementById("password_1").value;
		let pass2 = document.getElementById("password_2").value;
		
		if($(".pw").val() == ""){
			$("#checkPw").css({"display":"none"});
			return;
		}
		
		if(pass1 != "" || pass2 != ""){
				if(pass1 == pass2){
				$("#checkPw").css({"display":"block"});
				$("#checkPw").html('비밀번호가 일치합니다.');
				$("#checkPw").attr('color','#2fb380');
			} else {
				$("#checkPw").css({"display":"block"});
				$("#checkPw").html('비밀번호가 일치하지 않습니다');
				$("#checkPw").attr('color','#dc3545');
			}
		}
	})
	function buttons() {
		if(document.frm.m_id.value == ""){
			alert("ID를 입력하세요");
			document.frm.m_id.focus();
			return;
		}
		$.ajax(
	    		{
	    			type:"GET",
	    			url:"http://34.64.56.248:3000/user/exist/"+document.frm.m_id.value,
	    			dataType:"json",
	    			success :  res => {
						id_check = true;
						document.frm.emailok.disabled=false;
	    			},error: log =>{alert("아이디가 이미 사용중입니다.")}
	    		}		
	    	)
			if(frm.m_id.value.indexOf("@")==-1){
				alert("@가 비어져있습니다.");
				frm.m_id.focus();
				return false;
			}
	} 
	let num = 0;
	function emailCheck() {
		let email = document.frm.m_id.value;
		num = setPass();
		let subject = "비트콩식 인증코드";
		let content = "";
		sendEmail(email,num,subject,content);
		document.frm.emailconfirm.type="text";
		document.frm.emailok.type="button";
	}
	function comfirmEmail() {
		let nums = document.frm.emailconfirm.value;
		console.log(nums);
		console.log(num);
		if(num == nums && nums != 0){
			alert("이메일 인증통과");
			email_check = true;
		}else{
			alert("값이 비어 있거나 똑같지 않음.")
		}
	}
	
	function setPass() {
		let str = ''
			  for (let i = 0; i < 6; i++) {
			    str += Math.floor(Math.random() * 10)
			  }
			  return str
	}
	function sendEmail(email,subject,content) {
		console.log(email)
		$.ajax({
			type : "POST",
			url : "http://34.64.56.248:3000/mail",
			data : {"email":email,"num": num},
			dataType:"json",
			success :  res => {
				console.log(res);
				email_auth_cd = num;
				},
			error: log =>{console.log("실패"+log)}
		})
	}
	</script>