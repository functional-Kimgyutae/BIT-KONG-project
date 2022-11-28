package controller.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.MyView;
import dao.MemberDAO;
import util.MailUtil;
import vo.RegisterVO;

public class PurchaseController implements Controller {

	@Override
	public MyView process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		RegisterVO userVO = (RegisterVO)session.getAttribute("userVO");
		String price = request.getParameter("price");
		String unit = request.getParameter("unit");
		String pay = request.getParameter("pay");
		MailUtil Mu = new MailUtil();
		
		String subject="비트콩식 결제확인 메일"; // 보내는 제목 설정
		String content="충전된 금액 : "+price+unit+"<br> 결제 금액"+pay; // 이메일 내용 설정
		
		Mu.connectEmail(userVO.getM_id(),subject,content);
		
		
		// userVO 결제 되면 금액 추가 하는거 넣기 
		MemberDAO mDAO = new MemberDAO();
		int p = Integer.parseInt(pay);
		System.out.println(p);
//		int money = (p * 100000) + userVO.getM_krw();
//		System.out.println(money);
//		mDAO.changeMoney(money, userVO.getM_id());
		
		//금액 변경 후 다시 가져오기
		session.setAttribute("userVO", mDAO.getUserData(userVO.getM_id(), userVO.getM_password()));
		boolean result = true;
		
		request.setAttribute("same", result);
		
		return new MyView("/view/ajax/ajax.jsp");
	}

}
