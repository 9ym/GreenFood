package com.kh.greenfood.dao;

import java.util.List;

import com.kh.greenfood.domain.NoticeVo;
import com.kh.greenfood.domain.PagingDto;

public interface NoticeDao {
		
		// 목록
		public List<NoticeVo> noticeList(PagingDto pagingDto) throws Exception;

		// 전체 개시글 수 가져오기
		public int noticeListCount(PagingDto pagingDto) throws Exception;
		
		// 입력
		public void insertNotice(NoticeVo noticeVo) throws Exception;
		
		// 글조회
		public NoticeVo selectNotice(int notice_no) throws Exception;
		
		// 글 수정
		public void updateNotice(NoticeVo noticeVo) throws Exception;
		
		// 글 삭제
		public void deleteNotice(int notice_no) throws Exception;
		
		// 조회수 가져오기
		public void updateNoticeReadcount(int notice_no) throws Exception;
}
