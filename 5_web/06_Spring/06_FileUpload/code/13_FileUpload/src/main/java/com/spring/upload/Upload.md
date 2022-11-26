```
package com.spring.upload;

import java.io.File;
import java.util.Calendar;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.validation.FieldError;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
// @Service
// component 또는 service
// service ==> spring 에서 비지니스 로직을 수행할때 붙는 애노테이션
// 해당 upload 라는 클래스는 비지니스 로직을 수행하는 클래스
public class Upload {

	public boolean fileUpload(MultipartHttpServletRequest mRequest) {

		boolean isUpload = false;
		String uploadPath = "/Users/7_Spring/13_FileUpload/src/main/webapp/resources/upload/";
		//request.getServletContext().getRealPath("/upload");
		System.out.println("uploadPath :" + uploadPath);

		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int day = cal.get(Calendar.DAY_OF_MONTH);

		// 업로드된 파일들의 이름 목록을 제공하는 메서드 호출
		Iterator<String> iterator = mRequest.getFileNames();

		// 값이 있는지 확인
		while(iterator.hasNext()) {

			String upLoadFileName = iterator.next();

			System.out.println("uploadFilename :" + upLoadFileName);

			MultipartFile mfile = mRequest.getFile(upLoadFileName);
			String originalFileName = mfile.getOriginalFilename();

			System.out.println("originalFileName :" + originalFileName);

			// 실제 폴더를 만들기
			// .....................\\resources\\upload\\2022-11-25
			String homedir = uploadPath + year + "-" + month + "-" + day;

			File path1 = new File(homedir);
			if(!path1.exists()) {
				path1.mkdirs();
			}

			// 실제 파일 만들기
			String saveFileName = originalFileName;

			// 파일이 있으면,
			if(!saveFileName.equals("")) {
				// 파일명 중복 방지
				saveFileName = System.currentTimeMillis() + "_" + saveFileName;

				try {
					// 파일만들기
					// .....................\\resources\\upload\\2022-11-25\\파일명
					File origin = new File(homedir+"/"+saveFileName);

					// 파일변환
					// transferTo() : 파일데이터를 지정한 폴더로 실제로 저장시키는 메서드.
					mfile.transferTo(origin);

					isUpload = true;

				}catch(Exception e) {
					e.printStackTrace();
				}

			}// if문 끝
		}// while문 끝

		return isUpload;
	}
}
```
