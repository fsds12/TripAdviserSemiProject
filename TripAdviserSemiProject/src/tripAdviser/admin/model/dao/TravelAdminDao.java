package tripAdviser.admin.model.dao;

import java.io.FileReader;
import java.sql.Array;
import java.sql.Connection;
import java.sql.Date;
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
		List<TravelProduct> list= new ArrayList();
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
				/*tp.setTrvLargeCtg(trvLargeCtg);
				tp.setTrvSmallCtg(trvSmallCtg);*/	//카테고리 테이블에서 조인하여 불러올것  
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
		List<TravelProduct> list=new ArrayList();
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
				/*tp.setTrvLargeCtg(trvLargeCtg);
				tp.setTrvSmallCtg(trvSmallCtg);*/	//카테고리 테이블에서 조인하여 불러올것  
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
			pstmt.setString(2, tp.getTrvCity());
			pstmt.setString(3, tp.getTrvAddress());
			pstmt.setDate(4, (Date) tp.getTrvDateStart());
			pstmt.setDate(5, (Date) tp.getTrvDateEnd());
			pstmt.setString(6, tp.getTrvRepresentPic());
			pstmt.setArray(7, (Array) tp.getAlbumUrls());
			pstmt.setArray(8, (Array) tp.getAlbumUrls());
			pstmt.setArray(9, (Array) tp.getAlbumUrls());
			pstmt.setString(10, tp.getTrvReview());
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

	

}

