package controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.MyView;
import dao.MemberDAO;
import vo.RegisterVO;

public class UserRegisterRsController implements Controller {

	@Override
	public MyView process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		
		String path = "";
		MemberDAO dao = new MemberDAO();
		String m_id = request.getParameter("m_id");
		String m_name = request.getParameter("m_name");
		String m_phone = request.getParameter("m_phone_number");
		String m_password = request.getParameter("m_password");
		RegisterVO vo = new RegisterVO(m_id,m_name,m_phone,m_password);
		int n = dao.insertregist(vo);
		
		if(n > 0) {
			session.setAttribute("alert", "회원가입이 완료 되었습니다.");
			path = "/user/login";
		}else {
			session.setAttribute("alert", "오류 발생! 다시 시도 해주세요.");
			path = "/user/register";
		}
		return new MyView(path);
	}

}
