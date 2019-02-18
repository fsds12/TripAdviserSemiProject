package tripAdviser.travel.product.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import tripAdviser.member.model.vo.Comment;

public class TravelProductCommentDao {
	private PreparedStatement pstmt;
	private ResultSet rs;
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
	
	public int insertComment(Connection conn, Comment c) {
		int result = 0;
		sql = prop.getProperty("insertComment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getTrvNo());
			pstmt.setString(2, c.getMemberId());
			pstmt.setInt(3, c.getTrvEvaluation());
			pstmt.setString(4, c.getCommentContent());
			
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
