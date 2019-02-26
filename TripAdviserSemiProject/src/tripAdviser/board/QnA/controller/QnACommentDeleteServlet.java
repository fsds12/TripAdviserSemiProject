package tripAdviser.board.QnA.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tripAdviser.board.QnA.model.service.qaService;

/**
 * Servlet implementation class QnACommentDeleteServlet
 */
@WebServlet("/QnA/commentDelete")
public class QnACommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnACommentDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int commentNo=Integer.parseInt(request.getParameter("commentNo"));
		
		int result=new qaService().deleteComment(commentNo);
		
		String msg="";
		String view="/views/common/msg.jsp";
		String loc="/QnA/QnAList";
		
		if(result>0) {
			msg="삭제 완료";
			
		}else {
			msg="삭제 실패";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher(view).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
