package cn.edu.cqupt.dao;

import cn.edu.cqupt.domain.Marriage;
import java.util.List;

public interface IMarriageDao {

    void insertMarriageAppointment(Marriage marriage);
    List<Marriage> selectAllMarriageAppointment();
    List<Marriage> selectAllDivorceAppointmentByPage(Integer nodeId);
    Integer countDivorceAppointment();
    List<Marriage> selectAllMarriageAppointmentByUserId(Integer userId);

    void insertDivorceAppointment(Marriage marriage);
    List<Marriage> selectAllDivorceAppointment();
    List<Marriage> selectAllMarriageAppointmentByPage(Integer nodeId);
    Integer countMarriageAppointment();
    List<Marriage> selectAllDivorceAppointmentByUserId(Integer userId);

}
