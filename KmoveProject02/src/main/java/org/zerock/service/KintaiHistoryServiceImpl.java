package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.KintaiHistoryVO;
import org.zerock.mapper.KintaiHistoryMapper;

import lombok.Setter;

@Service
public class KintaiHistoryServiceImpl implements KintaiHistoryService {

	@Setter(onMethod_ = @Autowired)
	private KintaiHistoryMapper mapper;

	@Override
	public void register(KintaiHistoryVO kintaihistory) {
		// TODO Auto-generated method stub
		mapper.insert(kintaihistory);
	}

	@Override
	public List<KintaiHistoryVO> search(String shain_no) {
	    return mapper.search(shain_no);
	}

}