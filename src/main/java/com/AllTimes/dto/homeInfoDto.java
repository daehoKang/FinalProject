package com.AllTimes.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


public class homeInfoDto {
	
	private int countM;
	private int countR;
	public int getCountM() {
		return countM;
	}
	public void setCountM(int countM) {
		this.countM = countM;
	}
	public int getCountR() {
		return countR;
	}
	public void setCountR(int countR) {
		this.countR = countR;
	}
	@Override
	public String toString() {
		return "homeInfoDto [countM=" + countM + ", countR=" + countR + "]";
	}
	
	
}
