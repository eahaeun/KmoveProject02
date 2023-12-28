package org.zerock.domain;

import lombok.Data;

@Data
public class KyuyoTotalVO {

	private String kizoku_ym;
    private int sumSikyuPay;
    private int sumKojyoPay;
    private int count;
}
