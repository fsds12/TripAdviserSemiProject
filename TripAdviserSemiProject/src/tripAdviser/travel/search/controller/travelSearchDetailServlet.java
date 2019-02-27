package tripAdviser.travel.search.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import tripAdviser.travel.product.model.vo.TravelProduct;
import tripAdviser.travel.search.model.service.travelSearchService;

/**
 * Servlet implementation class travelSleepDetail
 */
@WebServlet("/detail")
public class travelSearchDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public travelSearchDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String msg="";
		String loc="";
		String view ="/views/travelSearch/travelSearchDetail.jsp";
		String category = request.getParameter("category");
		String searchkey = request.getParameter("searchkey");
		
		
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e){
			cPage=1;
		}
		int numPerPage=12;
		
		
		  int totalContent= new travelSearchService().selectCountAll(category, searchkey);
		  //System.out.println("토탈컨텐트"+totalContent);
		  int totalPage=(int)Math.ceil((double)totalContent/numPerPage);
		  //System.out.println("토탈페이지"+totalPage);
		  
		  
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
	         pageBar = pageBar + "<li class='page-item'><a class='page-link' href='" + request.getContextPath() + "/detail?category=" + category + "&searchkey=" + searchkey + "&cPage=" + (pageNo - pageBarSize)+ "'>&laquo;</a></li>";
	      }
	      
	      //페이지바 숫자채우기
	      while(pageNo <= totalPage && pageNo <= pageEnd) {
	         if(cPage == pageNo) {
	            pageBar = pageBar + "<li class='page-item active'><a class='page-link' href='" + request.getContextPath() + "/detail?category=" + category + "&searchkey=" + searchkey + "&cPage=" + pageNo +"'>" + pageNo + "</a></li>";
	         }
	         else {
	            pageBar = pageBar + "<li class='page-item'><a class='page-link' href='" + request.getContextPath() + "/detail?category=" + category + "&searchkey=" + searchkey + "&cPage=" + pageNo +"'>" + pageNo + "</a></li>";
	         }
	         pageNo++;
	      }
	      
	      //다음 만들기
	      
	      if(pageEnd >= totalPage) {
	         pageBar = pageBar + "<li class='page-item disabled'><a class='page-link' href='#'>&raquo;</a></li></ul>";
	      }
	      else {
	         pageBar = pageBar + "<li class='page-item'><a class='page-link' href='" + request.getContextPath() + "/detail?&cPage=" + (pageStart + pageBarSize) +"'>&raquo;</a></li></ul>";
	      }
		 
		
		
	
		
		
		List<TravelProduct> list = new travelSearchService().travelDedailSearchCategoryAll(category, searchkey, cPage, numPerPage);
		
		request.setAttribute("searchCategoryDetailList", list);
		request.setAttribute("cPage", cPage);
		request.setAttribute("numPerPage", numPerPage);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("searchKey", searchkey);
		request.getRequestDispatcher(view).forward(request, response); 
		
		/*
		 * if(category.equals("sleepdelist")) { List<TravelProduct> list = new
		 * travelSearchService().travelDedailSleepAll(searchkey, cPage, numPerPage);
		 * //System.out.println("나오냐?????????????????????"+list);
		 * 
		 * request.setAttribute("list",list);
		 * request.getRequestDispatcher(view).forward(request, response); } else
		 * if(category.equals("aclist")) { List<TravelProduct> list = new
		 * travelSearchService().travelDedailSleepAll(searchkey, cPage, numPerPage);
		 * request.setAttribute("list", list);
		 * request.getRequestDispatcher(view).forward(request, response); } else
		 * if(category.equals("eatlist")) { List<TravelProduct> list = new
		 * travelSearchService().travelDedailSleepAll(searchkey, cPage, numPerPage);
		 * request.setAttribute("list", list);
		 * request.getRequestDispatcher(view).forward(request, response); }
		 */
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
