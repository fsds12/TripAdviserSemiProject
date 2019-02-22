package tripAdviser.myPage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tripAdviser.member.model.vo.Member;
import tripAdviser.myPage.model.service.MyPageService;

/**
 * Servlet implementation class MyProfileViewServlet
 */
@WebServlet("/myPage/myProfile")
public class MyProfileViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyProfileViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String loginedId = "";
		Member m = (Member)request.getSession().getAttribute("loginMember");
		if(m != null) {
			loginedId = m.getMemberId();
		}
		
		if(id.equals(loginedId) && id != null && !id.equals("")) {
			m = new MyPageService().selectId(id);
			request.setAttribute("member", m);
			request.getRequestDispatcher("/views/myPage/myProfile.jsp").forward(request, response);
		}
		else {
			request.getRequestDispatcher("/").forward(request, response);
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
