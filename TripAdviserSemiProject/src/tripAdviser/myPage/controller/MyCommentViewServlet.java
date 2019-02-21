package tripAdviser.myPage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tripAdviser.myPage.model.service.MyPageService;
import tripAdviser.myPage.model.vo.MyPageComment;

/**
 * Servlet implementation class MyCommentViewServlet
 */
@WebServlet("/myPage/myComment")
public class MyCommentViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyCommentViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		
		int cPage;	//코멘트 현재페이지
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}
		catch(NumberFormatException e) {
			cPage = 1;
		}
		int numPerPage = 5;	//코멘트 한페이지당 보여줄 코멘트갯수
		
		int totalCommentListCnt = new MyPageService().selectMyCommentListCount(id);	//여행정보 전체 코멘트수
		int totalCommentPageCnt = (int)Math.ceil((double)totalCommentListCnt / numPerPage);			//여행정보 전체 페이지수
		
		//페이지바 만들기
		String pageBar = "<ul class='pagination justify-content-center'>";
		int pageBarSize = 5;
		int pageNo = ((cPage / pageBarSize) * pageBarSize) + 1;	//페이지바의 시작페이지숫자 설정
		int pageStart = pageNo;
		int pageEnd = pageNo + pageBarSize - 1;
		
		//이전 만들기
		if(pageNo == 1) {
			pageBar = pageBar + "<li class='page-item disabled'><a class='page-link' href='#'>&laquo;</a></li>";
		}
		else {
			pageBar = pageBar + "<li class='page-item'><a class='page-link' href='javascript:fn_change_page(" + (pageNo - pageBarSize) + ")'>&laquo;</a></li>";
		}
		
		//페이지바 숫자채우기
		while(pageNo <= totalCommentPageCnt && pageNo <= pageEnd) {
			if(cPage == pageNo) {
				pageBar = pageBar + "<li class='page-item active'><a class='page-link'>" + pageNo + "</a></li>";
			}
			else {
				pageBar = pageBar + "<li class='page-item'><a class='page-link' href='javascript:fn_change_page(" + pageNo + ")'>" + pageNo + "</a></li>";
			}
			pageNo++;
		}
		
		//다음 만들기
		
		if(pageEnd >= totalCommentPageCnt) {
			pageBar = pageBar + "<li class='page-item disabled'><a class='page-link' href='#'>&raquo;</a></li></ul>";
		}
		else {
			pageBar = pageBar + "<li class='page-item'><a class='page-link' href='javascript:fn_change_page(" + (pageStart + pageBarSize) + ")'>&raquo;</a></li></ul>";
		}
		
		//데이터 받아오기
		List<MyPageComment> list = new MyPageService().selectMyComment(id, cPage, numPerPage);
		
		if(list.size() > 0) {
			request.setAttribute("myCommentList", list);
			request.setAttribute("pageBar", pageBar);
		}
		request.setAttribute("id", id);
		request.getRequestDispatcher("/views/myPage/myComment.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
