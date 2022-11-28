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

public class NoticeWriteRsController implements Controller {

	@Override
	public MyView process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		NoticeDAO dao = new NoticeDAO();
		String n_title = request.getParameter("n_title");
		RegisterVO userVO = (RegisterVO)session.getAttribute("userVO");
		String m_id = userVO.getM_id();
		String n_context = request.getParameter("n_context");
		int n = dao.insertnotice(n_title, n_context,m_id);
		String path = "";
		if( n > 0){
			session.setAttribute("alert", "성공적으로 글을 작성하였습니다.");
			path = "/notice";
		}else{
			session.setAttribute("alert", "오류발생! 다시 시도 해주세요.");
			path = "/notice/write";
		}
		return new MyView(path);
	}

}
