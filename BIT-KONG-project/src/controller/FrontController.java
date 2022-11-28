package controller;

import java.io.Console;
import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.ajax.CheckIdController;
import controller.ajax.PurchaseController;
import controller.ajax.SendMailController;
import controller.ajax.SendMailsController;
import controller.board.BoardContextController;
import controller.board.BoardController;
import controller.board.BoardDeleteController;
import controller.board.BoardUpdateController;
import controller.board.BoardUpdateRsController;
import controller.board.BoardWriteController;
import controller.board.BoardWritePsController;
import controller.notice.NoticeContextController;
import controller.notice.NoticeController;
import controller.notice.NoticeWriteController;
import controller.notice.NoticeWriteRsController;
import controller.notice.OpenapicenterController;
import controller.user.UserFindLoginController;
import controller.user.UserFindLoginRsController;
import controller.user.UserFindPwdController;
import controller.user.UserLoginController;
import controller.user.UserLoginRsController;
import controller.user.UserLogoutController;
import controller.user.UserRegisterController;
import controller.user.UserRegisterRsController;

/**
 * Servlet implementation class FrontController
 */
@WebServlet(urlPatterns={"/index","/coin/*","/user/*","/board","/board/*","/notice","/notice/*","/openapi_guide","/ajax/*"})

public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Controller> controllerMap = new HashMap<>(); 
       
    public FrontController() {
    	super();
    }

	public void init(ServletConfig config) throws ServletException {
		// index
		controllerMap.put("/index", new MainController());
		// coin
		controllerMap.put("/coin/coin_wallet", new CoinWalletController());
		controllerMap.put("/coin/coin_receipt", new CoinReceiptController());
		// user
		controllerMap.put("/user/login", new UserLoginController());
		controllerMap.put("/user/login_rs", new UserLoginRsController());
		controllerMap.put("/user/register", new UserRegisterController());
		controllerMap.put("/user/register_rs", new UserRegisterRsController());
		controllerMap.put("/user/logout", new UserLogoutController());
		controllerMap.put("/user/findlogin", new UserFindLoginController());
		controllerMap.put("/user/findlogin_rs", new UserFindLoginRsController());
		controllerMap.put("/user/findpwd", new UserFindPwdController());
		
		//board
		controllerMap.put("/board", new BoardController());
		controllerMap.put("/board/context", new BoardContextController());
		controllerMap.put("/board/write", new BoardWriteController());
		controllerMap.put("/board/write_rs", new BoardWritePsController());
		controllerMap.put("/board/update", new BoardUpdateController());
		controllerMap.put("/board/update_rs", new BoardUpdateRsController());
		controllerMap.put("/board/delete", new BoardDeleteController());
		
		//notice
		controllerMap.put("/notice", new NoticeController());
		controllerMap.put("/notice/write", new NoticeWriteController());
		controllerMap.put("/notice/write_rs", new NoticeWriteRsController());
		controllerMap.put("/notice/context", new NoticeContextController());
		
		//notice-openapi
		controllerMap.put("/openapi_guide", new OpenapicenterController());
		//ajax
		controllerMap.put("/ajax/checkId", new CheckIdController());
		controllerMap.put("/ajax/sendMail",new SendMailController());
		controllerMap.put("/ajax/sendMails",new SendMailsController());
		controllerMap.put("/ajax/purchase",new PurchaseController());
		
	}


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String path = uri.substring(contextPath.length());
		Controller controller = controllerMap.get(path);
		if(controller == null) {
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		MyView view = controller.process(request, response);
		view.render(request, response);
	}

}