package org.zerock.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.KintaiHistoryVO;
import org.zerock.domain.ShainVO;
import org.zerock.service.BushoService;
import org.zerock.service.KintaiHistoryService;
import org.zerock.service.KintaiHourService;
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
	private KintaiHourService kintaihourService;
	private BushoService bushoService;

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

	@GetMapping("/view")
	public void view(Model model, @RequestParam(name = "selectedMonth", required = false) String selectedMonth) {

		log.info("Selected Month: " + selectedMonth);
		model.addAttribute("list", shainService.getList());
		model.addAttribute("hour", kintaihourService.getDataByMonth(selectedMonth));
		model.addAttribute("dhour", kintaihourService.getDataByD(selectedMonth));

	}

	@GetMapping("/remain")
	public void remain(Model model) {
		model.addAttribute("koyoKeitaiList", kintaihistoryService.getKoyoKeitai());
		model.addAttribute("BushoList", bushoService.getList());
		model.addAttribute("list", shainService.getList());
		model.addAttribute("khour", kintaihistoryService.getKHour());

	}

	@PostMapping("/remain")
	public ResponseEntity<List<KintaiHistoryVO>> remain(
			@RequestParam(name = "shain_no", required = false) String shain_no) {
		List<KintaiHistoryVO> KH = kintaihistoryService.getShain(shain_no);

		for (int i = 0; i < KH.size(); i++) {
			KintaiHistoryVO KHVO = KH.get(i);
			String formattedDate1 = KHVO.getNyuryoku_ymd().substring(0, KHVO.getNyuryoku_ymd().indexOf(" "));
			KHVO.setNyuryoku_ymd(formattedDate1);
			String formattedDate2 = KHVO.getKaishi_ymd().substring(0, KHVO.getKaishi_ymd().indexOf(" "));
			KHVO.setKaishi_ymd(formattedDate2);
			String formattedDate3 = KHVO.getShuryo_ymd().substring(0, KHVO.getShuryo_ymd().indexOf(" "));
			KHVO.setShuryo_ymd(formattedDate3);
		}

		return new ResponseEntity<>(KH, HttpStatus.OK);
	}

	@GetMapping("/manage")
	@ResponseBody
	public List<KintaiHistoryVO> getKintaiList(@RequestParam("shain_no") String shain_no) {
		try {
			List<KintaiHistoryVO> kintaiList = kintaihistoryService.read(shain_no);
			for (int i = 0; i < kintaiList.size(); i++) {
				String formattedDate1 = kintaiList.get(i).getNyuryoku_ymd().substring(0, kintaiList.get(i).getNyuryoku_ymd().indexOf(" "));
				kintaiList.get(i).setNyuryoku_ymd(formattedDate1);
				String formattedDate2 = kintaiList.get(i).getKaishi_ymd().substring(0, kintaiList.get(i).getKaishi_ymd().indexOf(" "));
				kintaiList.get(i).setKaishi_ymd(formattedDate2);
				String formattedDate3 = kintaiList.get(i).getShuryo_ymd().substring(0, kintaiList.get(i).getShuryo_ymd().indexOf(" "));
				kintaiList.get(i).setShuryo_ymd(formattedDate3);
			}

			return kintaiList;
		} catch (Exception e) {
			log.error("Load failed", e);
			return null; // 또는 적절한 에러 응답을 반환할 수 있습니다.
		}
	}
	
	@GetMapping("/manageShain")
	@ResponseBody
	public ShainVO getShain(@RequestParam("shain_no") String shain_no) {
		try {
			ShainVO shain = shainService.get(shain_no);

			return shain;
		} catch (Exception e) {
			log.error("Load failed", e);
			return null; // 또는 적절한 에러 응답을 반환할 수 있습니다.
		}
	}
	
	@GetMapping("/modify")
	public void modify(@RequestParam("kintai_no") String kintai_no, Model model) {
		log.info("勤怠番号 : " + kintai_no);
		
		model.addAttribute("list", shainService.getList());
		model.addAttribute("save", kintaiService.getList());
		
		KintaiHistoryVO KHVO = kintaihistoryService.getByKintaiNo(kintai_no);
		String formattedDate1 = KHVO.getNyuryoku_ymd().substring(0, KHVO.getNyuryoku_ymd().indexOf(" "));
		KHVO.setNyuryoku_ymd(formattedDate1);
		String formattedDate2 = KHVO.getKaishi_ymd().substring(0, KHVO.getKaishi_ymd().indexOf(" "));
		KHVO.setKaishi_ymd(formattedDate2);
		String formattedDate3 = KHVO.getShuryo_ymd().substring(0, KHVO.getShuryo_ymd().indexOf(" "));
		KHVO.setShuryo_ymd(formattedDate3);
		
		model.addAttribute("selectedKintai", KHVO);
	}

	@PostMapping("/modify")
	public String modifyKintai(KintaiHistoryVO vo) {
		log.info("수정");
		kintaihistoryService.update(vo);
		return "redirect:/kintai/list";
	}
	
	@PostMapping("/delete")
	public String delete(@RequestParam("kintai_no") String kintai_no) {
		log.info("삭제");
		kintaihistoryService.delete(kintai_no);
		return "redirect:/kintai/list";
	}
}