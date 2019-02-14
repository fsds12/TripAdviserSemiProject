package tripAdviser.travel.search.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import tripAdviser.travel.product.model.vo.TravelProduct;
import tripAdviser.travel.search.model.dao.travelSearchDao;

public class travelSearchService {
	
	public List<TravelProduct> travelSearchAll()
	{
		Connection conn=getConnection();
		List<TravelProduct> list= new travelSearchDao().travelSearchAll(conn);
		close(conn);
		return list;
	}
	
	public double getStarAve(int trvNo)
	{
		Connection conn=getConnection();
		double StarAve=new travelSearchDao().getStarAve(conn, trvNo);
		
		return StarAve;
	}
	
}
