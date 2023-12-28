package org.zerock.service;

import org.zerock.domain.KaishaVO;
import org.zerock.domain.KanrishaVO;

public interface HomeService {
	public KaishaVO get();
	
	public int getCount();

	public int getCountByEmpType(String empType);
	
	public void register(KanrishaVO vo);
}
