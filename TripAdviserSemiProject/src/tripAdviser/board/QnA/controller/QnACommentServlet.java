package tripAdviser.board.QnA.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tripAdviser.board.QnA.model.service.qaService;
import tripAdviser.board.model.vo.BoardAnswer;

/**
 * Servlet implementation class QnACommentServlet
 */
@WebServlet("/QnA/insertComment")
public class QnACommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnACommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String writer=request.getParameter("commentWriter");
		String content=request.getParameter("commentContent");
		int boardRef=Integer.parseInt(request.getParameter("boardRef"));
		int level=Integer.parseInt(request.getParameter("level"));
		int commentRef=Integer.parseInt(request.getParameter("commentRef"));
		
		BoardAnswer ba=new BoardAnswer();
		
		ba.setMemberId(writer);
		ba.setBoardContent(content);
		ba.setBoardNoRef(boardRef);
		ba.setCommentLevel(level);
		ba.setCommentNoRef(commentRef);
		
		int result=new qaService().insertComment(ba);
		
		String msg="";
		String loc="";
		String view="";
		
		if(result>0) {
			msg="등록되었습니다.";
			loc="/";
		}else {
			msg="등록 실패";
			loc="/";
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
