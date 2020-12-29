package com.kh.greenfood;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.greenfood.dao.NoticeDao;
import com.kh.greenfood.domain.NoticeVo;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class noticeDaoTest {
	
	@Inject
	private NoticeDao noticeDao;

	@Test
	public void testInsertNotice() throws Exception {
		NoticeVo noticeVo = new NoticeVo();
		/*noticeVo.setNotice_no(notice_no);*/
		noticeVo.setNotice_title("力格力格力格");
		noticeVo.setNotice_content("郴侩郴侩郴侩");
		/*noticeVo.setAdmin_id("admin");*/
		noticeDao.insertNotice(noticeVo);
		System.out.println("noticeVo :" + noticeVo);
	}
	
	
}
