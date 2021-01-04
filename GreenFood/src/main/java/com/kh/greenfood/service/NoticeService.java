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
		
		// 글 수정
		public void updateNotice(NoticeVo noticeVo) throws Exception;
		
		// 글삭제
		public void deleteNotice(int notice_no) throws Exception;
	
	
}
