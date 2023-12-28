package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.KintaiHistoryVO;
import org.zerock.domain.KintaiVO;
import org.zerock.mapper.KintaiMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class KintaiServiceImpl implements KintaiService {
	@Setter(onMethod_ = @Autowired)
	private KintaiMapper mapper;

	@Override
	public List<KintaiVO> getList() {
		log.info("getList......");
		return mapper.getList();
	}

}
