package org.zerock.service;

import java.util.List;

import org.zerock.domain.TaishokuVO;

public interface TaishokuService {

	public List<TaishokuVO> getTKList();

	void insertShainAndTaishoku(String shain_no, String taishoku_ymd, String taishoku_jiyu, String taishoku_renraku);

	TaishokuVO getTaishokuInfo(String shain_no);

	int cancelTaishoku(String shain_no);

	int cancelShain(String shain_no);
	
	void savePay(String shain_no, String sikyu_ymd, int taishoku_pay);
}
