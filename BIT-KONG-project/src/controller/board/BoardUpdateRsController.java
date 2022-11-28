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

public class BoardUpdateRsController implements Controller {

	@Override
	public MyView process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		BoardDAO dao = new BoardDAO();
		int b_id = Integer.parseInt(request.getParameter("b_id"));
		int c_tag = Integer.parseInt(request.getParameter("c_tag"));
		String b_title = request.getParameter("b_title");
		String b_name = request.getParameter("b_name");
		String b_context = request.getParameter("b_context");
		RegisterVO userVO = (RegisterVO)session.getAttribute("userVO");
		
		BoardlistVO vo = new BoardlistVO(b_id,c_tag,b_title,b_name,"",userVO.getM_id(),b_context,0);
		int n = dao.updateboard(vo);
		
		String path = "";
		if(n == 1){
			session.setAttribute("alert","성공적으로 글을 수정하였습니다.");
			path="/board";
		}else {
			session.setAttribute("alert","오류발생! 다시시도해주세요.");
			path = "/board";
		}

		return new MyView(path);
	}
}
