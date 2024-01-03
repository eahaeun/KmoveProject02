package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.KanrishaVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class KanrishaMapperTests {
	@Setter(onMethod_ = @Autowired)
	private KanrishaMapper mapper;

	@Test
	public void testInsert() {
		KanrishaVO vo = new KanrishaVO();
		vo.setKanrisha_nm("d");
		vo.setKanrisha_pw("d");
		vo.setKanrisha_uid("d");
		vo.setRenraku_tel("d");
		vo.setRenraku_email("d");
		mapper.insert(vo);
	}
	
	@Test
	public void testLogin() {
		mapper.selectById("15", "15");
	}
	/*
	 * @Test public void testGet() { log.info(mapper.get("user00")); }
	 */
}
