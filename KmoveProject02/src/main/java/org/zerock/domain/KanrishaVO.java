package org.zerock.domain;

import lombok.Data;

@Data
public class KanrishaVO {
	private String kanrisha_uid;
	private String kanrisha_pw;
	private String kanrisha_nm;
	private String renraku_tel;
	private String renraku_email;
	
	public boolean matchPassword(String pwd) {
		return kanrisha_pw.equals(pwd);
	}
}
