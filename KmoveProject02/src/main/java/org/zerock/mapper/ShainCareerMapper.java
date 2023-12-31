package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ShainCareerVO;

public interface ShainCareerMapper {
	public void delete(String shain_no);

	public void register(ShainCareerVO careerVO);

	public List<ShainCareerVO> getCareerByShainNo(String shain_no);

	public int careerModify(ShainCareerVO careerVO);
}
