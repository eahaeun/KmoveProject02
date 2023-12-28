package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.KaishaVO;
import org.zerock.mapper.KaishaMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class KaishaServiceImpl implements KaishaService {
	@Setter(onMethod_ = @Autowired)
	private KaishaMapper mapper;
	
	@Override
	public KaishaVO read() {
		return mapper.get();
	}
	
}
