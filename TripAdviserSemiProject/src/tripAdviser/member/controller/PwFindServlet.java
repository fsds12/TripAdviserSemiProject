package tripAdviser.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tripAdviser.member.model.service.MemberService;
import tripAdviser.member.model.vo.Member;

/**
 * Servlet implementation class PwFindServlet
 */
@WebServlet("/pwfind")
public class PwFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PwFindServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id=request.getParameter("inputEmail2");
		String phone=request.getParameter("phone2");
		String email=request.getParameter("email2");
		System.out.println(id+phone+email);
		Member m=new Member();
		
		m.setMemberId(id);
		m.setPhone(phone);
		m.setEmail(email);
		
		Member result=new MemberService().findPw(m);
		request.setAttribute("Member", result);

		RequestDispatcher rd=request.getRequestDispatcher("/views/member/findPw.jsp");
		rd.forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
