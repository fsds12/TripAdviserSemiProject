package tripAdviser.member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import tripAdviser.member.model.vo.Member;
import static common.JDBCTemplate.close;
public class MemberDao {
	private Properties prop=new Properties();
	
	public MemberDao() {
		try {
			String fileName=MemberDao.class.getResource("/sql/common/member-query.properties").getPath();
			prop.load(new FileReader(fileName));
		}catch(IOException e) {
			e.printStackTrace();	
	}
	}
	public Member selectOne(Connection conn,Member m) {
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectOne");
		Member result=null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,m.getMemberId());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=new Member();
				result.setMemberId(rs.getString("MEMBER_ID"));
				result.setMemberPw(rs.getString("MEMBER_PW"));
				result.setMemberGrade(rs.getInt("MEMBER_GRADE"));
				result.setEmail(rs.getString("EMAIL"));
				result.setName(rs.getString("NAME"));
				result.setMemberPictureUrl(rs.getString("MEMBER_PICTURE_URL"));
				result.setPostalCode(rs.getInt("POSTAL_CODE"));
				result.setAddress(rs.getString("ADDRESS"));
				result.setAddressDetail(rs.getString("ADDRESS_DETAIL"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	public Member findId(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("findId");
		Member result=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,m.getName());
			pstmt.setString(2,m.getPhone());
			pstmt.setString(3,m.getEmail());
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				result=new Member();
				result.setMemberId(rs.getString("MEMBER_ID"));
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	public int enrollMember(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertMember");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPw());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4,m.getName());
			pstmt.setInt(5,m.getPostalCode());
			pstmt.setString(6,m.getAddress());
			pstmt.setString(7, m.getAddressDetail());
			pstmt.setString(8, m.getPhone());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	public Member findPw(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("findPw");
		System.out.println(sql);
		Member result=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,m.getMemberId());
			pstmt.setString(2,m.getPhone());
			pstmt.setString(3,m.getEmail());
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				result=new Member();
				result.setMemberId(rs.getString("MEMBER_ID"));
				result.setMemberPw(rs.getString("MEMBER_PW"));
				result.setMemberGrade(rs.getInt("MEMBER_GRADE"));
				result.setEmail(rs.getString("EMAIL"));
				result.setName(rs.getString("NAME"));
				result.setMemberPictureUrl(rs.getString("MEMBER_PICTURE_URL"));
				result.setPostalCode(rs.getInt("POSTAL_CODE"));
				result.setAddress(rs.getString("ADDRESS"));
				result.setAddressDetail(rs.getString("ADDRESS_DETAIL"));
				result.setEnrollDate(rs.getDate("ENROLL_DATA"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return result;
		
	}
	public int pwchange(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("pwchange");
		
		try {
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,m.getMemberPw());
		pstmt.setString(2,m.getMemberId());
		result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}
	
	
}
	

