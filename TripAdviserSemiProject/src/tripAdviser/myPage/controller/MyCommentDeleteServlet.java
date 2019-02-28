package tripAdviser.myPage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tripAdviser.myPage.model.service.MyPageService;

/**
 * Servlet implementation class MyCommentDeleteServlet
 */
@WebServlet("/myPage/myCommentDelete")
public class MyCommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyCommentDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		int cPage = Integer.parseInt(request.getParameter("cPage"));
		String id = request.getParameter("id");
		int result = new MyPageService().deleteMyComment(commentNo);
		
		String msg = "";
		
		if(result > 0) {
			msg = "메시지 삭제 성공!";
		}
		else {
			msg = "메시지 삭제 실패!";
		}
		
		request.setAttribute("cPage", cPage);
		request.setAttribute("id", id);
		request.setAttribute("msg", msg);
		request.getRequestDispatcher("/myPage/myComment").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
