package com.kh.greenfood.dao;

import java.util.List;

import com.kh.greenfood.domain.NoticeVo;

public interface NoticeDao {
	
	// nextval 받아오기
	public int getNoticenoNextVal();
	
	// 목록
	public List<NoticeVo> getNotinceList(int notice_no) throws Exception;

	// 쓰기
	public void insertNotice(NoticeVo noticeVo) throws Exception;
	
	// 글조회
	public NoticeVo selectNotice(int notice_no) throws Exception;
}
