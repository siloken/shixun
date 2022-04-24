package cn.edu.cqupt.service.impl;

import cn.edu.cqupt.dao.IRecruitmentDao;
import cn.edu.cqupt.domain.Recruitment;
import cn.edu.cqupt.service.IRecruitmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("recruitmentCompany")
public class RecruitmentCompanyServiceImpl implements IRecruitmentService {

    @Autowired
    private IRecruitmentDao iRecruitmentDao;

    public void postRecruitment(Recruitment recruitment){
        iRecruitmentDao.insertRecruitment(recruitment);
    };

    public List<Recruitment> showSomeRecruitment(){return iRecruitmentDao.select4AllByIsChecked1();};

    @Override
    public List<Recruitment> showRecruitment(Integer pageId) {
        return iRecruitmentDao.selectAllByIsChecked1();
    }

    @Override
    public Integer getMaxPageId() {
        return null;
    }

    public List<Recruitment> showRecruitmentPersonal(Integer userId) {
        return iRecruitmentDao.selectAllByUserId(userId);
    }
}
