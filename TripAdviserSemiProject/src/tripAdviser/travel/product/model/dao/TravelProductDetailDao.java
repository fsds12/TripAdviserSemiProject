package tripAdviser.travel.product.model.dao;

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

import tripAdviser.member.model.vo.Comment;
import tripAdviser.travel.product.model.vo.TravelProduct;

public class TravelProductDetailDao {
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String sql = "";
	private Properties prop = new Properties();
	
	{
		String filePath = "";
		try {
			prop.load(new FileReader(filePath));
		}
		catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public TravelProduct selectTrvProduct(Connection conn, int trvNo) {
		TravelProduct tp = null;
		sql = prop.getProperty("selectTrvProduct");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, trvNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				tp = new TravelProduct();
				
				tp.setTrvNo(rs.getInt("trv_no"));
				tp.setTrvTitle(rs.getString("trv_title"));
				tp.setTrvRepresentPic(rs.getString("trv_represent_pic"));
				tp.setTrvProvince(rs.getString("trv_province"));
				tp.setTrvCity(rs.getString("trv_city"));
				tp.setTrvAddress(rs.getString("trv_address"));
				tp.setTrvDateStart(rs.getDate("trv_date_start"));
				tp.setTrvDateEnd(rs.getDate("trv_date_end"));
				tp.setTrvReview(rs.getString("trv_review"));
				tp.setTrvSmallCtg(rs.getString("trv_small_ctg_code"));
				/*tp.setTrvLargeCtg(trvLargeCtg);
				tp.setTrvSmallCtg(trvSmallCtg);*/	//카테고리 테이블에서 조인하여 불러올것  
				tp.setTrvGps(rs.getString("trv_gps"));
				tp.setTrvDate(rs.getDate("trv_write_date"));
				tp.setMemberId(rs.getString("member_id"));
				tp.setHits(rs.getInt("trv_hits"));
				
				close(rs);
				close(pstmt);
				
				sql = prop.getProperty("selectComment");
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, trvNo);
				rs = pstmt.executeQuery();
				List<Comment> commentList = new ArrayList<Comment>();
				
				while(rs.next()) {
					Comment c = new Comment();
					c.setCommentNo(rs.getInt("comment_no"));
					c.setMemberId(rs.getString("member_id"));
					c.setTrvEvaluation(rs.getInt("trv_evaluation"));
					c.setCommentContent(rs.getString("comment_content"));
					c.setCommentDate(rs.getDate("comment_date"));
					
					commentList.add(c);
				}
				
				tp.setCommentLists(commentList);
				
				close(rs);
				close(pstmt);
				
				sql = prop.getProperty("selectAlbum");
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, trvNo);
				rs = pstmt.executeQuery();
				
				List<String> albumList = new ArrayList<String>();
				
				while(rs.next()) {
					albumList.add(rs.getString("trv_pic_src"));
				}
				
				tp.setAlbumUrls(albumList);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		
		return tp;
	}

}
