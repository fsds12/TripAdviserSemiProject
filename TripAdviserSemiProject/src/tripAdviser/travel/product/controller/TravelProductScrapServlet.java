package tripAdviser.travel.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tripAdviser.member.model.vo.Member;
import tripAdviser.travel.product.model.service.TravelScrapService;

/**
 * Servlet implementation class TravelProductScrapServlet
 */
@WebServlet("/travel/myScrap")
public class TravelProductScrapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TravelProductScrapServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int trvNo = Integer.parseInt(request.getParameter("trvNo"));
		Member m = (Member)request.getSession().getAttribute("loginMember");
		String memberId = m.getMemberId();
		
		int result = new TravelScrapService().insertScrap(trvNo, memberId);
		response.setContentType("text/html;charset=UTF-8");
		
		if(result > 0) {
			response.getWriter().append("<button class='btn btn-outline-danger' style='width: 100%;' id='is-scrap-delete' onclick='fn_scrap_delete()'>스크랩제거</button>");
			//response.getWriter().append("<button class='btn btn-outline-danger' style='width: 100%;' id='is-scrap-delete'>스크랩제거</button>");
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
