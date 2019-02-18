package tripAdviser.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tripAdviser.admin.model.service.TravelAdminService;

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
