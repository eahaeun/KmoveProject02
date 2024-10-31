package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.KaishaVO;
import org.zerock.domain.KanrishaVO;
import org.zerock.service.KaishaService;
import org.zerock.service.KanrishaService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/setting/*")
public class KaishaController {

	@Setter(onMethod_ = @Autowired)
	private KaishaService kaishaService;

	@Setter(onMethod_ = @Autowired)
	private KanrishaService kanrishaService;

	@PostMapping("/allUpdate")
	public String kanrishaupdate(KaishaVO kaisha, KanrishaVO kanrisha) {
		kanrishaService.update(kanrisha);
		kaishaService.update(kaisha);

		return "redirect:/setting/kaishaRead";
	}

	@GetMapping("/kaishaRead")
	public void kaishaGet(Model model) {
		// 회사명을 기반으로 회사 정보를 검색
		KaishaVO kaisha = kaishaService.get("kaisha_nm");
		KanrishaVO kanrisha = kanrishaService.get();
		
		// 설립일 날짜처리
		String formattedDate = kaisha.getSetsuritsu_ymd().substring(0, kaisha.getSetsuritsu_ymd().indexOf(" "));
		kaisha.setSetsuritsu_ymd(formattedDate);

		// 뷰에서 렌더링할 모델에 회사 정보를 추가
		model.addAttribute("kaisha", kaisha);
		model.addAttribute("kanrisha", kanrisha);
	}
}
