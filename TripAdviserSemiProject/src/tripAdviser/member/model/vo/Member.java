package tripAdviser.member.model.vo;

import java.util.Date;
import java.util.List;

public class Member {
	private String memberId;
	private String memberPw;
	private int memberGrade;
	private String email;
	private String name;
	private String memberPictureUrl;
	private int postalCode;
	private String address;
	private String addressDetail;
	private String phone;
	private Date enrollDate;
	private List<Integer> trvScraps;
	
	public Member () {}

	public Member(String memberId, String memberPw, int memberGrade, String email, String name, String memberPictureUrl,
			int postalCode, String address, String addressDetail, String phone, Date enrollDate,
			List<Integer> trvScraps) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberGrade = memberGrade;
		this.email = email;
		this.name = name;
		this.memberPictureUrl = memberPictureUrl;
		this.postalCode = postalCode;
		this.address = address;
		this.addressDetail = addressDetail;
		this.phone = phone;
		this.enrollDate = enrollDate;
		this.trvScraps = trvScraps;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public int getMemberGrade() {
		return memberGrade;
	}

	public void setMemberGrade(int memberGrade) {
		this.memberGrade = memberGrade;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMemberPictureUrl() {
		return memberPictureUrl;
	}

	public void setMemberPictureUrl(String memberPictureUrl) {
		this.memberPictureUrl = memberPictureUrl;
	}

	public int getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(int postalCode) {
		this.postalCode = postalCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public List<Integer> getTrvScraps() {
		return trvScraps;
	}

	public void setTrvScraps(List<Integer> trvScraps) {
		this.trvScraps = trvScraps;
	}
	
	
}
