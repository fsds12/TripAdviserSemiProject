package tripAdviser.travel.search.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import tripAdviser.travel.product.model.vo.TravelProduct;
import tripAdviser.travel.search.model.service.travelSearchService;
import static common.JDBCTemplate.*;


public class travelSearchDao {
	private Properties prop = new Properties();

	public travelSearchDao() {

		try {
			String fileName = travelSearchDao.class.getResource("search-query.properties").getPath();
			prop.load(new FileReader(fileName));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public double getStarAve(Connection conn, int trvNo)
	{
		double StarAve=0.0;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		String sql= prop.getProperty("getStarRate");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,trvNo);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				StarAve=(rs.getDouble(1));
			}
			
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
			
		return StarAve;
	}
	
	
	public List<TravelProduct> travelSearchAll(Connection conn) {
	
		List<TravelProduct> list = new ArrayList<TravelProduct>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectProductAll");
		try {
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			 
			while (rs.next()) {
				double aveStarRate = new travelSearchService().getStarAve(rs.getInt("trv_No"));
				TravelProduct tp=new TravelProduct();
				tp.setTrvNo(rs.getInt("trv_No"));
				tp.setTrvTitle(rs.getString("trv_Title"));
				tp.setTrvRepresentPic(rs.getString("trv_Represent_Pic"));
				tp.setTrvProvince(rs.getString("trv_Province"));
				tp.setTrvCity(rs.getString("trv_city"));
				tp.setTrvAddress(rs.getString("trv_address"));
				tp.setTrvDateStart(rs.getDate("trv_date_start"));
				tp.setTrvDateEnd(rs.getDate("trv_date_end"));
				tp.setTrvReview(rs.getString("trv_review"));
				tp.setTrvSmallCtg(rs.getString("trv_small_ctg_code"));
				tp.setTrvGps(rs.getString("trv_gps"));
				tp.setTrvDate(rs.getDate("trv_write_date"));
				tp.setMemberId(rs.getString("member_id"));
				tp.setAvgStarRate(aveStarRate);
				list.add(tp);
								
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return list;

	}

	public List<TravelProduct> travelSearchCt(Connection conn, int categoryNo) {
		
		List<TravelProduct> list = new ArrayList<TravelProduct>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		switch(categoryNo)
		{
		case 0:sql=prop.getProperty("selectProductCT0");break;//전체베스트
		case 1:sql=prop.getProperty("selectProductCT1");break;//휴식거리 베스트
		case 2:sql=prop.getProperty("selectProductCT2");break;//즐길거리베스트
		case 3:sql=prop.getProperty("selectProductCT3");break;//먹을거리베스트
		case 4:sql=prop.getProperty("selectProduct1");break;//호텔베스트
		case 5:sql=prop.getProperty("selectProduct2");break;//게스트하우스베스트
		case 6:sql=prop.getProperty("selectProduct3");break;//템플스테이베스트
		case 7:sql=prop.getProperty("selectProduct4");break;//볼거리베스트
		case 8:sql=prop.getProperty("selectProduct5");break;//놀거리베스트
		case 9:sql=prop.getProperty("selectProduct6");break;//정식베스트
		case 10:sql=prop.getProperty("selectProduct7");break;//향토음식베스트
		case 11:sql=prop.getProperty("selectProduct8");break;//길거리음식베스트
	    default:sql=prop.getProperty("selectProductAll");break;
		}
		try {
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			 
			while (rs.next()) {
				double aveStarRate = 0.0;
				if(rs.getString("point")!=null)
				{
					aveStarRate = rs.getDouble("point");
				}		
				TravelProduct tp=new TravelProduct();
				tp.setTrvNo(rs.getInt("trv_No"));
				tp.setTrvTitle(rs.getString("trv_Title"));
				tp.setTrvRepresentPic(rs.getString("trv_Represent_Pic"));
				tp.setTrvProvince(rs.getString("trv_Province"));
				tp.setTrvCity(rs.getString("trv_city"));
				tp.setTrvAddress(rs.getString("trv_address"));
				tp.setAvgStarRate(aveStarRate);
				list.add(tp);
								
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return list;

	}

	public List<TravelProduct> traveltop(Connection conn, String searchkey) {
	      
	      List<TravelProduct> toplist = new ArrayList<TravelProduct>();
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = prop.getProperty("selectTop");
	      try {
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, "%"+searchkey+"%");
	         pstmt.setString(2, "%"+searchkey+"%");
	         pstmt.setString(3, "%"+searchkey+"%");
	         rs=pstmt.executeQuery();
	         
	          
	         while (rs.next()) {	         
	            TravelProduct top=new TravelProduct();
	            top.setTrvNo(rs.getInt("trv_No"));
	               top.setTrvTitle(rs.getString("trv_Title"));
	               top.setTrvRepresentPic(rs.getString("trv_Represent_Pic"));
	               top.setTrvProvince(rs.getString("trv_Province"));
	               top.setTrvCity(rs.getString("trv_city"));
	               top.setTrvAddress(rs.getString("trv_address"));
	               top.setTrvDateStart(rs.getDate("trv_date_start"));
	               top.setTrvDateEnd(rs.getDate("trv_date_end"));
	               top.setTrvReview(rs.getString("trv_review"));
	               top.setTrvSmallCtg(rs.getString("trv_small_ctg_code"));
	               top.setTrvGps(rs.getString("trv_gps"));
	               top.setTrvDate(rs.getDate("trv_write_date"));
	               top.setMemberId(rs.getString("member_id"));
	               top.setAvgStarRate(Math.floor(rs.getDouble("rate")*10)/10);
	            toplist.add(top);	           
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         try {
	            rs.close();
	            pstmt.close();
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	      }

	      return toplist;

	   }
	   
	   
	   public List<TravelProduct> travelSearchSleepAll(Connection conn, String searchkey) {
	      
	      List<TravelProduct> sleepList = new ArrayList<TravelProduct>();
	      PreparedStatement pstmt=null;
	      ResultSet rs = null;
	      String sql=prop.getProperty("sleepList");
	      try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, "%"+searchkey+"%");
	            pstmt.setString(2, "%"+searchkey+"%");
	            pstmt.setString(3, "%"+searchkey+"%");
	            rs=pstmt.executeQuery();
	         
	         while (rs.next()) {	            
	            TravelProduct sl=new TravelProduct();
	               sl.setTrvNo(rs.getInt("trv_No"));
	               sl.setTrvTitle(rs.getString("trv_Title"));
	               sl.setTrvRepresentPic(rs.getString("trv_Represent_Pic"));
	               sl.setTrvProvince(rs.getString("trv_Province"));
	               sl.setTrvCity(rs.getString("trv_city"));
	               sl.setTrvAddress(rs.getString("trv_address"));
	               sl.setTrvDateStart(rs.getDate("trv_date_start"));
	               sl.setTrvDateEnd(rs.getDate("trv_date_end"));
	               sl.setTrvReview(rs.getString("trv_review"));
	               sl.setTrvSmallCtg(rs.getString("trv_small_ctg_code"));
	               sl.setTrvGps(rs.getString("trv_gps"));
	               sl.setTrvDate(rs.getDate("trv_write_date"));
	               sl.setMemberId(rs.getString("member_id"));
	               sl.setAvgStarRate(Math.floor(rs.getDouble("rate")*10)/10);
	            sleepList.add(sl);
	            
	         }
	      }catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         try {
	            rs.close();
	            pstmt.close();
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	      }

	      return sleepList;

	      
	   }
	   
	   public List<TravelProduct> travelSearchActivityAll(Connection conn, String searchkey) {
	      
	      List<TravelProduct> acList = new ArrayList<TravelProduct>(); 
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      String sql=prop.getProperty("acList");
	      try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, "%"+searchkey+"%");
	            pstmt.setString(2, "%"+searchkey+"%");
	            pstmt.setString(3, "%"+searchkey+"%");
	            rs=pstmt.executeQuery();
	         
	         while (rs.next()) {	        
	         TravelProduct ac = new TravelProduct();
	         ac.setTrvNo(rs.getInt("trv_No"));
	            ac.setTrvTitle(rs.getString("trv_Title"));
	            ac.setTrvRepresentPic(rs.getString("trv_Represent_Pic"));
	            ac.setTrvProvince(rs.getString("trv_Province"));
	            ac.setTrvCity(rs.getString("trv_city"));
	            ac.setTrvAddress(rs.getString("trv_address"));
	            ac.setTrvDateStart(rs.getDate("trv_date_start"));
	            ac.setTrvDateEnd(rs.getDate("trv_date_end"));
	            ac.setTrvReview(rs.getString("trv_review"));
	            ac.setTrvSmallCtg(rs.getString("trv_small_ctg_code"));
	            ac.setTrvGps(rs.getString("trv_gps"));
	            ac.setTrvDate(rs.getDate("trv_write_date"));
	            ac.setMemberId(rs.getString("member_id"));
	            ac.setAvgStarRate(Math.floor(rs.getDouble("rate")*10)/10);
	         acList.add(ac);
	         }
	         
	      }catch(SQLException e) {
	         e.printStackTrace();
	      }finally {
	         try {
	         rs.close();
	         pstmt.close();
	         }catch(Exception e) {
	            e.printStackTrace();
	         }
	      }
	      return acList;
	      
	   }
	   
	   
	   
	   public List<TravelProduct> travelSearchEatAll(Connection conn, String searchkey){
	      List<TravelProduct> eatList = new ArrayList<TravelProduct>(); 
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      String sql=prop.getProperty("eatList");
	      try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, "%"+searchkey+"%");
	            pstmt.setString(2, "%"+searchkey+"%");
	            pstmt.setString(3, "%"+searchkey+"%");
	            rs=pstmt.executeQuery();
	         
	         while (rs.next()) {
	         TravelProduct ea = new TravelProduct();
	         ea.setTrvNo(rs.getInt("trv_No"));
	            ea.setTrvTitle(rs.getString("trv_Title"));
	            ea.setTrvRepresentPic(rs.getString("trv_Represent_Pic"));
	            ea.setTrvProvince(rs.getString("trv_Province"));
	            ea.setTrvCity(rs.getString("trv_city"));
	            ea.setTrvAddress(rs.getString("trv_address"));
	            ea.setTrvDateStart(rs.getDate("trv_date_start"));
	            ea.setTrvDateEnd(rs.getDate("trv_date_end"));
	            ea.setTrvReview(rs.getString("trv_review"));
	            ea.setTrvSmallCtg(rs.getString("trv_small_ctg_code"));
	            ea.setTrvGps(rs.getString("trv_gps"));
	            ea.setTrvDate(rs.getDate("trv_write_date"));
	            ea.setMemberId(rs.getString("member_id"));     
	            ea.setAvgStarRate(Math.floor(rs.getDouble("rate")*10)/10);     
	         eatList.add(ea);
	         }
	         
	      }catch(SQLException e) {
	         e.printStackTrace();
	      }finally {
	         try {
	         rs.close();
	         pstmt.close();
	         }catch(Exception e) {
	            e.printStackTrace();
	         }
	      }
	      return eatList;
	      
	   }
	   
	   public int selectCountAll(Connection conn, String category, String searchkey) {
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      int result=0;
	      String sql=prop.getProperty("selectCount");
	      try {
	         pstmt=conn.prepareStatement(sql);
	         pstmt.setString(1, "%"+category+"%");
	         pstmt.setString(2, "%"+searchkey+"%");
	         pstmt.setString(3, "%"+searchkey+"%");
	         pstmt.setString(4, "%"+searchkey+"%");
	         
	         rs=pstmt.executeQuery();
	         if(rs.next()) {
	            result=rs.getInt(1);
	         }
	      }catch(SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(rs);
	         close(pstmt);
	      }
	      return result;
	   }
	   
	   
	   
	   public List<TravelProduct> travelDedailSearchCategoryAll(Connection conn,String category, String searchkey, int cPage, int numPerPage) {
	      List<TravelProduct> list = new ArrayList<TravelProduct>();
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = prop.getProperty("categoryAll");
	    
	      try {
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, "%"+category+"%");
	         pstmt.setString(2, "%"+searchkey+"%");
	         pstmt.setString(3, "%"+searchkey+"%");
	         pstmt.setString(4, "%"+searchkey+"%");
	         pstmt.setInt(5, (cPage-1)*numPerPage+1);
	         pstmt.setInt(6, cPage*numPerPage);
	         rs=pstmt.executeQuery();

	                   
	         while (rs.next()) {	            
	            TravelProduct cate=new TravelProduct();
	            cate.setTrvNo(rs.getInt("trv_No"));
	            cate.setTrvTitle(rs.getString("trv_Title"));
	            cate.setTrvRepresentPic(rs.getString("trv_Represent_Pic"));
	            cate.setTrvProvince(rs.getString("trv_Province"));
	            cate.setTrvCity(rs.getString("trv_city"));
	            cate.setTrvAddress(rs.getString("trv_address"));
	            cate.setTrvDateStart(rs.getDate("trv_date_start"));
	            cate.setTrvDateEnd(rs.getDate("trv_date_end"));
	            cate.setTrvReview(rs.getString("trv_review"));
	            cate.setTrvSmallCtg(rs.getString("trv_small_ctg_code"));
	            cate.setTrvLargeCtg(rs.getString("trv_ctg_large_name"));
	            cate.setTrvGps(rs.getString("trv_gps"));
	            cate.setTrvDate(rs.getDate("trv_write_date"));
	            cate.setMemberId(rs.getString("member_id"));
	            cate.setAvgStarRate(Math.floor(rs.getDouble("rate")*10)/10);
	            list.add(cate);
	            
	            
	                        
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         try {
	            rs.close();
	            pstmt.close();
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	      }

	      return list;

	   
	   }

}
