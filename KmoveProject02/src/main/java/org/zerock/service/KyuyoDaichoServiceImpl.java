package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.KyuyoHistoryVO;
import org.zerock.domain.KyuyoTotalVO;
import org.zerock.domain.ShainVO;
import org.zerock.mapper.KyuyoHistoryMapper;
import org.zerock.mapper.ShainMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class KyuyoDaichoServiceImpl implements KyuyoDaichoService {

	
	@Setter(onMethod_ = @Autowired)
	private KyuyoHistoryMapper kyuyoHistroyMapper;
	
	@Setter(onMethod_ = @Autowired)
	private ShainMapper shainMapper;
	
	
	@Override
	public List<KyuyoTotalVO> getKyuyoTotal(String kizoku_ym) {
		// TODO Auto-generated method stub
		return kyuyoHistroyMapper.kyuyoTotal(kizoku_ym);
	}

	@Override
	public List<ShainVO> getShainList(String kizoku_ym) {
		// TODO Auto-generated method stub
		return shainMapper.findByShain_no(kizoku_ym);
	}

	@Override
	public List<KyuyoHistoryVO> getKyuyoList() {
		// TODO Auto-generated method stub
		return kyuyoHistroyMapper.getList();
	}

	@Override
	public boolean removeKyuyoTotal(String kizoku_ym) {
		// TODO Auto-generated method stub
		return kyuyoHistroyMapper.deleteTotal(kizoku_ym) == 1;
	}
	

	@Override
	public List<KyuyoHistoryVO> findByYM(String kizoku_ym) {
		// TODO Auto-generated method stub
		return kyuyoHistroyMapper.findByYM(kizoku_ym);
	}

}
