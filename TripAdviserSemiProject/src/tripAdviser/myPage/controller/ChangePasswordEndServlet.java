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
 * Servlet implementation class ChangePasswordEndServlet
 */
@WebServlet(name="ChangePasswordEndServlet",urlPatterns="/mypage/changepassword")
public class ChangePasswordEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id=request.getParameter("userId");
		String newPw=request.getParameter("password_new");
		String pw=request.getParameter("password");
		Member m=new Member();
		m.setMemberId(id);
		Member result=new MyPageService().selectOne(m);
		
		int insertResult=0;
		String msg="";
		String loc="/views/myPage/myPageMain.jsp";
		String view="/views/common/msg.jsp";
		if(result!=null) {
			msg="회원정보가 수정되었습니다.";
			
			if(result.getMemberPw().equals(pw)) {
				m.setMemberPw(newPw);
				insertResult=new MyPageService().updatePassword(m);
				if(insertResult>0) {
					msg="비밀번호가 변경되었습니다.";
					loc="/myPage?";
					String script="self.close()";
					request.setAttribute("script",script);
				}else {
					msg="비밀번호 변경을 실패하였습니다.";
					loc="/views/myPage/changePassword.jsp?userId="+id;
					}
			}else {
				msg="현재 비밀번호가 일치하지 않습니다.";
				loc="/views/myPage/changePassword.jsp?userId="+id;
			}
		}
		
		request.setAttribute("msg",msg);
		request.setAttribute("loc", loc);
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
