package controller.ajax;

import java.io.IOException;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.MyView;
import dao.BoardDAO;
import dao.MemberDAO;
import vo.BoardlistVO;

public class CheckIdController implements Controller{
	@Override
	public MyView process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		MemberDAO dao = new MemberDAO();
		
		String id = request.getParameter("id");
		
		
		boolean result = dao.confirmId(id);
		
		request.setAttribute("same", result);
		
		return new MyView("/view/ajax/ajax.jsp");
	}
}	
