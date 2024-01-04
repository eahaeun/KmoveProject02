package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.KojyoVO;

public interface KojyoMapper {

	public List<KojyoVO> getList();
	
	//추가
	public List<KojyoVO> get(String kojyo_km);

	public int update(@Param("vo") KojyoVO vo, @Param("target_kojyo_km") String target_kojyo_km);

	public int delete(String vo);

	public void create(KojyoVO vo);
	
	public KojyoVO getByKojyoKm(String kojyo_km);

	//카운트
	public int getCount();
}
