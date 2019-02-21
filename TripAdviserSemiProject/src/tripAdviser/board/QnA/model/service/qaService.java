package tripAdviser.board.QnA.model.service;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;
import java.sql.Connection;
import java.util.List;

import tripAdviser.board.QnA.model.dao.qaDao;
import tripAdviser.board.model.vo.Board;

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
}
