package com.atguigu.atcrowdfunding.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.atguigu.atcrowdfunding.bean.TAdmin;
import com.atguigu.atcrowdfunding.bean.TAdminExample;
import com.atguigu.atcrowdfunding.bean.TAdminExample.Criteria;
import com.atguigu.atcrowdfunding.bean.TAdminRoleExample;
import com.atguigu.atcrowdfunding.mapper.TAdminMapper;
import com.atguigu.atcrowdfunding.mapper.TAdminRoleMapper;
import com.atguigu.atcrowdfunding.service.TAdminService;
import com.atguigu.atcrowdfunding.utils.AppDateUtils;
import com.atguigu.atcrowdfunding.utils.MD5Util;
import com.atguigu.atcrowdfunding.utils.StringUtil;
@Service
public class TAdminServiceImpl implements TAdminService{

	@Autowired
	TAdminMapper adminMapper;
	@Autowired
	TAdminRoleMapper adminRoleMapper;
	@Autowired
	PasswordEncoder passwordEncoder;
	
	
	@Override
	public TAdmin doLogin(String loginacct, String userpswd) {
		
		userpswd = MD5Util.digest(userpswd);

		TAdminExample example = new TAdminExample();
		example.createCriteria().andLoginacctEqualTo(loginacct).andUserpswdEqualTo(userpswd);
		List<TAdmin> list = adminMapper.selectByExample(example);
		//如果没有查询到或者查询到了多个管理员
		if (CollectionUtils.isEmpty(list) || list.size()!=1) {
			return null;
		}
		return list.get(0);
	}
	@Override
	public List<TAdmin> listAdmins(String condition) {
		TAdminExample e = null;
		//判断是否传入查询条件
		if (!StringUtil.isEmpty(condition)) {
			 e = new TAdminExample();
			
			e.createCriteria().andLoginacctLike("%"+condition+"%");
			Criteria e2 = e.createCriteria().andUsernameLike("%"+condition+"%");
			Criteria e3 = e.createCriteria().andEmailLike("%"+condition+"%");
			e.or(e2);
			e.or(e3);
		}
		List<TAdmin> admins = adminMapper.selectByExample(e);
		return admins;
	}
	
	
	@Override
	public void deleteAdminById(Integer id) {

		adminMapper.deleteByPrimaryKey(id);
		
	}
	@Override
	public void saveAdmin(TAdmin admin) {
		//保存的密码加密
		//保证保存的用户一致,判断是否输入的用户名在数据库中已经存在，email与用户名有一个存在都不行
		TAdminExample e = new TAdminExample();
		
		e.createCriteria().andLoginacctEqualTo(admin.getLoginacct());
		long l = adminMapper.countByExample(e);
		if (l>0) {
			throw new RuntimeException("账号已经存在");
		}
		e.clear();
		e.createCriteria().andEmailEqualTo(admin.getEmail());
		long l1 = adminMapper.countByExample(e);
		if (l1>0) {
			throw new RuntimeException("邮箱已经存在");
		}
		admin.setUserpswd(passwordEncoder.encode(admin.getUserpswd()));
	
		
		//由工具类获取相对应的创建时间
		admin.setCreatetime(AppDateUtils.getFormatTime());
		adminMapper.insertSelective(admin);
		
		
	}
	@Override
	public TAdmin getAdminById(Integer id) {
		
		return adminMapper.selectByPrimaryKey(id);
	}
	@Override
	public void updateAdminById(TAdmin admin) {

		adminMapper.updateByPrimaryKeySelective(admin);
		
	}
	@Override
	public void deleteAdmins(ArrayList<Integer> list) {
		
		
		TAdminExample example = new TAdminExample();
		example.createCriteria().andIdIn(list);
		adminMapper.deleteByExample(example);
		
	}
	@Override
	public List<Integer> listAdminRoleIds(Integer id) {
		List<Integer> ids = adminRoleMapper.selectRoleIdsByAdminId(id);
		
		return ids;
	}
	@Override
	public void assignRoleToAdmin(Integer adminId, List<Integer> roleId) {
		//insert into t_admin_role (adminId , roleId) values(? , ?)
		adminRoleMapper.assignRoleIdsToAdmin(adminId, roleId);
	}
	@Override
	public void unAssignRoleToAdmin(Integer adminId, List<Integer> roleId) {

		
		//delete from t_admin_role where adminid=? roleid in ()
		TAdminRoleExample example = new TAdminRoleExample();
		example.createCriteria().andAdminidEqualTo(adminId).andRoleidIn(roleId);
		adminRoleMapper.deleteByExample(example);
	}
	

}
