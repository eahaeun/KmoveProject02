package org.zerock.service;

import org.zerock.domain.ShainAttachVO;

public interface ShainAttachService {

	public void uploadProfile(ShainAttachVO attachVO);
	
	public ShainAttachVO getProfile(String shain_no);
	
	public boolean updateAttach(ShainAttachVO attachVO);
}
