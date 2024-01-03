package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.KojyoVO;
import org.zerock.mapper.KojyoMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class KojyoServiceImpl implements KojyoService {

	@Setter(onMethod_ = @Autowired)
	private KojyoMapper kojyoMapper;

	@Override
	public void create(KojyoVO vo) {
		// TODO Auto-generated method stub
		kojyoMapper.create(vo);
	}

	@Override
	public List<KojyoVO> get(String Kojyo_km) {
		// TODO Auto-generated method stub
		return kojyoMapper.get(Kojyo_km);
	}

	@Override
	public void delete(String kojyo_km) {
		// TODO Auto-generated method stub
		kojyoMapper.delete(kojyo_km);
	}

	@Override
	public boolean update(KojyoVO vo, String target_kojyo_km) {
		// TODO Auto-generated method stub
		return kojyoMapper.update(vo, target_kojyo_km) > 0;
	}

	@Override
	public KojyoVO getByKojyoKm(String kojyo_km) {
		// TODO Auto-generated method stub
		return kojyoMapper.getByKojyoKm(kojyo_km);
	}

}
