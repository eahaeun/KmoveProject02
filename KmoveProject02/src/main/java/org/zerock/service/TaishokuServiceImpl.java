package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.TaishokuVO;
import org.zerock.mapper.ShainMapper;
import org.zerock.mapper.TaishokuMapper;

import lombok.Setter;

@Service
public class TaishokuServiceImpl implements TaishokuService {
	@Setter(onMethod_ = @Autowired)
	private TaishokuMapper mapper;

	@Setter(onMethod_ = @Autowired)
	private ShainMapper mapper2;

	@Override
	public List<TaishokuVO> getTKList() {
		// TODO Auto-generated method stub
		return mapper.getTaishokuVO();
	}

	@Override
	public void insertShainAndTaishoku(String shain_no, String taishoku_ymd, String taishoku_jiyu,
			String taishoku_renraku) {
		// TKDTO 객체를 생성하여 값을 설정
		TaishokuVO shainDTO = new TaishokuVO();
		shainDTO.setShain_no(shain_no);
		shainDTO.setTaishoku_ymd(taishoku_ymd);
		shainDTO.setTaishoku_jiyu(taishoku_jiyu);
		shainDTO.setTaishoku_renraku(taishoku_renraku);
		TaishokuVO existingData = mapper.getTaishokuInfo(shainDTO.getShain_no());
		// 매퍼 메서드 호출
		if (existingData != null) {
			// 이미 존재하는 경우, UPDATE 쿼리 실행

			mapper2.updateTaishokuYMD(shainDTO);
			mapper.updateTaishoku(shainDTO);

		} else {
			mapper2.updateTaishokuYMD(shainDTO);
			mapper.insertTaishoku(shainDTO);
		}
	}

	@Override
	public TaishokuVO getTaishokuInfo(String shain_no) {
		return mapper.getTaishokuInfo(shain_no);

	}

	@Override
	public int cancelTaishoku(String shain_no) {
		return mapper.cancelTaishoku(shain_no);
	}

	@Override
	public int cancelShain(String shain_no) {
		return mapper2.cancelShain(shain_no);
	}


		
}
