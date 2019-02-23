package tripAdviser.board.QnA.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import tripAdviser.board.model.vo.Board;
import tripAdviser.board.model.vo.BoardAnswer;

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
	
	public List<Board> selectSearchQa(Connection conn, int cPage, int numPerPage, String type, String key){
		List<Board> list=new ArrayList();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=null;
		switch(type) {
		case "title": sql=prop.getProperty("selectSearchTitle"); break;
		case "user": sql=prop.getProperty("selectSearchUser");  break;
		case "content": sql=prop.getProperty("selectSearchContent"); break;
		}
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+key+"%");
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage+1);
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
	
	public int selectQaCount(Connection conn, String type, String key) {
		int result=0;
		String sql=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		switch(type) {
		case "title": sql=prop.getProperty("selectTitleCount"); break;
		case "user": sql=prop.getProperty("selectUserCount"); break;
		case "content": sql=prop.getProperty("selectContentCount"); break;
		}
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+key+"%");
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
	
	public int increHits(Connection conn, int boardNo) {
		int result=0;
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("increHits");
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
	
	public int insertComment(Connection conn, BoardAnswer ba) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertComment");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			result=pstmt.executeUpdate();
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public List<BoardAnswer> selectComment(Connection conn, int boardNo){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectComment");
		List<BoardAnswer> comment=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				BoardAnswer ba=new BoardAnswer();
				ba.setCommentNo(rs.getInt("comment_no"));
				ba.setBoardNoRef(rs.getInt("board_no_ref"));
				ba.setBoardContent(rs.getString("board_content"));
				ba.setMemberId(rs.getString("member_id"));
				ba.setCommentLevel(rs.getInt("comment_level"));
				ba.setCommentNoRef(rs.getInt("comment_no_ref"));
				ba.setBoardDate(rs.getDate("board_date"));
				
				comment.add(ba);
			}
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			close(rs);
			close(pstmt);
		}
		return comment;
	}
}
