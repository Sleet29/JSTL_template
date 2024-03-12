package net.template.action;

import java.io.IOException;
import net.template.db.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.common.action.Action;
import net.common.action.ActionForward;

public class IdcheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		
		DAO dao = new DAO();
		
		// result가 0인 경우는 아이디가 존재하지 않는 경우
		// result가 -1인 경우는 아이디가 존재하는 경우
		
		int result = dao.isId(id);
		request.setAttribute("result", result);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/template/idcheck.jsp");
		return forward;
	}

}
