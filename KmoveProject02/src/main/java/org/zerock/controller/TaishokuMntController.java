package org.zerock.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.KyuyoHistoryVO;
import org.zerock.domain.ShainVO;
import org.zerock.service.KyuyoHistoryService;
import org.zerock.service.ShainService;
import org.zerock.service.TaishokuService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/taishoku/*")
@Log4j
@AllArgsConstructor
@ControllerAdvice
public class TaishokuMntController {
	@Setter(onMethod_ = @Autowired)
	private ShainService ShainService;
	@Setter(onMethod_ = @Autowired)
	private KyuyoHistoryService KyuyoHistoryService;
	@Setter(onMethod_ = @Autowired)
	private TaishokuService TaishokuService;

	@GetMapping("/taishokuMnt")
	public String showTaishokuMnt() {
		return "taishoku/taishokuMnt";
	}
	
	@GetMapping("/tmp")
	public String tmp() {
		return "taishoku/tmp";
	}

	@GetMapping("/shainList")
	@ResponseBody
	public List<ShainVO> showShainList() {
		return ShainService.getList();

	}

	@GetMapping("/getShainData")
	@ResponseBody
	public List<ShainVO> getShainData(@RequestParam("selectedShainNos") List<String> selectedShainNos) {
		return ShainService.getSelectedShainData(selectedShainNos);
	}

	@GetMapping("/getShainDataByNo")
	@ResponseBody
	public ShainVO getShainDataByNo(@RequestParam("shainNo") String shainNo) {

		ShainVO shain = ShainService.readShainByNo(shainNo);

		if (shain.getTaishoku_ymd() != null) {
			String formattedDate1 = shain.getNyusha_ymd().substring(0, shain.getNyusha_ymd().indexOf(" "));
			shain.setNyusha_ymd(formattedDate1);
			String formattedDate2 = shain.getTaishoku_ymd().substring(0, shain.getTaishoku_ymd().indexOf(" "));
			shain.setTaishoku_ymd(formattedDate2);

		} else {
			String formattedDate1 = shain.getNyusha_ymd().substring(0, shain.getNyusha_ymd().indexOf(" "));
			shain.setNyusha_ymd(formattedDate1);
			Date currentDate = new Date();

			// 퇴직일 문자열로
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String formattedDate2 = sdf.format(currentDate);
			shain.setTaishoku_ymd(formattedDate2);
		}

		return shain;
	}

	@GetMapping("/readSikyuWithShainNo")
	@ResponseBody
	public ShainVO readSikyuWithShainNo(String shainNo) {
		ShainVO shain = ShainService.getKihonPay(shainNo);
		return shain;
	}

	@GetMapping("/getKoza")
	@ResponseBody
	public ShainVO getKoza(String shainNo) {
		ShainVO shain = ShainService.readShainByNo(shainNo);
		return shain;

	}

	@GetMapping("/saveTaishoku")
	@ResponseBody
	public ResponseEntity<String> saveTaishoku(
			@RequestParam String shain_no,
            @RequestParam String sikyu_ymd,
            @RequestParam int taishoku_pay) {
		
		 try {
	            TaishokuService.savePay(shain_no, sikyu_ymd, taishoku_pay);
	            return ResponseEntity.ok("저장 성공");
	        } catch (Exception e) {
	            e.printStackTrace();
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("저장 실패");
		}
	}
}
