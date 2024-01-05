package org.zerock.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.BushoVO;
import org.zerock.domain.RequestVO;
import org.zerock.domain.ShainAttachVO;
import org.zerock.domain.ShainCareerListVO;
import org.zerock.domain.ShainCareerVO;
import org.zerock.domain.ShainEduListVO;
import org.zerock.domain.ShainEduVO;
import org.zerock.domain.ShainVO;
import org.zerock.domain.YakushokuVO;
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
	
	
	
	
	//수정
	@GetMapping("/shainModify")
	public void modify(@RequestParam String shain_no, Model model) {
		ShainVO shain = shainService.get(shain_no);

		if (shain != null) {

			String formattedDate = shain.getNyusha_ymd().substring(0, shain.getNyusha_ymd().indexOf(" "));
			shain.setNyusha_ymd(formattedDate);
			BushoVO busho = bushoService.get(shain.getBusho_nm());
			YakushokuVO yakushoku = yakushokuService.get(shain.getYakushoku_nm());

			// 부서와 직위 목록 가져오기
			List<BushoVO> bushoList = bushoService.getList();
			List<YakushokuVO> yakushokuList = yakushokuService.getList();

			model.addAttribute("shain", shain);
			model.addAttribute("busho", busho);
			model.addAttribute("yakushoku", yakushoku);
			model.addAttribute("bushoList", bushoList);
			model.addAttribute("yakushokuList", yakushokuList);

			List<ShainCareerVO> shainCareerList = shainCareerService.getCareerByShainNo(shain_no);
			model.addAttribute("shainCareerList", shainCareerList);

			List<ShainEduVO> shainEduList = shainEduService.getEduByShainNo(shain_no);
			model.addAttribute("shainEduList", shainEduList);

			for (int i = 0; i < shainCareerList.size(); i++) {
				ShainCareerVO shainCareer = shainCareerList.get(i);

				// 첫 번째 날짜 문자열인지 확인 후, substring 사용
				if (shainCareer.getNyusha_ymd2() != null && shainCareer.getNyusha_ymd2().contains(" ")) {
					String formattedDate1 = shainCareer.getNyusha_ymd2().substring(0,
							shainCareer.getNyusha_ymd2().indexOf(" "));
					shainCareer.setNyusha_ymd2(formattedDate1);
				}

				// 두 번째 날짜 문자열인지 확인 후, substring 사용
				if (shainCareer.getTaishoku_ymd2() != null && shainCareer.getTaishoku_ymd2().contains(" ")) {
					String formattedDate2 = shainCareer.getTaishoku_ymd2().substring(0,
							shainCareer.getTaishoku_ymd2().indexOf(" "));
					shainCareer.setTaishoku_ymd2(formattedDate2);
				}
			}

		} else {
			model.addAttribute("errorMessage", "該当社員が存在しません。");
		}
	}
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(@RequestParam("shain_no") String shain_no, ShainAttachVO shainAttachVO) {

		shainAttachVO = shainAttachservice.getProfile(shain_no);

		String fileName = shainAttachVO.getShain_uuid();
		String uploadPath = shainAttachVO.getShain_uploadpath();
		File file = new File(uploadPath + "\\" + fileName);
		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();

			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}

	@PostMapping("/shainModify")
	public String modify(ShainVO vo, @ModelAttribute("shainEduListVO") ShainEduListVO eduList,
			@ModelAttribute("shainCareerListVO") ShainCareerListVO careerList, MultipartFile[] uploadFile,
			ShainAttachVO shainAttachVO) {
		shainService.modify(vo);

		// 경력 정보 수정
		for (ShainCareerVO careerVO : careerList.getShainCareerList()) {
			careerVO.setShain_no(vo.getShain_no());
			shainCareerService.careerModify(careerVO);
		}

		// 학력 정보 수정
		for (ShainEduVO eduVO : eduList.getShainEduList()) {
			eduVO.setShain_no(vo.getShain_no());
			shainEduService.eduModify(eduVO);
		}

		String uploadFolder = "C:\\upload";

		File uploadPath = new File(uploadFolder, getFolder());
		String filePath = uploadPath.getPath();
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		if (uploadFile != null && uploadFile.length > 0) {
		    MultipartFile multipartFile = uploadFile[0]; // 첫 번째 파일을 가져옵니다.

		    String uploadFileName = multipartFile.getOriginalFilename();
		    uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);

		    UUID uuid = UUID.randomUUID();
		    String savedFileName = uuid.toString() + "_" + uploadFileName;
		    File saveFile = new File(uploadPath, savedFileName);

		    
		    shainAttachVO.setShain_no(vo.getShain_no());
		    shainAttachVO.setFile_nm(uploadFileName);
		    shainAttachVO.setShain_uuid(savedFileName);
		    shainAttachVO.setShain_uploadpath(filePath);

		    try {
		        multipartFile.transferTo(saveFile);
		        if (shainAttachservice.getProfile(vo.getShain_no()) == null) {
		            shainAttachservice.uploadProfile(shainAttachVO);
		        } else {
		            shainAttachservice.updateAttach(shainAttachVO);
		        }
		    } catch (Exception e) {
		        log.error(e.getMessage());
		        // 예외 처리 - 파일 업로드 실패 시 동작
		    }
		}


		return "redirect:/shain/shainList";
	}

}
