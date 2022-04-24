package cn.edu.cqupt.domain;

public class Recruitment {
    private Integer recruitmentId;
    private Integer companyId;
    private String jobTitle;
    private Integer lowSalary;
    private Integer highSalary;
    private String address;
    private String eduBackground;
    private String fullOrPartTime;
    private Integer numOfPeople;
    private String tel;
    private String detail;

    private Company company = null;

    public Recruitment(){};

    public void newCompany(){
        company = new Company();
    }

    public Company getCompany() {
        return company;
    }

    public Integer getRecruitmentId() {
        return recruitmentId;
    }

    public void setRecruitmentId(Integer recruitmentId) {
        this.recruitmentId = recruitmentId;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public Integer getLowSalary() {
        return lowSalary;
    }

    public void setLowSalary(Integer lowSalary) {
        this.lowSalary = lowSalary;
    }

    public Integer getHighSalary() {
        return highSalary;
    }

    public void setHighSalary(Integer highSalary) {
        this.highSalary = highSalary;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEduBackground() {
        return eduBackground;
    }

    public void setEduBackground(String eduBackground) {
        this.eduBackground = eduBackground;
    }

    public String getFullOrPartTime() {
        return fullOrPartTime;
    }

    public void setFullOrPartTime(String fullOrPartTime) {
        this.fullOrPartTime = fullOrPartTime;
    }

    public Integer getNumOfPeople() {
        return numOfPeople;
    }

    public void setNumOfPeople(Integer numOfPeople) {
        this.numOfPeople = numOfPeople;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    @Override
    public String toString() {
        return "Recruitment{" +
                "recruitmentId=" + recruitmentId +
                ", companyId=" + companyId + '\'' +
                ", jobTitle='" + jobTitle + '\'' +
                ", lowSalary=" + lowSalary +
                ", highSalary=" + highSalary +
                ", address='" + address + '\'' +
                ", eduBackground='" + eduBackground + '\'' +
                ", fullOrPartTime='" + fullOrPartTime + '\'' +
                ", numOfPeople=" + numOfPeople +
                ", tel='" + tel + '\'' +
                ", detail='" + detail + '\'' +
                '}';
    }
}
