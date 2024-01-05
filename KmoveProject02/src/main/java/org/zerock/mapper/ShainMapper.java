package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ShainVO;
import org.zerock.domain.TaishokuVO;

public interface ShainMapper {
	public int getCount();

	public int getCountByEmpType(String empType);
	
	public int getCountByStateType(String stateType);

	public void insert(ShainVO vo);

	public List<ShainVO> getList();

	public List<ShainVO> getListByKoyoKeitai(String koyo_keitai);
	
	public List<ShainVO> getListByZaishokuSt(String zaishoku_st);

	public ShainVO read(String shain_no);

	public int update(ShainVO shain);
	
	public void updateTaishokuYMD(TaishokuVO shainDTO);

	int cancelShain(String shain_no);
	
	public List<ShainVO> findByShain_no(String kizoku_ym);
	
	public void delete(String shain_no);
	
	public List<String> getKoyoKeitai();
	
	public int addKyuka();
	
	public int modify(ShainVO vo);
	
	public ShainVO get(String shain_no);
	
}
