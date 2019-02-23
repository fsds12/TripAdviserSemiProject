package tripAdviser.board.model.vo;

import java.util.Date;

public class BoardAnswer {
	//댓글 객체
	private int commentNo;
	private String memberId;
	private String boardContent;
	private Date boardDate;
	private int commentLevel;
	private int boardNoRef;
	private int commentNoRef;
	
	
	public BoardAnswer() {}


	public BoardAnswer(int commentNo, String memberId, String boardContent, Date boardDate, int commentLevel,
			int boardNoRef, int commentNoRef) {
		super();
		this.commentNo = commentNo;
		this.memberId = memberId;
		this.boardContent = boardContent;
		this.boardDate = boardDate;
		this.commentLevel = commentLevel;
		this.boardNoRef = boardNoRef;
		this.commentNoRef = commentNoRef;
	}


	public int getCommentNo() {
		return commentNo;
	}


	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public String getBoardContent() {
		return boardContent;
	}


	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}


	public Date getBoardDate() {
		return boardDate;
	}


	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}


	public int getCommentLevel() {
		return commentLevel;
	}


	public void setCommentLevel(int commentLevel) {
		this.commentLevel = commentLevel;
	}


	public int getBoardNoRef() {
		return boardNoRef;
	}


	public void setBoardNoRef(int boardNoRef) {
		this.boardNoRef = boardNoRef;
	}


	public int getCommentNoRef() {
		return commentNoRef;
	}


	public void setCommentNoRef(int commentNoRef) {
		this.commentNoRef = commentNoRef;
	}


	@Override
	public String toString() {
		return "BoardAnswer [commentNo=" + commentNo + ", memberId=" + memberId + ", boardContent=" + boardContent
				+ ", boardDate=" + boardDate + ", commentLevel=" + commentLevel + ", boardNoRef=" + boardNoRef
				+ ", commentNoRef=" + commentNoRef + "]";
	}
	
	
	
}
