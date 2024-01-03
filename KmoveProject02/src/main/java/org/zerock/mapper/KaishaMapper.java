package org.zerock.mapper;

import org.zerock.domain.KaishaVO;

public interface KaishaMapper {
	public KaishaVO get();

	public KaishaVO read(String kaisha_nm);

	public int update(KaishaVO vo);
}
