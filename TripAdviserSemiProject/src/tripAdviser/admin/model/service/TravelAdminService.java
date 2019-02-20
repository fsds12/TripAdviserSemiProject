package tripAdviser.admin.model.service;

import java.sql.Connection;
import java.util.List;

import tripAdviser.admin.model.dao.TravelAdminDao;
import tripAdviser.travel.product.model.vo.TravelProduct;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;

public class TravelAdminService {

	public int selectAdminListCount() {
		Connection conn=getConnection();
		int cnt=new TravelAdminDao().selectAdminListCount(conn);
		close(conn);
		return cnt;
	}

	public List<TravelProduct> selectAdminList(int cPage, int numPerPage) {
		Connection conn=getConnection();
		List<TravelProduct> list=new TravelAdminDao().selectAdminList(conn,cPage, numPerPage);
		close(conn);
		return list;
	}

	

}
