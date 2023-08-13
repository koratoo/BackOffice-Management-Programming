package org.innobl.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.io.File;

import org.innobl.domain.VO.MemberVO;
import org.innobl.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/upload")
public class FileController {

	@Autowired
	private MemberService service;
	// POST 요청이 /upload/image 경로로 들어올 때 이 메서드가 처리합니다.
    @PostMapping("/image")
    @ResponseBody // 응답 결과를 JSON 또는 문자열로 반환하기 위해 사용합니다.
    public String getUploadImgUrl(@ModelAttribute MemberVO member, MultipartFile[] file) {
        // TODO: 파일 업로드 로직을 구현해야 합니다.
        // 업로드된 이미지를 저장하고, 저장된 이미지의 URL을 얻어옵니다.
        // 아래는 예시 코드입니다.

    	  String uploadFolder = "C:\\Users\\-\\Desktop\\innoblife\\innobl\\src\\main\\webapp\\resources\\img";
  	    for (MultipartFile multipartFile : file) {
  	        String originalFileName = multipartFile.getOriginalFilename();
  	        File saveFile = new File(uploadFolder, originalFileName);
  	        try {
  	            multipartFile.transferTo(saveFile);
  	            String filePath = uploadFolder + "\\" + originalFileName;
  	            member.setProfileImg(filePath);
  	        } catch (Exception e) {
  	            log.error(e.getMessage());
  	        }
  	    }
  	    return "files";
    }
}
