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
 * Servlet implementation class QnAListServlet
 */
@WebServlet("/QnA/QnAList")
public class QnAListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnAListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
		
		int totalContent=new qaService().selectQaCount();		
		int totalPage=(int)Math.ceil((double)totalContent/numPerPage);
		
		List<Board> list=new qaService().selectQaList(cPage, numPerPage);
		
		String pageBar="";
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize+1;
		
		if(pageNo==1) {
			pageBar+="<li class='page-item'><a class='page-link'> << </a<</li>";
		}else {
			pageBar+="<li class='page-item'><a class='page-link' href='"+request.getContextPath()+"/QnA/QnAList?cPage="+(pageNo-1)+"'> << </a></li>";
		}
		
		
		while(!(pageNo>totalPage || pageNo>pageEnd)) {
			if(cPage==pageNo) {
				pageBar+="<li class='page-item'><a class='page-link'>"+pageNo+"</a></li>";
			}else {
				pageBar+="<li class='page-item'><a class='page-link' href='"+request.getContextPath()+"/QnA/QnAList?cPage="+pageNo+"'>"+pageNo+"</a></li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item'><a class='page-link'> >> </a></li>";
		}else {
			pageBar+="<li class='page-item'><a class='page-link' href='"+request.getContextPath()+"/QnA/QnAList?cPage="+(pageNo-1)+"'> >> </a></li>";
		}
		
		request.setAttribute("cPage", cPage);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("numPerPage", numPerPage);
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
