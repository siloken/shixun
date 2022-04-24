package cn.edu.cqupt.service.impl;

import cn.edu.cqupt.dao.ICitizenDao;
import cn.edu.cqupt.domain.MyUser;
import cn.edu.cqupt.service.IInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("infoCitizen")
public class InfoCitizenServiceImpl implements IInfoService {

    @Autowired
    private ICitizenDao iCitizenDao;

    @Override
    public void register(MyUser user) {
        iCitizenDao.insertCitizen(user);
    }

    @Override
    public Object showPersonalInfo(Integer userId) {
        return iCitizenDao.selectAllById(userId);
    }

    public Integer checkMarriage(String idCard) {
        return iCitizenDao.selectMarIdByIdCard(idCard);
    }
}
