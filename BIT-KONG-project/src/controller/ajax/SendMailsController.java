package controller.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.MyView;
import util.MailUtil;

public class SendMailsController implements Controller {

	@Override
	public MyView process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		MailUtil Mu = new MailUtil();
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String host = "http://localhost:8090/view/user/";
		content = "<body>\r\n" + 
				"    <div class=\"main\" style=\"            width: 600px;\r\n" + 
				"    height: 650px;\r\n" + 
				"    margin: 0 auto;\r\n" + 
				"    border: 1px solid #bebebe;\r\n" + 
				"    padding: 20px;\">\r\n" + 
				"        <div class=\"images\" style=\"width: 100%;\r\n" + 
				"        height: 150px;\r\n" + 
				"        padding-left: 120px;\r\n" + 
				"        padding-top: 30px;\">\r\n" + 
				"            <img src='https://ifh.cc/g/YRfOrr.png' alt=\"\" style=\"     width: 350px;\r\n" + 
				"            height: 140px;\r\n" + 
				"            object-fit: cover;\">\r\n" + 
				"        </div>\r\n" + 
				"        <div class=\"title\" style=\"height: 100px;\r\n" + 
				"        display: flex;\r\n" + 
				"        justify-content: left;\r\n" + 
				"        align-items: center;\r\n" + 
				"        font-family: fantasy;\">\r\n" + 
				"            <h3 style=\"font-size: 30px;\">비트콩식 비밀번호 재설정</h3>\r\n" + 
				"        </div>\r\n" + 
				"        <div class=\"subcontent\" style=\"margin-bottom: 10px;\r\n" + 
				"        font-weight: 400;\r\n" + 
				"        color: #7f7f7f;\">\r\n" + 
				"            <p style=\"font-size: 13px;\">\r\n" + 
				"                가상의 코인을 이용한 비트코인 연습 사이트 비트콩식에 가입하신것을 환엽합니다. <br>\r\n" + 
				"                아래의 확인를 눌러주시면 새 비밀번호 연습창으로 이동합니다.\r\n" + 
				"            </p>\r\n" + 
				"        </div>\r\n" + 
				"        <div class=\"emailcode\" style=\"height: 60px;\r\n" + 
				"        background-color: #f8f8f8;\r\n" + 
				"        line-height: 60px;\">\r\n" + 
				"            <h2 style=\"font-size: 35px;\"><a style=\"color: black;text-decoration: none;\"href="+host+"findpwd_new.jsp?email="+email+">확인</a></h2>\r\n" + 
				"        </div>\r\n" + 
				"        <div class=\"content\" style=\"height: 120px;\">\r\n" + 
				"            <span style=\"            padding: 0 14px;\r\n" + 
				"            color: #98999c;\r\n" + 
				"            font-size: 14px;\r\n" + 
				"            font-weight: 400;\r\n" + 
				"            line-height: 3em;\">최고의 서비스를 제공하는 것이 저희의 가치입니다.</span><br>\r\n" + 
				"            <span style=\"padding: 0 14px;\r\n" + 
				"            color: #98999c;\r\n" + 
				"            font-size: 14px;\r\n" + 
				"            font-weight: 400;\r\n" + 
				"            line-height: 3em;\">BIT-KONG Team</span>\r\n" + 
				"        </div>\r\n" + 
				"        <div class=\"footer\" style=\"color: #98999c;\r\n" + 
				"        font-size: 13px;\r\n" + 
				"        font-weight: 400;\r\n" + 
				"        line-height: 2em;  \">\r\n" + 
				"            <hr>\r\n" + 
				"            <span>비트콩|개발자 : 박홍식,김규태|사업자등록번호 : 010-xxxx-xxxx | 이메일 : bitkongproject@naver.com</span><br>\r\n" + 
				"            <span>주소 : 경기도 성남시 분당구 서현동 316 양영디지털고등학교</span>\r\n" + 
				"        </div>\r\n" + 
				"    </div>\r\n" + 
				"</body>";
		Mu.connectEmail(email,subject,content);
		boolean result = true;
		
		request.setAttribute("same", result);
		
		return new MyView("/view/ajax/ajax.jsp");
	}

}
