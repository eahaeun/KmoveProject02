package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class KaishaVO {
	 private String kaisha_nm;
	    private String daihyosha;
	    private String jigyosha_no;
	    private String hojin_no;
	    private Date setsuritsu_ymd;
	    private String homepage;
	    private String address;
	    private String renraku_tel;
	    private String renraku_fax;
	    private String jitai;
	    private String jishu;
}
