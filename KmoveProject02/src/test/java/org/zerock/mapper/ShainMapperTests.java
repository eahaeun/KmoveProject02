package org.zerock.mapper;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.ShainVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ShainMapperTests {
	@Setter(onMethod_ = @Autowired)
	private ShainMapper mapper;

	/*
	 * @Test public void testInsert() throws ParseException { ShainVO vo = new
	 * ShainVO(); vo.setShain_no("0001"); vo.setKihon_pay(200000);
	 * vo.setNyusha_ymd(date); mapper.insert(vo); }
	 */

	/*
	 * @Test public void testInsert() throws ParseException { SimpleDateFormat sdf =
	 * new SimpleDateFormat("yyyy-MM-dd"); Date date = sdf.parse("2000-11-24");
	 * ShainVO vo = new ShainVO(); vo.setShain_no("0001");
	 * vo.setShain_nm("John Doe"); // 예시: 사원 이름 vo.setAddress("Some Address");
	 * vo.setBirth("1990-01-01"); // 예시: 생년월일 vo.setBusho_nm("開発部");
	 * vo.setYakushoku_nm("部長"); vo.setKihon_pay(200000);
	 * vo.setRenraku_tel("010-1234-5678"); vo.setRenraku_email("john@example.com");
	 * vo.setNyusha_ymd(date); vo.setGinko_nm("은행명");
	 * vo.setKoza_num("123-456-78901234"); vo.setKoyo_keitai("근로자");
	 * mapper.insert(vo); }
	 */
	
	@Test
	public void testGetList() {
		mapper.getListByKoyoKeitai("2023-11");
	}
} 