package board;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadService {

	public String uploadFiles(MultipartFile[] files) {
		String result;
		//파일저장
		//서버의 시스템 위치
		String uploadFolder = "c:/uploadImages";
		
		File file = new File(uploadFolder);
		//파일을 저장할 폴더를 먼저 생성
		if(!file.exists()) {
			file.mkdirs();
		}
		
		//파일을 만들기 위한 파일명 생성
		//c:/uploadImages/파일명
		//난수를 섞어주는 파일명을 생성한다.
		//원본파일명과 난수로 새로 생성한 파일명을 디비에 저장한다.
			
			try {
				for(int i = 0; i < files.length; i++) {
					 UUID nums = UUID.randomUUID(); //난수를 만들어주는 오브젝트 객체 UUID
					 String newName = nums.toString()+files[i].getOriginalFilename();
					 System.out.println("UUID"+nums.toString());
					 file = new File(uploadFolder, newName);
				files[i].transferTo(file);
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
				result = "실패";
			} catch (IOException e) {
				e.printStackTrace();
				result = "실패";
			}
		
		
		result = "성공";
		return result;
}
}
