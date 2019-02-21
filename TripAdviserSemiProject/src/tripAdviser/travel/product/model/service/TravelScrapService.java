package tripAdviser.travel.product.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;

import tripAdviser.travel.product.model.dao.TravelScrapDao;

public class TravelScrapService {
	private Connection conn = null;
	private TravelScrapDao dao = new TravelScrapDao();
	
	public int insertScrap(int trvNo, String memberId) {
		conn = getConnection();
		int result = dao.insertScrap(conn, trvNo, memberId);
		
		if(result > 0) {
			commit();
		}
		else {
			rollback();
		}
		
		close(conn);
		return result;
	}
	
	public int deleteScrap(int trvNo, String memberId) {
		conn = getConnection();
		int result = dao.deleteScrap(conn, trvNo, memberId);
		
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
