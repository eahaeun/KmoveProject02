package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.ShainVO;
import org.zerock.mapper.ShainMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ShainServiceImpl implements ShainService {
	@Setter(onMethod_ = @Autowired)
	private ShainMapper mapper;
	
	public void register(ShainVO vo) {
		log.info("register.....");
		mapper.insert(vo);
	}

	@Override
	public List<ShainVO> getList() {
		log.info("getList......");
		return mapper.getList();
	}

	@Override
	public List<ShainVO> getListByKoyoKeitai(String kizoku_ym) {
		return mapper.getListByKoyoKeitai(kizoku_ym);
	}
	
	
	
}
