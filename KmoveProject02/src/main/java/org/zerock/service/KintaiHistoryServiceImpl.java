package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.KintaiHistoryVO;
import org.zerock.domain.KyukaHourVO;
import org.zerock.mapper.KintaiHistoryMapper;
import org.zerock.mapper.ShainMapper;

import lombok.Setter;

@Service
public class KintaiHistoryServiceImpl implements KintaiHistoryService {

	@Setter(onMethod_ = @Autowired)
	private KintaiHistoryMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private ShainMapper shainMapper;

	@Override
	public void register(KintaiHistoryVO kintaihistory) {
		// TODO Auto-generated method stub
		mapper.insert(kintaihistory);
	}

	@Override
	public List<KintaiHistoryVO> search(String shain_no) {
	    return mapper.search(shain_no);
	}
	
	@Override
	public List<KyukaHourVO> getKHour() {
		// TODO Auto-generated method stub
		return mapper.getKHour();
	}
	
	@Override
	public List<KintaiHistoryVO> getShain(String shain_no) {
	    return mapper.getShain(shain_no);
	}
	
	public List<String> getKoyoKeitai(){
		return shainMapper.getKoyoKeitai();
	}

}