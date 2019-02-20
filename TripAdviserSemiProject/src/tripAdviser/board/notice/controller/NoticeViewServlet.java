package tripAdviser.board.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tripAdviser.board.model.vo.Board;
import tripAdviser.board.notice.model.service.NoticeService;

/**
 * Servlet implementation class NoticeViewServlet
 */
@WebServlet("/notice/noticeView")
public class NoticeViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardNo=Integer.parseInt(request.getParameter("boardNo"));
		
		Cookie[] cookies=request.getCookies();
		String boardCookie="";
		boolean hasRead=false;
		
		if(cookies!=null) {
			output :
			for(Cookie c : cookies) {
				String name=c.getName();
				String value=c.getValue();
				if("boardCookie".equals(name)) {
					boardCookie=value;
					if(value.contains("|" + boardNo + "|")) {
						hasRead=true;
						break output;
					}
				}
			}
		}
		
		if(!hasRead) {
			Cookie c=new Cookie("boardCookie", boardCookie+"|"+boardNo+"|");
			c.setMaxAge(-1);
			response.addCookie(c);
		}
		
		Board b=new NoticeService().selectNoticeOne(boardNo, hasRead);
		
		request.setAttribute("Board", b);
		request.getRequestDispatcher("/views/notice/noticeBoardView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
