package cn.edu.cqupt.dao;

import cn.edu.cqupt.domain.MyUser;
import org.apache.ibatis.annotations.Param;

public interface IUserDao {
    String selectByNameAndPwd(@Param("username")String username,@Param("password")String password);
    MyUser loadUserByUsername(String username);
    void updatePassByUsername(@Param("username")String username,@Param("password")String password);
}
