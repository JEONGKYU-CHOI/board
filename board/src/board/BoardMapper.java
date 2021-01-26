package board;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import comment.Comment;

@Mapper
public interface BoardMapper {

	//board
	
		//insert
		@Insert("insert into board(board_title, board_content, board_name, board_password, board_view) values(#{boardTitle}, #{boardContent}, #{boardName}, #{boardPassword}, 0)")
		public int insertBoard(Board board);

		//delete
		@Delete("delete from board where id=#{id} and board_password=#{boardPassword}")
		public int deleteBoard(@Param("id") int id, @Param("boardPassword") String boardPassword);
		
		//update 
		@Update("update board set board_title=#{boardTitle}, board_content=#{boardContent}, board_name=#{boardName}, board_password=#{boardPassword}"
				+ " where id=#{id} and board_password=#{boardPassword}")
		public int updateBoard(Board board);
		
		//update
		@Update("update board set board_title=#{boardTitle}, board_content=#{boardContent}, board_name=#{boardName}, udate=now()"
				+ " where id=#{id}")
		public int Boardupdate(Board board);
		
		//selectAll
		@Select("select * from board")
		public List<Board> selectAll();
		
		//selectById
		@Select("select * from board where id=#{id}")
		public Board selectById(int id);
		 
		//selectByName
		@Select("select * from board where board_name=#{boardName}")
		public List<Board> selectByName(String name);
		
		//selectByTitle
		@Select("select * from board where board_title like CONCAT('%',#{boardTitle},'%')")
		public List<Board> selectBybdTitle(String boardTitle);

		
		//selectUpdate
		@Select("select * from board where id=#{id} and board_password=#{boardPassword}")
		public Board selectUpdate(@Param("id") int id, @Param("boardPassword") String boardPassword);
		//comment
		
		@Select("select * from comment order by id desc")
		public List<Comment> CommentAll();
		
		//조회수
		@Update("update board set board_view = board_view + 1 where id=#{id}")
		public int updateView(int id);
		 

		//page 
		//selectCount
		@Select("select count(*) from board")
		public int selectCount();     

		//listpage
		@Select("select * from board order by id desc limit #{displayPost}, #{postNum}")
		public List<Board> listPage(HashMap<String, Integer>hashMap);
		
}
