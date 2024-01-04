package org.zerock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.KojyoVO;
import org.zerock.domain.SikyuVO;
import org.zerock.service.KojyoService;
import org.zerock.service.SikyuService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/setting/*")
public class SikyuController {

	@Setter(onMethod_ = @Autowired)
	private SikyuService sikyuservice;

	@Setter(onMethod_ = @Autowired)
	private KojyoService kojyoservice;

	@GetMapping("/sikyuRead")
	public void sikyuget(Model model) {
		model.addAttribute("sikyuCount",sikyuservice.getCount());
		model.addAttribute("kojyoCount",kojyoservice.getCount());
		
		List<SikyuVO> sikyuread = sikyuservice.get("sikyu_km");
		log.info(sikyuread);
		model.addAttribute("sikyuList", sikyuread);

		List<KojyoVO> kojyoread = kojyoservice.get("kojyo_km");
		log.info(kojyoread);
		model.addAttribute("kojyoList", kojyoread);
	}
	
	@PostMapping("/sikyuRead")
	@ResponseBody
	public SikyuVO test(@RequestParam("sikyu_km") String sikyu_km, Model model) {
		model.addAttribute("sikyuCount",sikyuservice.getCount());
		model.addAttribute("kojyoCount",kojyoservice.getCount());
		
		System.out.println("성공 : " + sikyu_km);

		SikyuVO sikyu = sikyuservice.getBySikyuKm(sikyu_km);
		log.info("hahaha: " + sikyu);

		return sikyu;
	}

	@PostMapping("/sikyuUpdate")
	public String sikyuUpdate(SikyuVO vo, @RequestParam("target_km") String target_km) {
		log.info("hahaha" + vo.toString());
		sikyuservice.update(vo, target_km);
		return "redirect:/setting/sikyuRead";
	}
	
	@PostMapping("/sikyuCreate")
    public String sikyuCreate(@ModelAttribute SikyuVO sikyu) {
		sikyuservice.create(sikyu);
    	return "redirect:/setting/sikyuRead";
    }

	@PostMapping("/sikyuDelete")
	public String sikyuDelete(@RequestParam("sikyu_km") String sikyu_km) {
		sikyuservice.delete(sikyu_km);
		return "redirect:/setting/sikyuRead";
	}

	@PostMapping("/kojyoUpdate")
	public String kojyoUpdate(KojyoVO vo, @RequestParam("target_kojyo_km") String target_kojyo_km) {
		log.info(vo);
		kojyoservice.update(vo, target_kojyo_km);
		return "redirect:/setting/sikyuRead";
	}

	@PostMapping("/kojyoCreate")
	public String kojyoCreate(KojyoVO vo) {
		kojyoservice.create(vo);
		return "redirect:/setting/sikyuRead";
	}

	@PostMapping("/kojyoDelete")
	public String kojyoDelete(@RequestParam("kojyo_km") String kojyo_km) {
		kojyoservice.delete(kojyo_km);
		return "redirect:/setting/sikyuRead";
	}
	
	@PostMapping("/kojyoRead")
	@ResponseBody
	public KojyoVO tested(@RequestParam("kojyo_km") String kojyo_km, Model model) {
		System.out.println("성공" + kojyo_km);

		KojyoVO kojyo = kojyoservice.getByKojyoKm(kojyo_km);

		return kojyo;
	}

	
}
