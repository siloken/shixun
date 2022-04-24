package cn.edu.cqupt.domain;

public class MyImage {
    private String name;
    private String uuidName;
    private String url;

    public MyImage() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUuidName() {
        return uuidName;
    }

    public void setUuidName(String uuidName) {
        this.uuidName = uuidName;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "MyImage{" +
                "realName='" + name + '\'' +
                ", uuidName='" + uuidName + '\'' +
                ", realPath='" + url + '\'' +
                '}';
    }
}
