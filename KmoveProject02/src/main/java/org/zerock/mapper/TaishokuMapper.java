package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.TaishokuVO;

public interface TaishokuMapper {
	public List<TaishokuVO> getTaishokuVO();// 리스트 받아올때

	void insertTaishoku(TaishokuVO taishokuDTO);// 퇴직정보를 넣을 때

	void updateTaishoku(TaishokuVO taishokuDTO);

	TaishokuVO getTaishokuInfo(String shain_no);// 사원넘버 기준으로 확인.
	
	TaishokuVO isExist(String shain_no);

	int cancelTaishoku(String shain_no);

	void savePay(@Param("shain_no") String shain_no, @Param("sikyu_ymd") String sikyu_ymd, @Param("taishoku_pay") int taishoku_pay);
}
