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
 * Servlet implementation class CheckIdServlet
 */
@WebServlet("/check/id")
public class CheckIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Member m=new Member();
		String userId=request.getParameter("hiddenid");
		m.setMemberId(userId);
		Member result=new MemberService().selectId(m);
		System.out.println(result!=null);
		boolean isAble=(result==null?true:false);
		
		
		request.setAttribute("isAble",isAble);
		request.setAttribute("userId",userId);
		RequestDispatcher rd=request.getRequestDispatcher("/views/member/checkid.jsp");
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
