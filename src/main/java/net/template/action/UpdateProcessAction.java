package net.template.action;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.common.action.Action;
import net.common.action.ActionForward;
import net.template.db.DAO;
import net.template.db.Template_join;

public class UpdateProcessAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String jumin = request.getParameter("jumin1") + request.getParameter("jumin2");
		String email = request.getParameter("email") + "@" + request.getParameter("domain");
		String gender = request.getParameter("gender");
		String[] hobbyArray = request.getParameterValues("hobby");
		String hobby = String.join(",", hobbyArray); // 취미 배열을 문자열로 변환
		String post1 = request.getParameter("post1");
		String address = request.getParameter("address");
		String intro = request.getParameter("intro");

		Template_join join = new Template_join();
		join.setId(id);
		join.setPassword(pass);
		join.setJumin(jumin);
		join.setEmail(email);
		join.setGender(gender);
		join.setHobby(hobby);
		join.setPost(post1);
		join.setAddress(address);
		join.setIntro(intro);

		DAO dao = new DAO();
		int result = dao.update(join);
		String message = "회원정보 수정 실패입니다.";
		if (result == 1) {
			message = "회원정보 수정 성공입니다."; 
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		request.getSession().setAttribute("message", message);
		forward.setPath("templatetest.net");
		return forward;
	}
}
