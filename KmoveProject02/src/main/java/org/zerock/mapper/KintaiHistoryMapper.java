package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.KintaiHistoryVO;
import org.zerock.domain.KintaiHourVO;
import org.zerock.domain.KyukaHourVO;

public interface KintaiHistoryMapper {

	public void insert(KintaiHistoryVO kintaihistory);

	public List<KintaiHistoryVO> search(String shain_no);

	public List<KintaiHistoryVO> read(String shain_no);

	public List<KintaiHistoryVO> findBykintaiHistory(@Param("shain_no") String shain_no,
			@Param("kizoku_ym") String kizoku_ym);
	public List<KintaiHourVO> getHour();
	
	public List<KintaiHourVO> getDataByMonth(String searchMonth);
	
	public List<KintaiHourVO> getDataByD(String searchMonth);
	
	public List<KyukaHourVO> getKHour();
	
	public List<KintaiHistoryVO> getShain(String shain_no);

}
