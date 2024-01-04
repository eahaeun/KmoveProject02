package org.zerock.service;

import java.util.List;

import org.zerock.domain.BushoVO;
import org.zerock.domain.KintaiVO;

public interface KintaiService {
	
	public List<KintaiVO> getList();
	
	public List<KintaiVO> get(String Kintai_km);

	public boolean update(KintaiVO vo, String target_kintai_km);

	public void delete(String kintai_km);

	public void create(KintaiVO vo);
	
	public KintaiVO getByKintaiKm(String kintai_km);
	
}
