package org.zerock.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.RequestVO;
import org.zerock.domain.ShainAttachVO;
import org.zerock.domain.ShainCareerListVO;
import org.zerock.domain.ShainCareerVO;
import org.zerock.domain.ShainEduListVO;
import org.zerock.domain.ShainEduVO;
import org.zerock.domain.ShainVO;
import org.zerock.service.BushoService;
import org.zerock.service.ShainAttachService;
import org.zerock.service.ShainCareerService;
import org.zerock.service.ShainEduService;
import org.zerock.service.ShainService;
import org.zerock.service.YakushokuService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/shain/*")
@Log4j
@AllArgsConstructor
public class ShainController {
	private ShainService shainService;
	private BushoService bushoService;
	private YakushokuService yakushokuService;
	private ShainCareerService shainCareerService;
	private ShainEduService shainEduService;
	private ShainAttachService shainAttachservice;

	@GetMapping("/shainList")
	public void getList(Model model) {
		// 카운트 전달
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
	} // 사원조회/삭제 end

	
	
	
	
	
	
	// 사원등록
	@GetMapping("/shainRegister")
	public void register(Model model) {
		model.addAttribute("bushoList", bushoService.getList());
		model.addAttribute("yakushokuList", yakushokuService.getList());

	}

	@PostMapping("/shainRegister")
	public String register(ShainVO vo, @ModelAttribute(value = "ShainEduListVO") ShainEduListVO eduList,
			@ModelAttribute(value = "shainCareerListVO") ShainCareerListVO careerList, MultipartFile[] uploadFile,
			String shain_no, ShainAttachVO shainAttachVO) {
		System.out.println("하하");
		shainService.register(vo);
		
		for (ShainCareerVO careerVO : careerList.getShainCareerList()) {
			careerVO.setShain_no(vo.getShain_no());
			shainCareerService.register(careerVO);
		}

		for (ShainEduVO eduVO : eduList.getShainEduList()) {
			eduVO.setShain_no(vo.getShain_no());
			shainEduService.register(eduVO);
		}

		String uploadFolder = "C:\\upload";

		File uploadPath = new File(uploadFolder, getFolder());
		String filePath = uploadPath.getPath();
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		for (MultipartFile multipartFile : uploadFile) {

			String uploadFileName = multipartFile.getOriginalFilename();

			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);

			UUID uuid = UUID.randomUUID();

			uploadFileName = uuid.toString() + "_" + uploadFileName;

			File saveFile = new File(uploadPath, uploadFileName);

			shainAttachVO.setShain_no(shain_no);
			shainAttachVO.setFile_nm(multipartFile.getOriginalFilename());
			shainAttachVO.setShain_uuid(uploadFileName);
			shainAttachVO.setShain_uploadpath(filePath);

			try {
				if (shainAttachservice.getProfile(shain_no) == null) {
					multipartFile.transferTo(saveFile);
					shainAttachservice.uploadProfile(shainAttachVO);
				} else {
					multipartFile.transferTo(saveFile);
					shainAttachservice.updateAttach(shainAttachVO);
				}
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}

		return "redirect:/shain/shainList";
	}


	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		return str.replace("-", File.separator);
	}

}
