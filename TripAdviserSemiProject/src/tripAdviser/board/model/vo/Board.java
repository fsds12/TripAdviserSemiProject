package tripAdviser.board.model.vo;

import java.util.Date;

public class Board {
	private int boardNo;
	private String memberId;
	private String title;
	private String content;
	private int hits;
	private Date boardDate;
	
	public Board() {
		// TODO Auto-generated constructor stub
	}

	public Board(int boardNo, String memberId, String title, String content, int hits, Date boardDate) {
		super();
		this.boardNo = boardNo;
		this.memberId = memberId;
		this.title = title;
		this.content = content;
		this.hits = hits;
		this.boardDate = boardDate;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public Date getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", memberId=" + memberId + ", title=" + title + ", content=" + content
				+ ", hits=" + hits + ", boardDate=" + boardDate + "]";
	}
	
	
}
