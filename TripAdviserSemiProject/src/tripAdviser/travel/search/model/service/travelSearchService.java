package tripAdviser.travel.search.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import tripAdviser.travel.product.model.vo.TravelProduct;
import tripAdviser.travel.search.model.dao.travelSearchDao;

public class travelSearchService {
	
	public List<TravelProduct> travelSearchCt(int categoryNo)
	{
		Connection conn=getConnection();
		List<TravelProduct> list= new travelSearchDao().travelSearchCt(conn, categoryNo);
		close(conn);
		return list;
	}
	
	
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
	
	//검색어top3
	   public List<TravelProduct> traveltop(String searchkey)
	   {
	      Connection conn=getConnection();
	      List<TravelProduct> toplist= new travelSearchDao().traveltop(conn, searchkey);
	      close(conn);
	      //System.out.println(list);
	      return toplist;
	   }

	   //숙박top3
	   public List<TravelProduct> travelSearchSleepAll(String searchkey) {
	      
	      Connection conn=getConnection();
	      List<TravelProduct> sleepList= new travelSearchDao().travelSearchSleepAll(conn, searchkey);
	      close(conn);
	      return sleepList;
	   }
	   
	   //액티비티top3
	   public List<TravelProduct> travelSearchActivityAll(String searchkey) {
	      Connection conn=getConnection();
	      List<TravelProduct> acList= new travelSearchDao().travelSearchActivityAll(conn, searchkey);
	      close(conn);
	      return acList;
	   }
	   
	   //맛집top3
	   public List<TravelProduct> travelSearchEatAll(String searchkey){
	      Connection conn = getConnection();
	      List<TravelProduct> eatList = new travelSearchDao().travelSearchEatAll(conn, searchkey);
	      close(conn);
	      return eatList;
	   }
	   //전체페이지
	   public int selectCountAll(String category, String searchkey ) {
	      Connection conn = getConnection();
	      int result = new travelSearchDao().selectCountAll(conn, category, searchkey);
	      close(conn);
	      return result;
	   }

	   public List travelDedailSearchCategoryAll(String category, String searchkey, int cPage, int numPerPage) {
	      Connection conn = getConnection();
	      List<TravelProduct>list = new travelSearchDao().travelDedailSearchCategoryAll(conn, category, searchkey, cPage, numPerPage);
	      close(conn);
	      return list;
	   }
	
}
