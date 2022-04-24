package cn.edu.cqupt.domain;

public class Transcript {

    private String examName;
    private String examineeId;
    private String examineeName;
    private Integer score;
    private String idCard;

    public Transcript() {
    }

    @Override
    public String toString() {
        return "Transcript{" +
                "examName='" + examName + '\'' +
                ", examineeId='" + examineeId + '\'' +
                ", examineeName='" + examineeName + '\'' +
                ", score=" + score +
                ", idCard='" + idCard + '\'' +
                '}';
    }

    public String getExamName() {
        return examName;
    }

    public void setExamName(String examName) {
        this.examName = examName;
    }

    public String getExamineeId() {
        return examineeId;
    }

    public void setExamineeId(String examineeId) {
        this.examineeId = examineeId;
    }

    public String getExamineeName() {
        return examineeName;
    }

    public void setExamineeName(String examineeName) {
        this.examineeName = examineeName;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

}
