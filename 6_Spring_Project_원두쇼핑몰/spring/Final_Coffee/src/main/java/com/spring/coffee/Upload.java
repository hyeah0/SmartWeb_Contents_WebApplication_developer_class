package com.spring.coffee;

import java.io.File;
import java.util.Calendar;
import java.util.Iterator;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
public class Upload {

	public boolean fileUpload(MultipartHttpServletRequest mRequest) {
		
		boolean isUpload = false;
		
		String uploadPath = "C:\\NCS\\workspace(spring)\\Final_Coffee\\src\\main\\webapp\\resources\\upload";
		
		Calendar cal = Calendar.getInstance();
		
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		
		// 업로드된 파일들의 이름 목록을 제공하는 메서드.
		Iterator<String> iterator = mRequest.getFileNames();
		
		while(iterator.hasNext()) {
			String uploadFileName = iterator.next();
			
			MultipartFile mFile = mRequest.getFile(uploadFileName);
			
			String originalFileName = mFile.getOriginalFilename();
			
			// 실제 폴더를 만들어 보자.
			// ...................\\resources\\upload\\2022-11-25\\
			String homedir = uploadPath + year + "-" + month + "-" + day;
			
			File path1 = new File(homedir);
			
			if(!path1.exists()) {
				path1.mkdirs();
			}
			
			// 실제 파일을 만들어 보자.(파일복사느낌임)
			String saveFileName = originalFileName;
			
			if(saveFileName.equals(null)) {
				saveFileName = System.currentTimeMillis()+"_"+saveFileName;		// 현재 시간을 천분의 1초단위로 계산하고 있는 메소드래..
				
				try {
					// ...................\\resources\\upload\\2022-11-25\\실제파일
					File origin = new File(homedir+"/"+saveFileName);
					
					// transferTo() : 파일 데이터를 지정한 폴더로 실제 저장시키는 메서드.
					mFile.transferTo(origin);
					
					isUpload = true;
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} // while 문의 end 부분
		
		return isUpload;
	}
	
}
