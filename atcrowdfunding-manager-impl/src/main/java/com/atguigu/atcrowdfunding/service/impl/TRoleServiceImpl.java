package com.atguigu.atcrowdfunding.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.atguigu.atcrowdfunding.bean.TRole;
import com.atguigu.atcrowdfunding.bean.TRoleExample;
import com.atguigu.atcrowdfunding.bean.TRolePermissionExample;
import com.atguigu.atcrowdfunding.mapper.TRoleMapper;
import com.atguigu.atcrowdfunding.mapper.TRolePermissionMapper;
import com.atguigu.atcrowdfunding.service.TRoleService;
@Service
public class TRoleServiceImpl implements TRoleService {

	@Autowired
	TRoleMapper roleMapper;
	@Autowired 
	TRolePermissionMapper rolePermissionMapper;
	
	@Override
	public List<TRole> listRoles(String condition) {
		//判断是否有条件查询
		
		TRoleExample e = null;
		//如果没有条件就查询所有，如果有条件，就查询条件的
		if(!StringUtils.isEmpty(condition)) {
			e = new TRoleExample();
			e.createCriteria().andNameLike("%"+condition+"%");
		}
	
		return roleMapper.selectByExample(e);
		
	}


	@Override
	public void deleteRole(Integer id) {
		roleMapper.deleteByPrimaryKey(id);
	}


	@Override
	public void saveRole(TRole role) {

		roleMapper.insertSelective(role);
	}


	@Override
	public TRole getRoleById(Integer id) {


		return roleMapper.selectByPrimaryKey(id);
	}


	@Override
	public void updateRole(TRole role) {

		roleMapper.updateByPrimaryKeySelective(role);
	}


	@Override
	public List<Integer> getRolePermissionIds(Integer id) {

		List<Integer> permissionIds = rolePermissionMapper.selectPermissionIdsByRoleId(id);
		
		return permissionIds;
	}


	@Override
	public void deletePermissions(Integer id) {

		TRolePermissionExample example = new TRolePermissionExample();
		example.createCriteria().andRoleidEqualTo(id);//根据roleId来删除权限
		
		rolePermissionMapper.deleteByExample(example);
		
	}


	@Override
	public void updatePermissions(Integer id , List<Integer> pids) {

		rolePermissionMapper.insertRolePermissionIds(id  , pids);
	}

}
