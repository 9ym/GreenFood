package com.kh.greenfood.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.greenfood.dao.NoticeDao;
import com.kh.greenfood.domain.NoticeVo;
import com.kh.greenfood.domain.PagingDto;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Inject
	private NoticeDao noticeDao;

	// 목록
	@Override
	public List<NoticeVo> noticeList(PagingDto pagingDto) throws Exception {
		List<NoticeVo> noticeList = noticeDao.noticeList(pagingDto);
		return noticeList;
	}
	
	// 전체 개시글 수 가져오기
	@Override
	public int noticeListCount(PagingDto pagingDto) throws Exception {
		int count = noticeDao.noticeListCount(pagingDto);
		return count;
		
	}
	
	// 입력
	@Override
	public void insertNotice(NoticeVo noticeVo) throws Exception {
		
		noticeDao.insertNotice(noticeVo);
	}

	// 글조회
	@Override
	public NoticeVo selectNotice(int notice_no) throws Exception {
		noticeDao.updateNoticeReadcount(notice_no);
		NoticeVo noticeVo = noticeDao.selectNotice(notice_no);
		return noticeVo;
	}
	
	// 글 수정
	@Override
	public void updateNotice(NoticeVo noticeVo) throws Exception {
		noticeDao.updateNotice(noticeVo);
		
	}
	
	// 글삭제
	@Override
	public void deleteNotice(int notice_no) throws Exception {
		noticeDao.deleteNotice(notice_no);
	}
	
}
