package cn.edu.cqupt.service;

import cn.edu.cqupt.domain.MyUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

@Service("login")
public interface ILoginService extends UserDetailsService {

    String identityCheck(String username,String password) ;
    void resetPassword(String username,String password);
}
