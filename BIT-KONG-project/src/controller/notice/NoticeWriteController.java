package controller.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.MyView;
import dao.NoticeDAO;
import vo.NoticeVO;
import vo.RegisterVO;

public class NoticeWriteController implements Controller {

	@Override
	public MyView process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		NoticeDAO dao = new NoticeDAO();
		RegisterVO userVO = (RegisterVO)session.getAttribute("userVO");
		String m_id = userVO.getM_id();
		if(!userVO.getM_id().equals("admin")) {
			session.setAttribute("alert", "잘못된 접근입니다.");
			return new MyView("/notice");
		}
		return new MyView("/view/notice/notice_write.jsp");
	}

}
