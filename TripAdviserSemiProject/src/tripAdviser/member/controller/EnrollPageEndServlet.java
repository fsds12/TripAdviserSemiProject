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
 * Servlet implementation class EnrollPageEndServlet
 */
@WebServlet(name="EnrollPageEndServlet",urlPatterns="/signup")
public class EnrollPageEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	
	
	
    public EnrollPageEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		request.setCharacterEncoding("UTF-8");
		
		
		
		String id=request.getParameter("inputEmail");
		String pw=request.getParameter("inputPassword");
		String email=request.getParameter("email");
		//String codeCheck=request.getParameter("code_check");
		String phone=request.getParameter("phone");
		String name=request.getParameter("username");
		int postalCode=Integer.parseInt(request.getParameter("address"));//우편번호
		String mainAddress=request.getParameter("sample4_roadAddress");//주소
		String addressDetail=request.getParameter("address2");//상세주소
		
		Member m=new Member();
		m.setMemberId(id);
		m.setMemberPw(pw);
		m.setEmail(email);
		m.setPhone(phone);
		m.setName(name);
		m.setPostalCode(postalCode);
		m.setAddress(mainAddress);
		m.setAddressDetail(addressDetail);
		
		int result=new MemberService().enrollMember(m);
		
		String msg="";
		String loc="";
		String view="/views/common/msg.jsp";
		if(result>0) {
			msg="가입되었습니다.";
			loc="/";
		}else {
			msg="회원가입을 실패하였습니다.";
			loc="/views/member/enrollMember.jsp";
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
