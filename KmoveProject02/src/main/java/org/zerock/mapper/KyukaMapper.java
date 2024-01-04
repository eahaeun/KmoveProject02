package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.KyukaVO;

public interface KyukaMapper {

	public List<KyukaVO> get(String kyuka_km);

	public int update(@Param("vo") KyukaVO vo, @Param("target_km") String target_km);

	public int delete(String vo);

	public void create(KyukaVO vo);

	public KyukaVO getByKyukaKm(String kyuka_km);

}
