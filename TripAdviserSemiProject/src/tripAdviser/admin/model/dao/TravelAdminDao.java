package tripAdviser.admin.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import tripAdviser.travel.product.model.vo.TravelProduct;

import static common.JDBCTemplate.close;

public class TravelAdminDao {
	
	private Properties prop=new Properties();
	
	public TravelAdminDao() {
		try {
			String fileName=TravelAdminDao.class.getResource("/sql/common/admin-query.properties").getPath();
			prop.load(new FileReader(fileName));
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

	}

	public int selectAdminListCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int cnt=0;
		String sql=prop.getProperty("selectAdminListCount");
		try {
			pstmt=conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				cnt=rs.getInt("cnt");
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		
		return cnt;
	}

	public List<TravelProduct> selectAdminList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<TravelProduct> list= new ArrayList<TravelProduct>();
		String sql=prop.getProperty("selectAdminList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1) * numPerPage + 1);
			pstmt.setInt(2, cPage * numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				TravelProduct tp=new TravelProduct();
				
				
				
				tp.setTrvNo(rs.getInt("trv_no"));
				tp.setTrvTitle(rs.getString("trv_title"));
				tp.setTrvRepresentPic(rs.getString("trv_represent_pic"));
				tp.setTrvProvince(rs.getString("trv_province"));
				tp.setTrvCity(rs.getString("trv_city"));
				tp.setTrvAddress(rs.getString("trv_address"));
				tp.setTrvDateStart(rs.getDate("trv_date_start"));
				tp.setTrvDateEnd(rs.getDate("trv_date_end"));
				tp.setTrvReview(rs.getString("trv_review"));
				tp.setTrvSmallCtg(rs.getString("trv_small_ctg_code"));
				tp.setTrvGps(rs.getString("trv_gps"));
				tp.setTrvDate(rs.getDate("trv_write_date"));
				tp.setMemberId(rs.getString("member_id"));
				tp.setHits(rs.getInt("trv_hits"));
				list.add(tp);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public int selectAdminSearchCount(Connection conn, String type, String key) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int cnt=0;
		String sql="";
		if("memberId".equals(type))
		{
			sql=prop.getProperty("selectAdminSearchCount");
		}
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+key+"%");
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				cnt=rs.getInt("cnt");
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		
		return cnt;
		
	}

	public List<TravelProduct> selectAdminSearch(Connection conn, String type, String key, int cPage, int numPerPage) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<TravelProduct> list=new ArrayList<TravelProduct>();
		String sql="";
		if("memberId".equals(type))
		{
			sql=prop.getProperty("selectAdminSearch");
		}
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+key+"%");
			pstmt.setInt(2, (cPage-1) * numPerPage + 1);
			pstmt.setInt(3, cPage * numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				TravelProduct tp=new TravelProduct();
				
				
				tp.setTrvNo(rs.getInt("trv_no"));
				tp.setTrvTitle(rs.getString("trv_title"));
				tp.setTrvRepresentPic(rs.getString("trv_represent_pic"));
				tp.setTrvProvince(rs.getString("trv_province"));
				tp.setTrvCity(rs.getString("trv_city"));
				tp.setTrvAddress(rs.getString("trv_address"));
				tp.setTrvDateStart(rs.getDate("trv_date_start"));
				tp.setTrvDateEnd(rs.getDate("trv_date_end"));
				tp.setTrvReview(rs.getString("trv_review"));
				tp.setTrvSmallCtg(rs.getString("trv_small_ctg_code"));
				tp.setTrvGps(rs.getString("trv_gps"));
				tp.setTrvDate(rs.getDate("trv_write_date"));
				tp.setMemberId(rs.getString("member_id"));
				tp.setHits(rs.getInt("trv_hits"));
				list.add(tp);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public int insertAdmin(Connection conn, TravelProduct tp) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		
		
		String sql=prop.getProperty("insertAdmin");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, tp.getTrvTitle());
			pstmt.setString(2, tp.getTrvRepresentPic());
			pstmt.setString(3, tp.getTrvProvince());
			pstmt.setString(4, tp.getTrvCity());
			pstmt.setString(5, tp.getTrvAddress());
			pstmt.setString(6, tp.getTrvReview());
			pstmt.setString(7, tp.getTrvSmallCtg());
			
			
			result=pstmt.executeUpdate();
			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		
		
		return result;
	}
	
	public int getTrvNo(Connection conn) {
		String sql = prop.getProperty("selectpicSeq");
		int trvNo = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				trvNo = rs.getInt(1);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		return trvNo;
	}

	public int insertAlbumUrls(Connection conn, int trvNo, String urls) {
		String sql = prop.getProperty("insertImage");
		int result = 0;
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, trvNo);
			pstmt.setString(2, urls);
			
			result = pstmt.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		return result;
	}
	
	public TravelProduct selectNo(Connection conn, int no) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		TravelProduct tp=null;
		String sql=prop.getProperty("selectNo");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				tp=new TravelProduct();
				
				tp.setTrvNo(rs.getInt("trv_no"));
				tp.setTrvTitle(rs.getString("trv_title"));
				tp.setTrvRepresentPic(rs.getString("trv_represent_pic"));
				tp.setTrvProvince(rs.getString("trv_province"));
				tp.setTrvCity(rs.getString("trv_city"));
				tp.setTrvAddress(rs.getString("trv_address"));
				tp.setTrvDateStart(rs.getDate("trv_date_start"));
				tp.setTrvDateEnd(rs.getDate("trv_date_end"));
				tp.setTrvReview(rs.getString("trv_review"));
				tp.setTrvSmallCtg(rs.getString("trv_small_ctg_code"));
				tp.setTrvGps(rs.getString("trv_gps"));
				tp.setTrvDate(rs.getDate("trv_write_date"));
				tp.setMemberId(rs.getString("member_id"));
				tp.setHits(rs.getInt("trv_hits"));
				
				
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		
		return tp;
	}

	public int updateAdmin(Connection conn, TravelProduct tp) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		List<String> urlList=new ArrayList<String>();
		String sql=prop.getProperty("updateAdmin");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, tp.getTrvTitle());
			pstmt.setString(2, tp.getTrvRepresentPic());
			pstmt.setString(3, tp.getTrvProvince());
			pstmt.setString(4, tp.getTrvCity());
			pstmt.setString(5, tp.getTrvAddress());
			pstmt.setString(6, tp.getTrvReview());
			pstmt.setString(7, tp.getTrvSmallCtg());
			pstmt.setInt(8, tp.getTrvNo());
			
			result=pstmt.executeUpdate();
			
			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		
		
		return result;
	}

	public int deleteAdmin(Connection conn,int trvNo) {
		PreparedStatement pstmt=null;
		
		int result=0;
		String sql=prop.getProperty("deleteAdmin");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, trvNo);
			result=pstmt.executeUpdate();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteTravelInfo(Connection conn, int trvNo) {
	      PreparedStatement pstmt=null;
	      
	      int result=0;
	      String sql=prop.getProperty("deleteTravelInfo");
	      try {
	         pstmt=conn.prepareStatement(sql);
	         pstmt.setInt(1, trvNo);
	         result=pstmt.executeUpdate();
	      }
	      catch(SQLException e)
	      {
	         e.printStackTrace();
	      }
	      
	      finally {
	         close(pstmt);
	      }
	      
	      return result;
	   }



	public int deleteAlbumUrls(Connection conn, TravelProduct tp) {
		String sql = prop.getProperty("deleteAdmin");
		int result = 0;
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tp.getTrvNo());
			
			result = pstmt.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		return result;
	}

	public TravelProduct selectAdmin(Connection conn,int trvNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		TravelProduct tp=null;
		String sql=prop.getProperty("selectAdmin");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, trvNo);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				tp=new TravelProduct();
				
				tp.setTrvNo(rs.getInt("trv_no"));
				tp.setTrvTitle(rs.getString("trv_title"));
				tp.setTrvRepresentPic(rs.getString("trv_represent_pic"));
				tp.setTrvProvince(rs.getString("trv_province"));
				tp.setTrvCity(rs.getString("trv_city"));
				tp.setTrvAddress(rs.getString("trv_address"));
				tp.setTrvDateStart(rs.getDate("trv_date_start"));
				tp.setTrvDateEnd(rs.getDate("trv_date_end"));
				tp.setTrvReview(rs.getString("trv_review"));
				tp.setTrvSmallCtg(rs.getString("trv_small_ctg_code"));
				tp.setTrvGps(rs.getString("trv_gps"));
				tp.setTrvDate(rs.getDate("trv_write_date"));
				tp.setMemberId(rs.getString("member_id"));
				tp.setHits(rs.getInt("trv_hits"));
				
				
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		
		return tp;
	}
	

}

