package org.zerock.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.TaishokuVO;
import org.zerock.service.TaishokuService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/taishoku/*")
@Log4j
@AllArgsConstructor
public class TaishokuController {
	private TaishokuService service;

	@GetMapping("/list")
	public void list(Model model) {
		List<TaishokuVO> list = service.getTKList();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		for (int i = 0; i < list.size(); i++) {
			list.get(i).setNum(i + 1);
		}

		for (int i = 0; i < list.size(); i++) {

			if (list.get(i).getTaishoku_ymd() != null) {
				TaishokuVO shain = list.get(i);
				String formattedDate = shain.getNyusha_ymd().substring(0, shain.getNyusha_ymd().indexOf(" "));
				shain.setNyusha_ymd(formattedDate);
				String formattedDate2 = shain.getTaishoku_ymd().substring(0, shain.getTaishoku_ymd().indexOf(" "));
				shain.setTaishoku_ymd(formattedDate2);

				try {
					Date nyushaDate = dateFormat.parse(list.get(i).getNyusha_ymd());
					Date taishokuDate = dateFormat.parse(list.get(i).getTaishoku_ymd());

					LocalDate localDate1 = nyushaDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
					LocalDate localDate2 = taishokuDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

					int yearDiff = localDate2.getYear() - localDate1.getYear();
					list.get(i).setYearDiff(yearDiff);
				} catch (ParseException e) {
					// 예외 처리
					e.printStackTrace();
					// 둘다 String으로 받아올떄 날짜계산.
				}

			} else {

				try {
					TaishokuVO shain = list.get(i);
					String formattedDate = shain.getNyusha_ymd().substring(0, shain.getNyusha_ymd().indexOf(" "));
					shain.setNyusha_ymd(formattedDate);

					Date nyushaDate = dateFormat.parse(list.get(i).getNyusha_ymd());
					LocalDate localDate1 = nyushaDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
					LocalDate localDate2 = new Date().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
					int yearDiff = localDate2.getYear() - localDate1.getYear();
					list.get(i).setYearDiff(yearDiff);
				} catch (ParseException e) {
					// 예외 처리
					e.printStackTrace();
				}
			}

			model.addAttribute("tk", list);
		}
	}

	@PostMapping("/taishokuOn")
	@ResponseBody
	public String insertShainAndTaishoku(@RequestParam("shain_no") String shain_no,
			@RequestParam("taishoku_ymd") String taishoku_ymd, @RequestParam("taishoku_jiyu") String taishoku_jiyu,
			@RequestParam("taishoku_renraku") String taishoku_renraku) {
		try {
			service.insertShainAndTaishoku(shain_no, taishoku_ymd, taishoku_jiyu, taishoku_renraku);
			return "success";
		} catch (Exception e) {
			log.error("Insertion failed", e);
			return "fail";
		}
	}

	@GetMapping("/taishokuInfo")
	@ResponseBody
	public TaishokuVO getTaishokuInfo(@RequestParam("shain_no") String shain_no) {
		try {
			TaishokuVO taishokuInfo = service.getTaishokuInfo(shain_no);
			String formattedDate = taishokuInfo.getTaishoku_ymd().substring(0,
					taishokuInfo.getTaishoku_ymd().indexOf(" "));
			taishokuInfo.setTaishoku_ymd(formattedDate);
			return taishokuInfo;
		} catch (Exception e) {
			log.error("Load failed", e);
			return null; // 또는 적절한 에러 응답을 반환할 수 있습니다.
		}
	}

	@PostMapping("/taishokuCancel")
	@ResponseBody
	public void cancelShainAndTaishoku(@RequestParam("shain_no") String shain_no) {
		System.out.println("selected shain: " + shain_no);
			service.cancelTaishoku(shain_no);
			service.cancelShain(shain_no);
	}
}
