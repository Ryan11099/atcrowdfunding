package com.atguigu.atcrowdfunding.service;

import java.util.List;

import com.atguigu.atcrowdfunding.bean.TRole;

public interface TRoleService {

	List<TRole> listRoles(String condition);

	void deleteRole(Integer id);

	void saveRole(TRole role);

	TRole getRoleById(Integer id);

	void updateRole(TRole role);

	List<Integer> getRolePermissionIds(Integer id);

	void deletePermissions(Integer id);

	void updatePermissions(Integer id , List<Integer> pids);

}
