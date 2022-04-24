package cn.edu.cqupt.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Message {

    private Integer messageId;
    private String message;
    private String respond;
    private String dateTimeInsert;
    private String dateTimeApproved;

    private Citizen citizen;
    private Admin admin;

    public Message() {

    }

/*    public Message(String message) {
        this.message = message;
        System.out.println("Message(String)");
    }*/

/*    public Message(Integer messageId,String respond) {
        this.messageId = messageId;
        this.respond = respond;
        System.out.println("Message(Integer,String)");
    }*/

    /*public void newDateTime(){
        this.dateTimeInsert =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
    }*/

    public void newCitizen(){
        this.citizen=new Citizen();
    }

    public void newAdmin() {
        this.admin=new Admin();
    }

    public Integer getMessageId() {
        return messageId;
    }

    public void setMessageId(Integer messageId) {
        this.messageId = messageId;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getRespond() {
        return respond;
    }

    public void setRespond(String respond) {
        this.respond = respond;
    }

    public String getDateTimeInsert() {
        return dateTimeInsert;
    }

    public void setDateTimeInsert(String dateTimeInsert) {
        this.dateTimeInsert = dateTimeInsert;
    }

    public String getDateTimeApproved() {
        return dateTimeApproved;
    }

    public void setDateTimeApproved(String dateTimeApproved) {
        this.dateTimeApproved = dateTimeApproved;
    }

    public Citizen getCitizen() {
        return citizen;
    }

    public void setCitizen(Citizen citizen) {
        this.citizen = citizen;
    }

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    @Override
    public String toString() {
        return "Message{" +
                "messageId=" + messageId +
                ", message='" + message + '\'' +
                ", respond='" + respond + '\'' +
                ", dateTimeInsert='" + dateTimeInsert + '\'' +
                ", dateTimeApproved='" + dateTimeApproved + '\'' +
                ", citizen=" + citizen +
                ", admin=" + admin +
                '}';
    }
}
