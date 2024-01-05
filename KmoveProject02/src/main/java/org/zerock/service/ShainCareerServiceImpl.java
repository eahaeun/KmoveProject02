package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.ShainCareerVO;
import org.zerock.mapper.ShainCareerMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class ShainCareerServiceImpl implements ShainCareerService {
	
	@Setter(onMethod_ = @Autowired)
	private ShainCareerMapper mapper;

	@Override
	public void register(ShainCareerVO careerVO) {
		mapper.register(careerVO);
		
	}

	@Override
	public List<ShainCareerVO> getCareerByShainNo(String shain_no) {
		return mapper.getCareerByShainNo(shain_no);
	}

	@Override
	public boolean careerModify(ShainCareerVO careerVO) {
		boolean careerModifyResult = mapper.careerModify(careerVO) == 1;
		return careerModifyResult;
	}
	
	

	
}
