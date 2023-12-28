package org.zerock.domain;

import lombok.Data;

@Data
public class TaishokuVO {
	private int num;
	private String zaishoku_st;
	private String shain_no;
	private String shain_nm;
	private String busho_nm;
	private String yakushoku_nm;
	private String nyusha_ymd;
	private String taishoku_ymd;
	private int taishoku_pay;
	private int yearDiff;
	

	private String taishoku_jiyu;
	private String taishoku_renraku;
}
