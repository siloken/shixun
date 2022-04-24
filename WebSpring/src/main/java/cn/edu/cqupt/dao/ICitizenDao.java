package cn.edu.cqupt.dao;

import cn.edu.cqupt.domain.Citizen;
import cn.edu.cqupt.domain.MyUser;

public interface ICitizenDao {
    //MyUser selectByNameAndPwd(MyUser user) throws IOException;
    void insertCitizen(MyUser user);
    Integer selectMarIdByIdCard(String idCard);
    Citizen selectAllById(Integer userId);
}
