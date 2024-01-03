package org.zerock.service;

import org.zerock.domain.KaishaVO;

public interface KaishaService {

	public KaishaVO get(String kaisha_nm);

	public boolean update(KaishaVO vo);
	
	public KaishaVO read();
	
}
