package tripAdviser.board.notice.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import static common.JDBCTemplate.close;
import tripAdviser.board.model.vo.NoticeBoard;

public class NoticeDao {
	
	private Properties prop=new Properties();
	
	public NoticeDao() {
		try {
			String fileName=NoticeDao.class.getResource("/sql/common/noticeboard-query.properties").getPath();
			prop.load(new FileReader(fileName));
		}catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public List<NoticeBoard> selectNoticeList(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectNoticeList");
		List<NoticeBoard> list=new ArrayList();
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				NoticeBoard n=new NoticeBoard();
				n.setBoardNo(rs.getInt("board_no"));
				n.setMemberId(rs.getString("member_id"));
				n.setTitle(rs.getString("title"));
				n.setContent(rs.getString("content"));
				n.setHits(rs.getInt("hits"));
				n.setBoardDate(rs.getDate("board_date"));
				
				list.add(n);
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
