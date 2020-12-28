package com.kh.greenfood.service;

import java.util.List;

import com.kh.greenfood.domain.NoticeVo;

public interface NoticeService {
	
	// 목록
	public List<NoticeVo> getNoticeList(int notice_no) throws Exception;

	// 쓰기
	public void insertNotice(NoticeVo noticeVo) throws Exception;
	
	// 글조회
	public NoticeVo selectNotice(int notice_no) throws Exception;
	
	
}
