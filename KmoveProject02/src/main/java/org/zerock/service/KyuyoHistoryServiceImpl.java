package org.zerock.service;

import org.springframework.stereotype.Service;
import org.zerock.domain.KyuyoHistoryVO;
import org.zerock.mapper.KyuyoHistoryMapper;

import lombok.Setter;

@Service
public class KyuyoHistoryServiceImpl implements KyuyoHistoryService {
	
	@Setter
	private KyuyoHistoryMapper mapper;
	
//	@Override
//	public KyuyoHistoryVO getListByKizokuYm(String shain_no, String kizoku_ym) {
//		return mapper.getByKizokuYm(shain_no, kizoku_ym);
//	}
	
}
