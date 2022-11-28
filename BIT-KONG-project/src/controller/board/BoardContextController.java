package controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.MyView;
import dao.BoardDAO;
import vo.BoardlistVO;

public class BoardContextController implements Controller {

	@Override
	public MyView process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		BoardDAO dao = new BoardDAO();
		int b_id = Integer.parseInt(request.getParameter("b_id"));
		dao.plusview(b_id);
		if(b_id == 0) {
			session.setAttribute("alert", "오류발생");
			return new MyView("/board");
		}
		
		BoardlistVO list_data =  dao.getBoardContext(b_id);
		session.setAttribute("list_data",list_data);
		
		return new MyView("/view/board/context.jsp");
	}

}
