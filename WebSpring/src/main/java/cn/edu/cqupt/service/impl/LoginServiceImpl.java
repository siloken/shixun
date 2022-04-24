package cn.edu.cqupt.service.impl;

import cn.edu.cqupt.dao.IUserDao;
import cn.edu.cqupt.domain.MyUser;
import cn.edu.cqupt.service.ILoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("login")
public class LoginServiceImpl implements ILoginService {

    @Autowired
    private IUserDao iUserDao;

    @Override
    public String identityCheck(String username,String password) {
        return iUserDao.selectByNameAndPwd(username,password);
    }

    @Override
    public void resetPassword(String username, String password) {
        iUserDao.updatePassByUsername(username,password);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        System.out.println("---------login: " + username + "---------");
        MyUser user = iUserDao.loadUserByUsername(username);
        MyUser userDetails = null;
        List<SimpleGrantedAuthority> list = new ArrayList<>();

        if (user != null) {
            list.add(new SimpleGrantedAuthority("ROLE_" + user.getRoleNameEng()));
            userDetails = new MyUser(user.getUsername(), "{noop}" + user.getPassword(), list);
            userDetails.setUserId(user.getUserId());
            userDetails.setRoleId(user.getRoleId());
            userDetails.setRoleName(user.getRoleName());
            userDetails.setRoleNameEng(user.getRoleNameEng());
        } else {
            userDetails = new MyUser();
        }
        return userDetails;
    }
}
