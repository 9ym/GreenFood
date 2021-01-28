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

			noticeVo.setNotice_title(i + " ��° �Խù� �Դϴ�.");

			noticeVo.setNotice_content(i + " ��° �Խù� �Դϴ�.");
		noticeDao.insertNotice(noticeVo);
	
		}
	}
	

	
	@Test
	public void testUpdateNotice() throws Exception {
		NoticeVo noticeVo = new NoticeVo();
		noticeVo.setNotice_title("�������� 5  ����");
		noticeVo.setNotice_content("����5 ����");
		noticeVo.setNotice_no(61);
		noticeDao.updateNotice(noticeVo);
	}
	
	@Test
	public void testNoticeList() throws Exception {
		PagingDto pagingDto = new PagingDto();
		pagingDto.setPage(1);
		/*pagingDto.setPage(10);*/
		pagingDto.setTotalCount(noticeDao.noticeListCount(pagingDto));
		pagingDto.setPagingInfo();
	}
	
	
}
