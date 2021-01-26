package comment;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface CommentMapper {
	
	//insert
	@Insert("insert into newcomment(board_id, comment_content, comment_name, comment_password) values(#{boardId}, #{commentContent}, #{commentName}, #{commentPassword})")
	public int insertComment(Comment comment);
	
	//delete
	@Delete("delete from newcomment where id=#{id} and comment_password=#{commentPassword}")
	public int deleteComment(@Param("id") int id, @Param("commentPassword") String commentPassword);
	
	//id로만 지우기
	@Delete("delete from newcomment where id=#{id}")
	public int deletecomment(int id);
	
	
	
	//update
	@Update("update newcomment set comment_title=#{commentTitle}, comment_content=#{commentContent}, comment_name=#{commentName}, udate=now()"
		+	" where id=#{id}")
	public int updateComment(Comment comment);
	
	//selectAll
	@Select("select board_id, comment_title, comment_content, comment_name, wdate, udate from newcomment")
	public List<Comment> selectAll();
	
	
	//select
 	@Select("select * from newcomment where id=#{id} and comment_password=#{commentPassword}")
	public Comment selectComment(@Param("id")int id, @Param("commentPassword")String commentPassword);
	
	  
	
	//selectById
	@Select("select * from newcomment where id=#{id}")
	public Comment selectById(int id);
	
	//selectBoardId
	@Select("select * from newcomment where id=#{id}")
	public List<Comment> selectid(int id);
	
	//selectBoardId
	@Select("select * from newcomment where board_id=#{boardId}")
	public List<Comment> selectBoardId(int boardId);
		
	//댓글 수정
	@Select("select * from newcomment where board_id=#{boardId}")
	public Comment select(int boardId);
}
