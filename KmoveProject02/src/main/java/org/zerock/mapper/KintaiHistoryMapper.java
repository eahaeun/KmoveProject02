package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.KintaiHistoryVO;

public interface KintaiHistoryMapper {

	public void insert(KintaiHistoryVO kintaihistory);

	public List<KintaiHistoryVO> search(String shain_no);

	public KintaiHistoryVO read(String shain_no);

	public List<KintaiHistoryVO> findBykintaiHistory(@Param("shain_no") String shain_no,
			@Param("kizoku_ym") String kizoku_ym);

}
