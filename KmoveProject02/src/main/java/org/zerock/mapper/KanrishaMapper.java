package org.zerock.mapper;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.KanrishaVO;

public interface KanrishaMapper {
	public void insert(KanrishaVO vo);

	KanrishaVO selectById(@Param("kanrisha_uid") String kanrisha_uid, @Param("kanrisha_pw") String kanrisha_pw);

	public KanrishaVO get();
	
	public int update(KanrishaVO vo);
}
