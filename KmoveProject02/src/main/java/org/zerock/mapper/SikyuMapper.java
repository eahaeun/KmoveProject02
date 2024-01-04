package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.SikyuVO;

public interface SikyuMapper {

	public List<SikyuVO> getList();
	
	// 추가
	public List<SikyuVO> get(String sikyu_km);
	
	public int update(@Param("vo") SikyuVO vo, @Param("target_km") String target_km);
	
	public int delete(String vo);
	
	public void create(SikyuVO vo);
	
	public SikyuVO getBySikyuKm(String sikyu_km);
	
	//카운트
	public int getCount();
}
