package org.zerock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.KintaiVO;
import org.zerock.domain.KyukaVO;
import org.zerock.service.KintaiService;
import org.zerock.service.KyukaService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/setting/*")
public class KyukaController {

	@Setter(onMethod_ = @Autowired)
	private KyukaService kyukaservice;

	@Setter(onMethod_ = @Autowired)
	private KintaiService kintaiservice;

	@GetMapping("/kyukaRead")
	public void kyukaget(Model model) {
		List<KyukaVO> kyukaread = kyukaservice.get("kyuka_km");

		for (int i = 0; i < kyukaread.size(); i++) {
			KyukaVO kyukaList = kyukaread.get(i);

			// 시작일자 포맷팅
			String formattedKaishiYmd = kyukaList.getKaishi_ymd().substring(0, kyukaList.getKaishi_ymd().indexOf(" "));
			kyukaList.setKaishi_ymd(formattedKaishiYmd);

			// 종료일자 포맷팅
			String formattedShuryoYmd = kyukaList.getShuryo_ymd().substring(0, kyukaList.getShuryo_ymd().indexOf(" "));
			kyukaList.setShuryo_ymd(formattedShuryoYmd);
		}

		List<KintaiVO> kintaiList = kintaiservice.get("kintai_km");
		log.info(kintaiList);

		model.addAttribute("kintaiList", kintaiList);
		model.addAttribute("kyukaList", kyukaread);
	}


	@PostMapping("/kyukaUpdate")
	public String kyukaupdate(KyukaVO vo, @RequestParam("target_km") String target_km) {
		System.out.println("kyuka is : " + vo);
		System.out.println("target is : " + target_km);
		kyukaservice.update(vo, target_km);

		return "redirect:/setting/kyukaRead";
	}

	@PostMapping("/kyukaCreate")
	public String kyukacreate(KyukaVO vo) {
		log.info("휴가 " + vo.getKyuka_active());
		if ("O".equals(vo.getKyuka_active())) {
			kyukaservice.addKyuka();
			log.info("休暇 plus 15日");
		}
		kyukaservice.create(vo);

		return "redirect:/setting/kyukaRead";
	}

	@PostMapping("/kyukaDelete")
	public String kyukadelete(@RequestParam("kyuka_km") String kyuka_km) {
		kyukaservice.delete(kyuka_km);
		return "redirect:/setting/kyukaRead";
	}

	@PostMapping("/kintaiUpdate")
	public String kintaiupdate(KintaiVO vo, @RequestParam("target_kintai_km") String target_kintai_km) {
		System.out.println("kintai isssss : " + vo);
		System.out.println("target isssss : " + target_kintai_km);
		kintaiservice.update(vo, target_kintai_km);
		return "redirect:/setting/kyukaRead";
	}

	@PostMapping("/kintaiCreate")
	public String kintaicreate(KintaiVO vo) {
		log.info("hahaha : " + vo);
		kintaiservice.create(vo);
		return "redirect:/setting/kyukaRead";

	}

	@PostMapping("/kintaiDelete")
	public String kintaidelete(@RequestParam("kintai_km") String kintai_km) {
		kintaiservice.delete(kintai_km);
		return "redirect:/setting/kyukaRead";
	}

	@PostMapping("/kyukaRead")
	@ResponseBody
	public KyukaVO test(@RequestParam("kyuka_km") String kyuka_km, Model model) {
		System.out.println("성공" + kyuka_km);

		KyukaVO kyuka = kyukaservice.getByKyukaKm(kyuka_km);

		// 시작일자 포맷팅
		String formattedKaishiYmd = kyuka.getKaishi_ymd().substring(0, kyuka.getKaishi_ymd().indexOf(" "));
		kyuka.setKaishi_ymd(formattedKaishiYmd);

		String formattedShuryoYmd = kyuka.getShuryo_ymd().substring(0, kyuka.getShuryo_ymd().indexOf(" "));
		kyuka.setShuryo_ymd(formattedShuryoYmd);

		return kyuka;

	}

	@PostMapping("/kintaiRead")
	@ResponseBody
	public KintaiVO tested(@RequestParam("kintai_km") String kintai_km, Model model) {
		System.out.println("성공" + kintai_km);

		KintaiVO kintai = kintaiservice.getByKintaiKm(kintai_km);

		return kintai;
	}

}
