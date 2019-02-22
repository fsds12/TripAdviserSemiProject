package tripAdviser.travel.search.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class categoryMenuServlet
 */
@WebServlet("/category/menu.do")
public class categoryMenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public categoryMenuServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	int choice;
	try{
		choice=Integer.parseInt(request.getParameter("choice"));
	}catch(NumberFormatException e)
	{
		choice=0;
	}
	
	System.out.println("넘겨받은값"+choice);
	String list;
	switch(choice)
	{
	case 1:list="/views/travelSearch/travelMainPage_1.jsp";break;
	case 2:list="/views/travelSearch/travelMainPage_2.jsp";break;
	case 3:list="<%@ include file='views/travelSearch/travelMainPage_1.jsp'%>";break;
	case 4:list="<%@ include file='views/travelSearch/travelMainPage_1.jsp'%>";break;
	case 5:list="<%@ include file='views/travelSearch/travelMainPage_1.jsp'%>";break;
	case 6:list="<%@ include file='views/travelSearch/travelMainPage_1.jsp'%>";break;
	case 7:list="<%@ include file='views/travelSearch/travelMainPage_1.jsp'%>";break;
	case 8:list="<%@ include file='views/travelSearch/travelMainPage_1.jsp'%>";break;
	default : list="/views/travelSearch/travelMainPage.jsp";break;
	}
	request.getRequestDispatcher(list).forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
