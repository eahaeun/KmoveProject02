package org.zerock.service;

import java.util.List;

import org.zerock.domain.SikyuVO;

public interface SikyuService {

	public List<SikyuVO> get(String Sikyu_km);

	public void create(SikyuVO vo);

	public boolean update(SikyuVO vo, String target_km);

	public void delete(String sikyu_km);
	
	public SikyuVO getBySikyuKm(String sikyu_km);

	public int getCount();
}
