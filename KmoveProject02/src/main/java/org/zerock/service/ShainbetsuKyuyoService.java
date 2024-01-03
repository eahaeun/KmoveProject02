package org.zerock.service;

import java.util.List;

import org.zerock.domain.KyuyoHistoryVO;
import org.zerock.domain.ShainVO;

public interface ShainbetsuKyuyoService {

	public List<ShainVO> getShainList();
	
	public ShainVO getShain(String shain_no);
	
	public List<KyuyoHistoryVO> getKyuyoByDate(String shain_no, String start_ym, String end_ym);
}
