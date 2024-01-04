package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.KintaiVO;

public interface KintaiMapper {
	public List<KintaiVO> getList();
	
	public List<KintaiVO> get(String kintai_km);

	public int update(@Param("vo") KintaiVO vo, @Param("target_kintai_km") String target_kintai_km);

	public int delete(String vo);

	public void create(KintaiVO vo);

	public KintaiVO getByKintaiKm(String kintai_km);
	
}
