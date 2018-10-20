package cc.openkit.admin.mapper;

import cc.openkit.admin.pojo.Admin;

public interface AdminMapper {
    int deleteByPrimaryKey(String kitAdminId);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(String kitAdminId);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);
}