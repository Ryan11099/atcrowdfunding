package com.atguigu.atcrowdfunding.mapper;

import com.atguigu.atcrowdfunding.bean.TRolePermission;
import com.atguigu.atcrowdfunding.bean.TRolePermissionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TRolePermissionMapper {
    int countByExample(TRolePermissionExample example);

    int deleteByExample(TRolePermissionExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TRolePermission record);

    int insertSelective(TRolePermission record);

    List<TRolePermission> selectByExample(TRolePermissionExample example);

    TRolePermission selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TRolePermission record, @Param("example") TRolePermissionExample example);

    int updateByExample(@Param("record") TRolePermission record, @Param("example") TRolePermissionExample example);

    int updateByPrimaryKeySelective(TRolePermission record);

    int updateByPrimaryKey(TRolePermission record);

	List<Integer> selectPermissionIdsByRoleId(Integer id);

	void insertRolePermissionIds(@Param("id")Integer id, @Param("pids")List<Integer> pids);
}