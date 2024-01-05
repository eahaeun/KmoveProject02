package org.zerock.service;

import java.util.List;

import org.zerock.domain.ShainEduVO;

public interface ShainEduService {
	
	public void register(ShainEduVO eduVO);
	
	public List<ShainEduVO> getEduByShainNo(String shain_no);
	
	public boolean eduModify(ShainEduVO eduVO);

}
