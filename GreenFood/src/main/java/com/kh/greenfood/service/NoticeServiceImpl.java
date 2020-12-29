package com.kh.greenfood.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.greenfood.dao.NoticeDao;
import com.kh.greenfood.domain.NoticeVo;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Inject
	private NoticeDao noticeDao;

	@Override
	
	public void insertNotice(NoticeVo noticeVo) throws Exception {
		
		noticeDao.insertNotice(noticeVo);
	}

	@Override
	public List<NoticeVo> noticeList() throws Exception {
		List<NoticeVo> noticeList = noticeDao.noticeList();
		System.out.println("NoticeServiceImpl, noticeList, noticeList:" + noticeList);
		return noticeList;
	}

	
	@Override
	public NoticeVo selectNotice(int notice_no) throws Exception {
		NoticeVo noticeVo = noticeDao.selectNotice(notice_no);
		return noticeVo;
	}
	
	
}
