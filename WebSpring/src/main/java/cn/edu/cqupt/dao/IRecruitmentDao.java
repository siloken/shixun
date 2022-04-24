package cn.edu.cqupt.dao;

import cn.edu.cqupt.domain.Recruitment;

import java.util.List;

public interface IRecruitmentDao {
    void insertRecruitment(Recruitment recruitment);
    List<Recruitment> selectAllByIsChecked1();
    List<Recruitment> selectAllByIsChecked0();
    List<Recruitment> select4AllByIsChecked1();
    void updateIsCheckedById(Integer recruitmentId);
    List<Recruitment> selectAllByIsChecked1AndPage(Integer recruitmentNodeId);
    Integer countRecruitmentByIsChecked1();
    List<Recruitment> selectAllByIsChecked0AndPage(Integer recruitmentNodeId);
    Integer countRecruitmentByIsChecked0();
    List<Recruitment> selectAllByUserId(Integer userId);
}
