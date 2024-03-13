package net.template.action;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.common.action.Action;
import net.common.action.ActionForward;
import net.template.db.DAO;

public class DeleteAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        DAO dao = new DAO();

        boolean deleted = dao.deleteUser(id);

        if (deleted) {
            request.setAttribute("message", "사용자 삭제 성공");
        } else {
            request.setAttribute("message", "사용자 삭제 실패");
        }

        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("/template/deleteResult.jsp");
        return forward;
    }

}
