package cn.edu.cqupt.service;

import cn.edu.cqupt.domain.Marriage;

import java.util.List;

public interface IMarriageService {

    void marriageAppointment(Marriage marriage);

    List<Marriage> showMarriageAppointment(Integer nodeId);
    Integer getMarriageMaxPageId();
    List<Marriage> showMarriageAppointmentPersonal(Integer userId);


    void divorceAppointment(Marriage marriage);

    List<Marriage> showDivorceAppointment(Integer nodeId);
    Integer getDivorceMaxPageId();
    List<Marriage> showDivorceAppointmentPersonal(Integer userId);

}
