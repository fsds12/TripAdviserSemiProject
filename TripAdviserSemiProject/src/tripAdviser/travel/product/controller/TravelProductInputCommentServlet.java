package tripAdviser.travel.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tripAdviser.member.model.vo.Comment;
import tripAdviser.travel.product.model.service.TravelProductCommentService;

/**
 * Servlet implementation class TravelProductInputCommentServlet
 */
@WebServlet("/travel/inputComment")
public class TravelProductInputCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TravelProductInputCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int commentRefTrvNo = Integer.parseInt(request.getParameter("commentRefTrvNo"));
		int evaluation = Integer.parseInt(request.getParameter("evaluation"));
		String comment = request.getParameter("comment");
		String commentWriter = request.getParameter("commentWriter");
		
		Comment c = new Comment();
		
		c.setTrvNo(commentRefTrvNo);
		c.setTrvEvaluation(evaluation);
		c.setCommentContent(comment);
		c.setMemberId(commentWriter);
		
		System.out.println(evaluation + " : " + comment + " : " + commentWriter + " : " + commentRefTrvNo);
		
		int result = new TravelProductCommentService().insertComment(c);
		
		String view = "/views/common/msg.jsp";
		String loc = "/travel/travelProductDetail?trvNo=" + commentRefTrvNo + "#travel-comment-container";
		String msg = "";
		
		if(result > 0) {
			msg = "코멘트 등록성공!";
		}
		else {
			msg = "코멘트등록실패!";
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
