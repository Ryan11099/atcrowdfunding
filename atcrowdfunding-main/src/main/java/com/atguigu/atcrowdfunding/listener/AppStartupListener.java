package com.atguigu.atcrowdfunding.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.atguigu.atcrowdfunding.consts.AppConsts;

public class AppStartupListener implements ServletContextListener {

	
	/* web组件的创建过程
	 * 1.创建相对应的接口
	 * 2.在web.xml里面进行配置
	 *  */
   
    public void contextDestroyed(ServletContextEvent sce)  { 
    }

    public void contextInitialized(ServletContextEvent sce)  { 
    	//存入路径
    	sce.getServletContext().setAttribute(AppConsts.CONTEXT_PATH, sce.getServletContext().getContextPath());
    }
	
}
