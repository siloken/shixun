package cn.edu.cqupt.dao;

import cn.edu.cqupt.domain.Message;
import java.util.List;

public interface IMessageDao {
        void insertMessage(Message message);
        List<Message> selectByIsApproved1();
        List<Message> selectByIsApproved0();
        void updateApprovedInfoById(Message message);
        List<Message> selectAllByIsApproved1AndPage(Integer nodeMessageId);
        Integer selectMessageCountByIsApproved1();
        List<Message> selectAllByIsApproved0AndPage(Integer nodeMessageId);
        Integer selectMessageCountByIsApproved0();

        List<Message> selectAllByUserId(Integer userId);

        //List<Message> messageTest();

        //void insertMessage(@Param("peopleid") Integer peopleId, @Param("message") String message);
        //void insertMessage(Integer peopleId, String message);

}
