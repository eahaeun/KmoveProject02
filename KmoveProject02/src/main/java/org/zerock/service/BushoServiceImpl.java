package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BushoVO;
import org.zerock.mapper.BushoMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BushoServiceImpl implements BushoService {
	@Setter(onMethod_ = @Autowired)
	private BushoMapper mapper;

	@Override
	public List<BushoVO> getList() {
		return mapper.getList();
	}

	@Override
	public void register(BushoVO vo) {
		mapper.insert(vo);
	}

	@Override
	public int modify(String busho_nm, String new_value) {
		return mapper.update(busho_nm, new_value);
	}

	@Override
	public boolean remove(String busho_nm) {
		log.info("Busho register......");
		return mapper.delete(busho_nm) == 1;
	}
	
	@Override
	public BushoVO get(String busho_nm) {
		return mapper.get(busho_nm);
	}

}
