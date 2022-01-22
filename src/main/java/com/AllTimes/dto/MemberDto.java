package com.AllTimes.dto;



import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


public class MemberDto {
	
	private String mid;
	private String mpw;
	private String mname;
	private int mstate;
	private String mmail;
	private int mage;
	private String mcontact;
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public int getMstate() {
		return mstate;
	}
	public void setMstate(int mstate) {
		this.mstate = mstate;
	}
	public String getMmail() {
		return mmail;
	}
	public void setMmail(String mmail) {
		this.mmail = mmail;
	}
	public int getMage() {
		return mage;
	}
	public void setMage(int mage) {
		this.mage = mage;
	}
	public String getMcontact() {
		return mcontact;
	}
	public void setMcontact(String mcontact) {
		this.mcontact = mcontact;
	}
	@Override
	public String toString() {
		return "MemberDto [mid=" + mid + ", mpw=" + mpw + ", mname=" + mname + ", mstate=" + mstate + ", mmail=" + mmail
				+ ", mage=" + mage + ", mcontact=" + mcontact + "]";
	}
	

	
}
