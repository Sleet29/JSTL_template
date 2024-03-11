package net.template.action;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class TemplateFrontController extends jakarta.servlet.http.HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Request = request.getRemoteHost();
		
	}
	// doProcess(request,response)메서드를 구현하여 요청이 GET방식이든
	// POST방식으로 전송되어 오든 같은 메서드에서 요청을 처리할 수 있도록 하였습니다.
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}
}
