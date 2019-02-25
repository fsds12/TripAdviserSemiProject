package tripAdviser.board.QnA.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tripAdviser.board.QnA.model.service.qaService;
import tripAdviser.board.model.vo.Board;

/**
 * Servlet implementation class QnASearchServlet
 */
@WebServlet("/QnA/QnAFind")
public class QnASearchServlet extends HttpServlet {
	private qaService service=new qaService();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnASearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type=request.getParameter("type");
		String key=request.getParameter("key");
		
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
		
		int totalContent=service.selectQaCount(type, key);
		List<Board> list=service.selectSearchQa(cPage, numPerPage, type, key);		
		
		
		int totalPage=(int)Math.ceil((double)totalContent/numPerPage);
		
		String pageBar="";
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		if(pageNo==1) {
			pageBar+="<li class='page-item'><a class='page-link' href=''> << </a></li>";
		}else {
			pageBar+="<li class='page-item'><a class='page-link' href='" + request.getContextPath()+"QnA/QnAFind?cPage="+(pageNo-1)+"&numPerPage="+numPerPage+"&type="+type+"&key="+key+"'> << </a></li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<li class='page-item'><a class='page-link'>"+pageNo+"</a></li>";
			}else {
				pageBar+="<li class='page-item'><a class='page-link' href='"+request.getContextPath()+"QnA/QnAFind?cPage="+(pageNo-1)+"&numPerPage="+numPerPage+"&type="+type+"&key="+key+"'>"+pageNo+"</a></li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item'><a class='page-link'> >> </a></li>";
		}else {
			pageBar+="<li class='page-item'><a class='page-link' href='"+request.getContextPath()+"QnA/QnAFind?cPage="+pageNo+"&numPerPage="+numPerPage+"&type="+type+"&key="+key+"'> >> </a></li>";
		}
		
		request.setAttribute("cPage", cPage);
		request.setAttribute("numPerPage", numPerPage);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("searchType", type);
		request.setAttribute("searchKey", key);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/QnA/QnABoard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
