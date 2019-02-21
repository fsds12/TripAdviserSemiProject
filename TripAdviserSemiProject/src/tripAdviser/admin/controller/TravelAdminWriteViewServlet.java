package tripAdviser.admin.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import tripAdviser.admin.model.service.TravelAdminService;
import tripAdviser.travel.product.model.vo.TravelProduct;

/**
 * Servlet implementation class TravelAdminWriteViewServlet
 */
@WebServlet("/travel/travelAdminWriteView")
public class TravelAdminWriteViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TravelAdminWriteViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request))
		{
			request.setAttribute("msg", "업로드오류");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		//저장경로
		String dir=getServletContext().getRealPath("/images/travel_upload_imgs");
		int maxSize=1024*1024*1024;
		
		MultipartRequest mr=new MultipartRequest(request, dir,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		
		//DB로직 구성~!
		/*System.out.println(mr.getFilesystemName("test1"));
		System.out.println(mr.getFilesystemName("test2"));*/
		
		Enumeration e=mr.getFileNames();
		List<String> fileNames=new ArrayList();
		while(e.hasMoreElements())
		{
			fileNames.add(mr.getFilesystemName((String)e.nextElement()));
		}
		System.out.println(fileNames);
		
		
		
		
		String title=mr.getParameter("trvTitle");
		String ctg=mr.getParameter("trvCtg");
		String province=mr.getParameter("trvProvince");
		String city=mr.getParameter("trvCity");
		String addr=mr.getParameter("trvAddress");
		
		/*String dstart=mr.getParameter("trvDateStart");
		Date ds = null;
		try {
			ds = new SimpleDateFormat("yyyy-MM-dd").parse(dstart);
		} catch (ParseException e1) {
			
			e1.printStackTrace();
		}
		
		String dend=mr.getParameter("trvDateEnd");
		Date de = null;
		try {
			de = new SimpleDateFormat("yyyy-MM-dd").parse(dend);
		} catch (ParseException e1) {
			
			e1.printStackTrace();
		}*/
		
		String content=mr.getParameter("proContent");
		
		
		TravelProduct tp=new TravelProduct();
		tp.setTrvTitle(title);
		tp.setTrvCity(city);
		tp.setTrvAddress(addr);
		/*tp.setTrvDateStart(ds);
		tp.setTrvDateEnd(de);*/
		/*tp.setAlbumUrls(fileNames);*/
		tp.setTrvReview(content);
		
		
		/*tp.setTrvRepresentPic(rfile);
		tp.setAlbumUrls(file1);
		tp.setAlbumUrls(file2);
		tp.setAlbumUrls(file3);*/
		
		
		int result=new TravelAdminService().insertAdmin(tp);
		
		System.out.println(result);
		
		
		String msg="";
		String loc="/travel/travelProductDetail"/*+trvNo*/;
		String view="/views/common/msg.jsp";
		
		if(result>0)
		{
			msg="여행지상품등록성공";
		}
		else
		{
			msg="여행지상품등록실패";
		}
		
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher(view).forward(request, response);
		
		/*<%=request.getContextPath()%>/travel/travelProductDetail?trvNo=<%=tp.getTrvNo()%>*/
		/*request.getRequestDispatcher("").forward(request, response);*/
		
		
		/*SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date dsdate = null;
		try {
			dsdate = sdf.parse(dstart);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}*/
		
		/*SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd");
		Date dsdate2 = null;
		try {
			dsdate2 = sdf2.parse(dend);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		/*String rfile=mr.getParameter("trvRepresentPic");*/
		
		/*List<String> file1=new ArrayList();
		List<String> file2=new ArrayList();
		List<String> file3=new ArrayList();*/
		
		/*String file1=mr.getFilesystemName("trvPicSrc1");
		String file2=mr.getFilesystemName("trvPicSrc2");
		String file3=mr.getFilesystemName("trvPicSrc3");*/
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
