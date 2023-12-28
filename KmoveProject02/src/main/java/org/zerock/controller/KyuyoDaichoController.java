package org.zerock.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.KyuyoTotalVO;
import org.zerock.domain.ShainVO;
import org.zerock.service.KyuyoDaichoService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/kyuyo/*")
@AllArgsConstructor
public class KyuyoDaichoController {

	private KyuyoDaichoService kyuyoDaichoService;

	@GetMapping("/kyuyoDaicho")
	public void KyuyoDaicho() {
		
	}

	@GetMapping("/getKyuyoData")
	@ResponseBody
	public ResponseEntity<List<KyuyoTotalVO>> getKyuyoData(@RequestParam("kizoku_ym") String kizoku_ym) {
		List<KyuyoTotalVO> kyuyoTotal = kyuyoDaichoService.getKyuyoTotal(kizoku_ym);
		log.info(kyuyoTotal);

		return new ResponseEntity<List<KyuyoTotalVO>>(kyuyoTotal, HttpStatus.OK);
	}

	@PostMapping("/deleteKyuyoData")
	public String deleteKyuyoData(@RequestParam("kizoku_ym") String kizoku_ym, RedirectAttributes rttr) {
		kyuyoDaichoService.removeKyuyoTotal(kizoku_ym);
		rttr.addFlashAttribute("result", "success");

		return "redirect:/kyuyo/kyuyoDaicho";
	}

	@GetMapping("/kyuyoDaichoYM")
	public void KyuyoDaichoYM(@RequestParam("kizoku_ym") String kizoku_ym, Model model) {

		log.info(kizoku_ym);
		model.addAttribute("kyuyojyoho", kyuyoDaichoService.findByYM(kizoku_ym));
		log.info(kyuyoDaichoService.findByYM(kizoku_ym));
		List<ShainVO> shainList = kyuyoDaichoService.getShainList(kizoku_ym);

		for (int i = 0; i < shainList.size(); i++) {
			ShainVO shain = shainList.get(i);
			String formattedDate = shain.getNyusha_ymd().substring(0, shain.getNyusha_ymd().indexOf(" "));
			shain.setNyusha_ymd(formattedDate);

		}
		model.addAttribute("shainjyoho", shainList);
		log.info(kyuyoDaichoService.getShainList(kizoku_ym));
	}
}
