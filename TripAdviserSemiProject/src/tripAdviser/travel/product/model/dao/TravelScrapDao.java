package tripAdviser.travel.product.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

public class TravelScrapDao {
	private PreparedStatement pstmt;
	private String sql = "";
	private Properties prop = new Properties();
	
	{
		String filePath = TravelProductDetailDao.class.getResource("/sql/travel/travelProduct.properties").getPath();
		try {
			prop.load(new FileReader(filePath));
		}
		catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertScrap(Connection conn, int trvNo, String memberId) {
		int result = 0;
		sql = prop.getProperty("insertScrap");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setInt(2, trvNo);
			
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
	
	public int deleteScrap(Connection conn, int trvNo, String memberId) {
		int result = 0;
		sql = prop.getProperty("deleteScrap");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setInt(2, trvNo);
			
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

}
