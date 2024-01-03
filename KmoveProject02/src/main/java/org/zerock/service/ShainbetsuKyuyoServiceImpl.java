package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.KyuyoHistoryVO;
import org.zerock.domain.ShainVO;
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
public class ShainbetsuKyuyoServiceImpl implements ShainbetsuKyuyoService {

	@Setter(onMethod_ = @Autowired)
	private ShainMapper shainMapper;
	@Setter(onMethod_ = @Autowired)
	private KyuyoHistoryMapper kyuyoHistoryMapper;
	
	@Override
	public List<ShainVO> getShainList() {
		// TODO Auto-generated method stub
		return shainMapper.getList();
	}

	@Override
	public List<KyuyoHistoryVO> getKyuyoByDate(String shain_no, String start_ym, String end_ym) {
		// TODO Auto-generated method stub
		return kyuyoHistoryMapper.kyuyoByDate(shain_no, start_ym, end_ym);
	}

	@Override
	public ShainVO getShain(String shain_no) {
		// TODO Auto-generated method stub
		return shainMapper.read(shain_no);
	}
}
