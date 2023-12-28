package org.zerock.controller;

import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.KanrishaVO;
import org.zerock.service.KaishaService;
import org.zerock.service.KanrishaService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/main/*")
public class MainController {
	@Setter(onMethod_ = @Autowired)
	private KanrishaService kanrishaService;
	
	@Setter(onMethod_ = @Autowired)
	private KaishaService kaishaService;

	@GetMapping("/main")
	public void main(Model model, HttpServletRequest request) {
		// 클라이언트의 IP 주소 가져오기
        String ip_address = getClientIpAddress(request);
        // 모델에 속성 추가
        model.addAttribute("today", LocalDate.now());
        // 모델에 속성 추가
        model.addAttribute("ip_address", ip_address);
	    model.addAttribute("kaisha", kaishaService.read());
	    model.addAttribute("kanrisha", kanrishaService.get());
	}

	// 클라이언트의 IP 주소를 가져오는 메서드
    private String getClientIpAddress(HttpServletRequest request) {
        String xForwardedForHeader = request.getHeader("X-Forwarded-For");
        if (xForwardedForHeader == null) {
            return request.getRemoteAddr();
        }
        return xForwardedForHeader.split(",")[0];
    }
    
	@GetMapping("/join")
	public void join() {

	}

	@PostMapping("/join")
	public String join(KanrishaVO vo, RedirectAttributes rttr, @ModelAttribute("confirm_pw") String confirm_pw) {
	    System.out.println("Received KanrishaVO: " + vo);
	    
	    System.out.println("con : " + confirm_pw);
	    System.out.println("vo : " +vo.getKanrisha_pw());
	    System.out.println(!confirm_pw.equals(vo.getKanrisha_pw()));
	    
	    if (!confirm_pw.equals(vo.getKanrisha_pw())) {
	    	rttr.addFlashAttribute("error", "비밀번호와 확인이 일치하지 않습니다.");
	    	return "redirect:/joinFail";
	    }
	    kanrishaService.register(vo);
	    rttr.addFlashAttribute("kanrisha_nm", vo.getKanrisha_nm());

	    return "redirect:/joinSuccess";
	}


	@GetMapping("/joinSuccess")
	public void joinSuccess(@ModelAttribute("kanrisha_nm") String kanrisha_nm) {
	    System.out.println("Using kanrisha_nm: " + kanrisha_nm);
	    // joinSuccess.jsp에서 이 값 활용 가능
	}
	
	@GetMapping("/joinFail")
	public void joinFail(@ModelAttribute("error") String error) {
	    System.out.println(error);
	    // joinSuccess.jsp에서 이 값 활용 가능
	}
	
	@GetMapping("/login")
	public void loginview() {
		
	}
	
	@PostMapping("/login")
	public String login(@RequestParam("kanrisha_uid") String kanrisha_uid,
            @RequestParam("kanrisha_pw") String kanrisha_pw,
            RedirectAttributes rttr) {
		System.out.println("kkkkkkkkk : " + kanrisha_uid);
		System.out.println(kanrisha_pw);
		KanrishaVO vo = kanrishaService.login(kanrisha_uid, kanrisha_pw);
		if(vo != null) {
			return "redirect:/main";
		} else {
			rttr.addFlashAttribute("error", "로그인에 실패하였습니다.");
			return "redirect:/login";
		}
	}
		

}
