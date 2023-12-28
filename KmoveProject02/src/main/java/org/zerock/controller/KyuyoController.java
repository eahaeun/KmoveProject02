package org.zerock.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.KyuyoHistoryVO;
import org.zerock.domain.ShainVO;
import org.zerock.service.KyuyoHistoryService;
import org.zerock.service.ShainService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class KyuyoController {
	@Setter(onMethod_ = @Autowired)
	private ShainService shainService;

	@Setter(onMethod_ = @Autowired)
	private KyuyoHistoryService kyuyoHistoryService;

	@GetMapping("/kyuyotest")
	public void kyuyotest() {

	}

	@PostMapping("/kyuyotest")
	public void kyuyotest2(@RequestParam(name = "kizoku_ym") String kizoku_ym, Model model) {
		List<ShainVO> shainList = shainService.getListByKoyoKeitai(kizoku_ym);
		model.addAttribute("shainList", shainList);
		
		//KyuyoHistoryVO만들고 List<KhVO>에다가 .add(service.getkhlist(shain.getshain_no)이렇게 하면 안되냐?
		List<KyuyoHistoryVO> kyuyoList = new ArrayList<>();
		for(int i=0; i<shainList.size(); i++) {
			//kyuyoList.add(kyuyoHistoryService.getListByKizokuYm(shainList.get(i).getShain_no(), kizoku_ym));
		}
		model.addAttribute("kyuyoList", kyuyoList);
	}
}
