package cn.edu.cqupt.service.impl;

import cn.edu.cqupt.dao.ICompanyDao;
import cn.edu.cqupt.domain.MyUser;
import cn.edu.cqupt.service.IInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("infoCompany")
public class InfoCompanyServiceImpl implements IInfoService {

    @Autowired
    private ICompanyDao iCompanyDao;

    @Override
    public void register(MyUser user) {
        iCompanyDao.insertCompany(user);
    }

    @Override
    public Object showPersonalInfo(Integer userId) {
        return iCompanyDao.selectAllById(userId);
    }
}
