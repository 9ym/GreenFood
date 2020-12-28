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
	/*@Transactional*/
	public void insertNotice(NoticeVo noticeVo) throws Exception {
		int notice_no = noticeDao.getNoticenoNextVal();
		noticeVo.setNotice_no(notice_no);
		noticeDao.insertNotice(noticeVo);
	}
	
	

	@Override
	public List<NoticeVo> getNoticeList(int notice_no) throws Exception {
		List<NoticeVo> noticeList = noticeDao.getNotinceList(notice_no);
		return noticeList;
	}

	
	@Override
	public NoticeVo selectNotice(int notice_no) throws Exception {
		NoticeVo noticeVo = noticeDao.selectNotice(notice_no);
		return noticeVo;
	}
	
	
	
}
