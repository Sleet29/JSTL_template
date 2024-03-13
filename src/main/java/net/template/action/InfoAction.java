package net.template.action;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import net.common.action.Action;
import net.common.action.ActionForward;
import net.template.db.DAO;
import net.template.db.Template_join;
public class InfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		ActionForward forward = new ActionForward();
		
		if (id != null && id.equals("admin")) {
			
			DAO dao = new DAO();
			Template_join temp = dao.selectInfo(request.getParameter("id"));
			
			forward.setRedirect(false);
			forward.setPath("/template/info.jsp");
			request.setAttribute("temp",temp);
		} else {
			forward.setRedirect(true);
			forward.setPath("login.net");
		}
		return forward;
	}

}
