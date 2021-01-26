package comment;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentService {

	@Autowired
	private CommentMapper commentMapper;
	
	//전체조회
	public List<Comment> selectComment(){
		return commentMapper.selectAll();
	}
	
	//추가
	public int isnertComment(Comment comment) {
		return commentMapper.insertComment(comment);
	}
	
	//수정
	public int updateComment(Comment comment) {
		return commentMapper.updateComment(comment);
	}
	
	//삭제 
	public int deleteComment(int id) {
		return commentMapper.deletecomment(id);
	}
	
	//삭제 
	public int deleteComment1(@Param("id") int id, @Param("commentPassword") String commentPassword) {
		return commentMapper.deleteComment(id, commentPassword);
	}
	
	
	//id, pw조회
	public Comment selectComment(@Param("id")int id, @Param("commentPassword")String commentPassword) {
		return commentMapper.selectComment(id, commentPassword);
	}
	
	
	
	
	
	
	//id 조회
	public Comment selectById(int id) {
		return commentMapper.selectById(id);
	}
	
	//boardId로 조회
	public List<Comment> selectId(int id){
		return commentMapper.selectid(id);
	}
	
	//boardId로 조회
	public List<Comment> selectBoardId(int boardId){
		return commentMapper.selectBoardId(boardId);
	}
	
	//댓글 수정
	public Comment select(int boardId) {
		return commentMapper.select(boardId);
	}
}
