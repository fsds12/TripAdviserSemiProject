package tripAdviser.admin.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

	public int selectAdminListCount(Connection conn, int trvNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int cnt=0;
		String sql=prop.getProperty("selectAdminListCount");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, trvNo);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				cnt=rs.getInt(1);
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

	public TravelProduct selectAdminList(Connection conn, int trvNo, int cPage, int numPerPage) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		TravelProduct tp=null;
		String sql=prop.getProperty("selectAdminList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, trvNo);
			rs=pstmt.executeQuery();
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

