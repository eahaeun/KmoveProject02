package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.KanrishaVO;
import org.zerock.mapper.KanrishaMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class KanrishaServiceImpl implements KanrishaService {
	@Setter(onMethod_ = @Autowired)
	private KanrishaMapper mapper;

	@Override
	public void register(KanrishaVO vo) {
		mapper.insert(vo);
	}

	@Override
	public KanrishaVO login(String kanrisha_uid, String kanrisha_pw) {
		log.info("hahahah: " + mapper.selectById(kanrisha_uid, kanrisha_pw));
		return mapper.selectById(kanrisha_uid, kanrisha_pw);
	}

	@Override
	public KanrishaVO get() {
		return mapper.get();
	}	
	

	@Override
	public boolean update(KanrishaVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo) > 0;
	}

	@Override
	public boolean modify(KanrishaVO vo) {
		boolean modifyResult = mapper.update(vo) == 1;
		return modifyResult;
	}

}
