package org.zerock.service;

import java.util.List;

import org.zerock.domain.KojyoVO;

public interface KojyoService {

	public List<KojyoVO> get(String Kojyo_km);

	public void create(KojyoVO vo);

	public boolean update(KojyoVO vo,  String target_kojyo_km);

	public void delete(String kojyo_km);
	
	public KojyoVO getByKojyoKm(String kojyo_km);
	
	public int getCount();

}
