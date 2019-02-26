package tripAdviser.board.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tripAdviser.board.model.vo.Board;
import tripAdviser.board.notice.model.service.NoticeService;

/**
 * Servlet implementation class NoticeInsertServlet
 */
@WebServlet("/notice/insertNotice")
public class NoticeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
		String userId=request.getParameter("userId");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		Board b= new Board();
		b.setMemberId(userId);
		b.setTitle(title);
		b.setContent(content);
		
		int result = new NoticeService().insertNotice(b);
		
		String msg="";
		String loc="";
		String view="/views/common/msg.jsp";
		
		if(result>0) {
			msg="공지사항이 등록되었습니다.";
			loc="/notice/noticeView?boardNo="+result;
		}else {
			msg="등록 실패";
			loc="/notice/noticeWrite";
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
