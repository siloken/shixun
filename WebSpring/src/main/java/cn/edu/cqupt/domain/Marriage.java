package cn.edu.cqupt.domain;

public class Marriage {
    private String manId;
    private String manName;
    private String womanId;
    private String womanName;
    private String date;
    private String address;
    private String tel1;
    private String tel2;

    public Marriage() {
    }

    public String getManId() {
        return manId;
    }

    public void setManId(String manId) {
        this.manId = manId;
    }

    public String getManName() {
        return manName;
    }

    public void setManName(String manName) {
        this.manName = manName;
    }

    public String getWomanId() {
        return womanId;
    }

    public void setWomanId(String womanId) {
        this.womanId = womanId;
    }

    public String getWomanName() {
        return womanName;
    }

    public void setWomanName(String womanName) {
        this.womanName = womanName;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTel1() {
        return tel1;
    }

    public void setTel1(String tel1) {
        this.tel1 = tel1;
    }

    public String getTel2() {
        return tel2;
    }

    public void setTel2(String tel2) {
        this.tel2 = tel2;
    }

    @Override
    public String toString() {
        return "Marriage{" +
                "manId='" + manId + '\'' +
                ", manName='" + manName + '\'' +
                ", womanId='" + womanId + '\'' +
                ", womanName='" + womanName + '\'' +
                ", date='" + date + '\'' +
                ", address='" + address + '\'' +
                ", tel1='" + tel1 + '\'' +
                ", tel2='" + tel2 + '\'' +
                '}';
    }
}
