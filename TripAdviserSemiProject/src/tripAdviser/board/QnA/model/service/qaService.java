package tripAdviser.board.QnA.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import tripAdviser.board.QnA.model.dao.qaDao;
import tripAdviser.board.model.vo.Board;
import tripAdviser.board.model.vo.BoardAnswer;

public class qaService {
	private qaDao dao=new qaDao();
	
	public List<Board> selectQaList(int cPage, int numPerPage){
		Connection conn=getConnection();
		List<Board> list=dao.selectQaList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}
	
	public int selectQaCount() {
		
		Connection conn=getConnection();
		int result=dao.selectQaCount(conn);
		close(conn);		
		return result;
	}
	
	
	public Board selectQaOne(int boardNo, boolean hasRead) {
		Connection conn=getConnection();
		Board b=dao.selectQaOne(conn, boardNo);
		if(b!=null&&!hasRead) {
			int result=dao.increHits(conn, boardNo);
			if(result>0) commit();
			else rollback();
		}
		close(conn);
		return b;
	}
	
	public Board selectQaOne(int boardNo) {
		Connection conn=getConnection();
		Board b=dao.selectQaOne(conn, boardNo);
		close(conn);
		return b;
	}
	
	public int insertQnA(Board b) {
		Connection conn=getConnection();
		int result=dao.insertQnA(conn, b);
		if(result>0) {
			commit();			
			result=dao.selectSeq(conn);			
		}else {
			rollback();
		}
		close(conn);
		return result;
	}
	
	public int updateQa(Board b) {
		Connection conn=getConnection();
		int result=dao.updateQa(conn, b);
		if(result>0)commit();
		else rollback();
		close(conn);
		return result;
	}
	
	public int deleteQa(int boardNo) {
		Connection conn=getConnection();
		int result=dao.deleteQa(conn, boardNo);
		if(result>0) commit();
		else rollback();
		close(conn);
		return result;
	}
	
	public List<Board> selectSearchQa(int cPage, int numPerPage, String type, String key){
		Connection conn=getConnection();
		List<Board> list=dao.selectSearchQa(conn, cPage, numPerPage, type, key);
		close(conn);
		return list;
	}
	
	public int selectQaCount(String type, String key) {
		Connection conn=getConnection();
		int result=dao.selectQaCount(conn, type, key);
		close(conn);
		return result;
	}
	
	public int insertComment(BoardAnswer ba) {
		Connection conn=getConnection();
		int result=dao.insertComment(conn, ba);
		if(result>0) commit();
		else rollback();
		close(conn);
		return result;
	}
	
	public List<BoardAnswer> selectComment(int boardNo){
		
		Connection conn=getConnection();
		List<BoardAnswer> comment=dao.selectComment(conn, boardNo);
		close(conn);
		return comment;
	}
	
	public int deleteComment(int commentNo) {
		
		Connection conn=getConnection();
		int result=dao.deleteComment(conn, commentNo);
		if(result>0) commit();
		else rollback();
		
		return result;
	}
	
	
}
