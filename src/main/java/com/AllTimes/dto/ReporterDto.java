package com.AllTimes.dto;

import javax.servlet.http.HttpServletRequest;


import org.springframework.web.multipart.MultipartFile;



public class ReporterDto {
	private String rid;
	private String rpw;
	private String rname;
	private int rstate;
	private String rmail;
	
	private MultipartFile rfile;
	private String rprofile;
	private String rcontact;
	public String getRid() {
		return rid;
	}
	public void setRid(String rid) {
		this.rid = rid;
	}
	public String getRpw() {
		return rpw;
	}
	public void setRpw(String rpw) {
		this.rpw = rpw;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public int getRstate() {
		return rstate;
	}
	public void setRstate(int rstate) {
		this.rstate = rstate;
	}
	public String getRmail() {
		return rmail;
	}
	public void setRmail(String rmail) {
		this.rmail = rmail;
	}
	public MultipartFile getRfile() {
		return rfile;
	}
	public void setRfile(MultipartFile rfile) {
		this.rfile = rfile;
	}
	public String getRprofile() {
		return rprofile;
	}
	public void setRprofile(String rprofile) {
		this.rprofile = rprofile;
	}
	public String getRcontact() {
		return rcontact;
	}
	public void setRcontact(String rcontact) {
		this.rcontact = rcontact;
	}
	@Override
	public String toString() {
		return "ReporterDto [rid=" + rid + ", rpw=" + rpw + ", rname=" + rname + ", rstate=" + rstate + ", rmail="
				+ rmail + ", rfile=" + rfile + ", rprofile=" + rprofile + ", rcontact=" + rcontact + "]";
	}
	

	
}
