package cn.edu.cqupt.service.impl;

import cn.edu.cqupt.dao.IRecruitmentDao;
import cn.edu.cqupt.domain.Recruitment;
import cn.edu.cqupt.service.IRecruitmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("recruitmentCitizen")
public class RecruitmentCitizenServiceImpl implements IRecruitmentService {

    @Autowired
    private IRecruitmentDao iRecruitmentDao;

    @Override
    public List<Recruitment> showRecruitment(Integer pageId) {
        return iRecruitmentDao.selectAllByIsChecked1AndPage((pageId - 1) * 5);
    }

    @Override
    public Integer getMaxPageId() {
        Integer pageIdMax = iRecruitmentDao.countRecruitmentByIsChecked1();
        if (pageIdMax%5 == 0) {
            return pageIdMax / 5;
        } else {
            return pageIdMax / 5 + 1;
        }
    }

}
