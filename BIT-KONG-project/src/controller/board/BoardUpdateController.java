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
import vo.RegisterVO;

public class BoardUpdateController implements Controller {

	@Override
	public MyView process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		BoardDAO dao = new BoardDAO();
		
		int b_id = Integer.parseInt(request.getParameter("b_id"));
		if(b_id == 0) {
			session.setAttribute("alert", "성공적으로 글을 수정하였습니다.");
			return new MyView("/board");
		}
		
		BoardlistVO vo = dao.getBoardContext(b_id);
		RegisterVO userVO = (RegisterVO)session.getAttribute("userVO");
		if(!userVO.getM_id().equals(vo.getM_id())) {
			session.setAttribute("alert", "잘못된 접근입니다.");
			return new MyView("/board");
		}
		
		String[] coin_list = {"콩트","비트콩트","이더리움","어쩌구"};
		
		session.setAttribute("vo", vo);
		session.setAttribute("coin_list", coin_list);
		return new MyView("/view/board/update.jsp");
	}

}
