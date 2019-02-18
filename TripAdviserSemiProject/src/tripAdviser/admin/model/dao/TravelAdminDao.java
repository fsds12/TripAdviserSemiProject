package tripAdviser.admin.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import static common.JDBCTemplate.close;

public class TravelAdminDao {
	
	private Properties prop=new Properties();
	
	public TravelAdminDao() {
		try {
			String fileName=TravelAdminDao.class.getResource("admin-query.properties").getPath();
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

}

