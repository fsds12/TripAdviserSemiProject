package tripAdviser.myPage.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

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
}
