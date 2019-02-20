package tripAdviser.travel.product.model.service;

import java.sql.Connection;

import tripAdviser.member.model.vo.Comment;
import tripAdviser.travel.product.model.dao.TravelProductCommentDao;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;

public class TravelProductCommentService {
	private Connection conn;
	private TravelProductCommentDao dao = new TravelProductCommentDao();
	
	public int insertComment(Comment c) {
		conn = getConnection();
		int result = dao.insertComment(conn, c);
		
		if(result > 0) {
			commit();
		}
		else {
			rollback();
		}
		
		close(conn);
		return result;
	}
	
	public int modifyComment(Comment c) {
		conn = getConnection();
		int result = dao.modifyComment(conn, c);
		
		if(result > 0) {
			commit();
		}
		else {
			rollback();
		}
		
		close(conn);
		return result;
	}
	
	public int deleteComment(int commentNo) {
		conn = getConnection();
		int result = dao.deleteComment(conn, commentNo);
		
		if(result > 0) {
			commit();
		}
		else {
			rollback();
		}
		
		close(conn);
		return result;
	}
}
