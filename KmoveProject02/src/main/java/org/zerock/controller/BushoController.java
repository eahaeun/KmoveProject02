package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.BushoVO;
import org.zerock.service.BushoService;
import org.zerock.service.ShainService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
public class BushoController {
	@Setter(onMethod_ = @Autowired)
	private ShainService shainService;

	@Setter(onMethod_ = @Autowired)
	private BushoService bushoService;

	@PostMapping("/bushoRemove")
	public ResponseEntity<String> bushoRemove(@RequestParam("busho_nm") String busho_nm) {
		bushoService.remove(busho_nm);
		return ResponseEntity.ok("Success");
	}
	
	@PostMapping("/bushoModify")
    public ResponseEntity<String> bushoUpdate(@RequestParam String busho_nm, @RequestParam String new_value) {
        int result = bushoService.modify(busho_nm, new_value);
        if (result > 0) {
            return new ResponseEntity<>("Update successful", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Update failed", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
	
//	@GetMapping("/fortest")
//	public void test() {
//		
//	}
}
