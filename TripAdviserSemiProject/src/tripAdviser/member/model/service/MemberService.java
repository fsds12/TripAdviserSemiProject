package tripAdviser.member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;

import tripAdviser.member.model.dao.MemberDao;
import tripAdviser.member.model.vo.Member;
public class MemberService {
	
	public Member selectOne(Member m) {
		Connection conn=getConnection();
		Member result=new MemberDao().selectOne(conn,m);
		close(conn);
		return result;
	}
	public Member findId(Member m) {
		Connection conn=getConnection();
		Member result=new MemberDao().findId(conn,m);
		close(conn);
		return result;
	}
	public int enrollMember(Member m) {
		Connection conn=getConnection();
		int result=new MemberDao().enrollMember(conn,m);
		if(result>0) {
			commit();
		}else {
			rollback();
		}
		close(conn);
		return result;
	}
	public Member findPw(Member m) {
		Connection conn=getConnection();
		Member result=new MemberDao().findPw(conn,m);
		close(conn);
		return result;
	}
	public int pwchange(Member m) {
		Connection conn=getConnection();
		int result=new MemberDao().pwchange(conn,m);
		if(result>0) {
			commit();
		}else {
			rollback();
		}
		close(conn);
		return result;
	}
	
	
	
}
