package cn.edu.cqupt.service;

import cn.edu.cqupt.domain.Citizen;
import cn.edu.cqupt.domain.MyUser;

import java.io.IOException;

public interface ICitizenService {
    MyUser selectByNameAndPwd(MyUser user) throws IOException;
    void insertCitizen(Citizen citizen);
    Integer selectMarIdByManId(String idCard);

}
