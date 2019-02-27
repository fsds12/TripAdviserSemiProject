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
 * Servlet implementation class travelSearchServlet
 */
@WebServlet("/travel/travelSearch")
public class travelSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public travelSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
		
		//검색어 top3
			String searchkey = request.getParameter("searchkey");
			List<TravelProduct> toplist=new travelSearchService().traveltop(searchkey);
			String msg="";
			String loc="";
			String view ="/views/travelSearch/travelSearch.jsp";
			
			
			if(toplist==null)
			{
				System.out.println("검색결과가 없습니다!");
				
			}else
			{
				request.setAttribute("toplist", toplist);
				request.setAttribute("msg",msg);
				request.setAttribute("loc", loc);
				
			}
			
		//숙박업소 top3	
		List<TravelProduct> sleepList=new travelSearchService().travelSearchSleepAll(searchkey);
		if(sleepList==null)
		{
			System.out.println("검색결과가 없습니다.");
		}else
		{
			request.setAttribute("msg",msg);
			request.setAttribute("loc", loc);
			request.setAttribute("sleepList", sleepList);
			/*
			 * for(TravelProduct tem : sleepList) { System.out.println(tem); }
			 */
			
		}
		
		//액티비티top3
		List<TravelProduct> acList = new travelSearchService().travelSearchActivityAll(searchkey);
		if(acList==null)
		{
			System.out.println("검색결과가 없습니다.");
		}
		else {
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.setAttribute("acList", acList);
			/*
			 * for(TravelProduct tem : acList) { System.out.println(tem); }
			 */
		}
		
		//맛집 top3
		List<TravelProduct> eatList = new travelSearchService().travelSearchEatAll(searchkey);
		if(eatList==null)
		{
			System.out.println("검색결과가 없습니다.");
		}
		else {
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.setAttribute("eatList", eatList);
			/*
			 * for(TravelProduct tem : eatList) { System.out.println(tem); }
			 */
		}
		
		request.setAttribute("searchkey", searchkey);
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
