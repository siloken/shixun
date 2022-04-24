package cn.edu.cqupt.domain;

public class Company extends MyUser {

    private String companyName;
    private String mainServiceOrProduct;
    private String mainIndustry;

    private String registerName;
    private String registerPass;

    public Company() {
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getMainServiceOrProduct() {
        return mainServiceOrProduct;
    }

    public void setMainServiceOrProduct(String mainServiceOrProduct) {
        this.mainServiceOrProduct = mainServiceOrProduct;
    }

    public String getMainIndustry() {
        return mainIndustry;
    }

    public void setMainIndustry(String mainIndustry) {
        this.mainIndustry = mainIndustry;
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
        return "Company{" +
                "rolId='" + getRoleId() + '\'' +
                ", companyName='" + companyName + '\'' +
                ", mainServiceOrProduct='" + mainServiceOrProduct + '\'' +
                ", mainIndustry='" + mainIndustry + '\'' +
                '}';
    }
}
