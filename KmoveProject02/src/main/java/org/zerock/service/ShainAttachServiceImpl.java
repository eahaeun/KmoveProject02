package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.ShainAttachVO;
import org.zerock.mapper.ShainAttachMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class ShainAttachServiceImpl implements ShainAttachService {

	@Setter(onMethod_ = @Autowired)
	private ShainAttachMapper attachMapper;
	
	@Override
	public void uploadProfile(ShainAttachVO attachVO) {
		attachMapper.insert(attachVO);

	}

	@Override
	public ShainAttachVO getProfile(String shain_no) {
		// TODO Auto-generated method stub
		return attachMapper.getAttachByShainNo(shain_no);
	}

	@Override
	public boolean updateAttach(ShainAttachVO attachVO) {
		// TODO Auto-generated method stub
		return attachMapper.updateAttach(attachVO) == 1;
	}
	
	
}
