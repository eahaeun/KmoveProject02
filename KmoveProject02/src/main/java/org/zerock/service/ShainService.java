package org.zerock.service;

import java.util.List;

import org.zerock.domain.ShainVO;

public interface ShainService {
	public void register(ShainVO vo);
	
	public List<ShainVO> getList();
	
	public List<ShainVO> getListByKoyoKeitai(String koyo_keitai);

	public List<ShainVO> getListByZaishokuSt(String zaishoku_st);
	
	public void delete(String shain_no);
	
	public void deleteEdu(String shain_no);
	
	public void deleteCareer(String shain_no);
	
	public int getCount();
	
	public int getCountByEmpType(String empType);
	
	public int getCountByStateType(String stateType);
	
}
