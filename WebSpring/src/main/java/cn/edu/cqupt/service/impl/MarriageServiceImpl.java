package cn.edu.cqupt.service.impl;

import cn.edu.cqupt.dao.IMarriageDao;
import cn.edu.cqupt.domain.Marriage;
import cn.edu.cqupt.service.IMarriageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("marriage")
public class MarriageServiceImpl implements IMarriageService {

    @Autowired
    private IMarriageDao iMarriageDao;

    @Override
    public void marriageAppointment(Marriage marriage) {
        iMarriageDao.insertMarriageAppointment(marriage);
    }

    @Override
    public List<Marriage> showMarriageAppointment(Integer nodeId) {
        return iMarriageDao.selectAllMarriageAppointmentByPage((nodeId - 1) * 5);
    }

    @Override
    public Integer getMarriageMaxPageId() {
        Integer maxPageId = iMarriageDao.countMarriageAppointment();
        if (maxPageId % 5 == 0){
            return maxPageId/5;
        } else {
            return maxPageId/5 + 1;
        }
    }

    @Override
    public List<Marriage> showMarriageAppointmentPersonal(Integer userId) {
        return iMarriageDao.selectAllMarriageAppointmentByUserId(userId);
    }

    @Override
    public void divorceAppointment(Marriage marriage) {
        iMarriageDao.insertDivorceAppointment(marriage);
    }

    @Override
    public List<Marriage> showDivorceAppointment(Integer nodeId) {
        return iMarriageDao.selectAllDivorceAppointmentByPage((nodeId - 1) * 5);
    }

    @Override
    public Integer getDivorceMaxPageId() {
        Integer maxPageId = iMarriageDao.countDivorceAppointment();
        if (maxPageId % 5 == 0){
            return maxPageId/5;
        } else {
            return maxPageId/5 + 1;
        }
    }

    @Override
    public List<Marriage> showDivorceAppointmentPersonal(Integer userId) {
        return iMarriageDao.selectAllDivorceAppointmentByUserId(userId);
    }

}
