package tripAdviser.board.QnA.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tripAdviser.board.QnA.model.service.qaService;
import tripAdviser.board.model.vo.BoardAnswer;

/**
 * Servlet implementation class QnADeleteServlet
 */
@WebServlet("/QnA/deleteQnA")
public class QnADeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnADeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo=Integer.parseInt(request.getParameter("boardNo"));	
		
		int result=new qaService().deleteQa(boardNo);
		
		String msg="";
		String view="/views/common/msg.jsp";
		String loc="";
		
		if(result>0) {
			msg="삭제되었습니다.";			
			loc="/QnA/QnAList";
		}else {
			
			msg="댓글이 있는 경우 삭제가 불가능합니다.";
			loc="/QnA/QnABoardView?boardNo="+boardNo;
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
