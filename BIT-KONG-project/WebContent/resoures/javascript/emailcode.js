function emailcheck(m_id){//indexOf는 찾는 문자열이 없으면 -1을 반환함.
	if(!frm.m_id.value){ 
		alert("아이디를 입력해주세요.");
		frm.m_id.focus();
		return;
	}else{
		if(frm.m_id.value.indexOf("@")==-1){
			alert("@가 비어져있습니다.");
			frm.m_id.focus();
			return false;
		}
	}
	var url="/view/user/emailCheck.jsp?m_id="+m_id;
	open(url,"emailwindow", "statusbar=no, scrollbar=no, menubar=no, width=300, height=200");
}
    // 인증을 위해 새창으로 이동
function confirmemail(emailconfirm_value, authNum){
    // 입력한 값이 없거나, 인증코드가 일지하지 않을 경우
	if(!emailconfirm_value || emailconfirm_value != authNum){
		alert("값이 비었거나 인증코드가 일치 하지 않습니다.");
		emailconfirm_value="";
		self.close();
    // 인증코드가 일치하는 경우
	}else if(emailconfirm_value==authNum){
		alert("인증성공!");
		emailconfirm_value="";
		self.close();
		opener.document.frm.emailconfirm_value.value=1;
	}
}