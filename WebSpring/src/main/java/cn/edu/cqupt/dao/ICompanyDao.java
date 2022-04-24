package cn.edu.cqupt.dao;

import cn.edu.cqupt.domain.Company;
import cn.edu.cqupt.domain.MyUser;

public interface ICompanyDao {
    //MyUser selectByNameAndPwd(MyUser user) throws IOException;
    void insertCompany(MyUser user);
    Company selectAllById(Integer userId);
}
