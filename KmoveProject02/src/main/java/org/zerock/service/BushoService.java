package org.zerock.service;

import java.util.List;

import org.zerock.domain.BushoVO;


public interface BushoService {
	public List<BushoVO> getList();
	
	public void register(BushoVO vo);

	int modify(String busho_nm, String new_value);

	public boolean remove(String busho_nm);
		
}
