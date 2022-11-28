package controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.MyView;
import dao.BoardDAO;
import vo.RegisterVO;

public class BoardWritePsController implements Controller {

	@Override
	public MyView process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		BoardDAO dao = new BoardDAO();
		HttpSession session = request.getSession();
		String b_title = request.getParameter("b_title");
		String b_name = request.getParameter("b_name");
		RegisterVO userVO = (RegisterVO)session.getAttribute("userVO");
		String m_id = userVO.getM_id();
		int c_tag = Integer.parseInt(request.getParameter("c_tag"));
		String b_context = request.getParameter("b_context");
		
		int n = dao.write(b_title, b_name, m_id,c_tag,b_context);
		String path = "";
		if( n > 0){
			session.setAttribute("alert", "성공적으로 글을 작성하였습니다.");
			path = "/board";
		}else{
			session.setAttribute("alert", "오류발생! 다시 시도 해주세요.");
			path = "/board/write";
		}
		return new MyView(path);
	}

}
