package tripAdviser.board.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tripAdviser.board.model.vo.Board;
import tripAdviser.board.notice.model.service.NoticeService;

/**
 * Servlet implementation class NoticeSearchServlet
 */
@WebServlet("/notice/noticeFind")
public class NoticeSearchServlet extends HttpServlet {
	private NoticeService service=new NoticeService();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeSearchServlet() {super();}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type=request.getParameter("searchType");
		String key=request.getParameter("searchKey");
		
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch (Exception e) {
			cPage=1;
		}
		int numPerPage;
		try {
			numPerPage=Integer.parseInt(request.getParameter("numPerPage"));
		}catch (Exception e) {
			numPerPage=10;
		}
		
		int totalContent=service.selectNoticeCount(type, key);
		List<Board> list=service.selectSearchNotice(cPage, numPerPage, type, key);		
		
		
		int totalPage=(int)Math.ceil((double)totalContent/numPerPage);
		
		String pageBar="";
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		if(pageNo==1) {
			pageBar+="<li class=''><a class='' href=''> << </a></li>";
		}else {
			pageBar+="<li class=''><a class='' href='" + request.getContextPath() + "/notice/noticeList?cPage="+(pageNo-1)+"&numPerPage="+numPerPage+"&searchType="+type+"&searchKey="+key+"'> << </a></li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<li class=''><a class=''>"+pageNo+"</a></li>";
			}else {
				pageBar+="<li class=''><a href='"+request.getContextPath()+"/notice/noticeFind?cPage="+(pageNo-1)+"&numPerPage="+numPerPage+"&searchType="+type+"&searchKey="+key+"'>"+pageNo+"</a></li>";
			}
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class=''><a class=''> >> </a></li>";
		}else {
			pageBar+="<li class='><a href='"+request.getContextPath()+"/notice/noticeFind?cPage="+pageNo+"&numPerPage="+numPerPage+"&searchType="+type+"&searchKey="+key+"'> >> </a></li>";
		}
		
		request.setAttribute("cPage", cPage);
		request.setAttribute("numPerPage", numPerPage);
		request.setAttribute("type", type);
		request.setAttribute("key", key);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/views/notice/noticeBoard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
