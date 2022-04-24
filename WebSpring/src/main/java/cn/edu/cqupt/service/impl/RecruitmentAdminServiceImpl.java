package cn.edu.cqupt.service.impl;

import cn.edu.cqupt.dao.IRecruitmentDao;
import cn.edu.cqupt.domain.Recruitment;
import cn.edu.cqupt.service.IRecruitmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("recruitmentAdmin")
public class RecruitmentAdminServiceImpl implements IRecruitmentService {

    @Autowired
    private IRecruitmentDao iRecruitmentDao;

    public void checkRecruitment(Integer recruitmentId){
        iRecruitmentDao.updateIsCheckedById(recruitmentId);
    }

    @Override
    public List<Recruitment> showRecruitment(Integer pageId) {
        return iRecruitmentDao.selectAllByIsChecked0AndPage((pageId - 1) * 5);
    }

    @Override
    public Integer getMaxPageId() {
        Integer pageIdMax = iRecruitmentDao.countRecruitmentByIsChecked0();
        if (pageIdMax%5 == 0) {
            return pageIdMax / 5;
        } else {
            return pageIdMax / 5 + 1;
        }
    }
}
