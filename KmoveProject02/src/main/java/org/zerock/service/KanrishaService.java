package org.zerock.service;

import org.zerock.domain.KanrishaVO;

public interface KanrishaService {
	public void register(KanrishaVO vo);
	
	public KanrishaVO login(String kanrisha_uid, String kanrisha_pw);
	
	public KanrishaVO get();
	
}
