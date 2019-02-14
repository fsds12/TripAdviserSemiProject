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
		TravelProduct tp = new TravelProductDetailService().selectTrvProduct(trvNo);
		
		String view = "";
		String loc = "";
		String msg = "";
		
		if(tp != null) {
			view = "/views/travelDetail.jsp";
			request.setAttribute("travelProduct", tp);
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
