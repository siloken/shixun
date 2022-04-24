package cn.edu.cqupt.domain;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.ArrayList;
import java.util.List;

public class MyUser extends User {

    private Integer userId;
    private Integer roleId;
    private String roleName;
    private String roleNameEng;

    public MyUser() {
        super("null", "{noop}", new ArrayList<>());
    }

    public MyUser(String username, String password) {
        super(username, password, new ArrayList<>());
    }

    public MyUser(String username, String password, Integer userId, Integer roleId, String roleName, String roleNameEng) {
        super(username, password, new ArrayList<>());
        this.userId = userId;
        this.roleId = roleId;
        this.roleName = roleName;
        this.roleNameEng = roleNameEng;
    }

    public MyUser(String username, String password, List<SimpleGrantedAuthority> list){
        super(username,password,list);
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getRoleNameEng() {
        return roleNameEng;
    }

    public void setRoleNameEng(String roleNameEng) {
        this.roleNameEng = roleNameEng;
    }

    @Override
    public String toString() {
        return "MyUser{" +
                "userId=" + userId + '\'' +
                ", username='" + getUsername() + '\'' +
                ", password='" + getPassword() + '\'' +
                ", role_name='" + roleName + '\'' +
                ", role_id=" + roleId + '\'' +
                ", role_nameEng=" + roleNameEng +
                '}';
    }
}
