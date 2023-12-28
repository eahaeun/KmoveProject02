package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.TaishokuVO;

public interface TaishokuMapper {
	public List<TaishokuVO> getTaishokuVO();//리스트 받아올때

    void insertTaishoku(TaishokuVO taishokuDTO);//퇴직정보를 넣을 때

    void updateTaishoku(TaishokuVO taishokuDTO);
    
    TaishokuVO getTaishokuInfo(String shain_no);//사원넘버 기준으로 확인.
    
    int cancelTaishoku(String shain_no);
}
