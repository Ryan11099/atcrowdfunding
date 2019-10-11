package com.atguigu.atcrowdfunding.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.atguigu.atcrowdfunding.bean.TAdmin;
import com.atguigu.atcrowdfunding.bean.TAdminExample;
import com.atguigu.atcrowdfunding.mapper.TAdminMapper;


@RunWith(value=SpringJUnit4ClassRunner.class)
//2、加载Spring配置文件
@ContextConfiguration(locations={"classpath:spring/spring-bean.xml",
"classpath:spring/spring-mybatis.xml","classpath:spring/spring-tx.xml"})

public class MyBatisTset {
	
	//Log log = LogFactory.getLog(getClass());
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	TAdminMapper adminMapper;

	@Test
	public void test() {
		/* debug-->>info-->>warn-->>error */
		//log.debug("开始打印日志");
		logger.debug("开始打印日志");
		TAdminExample e = new TAdminExample();
		//log.info("hello");
		logger.info("hello");
		e.createCriteria().andLoginacctEqualTo("zhangsan").andUserpswdEqualTo("123456");
		//log.warn("警告");
		logger.warn("警告");
		List<TAdmin> list = adminMapper.selectByExample(e);
		System.out.println("测试junit！！！！");
		//log.error("报错了");
		System.out.println(list.toString());
	}

}
