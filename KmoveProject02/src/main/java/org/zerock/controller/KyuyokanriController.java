package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.KyuyoHistoryVO;
import org.zerock.domain.ShainVO;
import org.zerock.service.KyuyokanriService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/kyuyo/*")
@AllArgsConstructor
public class KyuyokanriController {

	private KyuyokanriService kyuyoKanriService;
	//private KyuyoDaichoService kyuyoDaichoService;
	
	@GetMapping("/kyuyokanrishokigamen")
	public void kyuyokanrishokigamen() {
		
	}
	
	@GetMapping("/kyuyokanri")
	public String kyuyokanri( @RequestParam("kizoku_ym") String kizoku_ym, @RequestParam("shain_no") String shain_no, Model model) {
		
		log.info("KyuyoKanri: " + kyuyoKanriService.getKyuyoHistroy(shain_no, kizoku_ym));
		
		
		
		log.info(kizoku_ym);
		log.info(shain_no);
		model.addAttribute("sikyu", kyuyoKanriService.getSikyuList());
		log.info("sikyu: " + kyuyoKanriService.getSikyuList());
		model.addAttribute("kojyo", kyuyoKanriService.getKojyoList());
		model.addAttribute("kintaijyoho", kyuyoKanriService.getKintaiHistory(shain_no));
		model.addAttribute("shainjyoho", kyuyoKanriService.getShain(shain_no));
		model.addAttribute("findByKintai", kyuyoKanriService.findBykintaiHistory(shain_no, kizoku_ym));
		log.info("findByKintai: " + kyuyoKanriService.findBykintaiHistory(shain_no, kizoku_ym) );
		model.addAttribute("kyuyojyoho", kyuyoKanriService.getKyuyoHistroy(shain_no, kizoku_ym));
		model.addAttribute("param", kizoku_ym);
		model.addAttribute("param", shain_no);
		return "/kyuyo/kyuyokanri";
	}
	
	@PostMapping("/kyuyokanri")
	public String registerKyuyokanri(@RequestParam("kizoku_ym") String kizoku_ym, @RequestParam("shain_no") String shain_no, KyuyoHistoryVO kyuyoHistory, ShainVO shain, RedirectAttributes rttr) {
		
		if(kyuyoKanriService.getKyuyoHistroy(shain_no, kizoku_ym) == null) {
			
			kyuyoKanriService.kyuyoHistoryregister(kyuyoHistory); // 입력된 데이터를 저장
			kyuyoKanriService.shainModifiy(shain);
			rttr.addFlashAttribute("result", "success");
		}else {
			
			kyuyoKanriService.kyuyoHistroyModifiy(kyuyoHistory);
			kyuyoKanriService.shainModifiy(shain);
			rttr.addFlashAttribute("result", "success");
		}
				
        return "redirect:/kyuyo/kyuyokanrishokigamen"; // KyuyoHistory.jsp로 리다이렉트하여 데이터 표시
	}
	
	/*
	 * @GetMapping("/kyuyoDaicho") public void
	 * KyuyoDaicho(@RequestParam("kizoku_ym") String kizoku_ym, Model model) {
	 * model.addAttribute("kyuyoTotal",
	 * kyuyoDaichoService.getKyuyoTatal(kizoku_ym)); }
	 */
}
