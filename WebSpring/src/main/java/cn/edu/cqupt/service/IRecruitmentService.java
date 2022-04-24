package cn.edu.cqupt.service;

import cn.edu.cqupt.domain.Recruitment;

import java.util.List;

public interface IRecruitmentService {

    List<Recruitment> showRecruitment(Integer pageId);
    Integer getMaxPageId();

}
