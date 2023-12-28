package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.BushoVO;

public interface BushoMapper {
	public List<BushoVO> getList();

	public void insert(BushoVO vo);

	int update(@Param("busho_nm") String busho_nm, @Param("new_value") String new_value);

	public int delete(String busho_nm);

}
