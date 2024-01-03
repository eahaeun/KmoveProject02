package org.zerock.service;

import java.util.List;

import org.zerock.domain.KanrishaVO;

public interface KanrishaService {
	public void register(KanrishaVO vo);
	
	public KanrishaVO login(String kanrisha_uid, String kanrisha_pw);
	
	public KanrishaVO get();
	
	public boolean update(KanrishaVO vo);

	public boolean modify(KanrishaVO vo);
	
}
