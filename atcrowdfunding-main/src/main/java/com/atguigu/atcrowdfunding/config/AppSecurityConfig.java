package com.atguigu.atcrowdfunding.config;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;

import com.alibaba.fastjson.JSON;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled=true)
public class AppSecurityConfig extends WebSecurityConfigurerAdapter{

	@Autowired
	UserDetailsService userDetailsService;
	@Autowired
	PasswordEncoder passwordEconder;
	
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		//配置相关信息
		auth.userDetailsService(userDetailsService).passwordEncoder(passwordEconder);
	
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {

	http.authorizeRequests()
	.antMatchers("/" , "/index" ,"/index.html" , "/static/**").permitAll()
	.anyRequest().authenticated();
	//设置登录页面
	http.formLogin().loginPage("/login.html").permitAll()
	.usernameParameter("loginacct")
	.passwordParameter("userpswd")
	.loginProcessingUrl("/doLogin")//登录执行的程序方法
	.defaultSuccessUrl("/main.html");//指定跳转成功的页面
	//异常信息的处理方式
	
	http.exceptionHandling().accessDeniedHandler(new AccessDeniedHandler() {
		
		@Override
		public void handle(HttpServletRequest request, HttpServletResponse response,
				AccessDeniedException accessDeniedException) throws IOException, ServletException {
			//判断是否为异步请求
			if("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
				//异步请求
				Map<String , String> map = new HashMap<String , String>();
				map.put("code", 403+"");
				map.put("message", accessDeniedException.getMessage());
				String jsonStr = JSON.toJSONString(map);
				response.getWriter().write(jsonStr);
			}else {
				//同步请求
				//处理同步请求的方法
			request.getRequestDispatcher("/WEB-INF/views/error/403.jsp").forward(request, response);
			}
		}
	});
	
	http.csrf().disable();//禁用csrf
	
	//处理注销业务
	http.logout()
	.logoutUrl("/logout")//登录处理地址
	.logoutSuccessUrl("/index");//默认登陆成功跳转地址
	}
}
