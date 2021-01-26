package board;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import comment.Comment;

@Service
public class BoardService {
	
	@Autowired
	private BoardMapper boardMapper;
	
	//전체조회
		public List<Board> selectBoard(){
			return boardMapper.selectAll();
		}
		
		//추가
		public int insertBoard(Board board) {
			return boardMapper.insertBoard(board);
		}
		
		//수정
		public int updateBoard(Board board) {
			return boardMapper.updateBoard(board);
		}
		
		//id 조회
		public Board selectById(int id) {
			return boardMapper.selectById(id);
		}
		
		//삭제
		public int deleteBoard(@Param("id") int id, @Param("boardPassword") String boardPassword) {
			return boardMapper.deleteBoard(id, boardPassword);
		}
		
		//제목 검색
		public List<Board> selectTitle(String boardTitle){
			return boardMapper.selectBybdTitle(boardTitle);
		}
		
		//comment
		
		//댓글 조회
		public List<Comment> selectComment(){
			return boardMapper.CommentAll();
		}
		
		//check
		public Board selectBoard(@Param("id") int id, @Param("boardPassword") String boardPassword) {
			return boardMapper.selectUpdate(id, boardPassword);
		}
		
		//update
		public int Boardupdate(Board board) {
			return boardMapper.Boardupdate(board);
		}
		
		//조회수
		public int BoardView(int id) {
			return boardMapper.updateView(id);
		}
		
		//page
		
		//갯수 구하기
		public int selectCount() {
			return boardMapper.selectCount();
		}
		
		//HashMap
		public List<Board> listPage(int displayPost, int postNum){
			
			HashMap<String, Integer> data = new HashMap<String, Integer>(); 
			data.put("displayPost", displayPost);
			data.put("postNum", postNum);
			
			return boardMapper.listPage(data); 
		}
		
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
