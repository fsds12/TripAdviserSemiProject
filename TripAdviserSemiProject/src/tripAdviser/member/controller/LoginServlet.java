package tripAdviser.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tripAdviser.member.model.service.MemberService;
import tripAdviser.member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name="LoginServlet",urlPatterns="/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("inputEmail");
		String password=request.getParameter("inputPassword");
		
		Member m=new Member();
		m.setMemberId(id);
		m.setMemberPw(password);
		
		Member result=new MemberService().selectOne(m);
		String msg="";
		String loc="/";
		String view="/";
		if(result!=null/*&&result.getMemberId().equals(id)&&result.getMemberPw().equals(password)*/) {
			msg="로그인 성공";
			HttpSession session=request.getSession();
			session.setAttribute("loginMember",m);
			String saveId=request.getParameter("customCheck1");
			
			if(saveId!=null) {
				Cookie c=new Cookie("saveId",id);
				c.setMaxAge(60*60*24*15);
				response.addCookie(c);
				}else {
					Cookie c=new Cookie("saveId",id);
					c.setMaxAge(0);
					response.addCookie(c);
			}
		}else {
			msg="아이디 또는 비밀번호가 일치하지 않습니다.";
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
