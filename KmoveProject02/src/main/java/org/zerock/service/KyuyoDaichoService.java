package org.zerock.service;

import java.util.List;

import org.zerock.domain.KyuyoHistoryVO;
import org.zerock.domain.KyuyoTotalVO;
import org.zerock.domain.ShainVO;

public interface KyuyoDaichoService {

	//
	public List<KyuyoTotalVO> getKyuyoTotal(String kizoku_ym);
	
	public List<ShainVO> getShainList(String kizoku_ym);
	
	public List<KyuyoHistoryVO> getKyuyoList();
	
	public boolean removeKyuyoTotal(String kizoku_ym);
	
	//사원번호와 귀속연월로 해당하는 데이터가 있는지 찾음.
	public List<KyuyoHistoryVO> findByYM (String kizoku_ym);
}
