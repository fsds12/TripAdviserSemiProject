package tripAdviser.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tripAdviser.admin.model.service.TravelAdminService;
import tripAdviser.travel.product.model.vo.TravelProduct;

/**
 * Servlet implementation class TravelAdminListViewServlet
 */
@WebServlet("/travel/TravelAdminListView")
public class TravelAdminListViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TravelAdminListViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int trvNo=Integer.parseInt(request.getParameter("trvNo"));
		
		
		//페이징처리로직
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));		
		}
		catch(NumberFormatException e)
		{
			cPage=1;
		}
		int numPerPage=5;
		
		int totalAdminListCnt = new TravelAdminService().selectAdminListCount(trvNo);   //관리자전체리스트
		int totalAdminPageCnt = (int)Math.ceil((double)totalAdminListCnt / numPerPage); //관리자 총페이지
		
		
	      //페이지바 만들기
	      String pageBar = "<ul class='pagination justify-content-center'>";
	      int pageBarSize = 5;
	      int pageNo = ((cPage / pageBarSize) * pageBarSize) + 1;   //페이지바의 시작페이지숫자 설정
	      int pageStart = pageNo;
	      int pageEnd = pageNo + pageBarSize - 1;
	      
	      //이전 만들기
	      if(pageNo == 1) {
	         pageBar = pageBar + "<li class='page-item disabled'><a class='page-link' href='#'>&laquo;</a></li>";
	      }
	      else {
	         pageBar = pageBar + "<li class='page-item'><a class='page-link' href='" + request.getContextPath() + "/travel/TravelAdminListView?trvNo=" + trvNo + "&cPage=" + (pageNo - pageBarSize) + "'>&laquo;</a></li>";
	      }
	      
	      //페이지바 숫자채우기
	      while(pageNo <= totalAdminPageCnt && pageNo <= pageEnd) {
	         pageBar = pageBar + "<li class='page-item'><a class='page-link' href='" + request.getContextPath() + "/travel/TravelAdminListView?trvNo=" + trvNo + "&cPage=" + pageNo + "'>" + pageNo + "</a></li>";
	         pageNo++;
	      }
	      
	      //다음 만들기
	      
	      if(pageEnd >= totalAdminPageCnt) {
	         pageBar = pageBar + "<li class='page-item disabled'><a class='page-link' href='#'>&raquo;</a></li></ul>";
	      }
	      else {
	         pageBar = pageBar + "<li class='page-item'><a class='page-link' href='" + request.getContextPath() + "/travel/TravelAdminListView?trvNo=" + trvNo + "&cPage=" + (pageStart + pageBarSize)  + "'>&raquo;</a></li></ul>";
	      }
		
		TravelProduct tp=new TravelAdminService().selectAdminList(trvNo,cPage,numPerPage);
		
		String view="";
		String loc="";
		String msg="";
		
		if(tp!=null)
		{
			view="/views/travelManage/travelList.jsp";
			request.setAttribute("travelProduct", tp);
			request.setAttribute("pageBar", pageBar);
		}
		else
		{
			view="/views/common/msg.jsp";
			loc="/";
			msg="잘못된 경로입니다.";
		}
		
		request.setAttribute("loc", loc);
		request.setAttribute("msg", msg);
		request.getRequestDispatcher(view).forward(request, response);
		
		/*request.getRequestDispatcher("/views/travelManage/travelList.jsp").forward(request, response);*/
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
