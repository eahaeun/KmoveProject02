package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.KintaiHistoryVO;

@Service
public interface KintaiHistoryService {
	
	public void register(KintaiHistoryVO kintaihistory);
	
	public List<KintaiHistoryVO> search(String shain_no);

}
