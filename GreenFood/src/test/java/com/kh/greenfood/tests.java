package com.kh.greenfood;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.greenfood.domain.TestVo;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class tests {
	
	@Inject
	private SqlSession sqlSession;
	
	@Test
	public void test() throws Exception{
		sqlSession.insert("com.kh.greenfood.board.ins");
		List<TestVo> test = sqlSession.selectList("com.kh.greenfood.board.sel");
		System.out.println(test);
	}
}
