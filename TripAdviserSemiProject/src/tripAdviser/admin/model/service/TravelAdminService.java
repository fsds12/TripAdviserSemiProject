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
	
	public int selectAdminSearchCount(String type, String key) {
		Connection conn=getConnection();
		int cnt=new TravelAdminDao().selectAdminSearchCount(conn,type,key);
		close(conn);
		return cnt;
	}

	public List<TravelProduct> selectAdminSearch(String type, String key, int cPage, int numPerPage) {
		Connection conn=getConnection();
		List<TravelProduct> list=new TravelAdminDao().selectAdminSearch(conn,type,key,cPage, numPerPage);
		close(conn);
		return list;
	}

	

}
