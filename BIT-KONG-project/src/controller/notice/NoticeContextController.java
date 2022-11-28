package controller.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.MyView;
import dao.NoticeDAO;
import vo.BoardlistVO;
import vo.NoticeVO;

public class NoticeContextController implements Controller {

	@Override
	public MyView process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		NoticeDAO dao = new NoticeDAO();
		int n_id = Integer.parseInt(request.getParameter("n_id"));
		dao.plusview(n_id);
		if(n_id == 0) {
			session.setAttribute("alert", "오류발생");
			return new MyView("/notice");
		}
		NoticeVO list_data =  dao.getnoticecontext(n_id);
		session.setAttribute("list_data",list_data);
		
		return new MyView("/view/notice/notice_context.jsp");
	}
}
