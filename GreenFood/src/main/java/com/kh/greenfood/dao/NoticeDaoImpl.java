package com.kh.greenfood.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.greenfood.domain.NoticeVo;
import com.kh.greenfood.domain.PagingDto;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	private static final String NAMESPACE = "com.kh.greenfood.notice.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<NoticeVo> noticeList(PagingDto pagingDto) throws Exception {
		List<NoticeVo> noticeList = sqlSession.selectList(NAMESPACE + "noticeList", pagingDto);
//		System.out.println("NoticeDaoImpl, noticeList, pagingDto:" + pagingDto);
		return noticeList;
	}
	
	@Override
	public void insertNotice(NoticeVo noticeVo) throws Exception {
		sqlSession.insert(NAMESPACE+ "insertNotice", noticeVo);
	}

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

	@Override
	public void updateNoticeReadcount(int notice_no) throws Exception {
		sqlSession.update(NAMESPACE + "updateNoticeReadcount", notice_no);
		
	}

	@Override
	public int noticeListCount(PagingDto pagingDto) throws Exception {
		int count = sqlSession.selectOne(NAMESPACE + "noticeListCount", pagingDto);
		return count;
	}
	
}
