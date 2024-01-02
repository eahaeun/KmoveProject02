package org.zerock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.RequestVO;
import org.zerock.domain.ShainVO;
import org.zerock.service.ShainService;

import lombok.Setter;

@Controller
@RequestMapping("/shain/*")
public class ShainController {
	@Setter(onMethod_ = @Autowired)
	private ShainService shainService;

	@GetMapping("/shainList")
	public void getList(Model model) {
		//카운트 전달
		model.addAttribute("zaishokushaCount", shainService.getCountByStateType("在職"));
		model.addAttribute("taishokushaCount", shainService.getCountByStateType("退職"));
		model.addAttribute("seishainCount", shainService.getCountByEmpType("正社員"));
		model.addAttribute("keiyakuCount", shainService.getCountByEmpType("契約社員"));
		model.addAttribute("rinjiCount", shainService.getCountByEmpType("臨時社員"));
		model.addAttribute("hakenCount", shainService.getCountByEmpType("派遣社員"));
		model.addAttribute("itakuCount", shainService.getCountByEmpType("委託社員"));
		model.addAttribute("partCount", shainService.getCountByEmpType("パートタイム"));
		model.addAttribute("allshainCount", shainService.getCount());
		
		
		List<ShainVO> shainList = shainService.getList();

		for (int i = 0; i < shainList.size(); i++) {
			ShainVO shain = shainList.get(i);

			String nyushaYmd = shain.getNyusha_ymd();
			String formattedDate = (nyushaYmd != null && nyushaYmd.contains(" "))
					? nyushaYmd.substring(0, nyushaYmd.indexOf(" "))
					: nyushaYmd;
			shain.setNyusha_ymd(formattedDate);

			String taishokuYmd = shain.getTaishoku_ymd();
			String formattedDate2 = (taishokuYmd != null && taishokuYmd.contains(" "))
					? taishokuYmd.substring(0, taishokuYmd.indexOf(" "))
					: taishokuYmd;
			shain.setTaishoku_ymd(formattedDate2);
		}

		model.addAttribute("shainList", shainList);
	}

	// ajax요청을 처리하고 고용형태에 따른 직원 목록 검색
	// consumes : 클라이언트가 서버에게 보내는 데이터 타입 명시 / produces : 서버가 클라이언트에게 반환하는 데이터 타입 명시
	@PostMapping(value = "/shainList", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody // java 객체를 json기반의 Http body로 변환(반환형이 객체일 때 사용)
	public List<ShainVO> getListByKoyoKeitai(@RequestBody RequestVO request) {

		System.out.println("hahaha : " + request);

		if (request.getZaishoku_st() == null) {
			List<ShainVO> shainList = shainService.getListByKoyoKeitai(request.getKoyo_keitai().trim());

			for (ShainVO shain : shainList) {
				String nyushaYmd = shain.getNyusha_ymd();
				if (nyushaYmd != null && nyushaYmd.contains(" ")) {
					shain.setNyusha_ymd(nyushaYmd.substring(0, nyushaYmd.indexOf(" ")));
				}

				String taishokuYmd = shain.getTaishoku_ymd();
				if (taishokuYmd != null && taishokuYmd.contains(" ")) {
					shain.setTaishoku_ymd(taishokuYmd.substring(0, taishokuYmd.indexOf(" ")));
				}
				
			}

			return shainList;

		} else if (request.getKoyo_keitai() == null) {
			System.out.println("hahaha" + request.getZaishoku_st());
			List<ShainVO> shainList = shainService.getListByZaishokuSt(request.getZaishoku_st().trim());

			for (ShainVO shain : shainList) {
				String nyushaYmd = shain.getNyusha_ymd();
				if (nyushaYmd != null && nyushaYmd.contains(" ")) {
					shain.setNyusha_ymd(nyushaYmd.substring(0, nyushaYmd.indexOf(" ")));
				}

				String taishokuYmd = shain.getTaishoku_ymd();
				if (taishokuYmd != null && taishokuYmd.contains(" ")) {
					shain.setTaishoku_ymd(taishokuYmd.substring(0, taishokuYmd.indexOf(" ")));
				}
			}

			return shainList;
		}
		
		return null;

	}

	@PostMapping("/shainDelete")
	public String deleteShains(@RequestBody List<String> shainNumbers) {
		for (int i = 0; i < shainNumbers.size(); i++) {
			String shain_no = shainNumbers.get(i);
			shainService.delete(shain_no);
			shainService.deleteEdu(shain_no);
			shainService.deleteCareer(shain_no);
		}

		return "redirect:/shain/shainList";
	}

	/*
	 * @GetMapping("/test") public void test(Model model) {
	 * model.addAttribute("bushoList", bushoService.getList()); }
	 */

	/*
	 * @PostMapping("/bushoModify") public void bushoModify(BushoVO vo) {
	 * bushoService.modify(vo); }
	 * 
	 * @PostMapping("/bushoRemove") public void bushoModify(String busho_nm) {
	 * bushoService.remove(busho_nm); }
	 */
}
