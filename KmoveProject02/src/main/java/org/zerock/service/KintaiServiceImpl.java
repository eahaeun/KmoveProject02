package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.KintaiVO;
import org.zerock.mapper.KintaiMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class KintaiServiceImpl implements KintaiService {
	@Setter(onMethod_ = @Autowired)
	private KintaiMapper kintaimapper;

	@Override
	public List<KintaiVO> getList() {
		log.info("getList......");
		return kintaimapper.getList();
	}

	@Override
	public List<KintaiVO> get(String kintai_km) {
		// TODO Auto-generated method stub
		return kintaimapper.get(kintai_km);
	}

	@Override
	public boolean update(KintaiVO vo, String target_kintai_km) {
		// TODO Auto-generated method stub
		return kintaimapper.update(vo, target_kintai_km) > 0;
	}

	@Override
	public void delete(String kintai_km) {
		// TODO Auto-generated method stub
		 kintaimapper.delete(kintai_km);
	}

	@Override
	public void create(KintaiVO vo) {
		// TODO Auto-generated method stub
		kintaimapper.create(vo);

	}

	@Override
	public KintaiVO getByKintaiKm(String kintai_km) {
		// TODO Auto-generated method stub
		return kintaimapper.getByKintaiKm(kintai_km);
	}
}
