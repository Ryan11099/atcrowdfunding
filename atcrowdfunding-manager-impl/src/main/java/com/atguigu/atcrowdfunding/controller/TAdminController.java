package com.atguigu.atcrowdfunding.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.atcrowdfunding.bean.TAdmin;
import com.atguigu.atcrowdfunding.bean.TMenu;
import com.atguigu.atcrowdfunding.bean.TRole;
import com.atguigu.atcrowdfunding.consts.AppConsts;
import com.atguigu.atcrowdfunding.service.TAdminService;
import com.atguigu.atcrowdfunding.service.TMenuService;
import com.atguigu.atcrowdfunding.service.TRoleService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class TAdminController {
	
	@Autowired
	TAdminService adminService;
	@Autowired
	TMenuService menuService;
	@Autowired
	TRoleService roleService;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	//处理取消请求分配角色
	@ResponseBody
	@RequestMapping("/admin/unAssignRole")
	public String unAssignRole(Integer adminId , @RequestParam("roleId")List<Integer> roleId) {
		//接受roleId的集合和将要分配的角色的集合,因为要接受的参数里面有集合类型，所以使用@RequestParam
		//调用Service业务层来处理请求
		adminService.unAssignRoleToAdmin(adminId , roleId);
		return "ok";
	}
	
	//处理分配角色的请求
	@ResponseBody
	@RequestMapping("/admin/assignRole")
	public String assignRole(Integer adminId , @RequestParam("roleId")List<Integer> roleId) {
		//接受roleId的集合和将要分配的角色的集合,因为要接受的参数里面有集合类型，所以使用@RequestParam
		//调用Service业务层来处理请求
		adminService.assignRoleToAdmin(adminId , roleId);
		return "ok";
	}
	
	
	//处理跳转到分配角色的页面中去
	@RequestMapping("admin/assignRole.html")
	public String toAssignRolePage(Model model , Integer id) {
		//准备单击事件所具有的管理员具有和未具有的角色的集合
		//1查询所有的角色集合，
		List<TRole> roles = roleService.listRoles(null);
		//2再查询所对应的id所具有的角色
		List<Integer> roleIds =  adminService.listAdminRoleIds(id);
		//将查询到的所有的集合分成两派，一派是id已经拥有的属性，一类是未拥有的属性
		ArrayList<TRole> assignRoles = new ArrayList<TRole>();
		ArrayList<TRole> unAssignRoles = new ArrayList<TRole>();
		for(TRole role : roles) {
			if(roleIds.contains(role)) {
				assignRoles.add(role);
			}else {
				unAssignRoles.add(role);
			}
		}
		//将所获取到的数据共享到域中去
		model.addAttribute("assignRoles", assignRoles);
		System.out.println(assignRoles);
		model.addAttribute("unAssignRoles", unAssignRoles);
		System.out.println(unAssignRoles);
		
		//3将其返回页面
	
		
		return "admin/assignRole";
	}
	
	
	//处理批量删除
	@RequestMapping("/admin/deleteAdmins")
	public String deleteAdmins(String ids , @RequestHeader("referer")String referer) {
		//将ids进行解析
		String[] idsArr = ids.split(",");
		System.out.println(ids);
		//将字符串转化为List集合
		ArrayList<Integer> list = new ArrayList<Integer>();
		if (idsArr!=null) {
			for(String idStr : idsArr) {
			int id = Integer.parseInt(idStr);
			list.add(id);
		}
		}
		//调用业务层
		adminService.deleteAdmins(list);
		//返回原来的页面
		
		
		return  "redirect:"+referer;
		
		
	}
	
	
	//处理用户修改内容的表单提交
	@PostMapping("/admin/updateAdmin")
	public String updateAdmin(TAdmin admin , HttpSession session ) {
		//调用业务层来处理信息
		adminService.updateAdminById(admin);
		//从session域中获取referer头信息
		String ref = (String) session.getAttribute("ref");
		session.removeAttribute("ref");
		//跳转回最后一条页面
		return "redirect:" + ref;
	}
	
	
	//处理用户跳转到编辑页面
	@RequestMapping("/admin/edit.html")
	public String toEditPage(HttpSession session , Integer id , HttpServletRequest request , @RequestHeader("referer")String referer) {
		//需要修改的管理员的信息
		TAdmin admin = adminService.getAdminById(id);
		//将数据保存到域中
		request.setAttribute("editAdmin", admin);
		//将请求头信息保存到session域中去
		session.setAttribute("ref", referer);
		//跳转到表单
		return "admin/edit";
		
	}
	
	//处理添加用户
	@RequestMapping("/admin/addAdmin")
	public String addAdmin(Model model , HttpSession session , TAdmin admin) {
		//调用业务层处理方法
		try {
			adminService.saveAdmin(admin);
		} catch (Exception e) {
			e.printStackTrace();
			//如果添加失败，就返回到添加之前的页面
			model.addAttribute("errorMsg", e.getMessage());
			return "admin/add";
			
		}
		//返回登录页面
		//从session域中获取数据
		Integer pages = (Integer) session.getAttribute(AppConsts.PAGES_COUNT);
		return "redirect:/admin/index.html?pageNum=" + (pages+1);
		
		
	}
	
	
	//跳转到增加用户的页面
	@RequestMapping("/admin/add.html")
	public String toAddAdminPage() {
		//调用业务层方法
		
		//将对象返回页面
		return "admin/add";
		
		
	}
	
	//由于spring于sprigMVC的父子容器之间的关系，spring是父容器，父亲不能让由儿子的，儿子可以使用父亲的
	//导致在Controller加的注解失效
	//解决父子容器的问题，将spring的容器的创建权交由MVC来处理
	
	@PreAuthorize("hasAnyRole('PM - 项目经理112233')")//只有项目经理能够干这个事
	@RequestMapping("/admin/deleteAdmin")
	public String deleteAdmin(Integer id, @RequestHeader("referer")String referer) {
		//调用service方法
		adminService.deleteAdminById(id);
		//将页面显示给用户
		
		
		return "redirect:"+referer;
		
		
	}
	
	
	
	@RequestMapping("/admin/index.html")
	public String toUserPage(HttpSession session ,  @RequestParam (value="condition" , defaultValue = "", required = false)String condition ,  
			@RequestParam(value = "pageNum" , defaultValue = "1"  , required = false)Integer pageNum , Model model) {
		//分页功能开启
		
		PageHelper.startPage(pageNum, AppConsts.PAGE_SIZE);
		//查询管理员
		List<TAdmin> admins = adminService.listAdmins(condition);
		//存到域中去
		
		//开启分页查询功能，利用pageInfo的功能来实现.pageinfo里面啥都有
		PageInfo<TAdmin> pageInfo = new PageInfo<TAdmin>(admins , AppConsts.NAV_SIZE);
		//参数1.分页集合 参数2.页面显示页码个数
		//将数据存放到session域中，在添加成功之后可以从其中获取页码信息，调到最后一页
		session.setAttribute(AppConsts.PAGES_COUNT, pageInfo.getPages());
		
		model.addAttribute("pageInfo", pageInfo);
		//在页面遍历显示
		return "admin/user";
	}
	
	
	/*登录请求不再由Controller来处理 ， 交由springsecurity来处理
	 * @GetMapping("/logout") 
	 * public String logout(HttpSession Session) {
	 * 
	 * Session.invalidate(); 
	 * //注销域对象 
	 * return "redirect:/index"; 
	 * }
	 */

	/*
	  @PostMapping("/doLogin") public String doLogin(String loginacct , String
	  userpswd ,HttpServletRequest request , HttpSession session) { //1.调用业务层
	  TAdmin admin = adminService.doLogin(loginacct , userpswd);
	  
	  //2准备参数 if (admin==null) { String errorMsg = "账号或密码错误！！！！";
	  request.setAttribute("errorMsg", errorMsg); return "login"; }
	  session.setAttribute("admin", admin); //3根据业务需要进行跳转
	  System.out.println("登录成功"); return "redirect:/main.html";
	  
	  }
	 */
	@RequestMapping("/main.html")
	public String toMainPage(HttpSession session) {
		//后台首页显示需要 菜单集合
		List<TMenu> parentsMenu = menuService.ListMenus();
		//打印日志
		logger.info("查询到的菜单集合：{}", parentsMenu.toString());
		//准备菜单集合设置到request域中
		session.setAttribute("parents", parentsMenu);
		
		System.out.println("菜单获取成功");
		//转发到后台首页.到main页面中遍历显示
		return "admin/main";
	}

}
