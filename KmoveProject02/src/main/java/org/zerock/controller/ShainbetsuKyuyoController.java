package org.zerock.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.KyuyoHistoryVO;
import org.zerock.domain.ShainVO;
import org.zerock.service.ShainbetsuKyuyoService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/kyuyo/*")
@AllArgsConstructor
public class ShainbetsuKyuyoController {
	
	private ShainbetsuKyuyoService shainbetsuKyuyoService;
	
	@GetMapping("/shainbetsuKyuyo")
	public void shainbetsuKyuyo(Model model) {
		model.addAttribute("shainjyoho", shainbetsuKyuyoService.getShainList());
	}
	
	@GetMapping("/kyuyoJyoho")
	@ResponseBody
    public ResponseEntity<Object> kyuyoJyoho(@RequestParam("shain_no") String shain_no,
                                           @RequestParam("start_ym") String start_ym,
                                           @RequestParam("end_ym") String end_ym) {
        List<KyuyoHistoryVO> kyuyoJyohoData = shainbetsuKyuyoService.getKyuyoByDate(shain_no, start_ym, end_ym);
        
        ShainVO shainjyohoData = shainbetsuKyuyoService.getShain(shain_no);
        
        Map<String, Object> responseData = new HashMap<>();
        responseData.put("kyuyoJyoho", kyuyoJyohoData);
        responseData.put("shainjyoho", shainjyohoData);
        
        log.info(responseData);
        
        return ResponseEntity.ok(responseData);
    }
	
}
