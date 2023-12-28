package org.zerock.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.KintaiHistoryVO;
import org.zerock.service.KintaiHistoryService;
import org.zerock.service.KintaiService;
import org.zerock.service.ShainService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/kintai/*")
@AllArgsConstructor
public class KintaiHistoryController {

	private ShainService shainService;
	private KintaiService kintaiService;
	private KintaiHistoryService kintaihistoryService;

	@GetMapping("/list")
	public void list(Model model) {

		model.addAttribute("list", shainService.getList());
		model.addAttribute("save", kintaiService.getList());
	}

	@PostMapping("/list")
    public ResponseEntity<String> handleKintaiFormSubmit(@ModelAttribute KintaiHistoryVO vo) {

        System.out.println("Received data: " + vo);
        kintaihistoryService.register(vo);
        return ResponseEntity.ok("Data received and registered successfully!");
    }
	
	@GetMapping("/modify")
	public void search(@RequestParam("shain_no") String shain_no, Model model) {
	    List<KintaiHistoryVO> search = kintaihistoryService.search(shain_no);
	    model.addAttribute("search", search);
	}
	
	

}