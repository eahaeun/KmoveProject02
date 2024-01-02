package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.KintaiHourVO;
import org.zerock.mapper.KintaiHistoryMapper;

import lombok.Setter;

@Service
public class KintaiHourServiceImpl implements KintaiHourService {
	
	@Setter(onMethod_ = @Autowired)
	private KintaiHistoryMapper mapper;

	@Override
	public List<KintaiHourVO> getHour() {
		// TODO Auto-generated method stub
		return mapper.getHour();
	}
	
	@Override
    public List<KintaiHourVO> getDataByMonth(String searchMonth) {
        return mapper.getDataByMonth(searchMonth);
    }
	
	@Override
    public List<KintaiHourVO> getDataByD(String searchMonth) {
        return mapper.getDataByD(searchMonth);
    }

}
