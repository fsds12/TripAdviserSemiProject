package tripAdviser.myPage.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import tripAdviser.member.model.vo.Member;
import tripAdviser.myPage.model.dao.MyPageDao;
import tripAdviser.myPage.model.vo.MyPageComment;
import tripAdviser.travel.product.model.vo.TravelProduct;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;

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
	
	public Member selectId(String id) {
		conn = getConnection();
		Member m = dao.selectId(conn, id);
		close(conn);
		
		return m;
	}
	
	public int deleteMyComment(int commentNo) {
		int result = 0;
		conn = getConnection();
		result = dao.deleteMyComment(conn, commentNo);
		
		if(result > 0) {
			commit();
		}
		else {
			rollback();
		}
		
		return result;
	}

	public int updateMember(Member m) {
		Connection conn=getConnection();
		int result=new MyPageDao().updateMember(conn,m);
		if(result>0) {
			commit();
		}else {
			rollback();
		}
		close(conn);
		return result;
	}

	public Member selectOne(Member m) {
		Connection conn=getConnection();
		Member result=new MyPageDao().seletOne(conn,m);
		close(conn);
		return result;
	}

	public int updatePassword(Member m) {
		Connection conn=getConnection();
		int result=new MyPageDao().updatePassword(conn,m);
		if(result>0) {
			commit();
		}else {
			rollback();
		}
		close(conn);
		return result;
	}

	public int withMember(Member m) {
		Connection conn=getConnection();
		int result=new MyPageDao().withMember(conn,m);
		if(result>0) {
			commit();
		}else {
			rollback();
		}
		close(conn);
		return result;
	}

	public int updatePicture(Member m) {
		Connection conn=getConnection();
		int result=new MyPageDao().updatePicture(conn,m);
		if(result>0) {
			commit();
		}else {	
			rollback();
		}
		close(conn);
		return result;
	}

	public int deleteImage(Member m) {
		Connection conn=getConnection();
		int result=new MyPageDao().deleteImage(conn,m);
		if(result>0) {
			commit();
		}else {
			rollback();
		}
		close(conn);
		return result;
		
	}
}
