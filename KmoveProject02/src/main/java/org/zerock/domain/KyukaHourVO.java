package org.zerock.domain;

import lombok.Data;

@Data
public class KyukaHourVO {

	private String shain_no;
	private String kaishi_ymd;
	private String shuryo_ymd;
	private String kintai_tani;
	private int total_kintai_hour;
		
}
