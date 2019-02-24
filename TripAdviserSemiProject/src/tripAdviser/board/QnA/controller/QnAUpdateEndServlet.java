package tripAdviser.board.QnA.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tripAdviser.board.QnA.model.service.qaService;
import tripAdviser.board.model.vo.Board;

/**
 * Servlet implementation class QnAUpdateEndServlet
 */
@WebServlet("/QnA/updateEnd")
public class QnAUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnAUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo=Integer.parseInt(request.getParameter("boardNo"));
		String userId=request.getParameter("userId");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		Board b=new Board();
		b.setBoardNo(boardNo);
		b.setMemberId(userId);
		b.setTitle(title);
		b.setContent(content);
		
		int result=new qaService().updateQa(b);
		
		String msg="";
		String loc="";
		String view="/views/common/msg.jsp";
		
		if(result>0) {
			msg="게시물이 수정되었습니다.";
			loc="/QnA/QnABoardView?boardNo="+boardNo;
		}else {
			msg="수정 실패";
			loc="/QnA/updateQnA";
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
