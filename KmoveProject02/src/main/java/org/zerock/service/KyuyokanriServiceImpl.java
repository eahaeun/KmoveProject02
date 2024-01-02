package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.KintaiHistoryVO;
import org.zerock.domain.KojyoVO;
import org.zerock.domain.KyuyoHistoryVO;
import org.zerock.domain.ShainVO;
import org.zerock.domain.SikyuVO;
import org.zerock.mapper.KintaiHistoryMapper;
import org.zerock.mapper.KojyoMapper;
import org.zerock.mapper.KyuyoHistoryMapper;
import org.zerock.mapper.ShainMapper;
import org.zerock.mapper.SikyuMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class KyuyokanriServiceImpl implements KyuyokanriService {

	@Setter(onMethod_ = @Autowired)
	private KintaiHistoryMapper kintaiHistroyMapper;
	
	@Setter(onMethod_ = @Autowired)
	private KojyoMapper kojyoMapper;
	
	@Setter(onMethod_ = @Autowired)
	private KyuyoHistoryMapper kyuyoHistroyMapper;
	
	@Setter(onMethod_ = @Autowired)
	private ShainMapper shainMapper;
	
	@Setter(onMethod_ = @Autowired)
	private SikyuMapper sikyuMapper;
	
	
	
	@Override
	public boolean kyuyoHistroyModifiy(KyuyoHistoryVO kyuyoHistory) {
		// TODO Auto-generated method stub
		return kyuyoHistroyMapper.update(kyuyoHistory) == 1;
	}

	@Override
	public List<ShainVO> getShainList() {
		// TODO Auto-generated method stub
		return shainMapper.getList();
	}

	@Override
	public ShainVO getShain(String shain_no) {
		// TODO Auto-generated method stub
		return shainMapper.read(shain_no);
	}

	@Override
	public List<KyuyoHistoryVO> getKyuyoHistoryList() {
		// TODO Auto-generated method stub
		return kyuyoHistroyMapper.getList();
	}

	@Override
	public KyuyoHistoryVO getKyuyoHistroy(String shain_no, String kizoku_ym) {
		// TODO Auto-generated method stub
		return kyuyoHistroyMapper.read(shain_no, kizoku_ym);
	}

	@Override
	public void kyuyoHistoryregister(KyuyoHistoryVO kyuyoHistory) {
		// TODO Auto-generated method stub
		kyuyoHistroyMapper.insert(kyuyoHistory);
	}

	@Override
	public List<KojyoVO> getKojyoList() {
		// TODO Auto-generated method stub
		return kojyoMapper.getList();
	}

	@Override
	public List<SikyuVO> getSikyuList() {
		// TODO Auto-generated method stub
		return sikyuMapper.getList();
	}

	@Override
	public List<KintaiHistoryVO> getKintaiHistory(String shain_no) {
		// TODO Auto-generated method stub
		return kintaiHistroyMapper.read(shain_no);
	}

	@Override
	public List<KintaiHistoryVO> findBykintaiHistory(String shain_no, String kizoku_ym) {
		// TODO Auto-generated method stub
		return kintaiHistroyMapper.findBykintaiHistory(shain_no, kizoku_ym);
	}

	@Override
	public boolean shainModifiy(ShainVO shain) {
		// TODO Auto-generated method stub
		return shainMapper.update(shain) == 1;
	}
	
	
	
	/*
	 * @Override public boolean remove(String shain_no) { // TODO Auto-generated
	 * method stub return false; }
	 */
	
}
