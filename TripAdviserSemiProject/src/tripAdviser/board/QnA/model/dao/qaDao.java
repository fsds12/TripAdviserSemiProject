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
	
	public List<Board> selectQaList(Connection conn, int cPage, int numPerPage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectQaList");
		List<Board> list=new ArrayList();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
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
	
	public int selectQaCount(Connection conn) {
		
		ResultSet rs=null;
		int result=0;
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("selectQaCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt("cnt");
			}
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertQnA(Connection conn, Board b) {
		String sql=prop.getProperty("insertQA");
		int result=0;
		PreparedStatement pstmt=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, b.getMemberId());
			pstmt.setString(2, b.getTitle());
			pstmt.setString(3, b.getContent());
			result=pstmt.executeUpdate();
			
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int selectSeq(Connection conn) {
		String sql=prop.getProperty("selectSeq");
		ResultSet rs=null;
		int result=0;
		PreparedStatement pstmt=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			
		}
		return result;
	}
	
	public Board selectQaOne(Connection conn, int boardNo) {
		String sql=prop.getProperty("selectQaOne");
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		Board b=null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				b=new Board();
				b.setBoardNo(rs.getInt("board_no"));
				b.setMemberId(rs.getString("member_id"));
				b.setTitle(rs.getString("title"));
				b.setContent(rs.getString("content"));
				b.setHits(rs.getInt("hits"));
				b.setBoardDate(rs.getDate("board_date"));
			}
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			close(rs);
			close(pstmt);
		}
		return b;
	}
	
	public int updateQa(Connection conn, Board b) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("updateQa");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, b.getMemberId());
			pstmt.setString(2, b.getTitle());
			pstmt.setString(3, b.getContent());
			pstmt.setInt(4, b.getBoardNo());
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteQa(Connection conn, int boardNo) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("deleteQa");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			result=pstmt.executeUpdate();
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			close(pstmt);
		}
		return result;
	}
}
