package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.KyukaVO;
import org.zerock.mapper.KyukaMapper;
import org.zerock.mapper.ShainMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class KyukaServiceImpl implements KyukaService {

	@Setter(onMethod_ = @Autowired)
	private KyukaMapper kyukaMapper;
	
	@Setter(onMethod_= @Autowired)
	private ShainMapper shainMapper;

	@Override
	public List<KyukaVO> get(String kyuka_km) {
		// TODO Auto-generated method stub
		return kyukaMapper.get(kyuka_km);
	}

	@Override
	public boolean update(KyukaVO vo, String target_km) {
		// TODO Auto-generated method stub
		return kyukaMapper.update(vo, target_km) > 0;
	}

	@Override
	public void delete(String kyuka_km) {
		// TODO Auto-generated method stub
		kyukaMapper.delete(kyuka_km);
	}

	@Override
	public void create(KyukaVO vo) {
		// TODO Auto-generated method stub
		kyukaMapper.create(vo);
	}

	@Override
	public KyukaVO getByKyukaKm(String kyuka_km) {
		// TODO Auto-generated method stub
		return kyukaMapper.getByKyukaKm(kyuka_km);
	}

	@Override
	public boolean updateKyuka() {
		// TODO Auto-generated method stub
		return shainMapper.addKyuka() == 0;
	}
	
	

}
