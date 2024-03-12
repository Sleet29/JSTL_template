package net.template.action;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.common.action.Action;
import net.common.action.ActionForward;

public class LogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().invalidate();
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("templatetest.net");
		request.getSession().setAttribute("message", "로그 아웃 되었습니다.");
		return forward;
	}
	

}
