package org.zerock.service;

import java.util.List;

import org.zerock.domain.KintaiHistoryVO;
import org.zerock.domain.KojyoVO;
import org.zerock.domain.KyuyoHistoryVO;
import org.zerock.domain.ShainVO;
import org.zerock.domain.SikyuVO;

public interface KyuyokanriService {

	//급여내역 T 리스트를 가져옴
	public List<KyuyoHistoryVO> getKyuyoHistoryList();
	
	//급여내역 T를 저장함
	public void kyuyoHistoryregister(KyuyoHistoryVO kyuyoHistory);
	
	//사원 T 리스트를 가져옴
	public List<ShainVO> getShainList();
	
	//사원번호로 해당 사원 급여내역T를 불러옴
	public KyuyoHistoryVO getKyuyoHistroy(String shain_no, String kizoku_ym);
	
	//사원번호로 해당 사원T를 불러옴
	public ShainVO getShain(String shain_no);
	
	public boolean shainModifiy (ShainVO shain);
	
	//사원번호로 해당 급여내역T를 수정함
	public boolean kyuyoHistroyModifiy (KyuyoHistoryVO kyuyoHistory);
	
	//공제항목 T를 가져옴
	public List<KojyoVO> getKojyoList();
	
	//지금항목 T를 가져옴
	public List<SikyuVO> getSikyuList();
	
	public KintaiHistoryVO getKintaiHistory(String shain_no);
	
	public List<KintaiHistoryVO> findBykintaiHistory(String shain_no, String kizoku_ym);
}
