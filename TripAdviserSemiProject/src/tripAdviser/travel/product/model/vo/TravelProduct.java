package tripAdviser.travel.product.model.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import tripAdviser.member.model.vo.Comment;

public class TravelProduct implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1062526498803072225L;
	
	private int trvNo;
	private String trvTitle;    			//여행제목
	private double avgStarRate;	//여행상품 평점
	private String trvRepresentPic;	//여행상품URL
	private String trvProvince;
	private String trvCity;
	private String trvAddress;
	private Date trvDateStart;
	private Date trvDateEnd;
	private String trvReview;
	private String trvLargeCtg;				//카테고리 대분류
	private String trvSmallCtg;				//카테고리 소분류
	private String trvGps;
	private Date trvDate;       			//작성일자
	private String memberId;    			//작성자
	private int hits;
	private List<Comment> CommentLists;	//해당 여행정보 코멘트들의 값
	private List<String> AlbumUrls;		//사진앨범 url 값들 저장
	private Comment bestComment;		//가장좋은평가를 받은 코멘트(구현예정)
	
	public TravelProduct() {}

	public TravelProduct(int trvNo, String trvTitle, double avgStarRate, String trvRepresentPic, String trvProvince,
			String trvCity, String trvAddress, Date trvDateStart, Date trvDateEnd, String trvReview, String trvLargeCtg,
			String trvSmallCtg, String trvGps, Date trvDate, String memberId, int hits, List<Comment> commentLists,
			List<String> albumUrls, Comment bestComment) {
		super();
		this.trvNo = trvNo;
		this.trvTitle = trvTitle;
		this.avgStarRate = avgStarRate;
		this.trvRepresentPic = trvRepresentPic;
		this.trvProvince = trvProvince;
		this.trvCity = trvCity;
		this.trvAddress = trvAddress;
		this.trvDateStart = trvDateStart;
		this.trvDateEnd = trvDateEnd;
		this.trvReview = trvReview;
		this.trvLargeCtg = trvLargeCtg;
		this.trvSmallCtg = trvSmallCtg;
		this.trvGps = trvGps;
		this.trvDate = trvDate;
		this.memberId = memberId;
		this.hits = hits;
		CommentLists = commentLists;
		AlbumUrls = albumUrls;
		this.bestComment = bestComment;
	}

	public int getTrvNo() {
		return trvNo;
	}

	public void setTrvNo(int trvNo) {
		this.trvNo = trvNo;
	}

	public String getTrvTitle() {
		return trvTitle;
	}

	public void setTrvTitle(String trvTitle) {
		this.trvTitle = trvTitle;
	}

	public double getAvgStarRate() {
		return avgStarRate;
	}

	public void setAvgStarRate(double avgStarRate) {
		this.avgStarRate = avgStarRate;
	}

	public String getTrvRepresentPic() {
		return trvRepresentPic;
	}

	public void setTrvRepresentPic(String trvRepresentPic) {
		this.trvRepresentPic = trvRepresentPic;
	}

	public String getTrvProvince() {
		return trvProvince;
	}

	public void setTrvProvince(String trvProvince) {
		this.trvProvince = trvProvince;
	}

	public String getTrvCity() {
		return trvCity;
	}

	public void setTrvCity(String trvCity) {
		this.trvCity = trvCity;
	}

	public String getTrvAddress() {
		return trvAddress;
	}

	public void setTrvAddress(String trvAddress) {
		this.trvAddress = trvAddress;
	}

	public Date getTrvDateStart() {
		return trvDateStart;
	}

	public void setTrvDateStart(Date trvDateStart) {
		this.trvDateStart = trvDateStart;
	}

	public Date getTrvDateEnd() {
		return trvDateEnd;
	}

	public void setTrvDateEnd(Date trvDateEnd) {
		this.trvDateEnd = trvDateEnd;
	}

	public String getTrvReview() {
		return trvReview;
	}

	public void setTrvReview(String trvReview) {
		this.trvReview = trvReview;
	}

	public String getTrvLargeCtg() {
		return trvLargeCtg;
	}

	public void setTrvLargeCtg(String trvLargeCtg) {
		this.trvLargeCtg = trvLargeCtg;
	}

	public String getTrvSmallCtg() {
		return trvSmallCtg;
	}

	public void setTrvSmallCtg(String trvSmallCtg) {
		this.trvSmallCtg = trvSmallCtg;
	}

	public String getTrvGps() {
		return trvGps;
	}

	public void setTrvGps(String trvGps) {
		this.trvGps = trvGps;
	}

	public Date getTrvDate() {
		return trvDate;
	}

	public void setTrvDate(Date trvDate) {
		this.trvDate = trvDate;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public List<Comment> getCommentLists() {
		return CommentLists;
	}

	public void setCommentLists(List<Comment> commentLists) {
		CommentLists = commentLists;
	}

	public List<String> getAlbumUrls() {
		return AlbumUrls;
	}

	public void setAlbumUrls(List<String> albumUrls) {
		AlbumUrls = albumUrls;
	}

	public Comment getBestComment() {
		return bestComment;
	}

	public void setBestComment(Comment bestComment) {
		this.bestComment = bestComment;
	}

	@Override
	public String toString() {
		return "TravelProduct [trvNo=" + trvNo + ", trvTitle=" + trvTitle + ", avgStarRate=" + avgStarRate
				+ ", trvRepresentPic=" + trvRepresentPic + ", trvProvince=" + trvProvince + ", trvCity=" + trvCity
				+ ", trvAddress=" + trvAddress + ", trvDateStart=" + trvDateStart + ", trvDateEnd=" + trvDateEnd
				+ ", trvReview=" + trvReview + ", trvLargeCtg=" + trvLargeCtg + ", trvSmallCtg=" + trvSmallCtg
				+ ", trvGps=" + trvGps + ", trvDate=" + trvDate + ", memberId=" + memberId + ", hits=" + hits
				+ ", CommentLists=" + CommentLists + ", AlbumUrls=" + AlbumUrls + ", bestComment=" + bestComment + "]";
	}

	

	
}
