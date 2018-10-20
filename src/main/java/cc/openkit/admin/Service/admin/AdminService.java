package cc.openkit.admin.Service.admin;

import cc.openkit.admin.pojo.Admin;
import cc.openkit.admin.Service.common.BaseService;

public interface AdminService extends BaseService<Admin> {
    Admin getModelByUsernameAndPassword(Admin admin);

    int updateByAdminId(Admin admin);
}
