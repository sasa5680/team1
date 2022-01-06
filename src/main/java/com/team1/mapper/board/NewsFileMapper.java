package com.team1.mapper.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team1.domain.board.NewsFileVO;

public interface NewsFileMapper {
	
	int insert(NewsFileVO fileVO);
	
	//List<String> selectNamesByBoardId(Integer boardId);
	
	List<NewsFileVO> selectNamesByBoardId(Integer boardId);

	void delete(@Param("boardId") Integer boardId, @Param("fileName") String fileName);
	
	void deleteByUrl(@Param("url") String url);
	
	void deleteByBoardId(Integer boardId);

}
