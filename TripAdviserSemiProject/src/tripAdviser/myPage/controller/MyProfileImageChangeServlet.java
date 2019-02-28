package tripAdviser.myPage.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import tripAdviser.member.model.vo.Member;
import tripAdviser.myPage.model.service.MyPageService;

/**
 * Servlet implementation class MyProfileImageChangeServlet
 */
@WebServlet("/myPage/myProfileImageChange")
public class MyProfileImageChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyProfileImageChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg","오류[관리자에 문의하세요]");
			request.setAttribute("log","/");
			RequestDispatcher rd=request.getRequestDispatcher("/views/common/msg.jsp");
			rd.forward(request, response);
			return;
		}
		
		String dir=getServletContext().getRealPath("/");
		dir+="images" + File.separator + "myPage_imgs";
		int maxSize=1024*1024*10; 
		MultipartRequest mr=new MultipartRequest(request,dir,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		String id=mr.getParameter("hiddenid");
		String filePath = mr.getFilesystemName("profile_up_file");
		
		System.out.println(filePath);
		
		/*Member m=new Member();
		m.setMemberId(id);
		m.setMemberPictureUrl(filePath);*/
		Member m = (Member)request.getSession().getAttribute("loginMember");
		m.setMemberPictureUrl(filePath);
		int result=new MyPageService().updatePicture(m);
		
		
		String view="/myPage";
		String img=filePath;
		
		
		RequestDispatcher rd=request.getRequestDispatcher(view);
		rd.forward(request,response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
