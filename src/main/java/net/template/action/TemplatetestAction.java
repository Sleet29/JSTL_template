package net.template.action;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.common.action.Action;
import net.common.action.ActionForward;

public class TemplatetestAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String go = request.getParameter("page");
		if(go==null) {
			go= "newitem";
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		request.setAttribute("pagefile", go);
		forward.setPath("/template/templatetest.jsp");
		return forward;
	}
}