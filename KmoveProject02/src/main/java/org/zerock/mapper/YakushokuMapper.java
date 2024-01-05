package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.YakushokuVO;

public interface YakushokuMapper {

	public List<YakushokuVO> getList();
	
	 public YakushokuVO get(String yakushoku_nm); 
	/* public YakushokuVO get(@Param("yakushoku_nm") String yakushoku_nm); */ 
	
}
