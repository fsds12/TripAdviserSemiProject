package tripAdviser.myPage.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import tripAdviser.member.model.vo.Member;
import tripAdviser.myPage.model.vo.MyPageComment;
import tripAdviser.travel.product.model.dao.TravelProductDetailDao;
import tripAdviser.travel.product.model.vo.TravelProduct;

public class MyPageDao {
	private PreparedStatement pstmt;
	private String sql = "";
	private ResultSet rs;
	private Properties prop = new Properties();
	
	{
		String filePath = TravelProductDetailDao.class.getResource("/sql/myPage/myPage.properties").getPath();
		try {
			prop.load(new FileReader(filePath));
		}
		catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<TravelProduct> selectScrap(Connection conn, String id) {
		List<TravelProduct> list = null;
		sql = prop.getProperty("selectScrap");
		
		try {
			list = new ArrayList<TravelProduct>();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TravelProduct tp = new TravelProduct();
				tp.setTrvNo(rs.getInt("trv_no"));
				tp.setMemberId(rs.getString("member_id"));
				tp.setTrvTitle(rs.getString("trv_title"));
				tp.setTrvRepresentPic(rs.getString("trv_represent_pic"));
				tp.setTrvProvince(rs.getString("trv_province"));
				tp.setTrvCity(rs.getString("trv_city"));
				tp.setTrvAddress(rs.getString("trv_address"));
				tp.setAvgStarRate(rs.getDouble("point"));
				
				list.add(tp);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public int selectMyCommentListCount(Connection conn, String id) {
		int result = 0;
		sql = prop.getProperty("selectMyCommentListCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("cnt");
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	public List<MyPageComment> selectMyComment(Connection conn, String id, int cPage, int numPerPage) {
		List<MyPageComment> list = null;
		sql = prop.getProperty("selectMyComment");
		
		try {
			list = new ArrayList<MyPageComment>();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, numPerPage*(cPage-1)+1);
			pstmt.setInt(3, cPage * numPerPage);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MyPageComment mpc = new MyPageComment();
				
				mpc.setTrvTitle(rs.getString("trv_title"));
				mpc.setTrvEvaluation(rs.getInt("trv_evaluation"));
				mpc.setCommentContent(rs.getString("comment_content"));
				
				list.add(mpc);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public Member selectId(Connection conn, String id) {
		Member m = null;
		sql = prop.getProperty("selectId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				m = new Member();
				
				m.setMemberId(rs.getString("member_id"));
				m.setMemberPw(rs.getString("member_pw"));
				m.setMemberGrade(rs.getInt("member_grade"));
				m.setAddress(rs.getString("address"));
				m.setAddressDetail(rs.getString("address_detail"));
				m.setEmail(rs.getString("email"));
				m.setName(rs.getString("name"));
				m.setMemberPictureUrl(rs.getString("member_picture_url"));
				m.setPhone(rs.getString("phone"));
				m.setEnrollDate(rs.getDate("enroll_date"));
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		
		return m;
	}

	public int updateMember(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("updateMember");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,m.getEmail());
			pstmt.setInt(2,m.getPostalCode());
			pstmt.setString(3,m.getAddress());
			pstmt.setString(4,m.getAddressDetail());
			pstmt.setString(5,m.getMemberId());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
}
