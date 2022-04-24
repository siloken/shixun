package cn.edu.cqupt.service.impl;

import cn.edu.cqupt.dao.IMessageDao;
import cn.edu.cqupt.domain.Message;
import cn.edu.cqupt.service.IMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("messageAdminService")
public class MessageAdminServiceImpl implements IMessageService {

    @Autowired
    private IMessageDao messageDao;

    @Override
    public List<Message> showMessage(Integer pageId) {
        return messageDao.selectAllByIsApproved0AndPage((pageId - 1) * 5);
    }

    @Override
    public Integer countMessage() {
        Integer pageIdMax = messageDao.selectMessageCountByIsApproved0();
        if (pageIdMax%5==0){
            return pageIdMax/5;
        } else {
            return pageIdMax/5 + 1;
        }
    }

    public void checkMessage(Message message) {
        messageDao.updateApprovedInfoById(message);
    }
}
