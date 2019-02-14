package tripAdviser.travel.product.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import tripAdviser.member.model.vo.Comment;
import tripAdviser.travel.product.model.dao.TravelProductDetailDao;
import tripAdviser.travel.product.model.vo.TravelProduct;

public class TravelProductDetailService {
	private TravelProductDetailDao dao = new TravelProductDetailDao();
	private Connection conn = null;
	
	public TravelProduct selectTrvProduct(int trvNo) {
		conn = getConnection();
		TravelProduct tp = dao.selectTrvProduct(conn, trvNo);
		
		close(conn);
		return tp;
	}
	
	public List<Comment> selectComment(int trvNo) {
		conn = getConnection();
		/*List<Comment> comments = dao.selectComment(conn, trvNo);*/
		List<Comment> comments = null;
		
		close(conn);
		return comments;
	}
}
