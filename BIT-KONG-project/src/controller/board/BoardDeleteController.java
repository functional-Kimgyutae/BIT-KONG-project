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

public class BoardDeleteController implements Controller {

	@Override
	public MyView process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		BoardDAO dao = new BoardDAO();
		
		int b_id = Integer.parseInt(request.getParameter("b_id"));
//		���� Ȯ�� �ʼ� 
		RegisterVO userVO = (RegisterVO)session.getAttribute("userVO");
		String m_id = userVO.getM_id();
		int n = dao.deleteboard(b_id,m_id);
		BoardlistVO vo = dao.getBoardContext(b_id);
		if(!userVO.getM_id().equals(vo.getM_id())) {
			session.setAttribute("alert", "잘못된 접근입니다.");
			return new MyView("/board");
		}
		String path = "";
		if(n == 1){ // �����Ϸ�
			session.setAttribute("alert", "성공적으로 삭제가 완료되었습니다.");
		}else{
			session.setAttribute("alert", "오류발생! 다시 시도해주세요.");
		}
		return new MyView("/board");
	}

}
