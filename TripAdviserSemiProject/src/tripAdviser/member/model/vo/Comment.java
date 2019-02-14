package tripAdviser.member.model.vo;

import java.util.Date;

public class Comment {
	private int commentNo;
	private int trvNo;
	private String memberId;
	private int trvEvaluation;
	private String comment_title;
	private String commentContent;
	private Date commentDate;
	private int goodCnt;	//좋아요 수 (구현예정)
	private int badCnt;		//싫어요 수 (구현예정)
	
	public Comment() {}

	public Comment(int commentNo, int trvNo, String memberId, int trvEvaluation, String comment_title, String comment,
			Date commentDate, int goodCnt, int badCnt) {
		super();
		this.commentNo = commentNo;
		this.trvNo = trvNo;
		this.memberId = memberId;
		this.trvEvaluation = trvEvaluation;
		this.comment_title = comment_title;
		this.commentContent = comment;
		this.commentDate = commentDate;
		this.goodCnt = goodCnt;
		this.badCnt = badCnt;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getTrvNo() {
		return trvNo;
	}

	public void setTrvNo(int trvNo) {
		this.trvNo = trvNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getTrvEvaluation() {
		return trvEvaluation;
	}

	public void setTrvEvaluation(int trvEvaluation) {
		this.trvEvaluation = trvEvaluation;
	}

	public String getComment_title() {
		return comment_title;
	}

	public void setComment_title(String comment_title) {
		this.comment_title = comment_title;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	public int getGoodCnt() {
		return goodCnt;
	}

	public void setGoodCnt(int goodCnt) {
		this.goodCnt = goodCnt;
	}

	public int getBadCnt() {
		return badCnt;
	}

	public void setBadCnt(int badCnt) {
		this.badCnt = badCnt;
	}
	
	
}
