package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.ShainEduVO;
import org.zerock.mapper.ShainEduMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class ShainEduServiceImpl implements ShainEduService {
	
	@Setter(onMethod_ = @Autowired)
	private ShainEduMapper mapper;
	
	@Override
	public void register(ShainEduVO eduVO) {
		mapper.register(eduVO);

	}

	@Override
	public List<ShainEduVO> getEduByShainNo(String shain_no) {
        return mapper.getEduByShainNo(shain_no);
    }

	@Override
	public boolean eduModify(ShainEduVO eduVO) {
		boolean eduModifyResult = mapper.eduModify(eduVO) == 1;
		return eduModifyResult;
		
	}
	
	

}
