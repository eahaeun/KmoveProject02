package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.ShainVO;
import org.zerock.mapper.ShainCareerMapper;
import org.zerock.mapper.ShainEduMapper;
import org.zerock.mapper.ShainMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ShainServiceImpl implements ShainService {
	@Setter(onMethod_ = @Autowired)
	private ShainMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private ShainEduMapper eduMapper;
	
	@Setter(onMethod_ = @Autowired)
	private ShainCareerMapper careerMapper;
	
	public void register(ShainVO vo) {
		log.info("register.....");
		mapper.insert(vo);
	}

	@Override
	public List<ShainVO> getList() {
		log.info("getList......");
		return mapper.getList();
	}

	@Override
	public List<ShainVO> getListByKoyoKeitai(String koyo_keitai) {
		return mapper.getListByKoyoKeitai(koyo_keitai);
	}
	

	@Override
	public List<ShainVO> getListByZaishokuSt(String zaishoku_st) {
		return mapper.getListByZaishokuSt(zaishoku_st);
	}
	
	@Override
	public void delete(String shain_no) {
		mapper.delete(shain_no);
	}
	
	@Override
	public void deleteEdu(String shain_no) {
		eduMapper.delete(shain_no);
	}

	@Override
	public void deleteCareer(String shain_no) {
		careerMapper.delete(shain_no);
	}
	
	@Override
	public int getCount() {
		return mapper.getCount();
	}
	
	@Override
	public int getCountByEmpType(String empType) {
		return mapper.getCountByEmpType(empType);
	}

	@Override
	public int getCountByStateType(String stateType) {
		return mapper.getCountByStateType(stateType);
	}
	
	
	
	
}
