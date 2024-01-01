package org.zerock.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ShainServiceTests {

	@Setter(onMethod_ = @Autowired)
	private ShainService service;
	
	@Test
	public void testGetList() {
		log.info(service.getListByKoyoKeitai("2023-11"));
	}

	@Test
	public void testGetListByZaishokuSt() {
		log.info(service.getListByZaishokuSt("在職"));
	}
}
