package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.KintaiHistoryVO;
import org.zerock.domain.KyukaHourVO;

@Service
public interface KintaiHistoryService {
	
	public void register(KintaiHistoryVO kintaihistory);
	
	public List<KintaiHistoryVO> search(String shain_no);

	public List<KyukaHourVO> getKHour();

	public List<KintaiHistoryVO> getShain(String shain_no);
	
	public List<String> getKoyoKeitai();
}
