package com.team1.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team1.domain.board.QuestionReplyVO;
import com.team1.mapper.board.QuestionReplyMapper;

import lombok.Setter;

@Service
public class QuestionReplyService {
	
	@Setter(onMethod_=@Autowired)
	private QuestionReplyMapper mapper;
	
	public List<QuestionReplyVO> list(Integer boardId) {
		return mapper.list(boardId);
	}
	
	public boolean insert(QuestionReplyVO reply) {
		return mapper.insert(reply) == 1 ;
	}
	
	public boolean remove(Integer ID) {
		return mapper.delete(ID) == 1;
	}
	
	public boolean register(QuestionReplyVO reply) {
		return mapper.insert(reply) == 1;
	}
	
	public boolean modify(QuestionReplyVO reply) {
		return mapper.update(reply) == 1;
	}

	public QuestionReplyVO readById(Integer ID) {
		return mapper.selectById(ID);
	}

	public boolean update(QuestionReplyVO newReply) {
		return mapper.update(newReply) == 1;		
	}

	public boolean delete(Integer ID) {
		return mapper.delete(ID) == 1;
	}

	public Integer countReplyList(Integer ID) {
		return mapper.listReplyCount(ID);
	}

	public QuestionReplyVO readByNick(String nickname) {
		return mapper.readByNick(nickname);
	}

	
}