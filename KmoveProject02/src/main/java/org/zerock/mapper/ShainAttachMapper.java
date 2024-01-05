package org.zerock.mapper;

import org.zerock.domain.ShainAttachVO;

public interface ShainAttachMapper {
	
	public void insert(ShainAttachVO attachVO);

	public ShainAttachVO getAttachByShainNo(String shain_no);
	
	public int updateAttach(ShainAttachVO attachVO);
}
