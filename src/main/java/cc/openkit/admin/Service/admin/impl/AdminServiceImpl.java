package cc.openkit.admin.Service.admin.impl;

import cc.openkit.admin.Service.admin.AdminService;
import cc.openkit.admin.Service.common.impl.BaseServiceImpl;
import cc.openkit.admin.pojo.Admin;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class AdminServiceImpl extends BaseServiceImpl<Admin> implements AdminService {

    private final static Logger LOGGER= LoggerFactory.getLogger(AdminServiceImpl.class);

    @Override
    public Admin getModelByUsernameAndPassword(Admin admin) {
        return null;
    }

    @Override
    public int updateByAdminId(Admin admin) {
        return 0;
    }
}
