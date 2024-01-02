package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.KintaiHourVO;
import org.zerock.domain.KyuyoHistoryVO;
import org.zerock.domain.KyuyoTotalVO;

public interface KyuyoHistoryMapper {

	public List<KyuyoHistoryVO> getList();

	public void insert(KyuyoHistoryVO kyuyoHistory);
	
	public int update(KyuyoHistoryVO kyuyoHistory);
	
	public List<KyuyoTotalVO> kyuyoTotal(String kizoku_ym);
	
	public List<KyuyoHistoryVO> findByYM (String kizoku_ym);
	
	public KyuyoHistoryVO read(@Param("shain_no") String shain_no, @Param("kizoku_ym") String kizoku_ym);
	
	public int delete(String shain_no);
	
	public int deleteTotal(String kizoku_ym);
	

}
