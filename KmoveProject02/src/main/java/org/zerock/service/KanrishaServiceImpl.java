package org.zerock.service;

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
	public KanrishaVO get(String kanrisha_uid) {
		return mapper.get(kanrisha_uid);
	}	
	
	
}
