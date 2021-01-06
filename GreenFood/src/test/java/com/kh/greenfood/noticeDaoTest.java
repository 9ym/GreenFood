package com.kh.greenfood;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.greenfood.dao.NoticeDao;
import com.kh.greenfood.domain.NoticeVo;
import com.kh.greenfood.domain.PagingDto;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class noticeDaoTest {
	
	@Inject
	private NoticeDao noticeDao;

	@Test
	public void testInsertNotice() throws Exception {
		NoticeVo noticeVo = new NoticeVo();
		for( int i = 1; i < 200 ; i++) {

			noticeVo.setNotice_title(i + " 번째 게시물 입니다.");

			noticeVo.setNotice_content(i + " 번째 게시물 입니다.");
		
		/*noticeVo.setNotice_no(notice_no);*/
		/*noticeVo.setNotice_title("제목제목제목");
		noticeVo.setNotice_content("내용내용내용");*/
		/*noticeVo.setAdmin_id("admin");*/
		noticeDao.insertNotice(noticeVo);
		System.out.println("noticeVo :" + noticeVo);
	
		}
	}
	



	
	
	
	
	
	@Test
	public void testUpdateNotice() throws Exception {
		NoticeVo noticeVo = new NoticeVo();
		noticeVo.setNotice_title("공지사항 5  수정");
		noticeVo.setNotice_content("내용5 수정");
		noticeVo.setNotice_no(61);
		noticeDao.updateNotice(noticeVo);
		System.out.println("noticeVo :" + noticeVo);
	}
	
	@Test
	public void testNoticeList() throws Exception {
		PagingDto pagingDto = new PagingDto();
		pagingDto.setPage(1);
		/*pagingDto.setPage(10);*/
		pagingDto.setTotalCount(noticeDao.noticeListCount(pagingDto));
		pagingDto.setPagingInfo();
		List<NoticeVo> boardList = noticeDao.noticeList(pagingDto);
		System.out.println("boardList:" + boardList);
	}
	
	
}
