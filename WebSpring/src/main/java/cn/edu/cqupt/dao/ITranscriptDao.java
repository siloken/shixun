package cn.edu.cqupt.dao;

import cn.edu.cqupt.domain.Transcript;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ITranscriptDao {
    Transcript selectScoreByExaminee(@Param("idCard") String idCard, @Param("examineeId") String examineeId);

    void insertTranscript(List<Transcript> trans);
}
