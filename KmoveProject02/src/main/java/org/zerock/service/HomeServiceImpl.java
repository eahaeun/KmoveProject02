package org.zerock.service;

import org.springframework.stereotype.Service;
import org.zerock.domain.KaishaVO;
import org.zerock.domain.KanrishaVO;
import org.zerock.mapper.KaishaMapper;
import org.zerock.mapper.KanrishaMapper;
import org.zerock.mapper.ShainMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class HomeServiceImpl implements HomeService {

	private KaishaMapper kaishaMapper;
	private ShainMapper shainMapper;
	private KanrishaMapper kanrishaMapper;
	
	@Override
	public KaishaVO get() {
		log.info("get Kaisha Info....");
		return kaishaMapper.get();
	}
	
	@Override
	public int getCount() {
		log.info("get all employee count...");
		return shainMapper.getCount();
	}

	@Override
	public int getCountByEmpType(String empType) {
		log.info("get employee count By Emp Type...");
		return shainMapper.getCountByEmpType(empType);
	}

	@Override
	public void register(KanrishaVO vo) {
		log.info("insert into Kanrisha......");
		kanrishaMapper.insert(vo);
	}

	
}
