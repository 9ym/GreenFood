package com.kh.greenfood.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.greenfood.domain.NoticeVo;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	private static final String NAMESPACE = "com.kh.greenfood.notice.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<NoticeVo> noticeList() throws Exception {
		List<NoticeVo> noticeList = sqlSession.selectList(NAMESPACE + "noticeList");
//		System.out.println("NoticeDaoImpl, noticeList, noticeList:" + noticeList);
		return noticeList;
	}
	
	@Override
	public void insertNotice(NoticeVo noticeVo) throws Exception {
		sqlSession.insert(NAMESPACE+ "insertNotice", noticeVo);
	}
/*
	@Override
	public NoticeVo selectNotice(int notice_no) throws Exception {
		NoticeVo noticeVo = sqlSession.selectOne(NAMESPACE + "selectNotice");
		return noticeVo;
	}

	@Override
	public int getNoticenoNextVal() {
		int notice_no = sqlSession.selectOne(NAMESPACE + "getNoticenoNextVal");
		return notice_no;
	}
	*/

	@Override
	public NoticeVo selectNotice(int notice_no) throws Exception {
		NoticeVo noticeVo = sqlSession.selectOne(NAMESPACE + "selectNotice", notice_no);
		return noticeVo;
	}
	
	@Override
	public void updateNotice(NoticeVo noticeVo) throws Exception {
		sqlSession.update(NAMESPACE + "updateNotice", noticeVo);
		
	}
	

	@Override
	public void deleteNotice(int notice_no) throws Exception {
		sqlSession.delete(NAMESPACE + "deleteNotice", notice_no);
		
	}

	

	
}
