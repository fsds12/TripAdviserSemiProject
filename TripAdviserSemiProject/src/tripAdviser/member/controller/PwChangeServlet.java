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
 * Servlet implementation class PwChangeServlet
 */
@WebServlet(name="PwChangeServlet",urlPatterns="/pwfindchange")
public class PwChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PwChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pw=request.getParameter("password");
		String id=request.getParameter("id");
		Member m=new Member();
		m.setMemberId(id);
		m.setMemberPw(pw);
		
		int result=new MemberService().pwchange(m);
		
		String msg="";
		String loc="/";
		String view="/views/common/msg.jsp";
		if(result>0) {
			msg="비밀번호가 변경되었습니다.";
		}else {
			msg="비밀변호 변경을 실패하였습니다.";
		}
		request.setAttribute("msg",msg);
		request.setAttribute("loc",loc);
		
		RequestDispatcher rd=request.getRequestDispatcher(view);
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
