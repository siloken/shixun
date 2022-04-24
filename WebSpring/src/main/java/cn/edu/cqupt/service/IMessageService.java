package cn.edu.cqupt.service;

import cn.edu.cqupt.domain.Message;

import java.util.List;

public interface IMessageService {

    List<Message> showMessage(Integer pageId);
    Integer countMessage();

}
