package org.zerock.domain;

import lombok.Data;

@Data
public class KintaiHistoryVO {
    private int kintai_no;
    private String shain_no;
    private String kintai_km;
    private String nyuryoku_ymd;
    private String kaishi_ymd;
    private String shuryo_ymd;
    private int kintai_hour;
    private int kintai_pay;
    
}
