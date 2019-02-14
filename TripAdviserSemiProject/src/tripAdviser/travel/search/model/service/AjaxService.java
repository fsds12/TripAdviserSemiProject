package tripAdviser.travel.search.model.service;

import java.sql.Connection;
import java.util.List;

import static common.JDBCTemplate.*;

import tripAdviser.travel.product.model.vo.TravelProduct;
import tripAdviser.travel.search.model.dao.AjaxDao;

public class AjaxService {

	public List<String> selectTitle(String search)
	{
		Connection conn=getConnection();
		List<String> list= new AjaxDao().selectTitle(conn, search);
		close(conn);
		return list;
	}
	
}
