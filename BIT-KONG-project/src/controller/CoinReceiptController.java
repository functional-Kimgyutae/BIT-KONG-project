package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDAO;
import dao.ReceiptDAO;
import vo.PaginationVO;
import vo.RegisterVO;

public class CoinReceiptController implements Controller{

	@Override
	public MyView process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		ReceiptDAO dao = new ReceiptDAO();
		

		RegisterVO userVO = (RegisterVO)session.getAttribute("userVO");
		
		int idex = 1;
    	if(request.getParameter("idex") != null){
    		idex = Integer.parseInt(request.getParameter("idex"));
    	}
    	int cnt = dao.getCnt(userVO.getM_id());
    	
    	PaginationVO pVO = new PaginationVO(idex,cnt);
    	
    	session.setAttribute("pVO", pVO);
		return new MyView("/view/coin_receipt.jsp");
	}

}
