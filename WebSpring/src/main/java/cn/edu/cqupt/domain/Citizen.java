package cn.edu.cqupt.domain;

public class Citizen extends MyUser {

    private String citizenName;
    private String sex;
    private Integer age;
    private String isMarried;
    private String idCard;

    private String registerName;
    private String registerPass;

    public Citizen() {
    }

    /*    //“登录成功”后mysql
    public Citizen(Integer role_id, String role_name, String citizen_name) {
        super(role_id, role_name);
        this.citizen_name = citizen_name;
    }*/

    //“注册信息”时jsp
/*    public Citizen(String username, String password, String citizen_name,
                   String sex, Integer age, String idCard) {
        super(username, password);
        this.citizen_name = citizen_name;
        this.sex = sex;
        this.age = age;
        this.idCard = idCard;
        this.setRole_id(1);
    }*/

    public String getCitizenName() {
        return citizenName;
    }

    public void setCitizenName(String citizenName) {
        this.citizenName = citizenName;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getIsMarried() {
        return isMarried;
    }

    public void setIsMarried(String isMarried) {
        this.isMarried = isMarried;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getRegisterName() {
        return registerName;
    }

    public void setRegisterName(String registerName) {
        this.registerName = registerName;
    }

    public String getRegisterPass() {
        return registerPass;
    }

    public void setRegisterPass(String registerPass) {
        this.registerPass = registerPass;
    }

    @Override
    public String toString() {
        return "Citizen{" +
                super.toString()+ '\'' +
                "role_id" + getRoleId() + '\'' +
                ", citizen_name='" + citizenName + '\'' +
                ", sex='" + sex + '\'' +
                ", age=" + age +
                ", isMarried='" + isMarried + '\'' +
                ", idCard='" + idCard + '\'' +
                '}';
    }
}
