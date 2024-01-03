package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.KaishaVO;
import org.zerock.mapper.KaishaMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class KaishaServiceImpl implements KaishaService {

	@Setter(onMethod_ = @Autowired)
	private KaishaMapper mapper;

	/**
	 * 회사 정보 조회 기능
	 *
	 * @param kaisha_nm 회사명
	 * @return 회사 정보 객체 (KaishaVO)
	 */
	@Override
	public KaishaVO get(String kaisha_nm) {
		return mapper.read(kaisha_nm);
	}

	/**
	 * 회사 정보 수정 기능
	 *
	 * @param vo 수정할 회사 정보 객체 (KaishaVO)
	 * @return 수정 성공 여부 (true: 성공, false: 실패)
	 */
	@Override
	public boolean update(KaishaVO vo) {
		// Mapper를 통해 데이터베이스에 회사 정보를 업데이트하고, 업데이트된 행의 수를 반환받음
		// 반환된 행의 수가 0보다 크면 업데이트 성공, 0이면 실패
		return mapper.update(vo) > 0;
	}

	@Override
	public KaishaVO read() {
		return mapper.get();
	}
	
	
}
