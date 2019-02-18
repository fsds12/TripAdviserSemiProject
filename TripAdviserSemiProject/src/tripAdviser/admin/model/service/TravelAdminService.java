package tripAdviser.admin.model.service;

import java.sql.Connection;

import tripAdviser.admin.model.dao.TravelAdminDao;
import tripAdviser.travel.product.model.vo.TravelProduct;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;

public class TravelAdminService {

	public int selectAdminListCount(int trvNo) {
		Connection conn=getConnection();
		int cnt=new TravelAdminDao().selectAdminListCount(conn,trvNo);
		close(conn);
		return cnt;
	}

	public TravelProduct selectAdminList(int trvNo, int cPage, int numPerPage) {
		Connection conn=getConnection();
		TravelProduct tp=new TravelAdminDao().selectAdminList(conn, trvNo, cPage, numPerPage);
		close(conn);
		return tp;
	}

}
