package com.team1.domain.board;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import lombok.Data;

@Data
public class NewsReplyVO {
	private Integer id;
	private Integer boardId;
	private String nickname;
	private String reply;
	private LocalDateTime inserted;
	private LocalDateTime updated;
	
	// 댓글 수정 삭제 버튼 여부
	private Boolean own;
	private String userprofile;
	private Integer uid;
	
	// 댓글을 작성하는데 탈퇴한 회원과 닉네임이 같을 때 필터
	
	public String getInserted() {
		return this.inserted.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}
	
	public String getUpdated() {
		return this.updated.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}
}