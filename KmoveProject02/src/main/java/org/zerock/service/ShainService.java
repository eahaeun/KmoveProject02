package org.zerock.service;

import java.util.List;

import org.zerock.domain.ShainVO;

public interface ShainService {
	public void register(ShainVO vo);
	
	public List<ShainVO> getList();
	
	public List<ShainVO> getListByKoyoKeitai(String kizoku_ym);
}
