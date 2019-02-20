package tripAdviser.board.QnA.model.service;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;
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
	
}
