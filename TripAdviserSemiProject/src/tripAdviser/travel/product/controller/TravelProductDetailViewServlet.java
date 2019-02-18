package tripAdviser.travel.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tripAdviser.travel.product.model.service.TravelProductDetailService;
import tripAdviser.travel.product.model.vo.TravelProduct;

/**
 * Servlet implementation class TravelProductDetailServlet
 */
@WebServlet("/travel/travelProductDetail")
public class TravelProductDetailViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TravelProductDetailViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int trvNo = Integer.parseInt(request.getParameter("trvNo"));
		
		int cPage;	//코멘트 현재페이지
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}
		catch(NumberFormatException e) {
			cPage = 1;
		}
		int numPerPage = 5;	//코멘트 한페이지당 보여줄 코멘트갯수
		
		int totalCommentListCnt = new TravelProductDetailService().selectCommentListCount(trvNo);	//여행정보 전체 코멘트수
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
			pageBar = pageBar + "<li class='page-item'><a class='page-link' href='" + request.getContextPath() + "/travel/travelProductDetail?trvNo=" + trvNo + "&cPage=" + (pageNo - pageBarSize) + "'>&laquo;</a></li>";
		}
		
		//페이지바 숫자채우기
		while(pageNo <= totalCommentPageCnt && pageNo <= pageEnd) {
			if(cPage == pageNo) {
				pageBar = pageBar + "<li class='page-item active'><a class='page-link' href='" + request.getContextPath() + "/travel/travelProductDetail?trvNo=" + trvNo + "&cPage=" + pageNo + "'>" + pageNo + "</a></li>";
			}
			else {
				pageBar = pageBar + "<li class='page-item'><a class='page-link' href='" + request.getContextPath() + "/travel/travelProductDetail?trvNo=" + trvNo + "&cPage=" + pageNo + "'>" + pageNo + "</a></li>";
			}
			pageNo++;
		}
		
		//다음 만들기
		
		if(pageEnd >= totalCommentPageCnt) {
			pageBar = pageBar + "<li class='page-item disabled'><a class='page-link' href='#'>&raquo;</a></li></ul>";
		}
		else {
			pageBar = pageBar + "<li class='page-item'><a class='page-link' href='" + request.getContextPath() + "/travel/travelProductDetail?trvNo=" + trvNo + "&cPage=" + (pageStart + pageBarSize)  + "'>&raquo;</a></li></ul>";
		}
		
		TravelProduct tp = new TravelProductDetailService().selectTrvProduct(trvNo, cPage, numPerPage);
		
		String view = "";
		String loc = "";
		String msg = "";
		
		if(tp != null) {
			view = "/views/travelProduct/travelDetail.jsp";
			request.setAttribute("travelProduct", tp);
			request.setAttribute("pageBar", pageBar);
		}
		else {
			view = "/views/common/msg.jsp";
			loc = "/";
			msg = "잘못된 경로거나 존재하지않는 여행정보입니다.";
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
