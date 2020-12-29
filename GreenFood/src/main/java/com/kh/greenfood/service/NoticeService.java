package com.kh.greenfood.service;

import java.util.List;

import com.kh.greenfood.domain.NoticeVo;

public interface NoticeService {
	
		// 목록
		public List<NoticeVo> noticeList() throws Exception;

		// 입력
		public void insertNotice(NoticeVo noticeVo) throws Exception;
		
		// 글조회
		public NoticeVo selectNotice(int notice_no) throws Exception;
	
	
}
