package tripAdviser.myPage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tripAdviser.member.model.vo.Member;
import tripAdviser.myPage.model.service.MyPageService;

/**
 * Servlet implementation class MyPageProfileUpdateServlet
 */
@WebServlet(name="MyPageProfileUpdateServlet",urlPatterns="/mypage/profileupdate")
public class MyPageProfileUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageProfileUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id=request.getParameter("inputEmail");
		String email=request.getParameter("email");
		int pcode=Integer.parseInt(request.getParameter("postal-code"));
		String address=request.getParameter("address");
		String address2=request.getParameter("address2");
		
		System.out.println(id+email+pcode+address+address2);
		
		Member m=new Member();
		
		m.setMemberId(id);
		m.setEmail(email);
		m.setPostalCode(pcode);
		m.setAddress(address);
		m.setAddressDetail(address2);
		
		int result=new MyPageService().updateMember(m);
		
		String msg="";
		String loc="/views/myPage/myPageMain.jsp";
		String view="/views/common/msg.jsp";
		if(result>0) {
			msg="회원정보가 수정되었습니다.";
			
		}else {
			msg="회원정보 수정을 실패하였습니다.";
			
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
