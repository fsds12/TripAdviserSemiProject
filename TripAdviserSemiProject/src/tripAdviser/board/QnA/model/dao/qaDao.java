package tripAdviser.board.QnA.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import tripAdviser.board.model.vo.Board;
import static common.JDBCTemplate.close;

public class qaDao {
	private Properties prop=new Properties();
	
	public qaDao() {
		try {
			String fileName=qaDao.class.getResource("/sql/common/qaboard-query.properties").getPath();
			prop.load(new FileReader(fileName));
		}catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public List<Board> selectQaList(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectQaList");
		List<Board> list=new ArrayList();
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Board b=new Board();
				b.setBoardNo(rs.getInt("board_no"));
				b.setMemberId(rs.getString("member_id"));
				b.setTitle(rs.getString("title"));
				b.setContent(rs.getString("content"));
				b.setHits(rs.getInt("hits"));
				b.setBoardDate(rs.getDate("board_date"));
				
				list.add(b);
			}
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
}
