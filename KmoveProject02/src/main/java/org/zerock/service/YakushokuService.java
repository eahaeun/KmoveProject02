package org.zerock.service;

import java.util.List;

import org.zerock.domain.YakushokuVO;

public interface YakushokuService {
	
	public List<YakushokuVO> getList();

	public YakushokuVO get(String yakushoku_nm);
}
