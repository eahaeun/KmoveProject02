package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.KyuyoHistoryVO;
import org.zerock.mapper.KyuyoHistoryMapper;

import lombok.Setter;

@Service
public class KyuyoHistoryServiceImpl implements KyuyoHistoryService {
	
	@Setter(onMethod_ = @Autowired)
	private KyuyoHistoryMapper mapper;

	//동진추가
	@Override
	public KyuyoHistoryVO readSikyuWithShainNo(String shain_no) {
	return mapper.readSikyuWithShainNo(shain_no);
		
	}
}
