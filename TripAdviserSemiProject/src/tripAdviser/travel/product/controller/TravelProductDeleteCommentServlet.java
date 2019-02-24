package tripAdviser.travel.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tripAdviser.travel.product.model.service.TravelProductCommentService;

/**
 * Servlet implementation class TravelProductDeleteCommentServlet
 */
@WebServlet("/travel/commentDelete")
public class TravelProductDeleteCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TravelProductDeleteCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		int trvNo = Integer.parseInt(request.getParameter("trvNo"));
		int cPage = Integer.parseInt(request.getParameter("cPage"));
		
		int result = new TravelProductCommentService().deleteComment(commentNo);
		
		String view = "/views/common/msg.jsp";
		String loc = "/travel/travelProductDetail?trvNo=" + trvNo + "&cPage=" + cPage + "#travel-comment-container";
		String msg = "";
		
		if(result > 0) {
			msg = "코멘트삭제성공!";
		}
		else {
			msg = "코멘트삭제실패!";
		}
		request.setAttribute("loc", loc);
		request.setAttribute("msg", msg);
		
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
