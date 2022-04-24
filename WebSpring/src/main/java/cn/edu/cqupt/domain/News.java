package cn.edu.cqupt.domain;

public class News {
    Integer newsId;
    String title;
    String subtitle;
    String dateTime;
    Integer adminId;
    String editorValue;//正文
    String regionalPlate;

    public News() {
    }

    @Override
    public String toString() {
        return "News{" +
                "newsId=" + newsId +
                ", title='" + title + '\'' +
                ", subtitle='" + subtitle + '\'' +
                ", dateTime='" + dateTime + '\'' +
                ", adminId='" + adminId + '\'' +
                ", editorValue='" + editorValue + '\'' +
                ", regionalPlate='" + regionalPlate + '\'' +
                '}';
    }

    public Integer getNewsId() {
        return newsId;
    }

    public void setNewsId(Integer newsId) {
        this.newsId = newsId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSubtitle() {
        return subtitle;
    }

    public void setSubtitle(String subtitle) {
        this.subtitle = subtitle;
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

    public String getEditorValue() {
        return editorValue;
    }

    public void setEditorValue(String editorValue) {
        this.editorValue = editorValue;
    }

    public String getRegionalPlate() {
        return regionalPlate;
    }

    public void setRegionalPlate(String regionalPlate) {
        this.regionalPlate = regionalPlate;
    }
}
