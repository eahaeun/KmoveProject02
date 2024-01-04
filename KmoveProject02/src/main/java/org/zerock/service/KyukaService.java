package org.zerock.service;

import java.util.List;

import org.zerock.domain.KyukaVO;

public interface KyukaService {

	public List<KyukaVO> get(String Kyuka_km);

	public boolean update(KyukaVO vo, String target_km);

	public void delete(String kyuka_km);

	public void create(KyukaVO vo);
	
	public KyukaVO getByKyukaKm(String kyuka_km);
	
	public boolean updateKyuka();
}
