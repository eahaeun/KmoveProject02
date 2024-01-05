package org.zerock.service;

import java.util.List;

import org.zerock.domain.ShainCareerVO;

public interface ShainCareerService {
	public void register(ShainCareerVO careerVO);
	public List<ShainCareerVO> getCareerByShainNo(String shain_no);
	public boolean careerModify(ShainCareerVO careerVO);

}
