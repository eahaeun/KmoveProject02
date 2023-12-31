package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ShainEduVO;

public interface ShainEduMapper {
	public void delete(String shain_no);

	public void register(ShainEduVO eduVO);

	public List<ShainEduVO> getEduByShainNo(String shain_no);

	public int eduModify(ShainEduVO eduVO);
}
