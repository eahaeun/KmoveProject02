package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.SikyuVO;
import org.zerock.mapper.SikyuMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class SikyuServiceImpl implements SikyuService {

	@Setter(onMethod_ = @Autowired)
	private SikyuMapper sikyuMapper;

	@Override
	public void create(SikyuVO vo) {
		// TODO Auto-generated method stub
		sikyuMapper.create(vo);

	}

	@Override
	public List<SikyuVO> get(String sikyu_km) {
		// TODO Auto-generated method stub
		return sikyuMapper.get(sikyu_km);
	}

	@Override
	public void delete(String sikyu_km) {
		// TODO Auto-generated method stub
		sikyuMapper.delete(sikyu_km);
	}

	@Override
	public boolean update(SikyuVO vo, String target_km) {
		// TODO Auto-generated method stub
		return sikyuMapper.update(vo, target_km) > 0;
	}

	@Override
	public SikyuVO getBySikyuKm(String sikyu_km) {
		// TODO Auto-generated method stub
		return sikyuMapper.getBySikyuKm(sikyu_km);
	}

}
