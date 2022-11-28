package controller.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.MyView;
import dao.BoardDAO;
import vo.BoardlistVO;
import vo.PaginationVO;

public class BoardController implements Controller {

	@Override
	public MyView process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		BoardDAO dao = new BoardDAO();
		
		int c_tag = 0;
    	if(request.getParameter("c_tag") != null){
    		c_tag = Integer.parseInt(request.getParameter("c_tag"));
    	}
    	
		int idx = 1;
    	if(request.getParameter("idx") != null){
    		idx = Integer.parseInt(request.getParameter("idx"));
    	}
    	
    	int cnt = dao.getCnt(c_tag);
    	
    	PaginationVO pVO = new PaginationVO(idx, cnt);
    	
    	
    	ArrayList<BoardlistVO> list = dao.getBoardlist(c_tag,pVO.getStartBoard(),pVO.getEndBoard());
    	String[] coin_list = {"콩트","비트콩트","이더리움","어쩌구"};
    	
    	session.setAttribute("c_tag", c_tag);
    	session.setAttribute("list", list);
    	session.setAttribute("coin_list", coin_list);
    	session.setAttribute("pVO", pVO);
		return new MyView("/view/board/board.jsp");
	}

}
