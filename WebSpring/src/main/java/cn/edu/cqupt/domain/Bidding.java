package cn.edu.cqupt.domain;

public class Bidding {

    private Integer biddingId;
    private String title;
    private String city;
    private String detail;
    private String dateTime;
    private Integer adminId;
    private String functionaryTel;
    private String functionaryName;

    public Bidding() {
    }

    @Override
    public String toString() {
        return "Bidding{" +
                "biddingId=" + biddingId +
                ", title='" + title + '\'' +
                ", city='" + city + '\'' +
                ", detail='" + detail + '\'' +
                ", dateTime='" + dateTime + '\'' +
                ", adminId=" + adminId +
                ", functionaryTel='" + functionaryTel + '\'' +
                ", functionaryName='" + functionaryName + '\'' +
                '}';
    }

    public Integer getBiddingId() {
        return biddingId;
    }

    public void setBiddingId(Integer biddingId) {
        this.biddingId = biddingId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public String getFunctionaryTel() {
        return functionaryTel;
    }

    public void setFunctionaryTel(String functionaryTel) {
        this.functionaryTel = functionaryTel;
    }

    public String getFunctionaryName() {
        return functionaryName;
    }

    public void setFunctionaryName(String functionaryName) {
        this.functionaryName = functionaryName;
    }

}
