package controller.notice;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.MyView;
import dao.NoticeDAO;
import vo.NoticeVO;

public class NoticeController implements Controller{

	@Override
	public MyView process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		NoticeDAO dao = new NoticeDAO();
		
		int n_tag = 0;
		if(request.getParameter("n_tag") != null){
    		n_tag = Integer.parseInt(request.getParameter("n_tag"));
    	}
		ArrayList<NoticeVO> list = dao.getnoticedata(n_tag);
		
		session.setAttribute("n_tag", n_tag);
		session.setAttribute("list", list);
		
		return new MyView("/view/notice/notice.jsp");
	}
	
}
