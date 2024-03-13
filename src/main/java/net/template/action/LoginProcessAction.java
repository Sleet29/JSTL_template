package net.template.action;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import net.common.action.Action;
import net.common.action.ActionForward;
import net.template.db.DAO;

public class LoginProcessAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String password = request.getParameter("passwd");
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		DAO dao = new DAO();
		int result = dao.isId(id,password);
		
		String message = "정보가 일치하지 않습니다.";
		if(result==1) { // 아이디와 비밀번호가 일치하는 경우
			session.setAttribute("id", id);
			message = id + "님 환영합니다.";
			
			String IDStore = request.getParameter("remember");
			Cookie cookie = new Cookie("id", request.getParameter("id"));
			// ID 기억하기를 체크한 경우
			if (IDStore != null && IDStore.equals("store")) {
				cookie.setMaxAge(60 * 60 * 24); // 쿠키의 유효시간을 24시간으로 설정한다.
				// 클라이언트로 쿠키값을 전송
				response.addCookie(cookie);
				
			} else {
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			
			forward.setPath("templatetest.net");
			
		} else {
			forward.setPath("login.net");
		}
		
		session.setAttribute("message", message);
		forward.setRedirect(true);
		return forward;
	}
}
