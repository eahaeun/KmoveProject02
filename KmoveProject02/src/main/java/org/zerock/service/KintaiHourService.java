package org.zerock.service;

import java.util.List;

import org.zerock.domain.KintaiHourVO;

public interface KintaiHourService {
	
	public List<KintaiHourVO> getHour();
	
	public List<KintaiHourVO> getDataByMonth(String searchMonth);
	
	public List<KintaiHourVO> getDataByD(String searchMonth);

}
