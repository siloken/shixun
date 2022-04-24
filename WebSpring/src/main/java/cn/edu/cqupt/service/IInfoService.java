package cn.edu.cqupt.service;

import cn.edu.cqupt.domain.MyUser;

public interface IInfoService {

    public void register(MyUser user);
    Object showPersonalInfo(Integer userId);
}
