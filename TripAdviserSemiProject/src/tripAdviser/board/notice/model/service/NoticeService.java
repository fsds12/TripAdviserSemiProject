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
	
	public List<Board> selectNoticeList(){
		Connection conn=getConnection();
		List<Board> list=dao.selectNoticeList(conn);
		close(conn);
		return list;
	}
	
	public int insertNotice(Board b) {
		Connection conn=getConnection();
		int result=dao.insertNotice(conn, b);
		if(result>0) {
			commit();
		}else{
			rollback();
		}
		close(conn);
		return result;
	}
}
