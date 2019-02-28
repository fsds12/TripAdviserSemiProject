package tripAdviser.board.QnA.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tripAdviser.board.QnA.model.service.qaService;
import tripAdviser.board.model.vo.Board;
import tripAdviser.board.model.vo.BoardAnswer;

/**
 * Servlet implementation class QnAViewServlet
 */
@WebServlet("/QnA/QnABoardView")
public class QnAViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnAViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardNo=Integer.parseInt(request.getParameter("boardNo"));
		String memberId=request.getParameter("userId");
		
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
						if(value.contains("|"+boardNo+"|")) {
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
		
		Board b=new qaService().selectQaOne(boardNo, hasRead);
		
		if(b!=null) {
			int cPage;   //코멘트 현재페이지
		      try {
		         cPage = Integer.parseInt(request.getParameter("cPage"));
		      }
		      catch(NumberFormatException e) {
		         cPage = 1;
		      }
		      int numPerPage = 2;   //코멘트 한페이지당 보여줄 코멘트갯수
		      
		      int totalComment=new qaService().selectCommentCount(boardNo);
		      List<BoardAnswer> comment= new qaService().selectComment(boardNo, cPage, numPerPage);   //여행정보 전체 코멘트수
		      int totalCommentPage = (int)Math.ceil((double)totalComment/numPerPage);         //여행정보 전체 페이지수
		      
		      //페이지바 만들기
		      String pageBar = "<ul class='pagination pagination-sm justify-content-center'>";
		      int pageBarSize = 5;
		      int pageNo = (((cPage-1) / pageBarSize) * pageBarSize) + 1;   //페이지바의 시작페이지숫자 설정
		      int pageStart = pageNo;
		      int pageEnd = pageNo + pageBarSize - 1;
		      
		      //이전 만들기
		      if(pageNo == 1) {
		         pageBar = pageBar + "<li class='page-item disabled'><a class='page-link' href='#'>&laquo;</a></li>";
		      }
		      else {
		         pageBar = pageBar + "<li class='page-item'><a class='page-link' href='" + request.getContextPath() + "/QnA/QnABoardView?boardNo=" + boardNo + "&cPage=" + (pageNo - pageBarSize) + "#comment-tbl" + "'>&laquo;</a></li>";
		      }
		      
		      //페이지바 숫자채우기
		      while(pageNo <= totalCommentPage && pageNo <= pageEnd) {
		         if(cPage == pageNo) {
		            pageBar = pageBar + "<li class='page-item active'><a class='page-link' href='" + request.getContextPath() + "/QnA/QnABoardView?boardNo=" + boardNo + "&cPage=" + pageNo + "#comment-tbl" + "'>" + pageNo + "</a></li>";
		         }
		         else {
		            pageBar = pageBar + "<li class='page-item'><a class='page-link' href='" + request.getContextPath() +"/QnA/QnABoardView?boardNo=" + boardNo + "&cPage=" + pageNo + "#comment-tbl" + "'>" + pageNo + "</a></li>";
		         }
		         pageNo++;
		      }
		      
		      //다음 만들기		      
		      if(pageEnd >= totalCommentPage) {
		         pageBar = pageBar + "<li class='page-item disabled'><a class='page-link' href='#'>&raquo;</a></li></ul>";
		      }
		      else {
		         pageBar = pageBar + "<li class='page-item'><a class='page-link' href='" + request.getContextPath() +"/QnA/QnABoardView?boardNo=" + boardNo  + "&cPage=" + (pageStart + pageBarSize) + "#travel-comment-container"  + "'>&raquo;</a></li></ul>";
		      }
			
			request.setAttribute("cPage", cPage);
			request.setAttribute("pageBar", pageBar);
			request.setAttribute("numPerPage", numPerPage);
			request.setAttribute("comment", comment);
			/*request.getRequestDispatcher("/views/QnA/commentList.jsp").forward(request, response);*/
		}	
		
		request.setAttribute("Board", b);		
		request.getRequestDispatcher("/views/QnA/QnABoardView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
