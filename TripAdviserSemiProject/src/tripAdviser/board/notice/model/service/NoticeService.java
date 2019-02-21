package tripAdviser.board.notice.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import tripAdviser.board.model.vo.Board;
import tripAdviser.board.notice.model.dao.NoticeDao;

public class NoticeService {
	private NoticeDao dao=new NoticeDao();
	
	public List<Board> selectNoticeList(int cPage, int numPerPage){
		Connection conn=getConnection();
		List<Board> list=dao.selectNoticeList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}
	
	public int insertNotice(Board b) {
		Connection conn=getConnection();
		int result=dao.insertNotice(conn, b);
		if(result>0) {
			commit();
			result=dao.selectSeq(conn);
		}else{
			rollback();
		}
		close(conn);
		return result;
	}
	
	public int selectNoticeCount() {
		
		Connection conn=getConnection();
		int result=dao.selectNoticeCount(conn);
		close(conn);
		return result;
	}
	
	/*public List<Board> selectSearchNotice(String type, String key){
		
		Connection conn=getConnection();
		List<Board> list=dao.selectSearchNotice(conn, type, key);
		close(conn);
		return list;
	}*/
	
	public int selectNoticeCount(String type, String key) {
		Connection conn=getConnection();
		int result=dao.selectNoticeCount(conn, type, key);
		close(conn);
		return result;
	}
	
	public List<Board> selectSearchNotice(int cPage, int numPerPage, String type, String key){
		Connection conn=getConnection();
		List<Board> list=dao.selectSearchNotice(conn, cPage, numPerPage, type, key);
		close(conn);
		return list;
	}
	public Board selectNoticeOne(int boardNo) {
		Connection conn=getConnection();
		Board b=dao.selectNoticeOne(conn, boardNo);		
		close(conn);
		return b;
	}
	
	public Board selectNoticeOne(int boardNo, boolean hasRead) {
		Connection conn=getConnection();
		Board b=dao.selectNoticeOne(conn, boardNo);
		if(b!=null && !hasRead) {
			int result=dao.increHits(conn, boardNo);
			if(result>0)commit();
			else rollback();
		}
		close(conn);
		return b;
	}
	
	public int updateNotice(Board b) {
		Connection conn=getConnection();
		int result=dao.updateNotice(conn, b);
		if(result>0) {
			commit();			
		}else {
			rollback();
		}
		close(conn);
		return result;
	}
	public int deleteNotice(int boardNo) {
		Connection conn=getConnection();
		int result=dao.deleteNotice(conn, boardNo);
		if(result>0) {commit();}
		else {rollback();}		
		close(conn);
		return result;
	}
	
	
}











