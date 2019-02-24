package tripAdviser.admin.model.dao;

import java.io.FileReader;
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
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;

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
		List<String> urlList=new ArrayList<String>();
		
		
		String sql=prop.getProperty("insertAdmin");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, tp.getTrvTitle());
			pstmt.setString(2, tp.getTrvRepresentPic());
			pstmt.setString(3, tp.getTrvProvince());
			pstmt.setString(4, tp.getTrvCity());
			pstmt.setString(5, tp.getTrvAddress());
			pstmt.setString(6, tp.getTrvReview());
			
			
			result=pstmt.executeUpdate();
			
			if(result>0)
			{
				commit();
			}
			else
			{
				rollback();
			}
			
		
			close(rs);
			close(pstmt);
			
			
			sql = prop.getProperty("selectpicSeq");
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				tp.setTrvNo(rs.getInt(1));
				
			}
		
			
			close(rs);
			close(pstmt);
			
			
			
			
			
			sql=prop.getProperty("insertImage");
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, tp.getTrvNo());
			for(int i=0; i<urlList.size(); i++) {
			   pstmt.setString(2, urlList.get(i));
			   int resultAlbum = pstmt.executeUpdate();
			   System.out.println(resultAlbum);
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
				/*tp.setTrvLargeCtg(trvLargeCtg);
				tp.setTrvSmallCtg(trvSmallCtg);*/	//카테고리 테이블에서 조인하여 불러올것  
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
			pstmt.setString(2, tp.getTrvProvince());
			pstmt.setString(3, tp.getTrvCity());
			pstmt.setString(4, tp.getTrvAddress());
			pstmt.setDate(5,  (Date) tp.getTrvDateStart());
			pstmt.setDate(6,  (Date) tp.getTrvDateEnd());
			pstmt.setString(7, tp.getTrvReview());
			/*pstmt.setInt(8, tp.getTrvNo());*/
			
			result=pstmt.executeUpdate();
			
			close(rs);
			close(pstmt);
			
			sql=prop.getProperty("insertImage");
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, tp.getTrvNo());
			for(int i=0; i<urlList.size(); i++) {
			   pstmt.setString(2, urlList.get(i));
			   result = pstmt.executeUpdate();
			}

			
			
			close(rs);
			close(pstmt);
			
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

	public int deleteAdmin(Connection conn) {
		PreparedStatement pstmt=null;
		
		int result=0;
		String sql=prop.getProperty("deleteAdmin");
		try {
			pstmt=conn.prepareStatement(sql);
			/*pstmt.setInt(1, trvNo);*/
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

	
	

}

