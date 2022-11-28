package controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.MyView;
import dao.MemberDAO;
import vo.RegisterVO;

public class UserFindLoginRsController implements Controller {

	@Override
	public MyView process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDAO dao = new MemberDAO();
		String path = "";
		String m_name = request.getParameter("m_name");
		String m_phone = request.getParameter("m_phone_number");
		String m_id = dao.findId(m_name, m_phone);
		
		if(m_id.equals("")) {
			session.setAttribute("alert", "존재하지 않는 아이디 이거나 전화번호가 틀립니다.");
			path = "/user/findlogin";
		}else {
//			session.setAttribute("alert", "아이디 찾기 성공! :"+m_id);
			session.setAttribute("m_id", m_id);
			path = "/view/user/findloginok.jsp";
		}
		return new MyView(path);
	}

}
