package cn.edu.cqupt.service;

import cn.edu.cqupt.domain.Transcript;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface ITranscriptService {
    Transcript checkTranscript(String idCard,String examineeId);

    void postTranscript(MultipartFile file,String rootPath) throws IOException;
}
