package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.YakushokuVO;
import org.zerock.mapper.YakushokuMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class YakushokuServiceImpl implements YakushokuService {
	
	@Setter(onMethod_ = @Autowired)
	private YakushokuMapper mapper;

	@Override
	public List<YakushokuVO> getList() {
		return mapper.getList();
	}

	@Override
	public YakushokuVO get(String yakushoku_nm) {
		return mapper.get(yakushoku_nm);
	}
	
	
}
