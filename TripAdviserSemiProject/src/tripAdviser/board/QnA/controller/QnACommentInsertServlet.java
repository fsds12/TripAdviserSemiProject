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
 * Servlet implementation class QnACommentInsertServlet
 */
@WebServlet("/QnA/insertComment")
public class QnACommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnACommentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardRef=Integer.parseInt(request.getParameter("boardRef"));
		String memberId=request.getParameter("memberId");
		String commentContent=request.getParameter("commentContent");
		int commentLevel=Integer.parseInt(request.getParameter("commentLevel"));
		int commentRef=Integer.parseInt(request.getParameter("commentRef"));
		
		BoardAnswer comment=new BoardAnswer();
		comment.setBoardNoRef(boardRef);
		comment.setMemberId(memberId);
		comment.setContent(commentContent);
		comment.setCommentLevel(commentLevel);
		comment.setCommentNoRef(commentRef);
		
		int result=new qaService().insertComment(comment);
		String msg="";
		String view="/views/common/msg.jsp";
		String loc="/QnA/QnABoardView?boardNo="+boardRef;
		
		if(result>0)
		{
			msg="등록성공";
		}
		else	
		{
			msg="등록실패";
		}
		request.setAttribute("msg",msg);
		request.setAttribute("loc",loc);
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
