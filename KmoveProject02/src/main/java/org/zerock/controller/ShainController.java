package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.KintaiHistoryVO;
import org.zerock.domain.ShainVO;
import org.zerock.service.BushoService;
import org.zerock.service.KintaiHistoryService;
import org.zerock.service.KintaiService;
import org.zerock.service.ShainService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ShainController {
	@Setter(onMethod_ = @Autowired)
	private ShainService shainService;

	@Setter(onMethod_ = @Autowired)
	private BushoService bushoService;

	@Setter(onMethod_ = @Autowired)
	private KintaiService kintaiService;

	@Setter(onMethod_ = @Autowired)
	private KintaiHistoryService kintaiHistoryService;

	@GetMapping("/shainRegister")
	public void register() {

	}

	@PostMapping("/shainRegister")
	public void register(ShainVO vo) {
		try {
			log.info("register......");
			shainService.register(vo);
		} catch (Exception e) {
			log.info(e);
		}
	}

	@GetMapping("/kintaitest")
	public void kintaitest(Model model) {
		model.addAttribute("shainList", shainService.getList());
		model.addAttribute("kintaiList", kintaiService.getList());
	}

	/*
	 * @PostMapping("/kintaiHistoryRegister") public void
	 * kintaiHistoryRegister(KintaiHistoryVO vo) {
	 * kintaiHistoryService.register(vo); }
	 */

	@PostMapping("/kintaiHistoryRegister")
	public ResponseEntity<String> handleKintaiFormSubmit(@ModelAttribute KintaiHistoryVO vo) {
	    // 여기에서 받은 데이터를 이용하여 처리 (예: DB에 저장)

	    // 예시: 받은 데이터를 콘솔에 출력
	    System.out.println("Received data: " + vo);

	    // register 메서드 호출
	    kintaiHistoryService.register(vo);

	    // 수정: 정상적으로 데이터를 처리했을 경우에만 응답을 반환하도록 수정
	    return ResponseEntity.ok("Data received and registered successfully!");
	}


	@GetMapping("/test")
	public void test(Model model) {
		model.addAttribute("bushoList", bushoService.getList());
	}


	/*
	 * @PostMapping("/bushoModify") public void bushoModify(BushoVO vo) {
	 * bushoService.modify(vo); }
	 * 
	 * @PostMapping("/bushoRemove") public void bushoModify(String busho_nm) {
	 * bushoService.remove(busho_nm); }
	 */
}
