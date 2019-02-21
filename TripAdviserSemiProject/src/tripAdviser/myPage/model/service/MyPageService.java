package tripAdviser.myPage.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import tripAdviser.myPage.model.dao.MyPageDao;
import tripAdviser.myPage.model.vo.MyPageComment;
import tripAdviser.travel.product.model.vo.TravelProduct;


public class MyPageService {
	private MyPageDao dao = new MyPageDao();
	private Connection conn = null;
	
	public List<TravelProduct> selectScrap(String id) {
		conn = getConnection();
		List<TravelProduct> list = dao.selectScrap(conn, id);
		close(conn);
		
		return list;
	}
	
	public int selectMyCommentListCount(String id) {
		int result = 0;
		conn = getConnection();
		result = dao.selectMyCommentListCount(conn, id);
		
		close(conn);
		return result;
	}
	
	public List<MyPageComment> selectMyComment(String id, int cPage, int numPerPage) {
		conn = getConnection();
		List<MyPageComment> list = dao.selectMyComment(conn, id, cPage, numPerPage);
		close(conn);
		
		return list;
	}
}
