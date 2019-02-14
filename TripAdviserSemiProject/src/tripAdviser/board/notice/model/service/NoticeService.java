package tripAdviser.board.notice.model.service;

import java.sql.Connection;
import java.util.List;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;
import tripAdviser.board.model.vo.NoticeBoard;
import tripAdviser.board.notice.model.dao.NoticeDao;

public class NoticeService {
	private NoticeDao dao=new NoticeDao();
	
	public List<NoticeBoard> selectNoticeList(){
		Connection conn=getConnection();
		List<NoticeBoard> list=dao.selectNoticeList(conn);
		close(conn);
		return list;
	}
}
