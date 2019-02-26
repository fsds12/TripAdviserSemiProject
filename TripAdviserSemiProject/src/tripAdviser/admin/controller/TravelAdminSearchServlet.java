package tripAdviser.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tripAdviser.admin.model.service.TravelAdminService;
import tripAdviser.travel.product.model.vo.TravelProduct;

/**
 * Servlet implementation class TravelAdminSearchServlet
 */
@WebServlet("/travel/travelAdminFind")
public class TravelAdminSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TravelAdminSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type=request.getParameter("searchType");
		String key=request.getParameter("searchKeyword");
		
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
		
		int totalcontent=0;
		List<TravelProduct> list=null;
		
		totalcontent=new TravelAdminService().selectAdminSearchCount(type, key);
		list=new TravelAdminService().selectAdminSearch(type, key,cPage,numPerPage);
		
		int totalAdminPageCnt = (int)Math.ceil((double)totalcontent / numPerPage); //관리자 총페이지
		
		
	      //페이지바 만들기
	      String pageBar = "<ul class='pagination justify-content-center'>";
	      int pageBarSize = 5;
	      int pageNo = (((cPage-1) / pageBarSize) * pageBarSize) + 1;   //페이지바의 시작페이지숫자 설정
	      int pageStart = pageNo;
	      int pageEnd = pageNo + pageBarSize - 1;
	      
	      //이전 만들기
	      if(pageNo == 1) {
	         pageBar = pageBar + "<li class='page-item disabled'><a class='page-link' href='#'>&laquo;</a></li>";
	      }
	      else {
	         pageBar = pageBar + "<li class='page-item'><a class='page-link' href='" + request.getContextPath() + "/travel/TravelAdminFind?cPage=" + (pageNo - pageBarSize) + "&SearchType"+type+"&SearchKeyword="+key+"'>&laquo;</a></li>";
	      }
	      
	      //페이지바 숫자채우기
	      while(pageNo <= totalAdminPageCnt && pageNo <= pageEnd) {
	         pageBar = pageBar + "<li class='page-item'><a class='page-link' href='" + request.getContextPath() + "/travel/TravelAdminListView?cPage="+ pageNo + "&SearchType"+type+"&SearchKeyword="+key+"'>" + pageNo + "</a></li>";
	         pageNo++;
	      }
	      
	      //다음 만들기
	      
	      if(pageEnd >= totalAdminPageCnt) {
	         pageBar = pageBar + "<li class='page-item disabled'><a class='page-link' href='#'>&raquo;</a></li></ul>";
	      }
	      else {
	         pageBar = pageBar + "<li class='page-item'><a class='page-link' href='" + request.getContextPath() + "/travel/TravelAdminListView?cPage=" + (pageStart + pageBarSize)  + "&SearchType"+type+"&SearchKeyword="+key+"'>&raquo;</a></li></ul>";
	      }
		
		
		
		
	    System.out.println(list);
	    System.out.println(type);
	    System.out.println(key);
	    
	    request.setAttribute("searchType", type);
	    request.setAttribute("searchKeyword", key);
	    
	    request.setAttribute("cPage", cPage);
	    request.setAttribute("numPerPage", numPerPage);
	    
		request.setAttribute("list", list);
		request.setAttribute("pageBar", pageBar);
		request.getRequestDispatcher("/views/travelManage/travelList.jsp").forward(request, response);
		
		
		
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
