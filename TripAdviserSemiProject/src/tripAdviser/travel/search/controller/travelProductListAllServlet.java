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
 * Servlet implementation class travelProductListAllServelet
 */
@WebServlet("/travelProductListAll")
public class travelProductListAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public travelProductListAllServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	List<TravelProduct> list=new travelSearchService().travelSearchAll();
	String msg="";
	String loc="";
	String view ="/views/travleSearch/travelMainPage.jsp";
	if(list!=null)
	{
		System.out.println("제품이검색되지 않았습니다.");
	}else
	{
		request.setAttribute("msg",msg);
		request.setAttribute("loc", loc);
		request.setAttribute("tplist", list);
		
		request.getRequestDispatcher(view).forward(request, response);
		System.out.println("성공?");
	}
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
