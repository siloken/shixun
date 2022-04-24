package cn.edu.cqupt.controller;

import cn.edu.cqupt.domain.Citizen;
import cn.edu.cqupt.domain.Marriage;
import cn.edu.cqupt.domain.Message;
import cn.edu.cqupt.service.IMarriageService;
import cn.edu.cqupt.service.impl.InfoCitizenServiceImpl;
import cn.edu.cqupt.service.impl.MessageCitizenServiceImpl;
import cn.edu.cqupt.service.impl.RecruitmentCitizenServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("citizen")
public class CitizenController {

    @Autowired
    private MessageCitizenServiceImpl messageCitizenService;

    @Autowired
    private InfoCitizenServiceImpl infoCitizenService;

    @Resource(name = "marriage")
    private IMarriageService iMarriageService;

    @Resource(name = "recruitmentCitizen")
    private RecruitmentCitizenServiceImpl recruitmentService;

    //留言
    @RequestMapping("toleavemessage")
    public String toLeaveMessage() {
        return "message_leave";
    }

    @RequestMapping("leavemessage")
    public String leaveMessage(Message message, HttpSession session) {
        Integer citizenId = (Integer) session.getAttribute("userId");
        message.newCitizen();
        message.getCitizen().setUserId(citizenId);
        messageCitizenService.leaveMessage(message);
        return "redirect:/";
    }

    //注册
    @RequestMapping("toregister")
    public String toRegister() {
        return "register";
    }

    @RequestMapping("register")
    public String register(Citizen citizen) {

        Integer integer = infoCitizenService.checkMarriage(citizen.getIdCard());

        String isMarried = "未婚";
        //访问婚姻登记表
        if (integer != null) {
            isMarried = "已婚";
        }
        citizen.setIsMarried(isMarried);
        citizen.setRoleId(1);

        infoCitizenService.register(citizen);

        return "redirect:/user/tologin";
    }

    //婚姻预约
    @RequestMapping("toMarriageAppointment")
    public  String toMarriageAppointment(){
        return "marriage_appointment";
    }
    @RequestMapping("marriageAppointment")
    public String marriageAppointment(Marriage marriage) {
        iMarriageService.marriageAppointment(marriage);
        return "redirect:/";
    }

    @RequestMapping("showMarriage")
    public String showMarriageAppointment(HttpServletRequest req) {
        //req.setAttribute("appointment", iMarriageService.checkMarriageAppointment());
        return "marriage_appointment_show";
    }

    @RequestMapping("toDivorceAppointment")
    public  String toDivorceAppointment(){
        return "divorce_appointment";
    }
    @RequestMapping("divorceAppointment")
    public String divorceAppointment(Marriage marriage) {
        iMarriageService.divorceAppointment(marriage);
        return "redirect:/";
    }

    @RequestMapping("showDivorce")
    public String showDivorceAppointment(HttpServletRequest req) {
        //req.setAttribute("appointment",iMarriageService.checkDivorceAppointment());
        return "marriage_appointment_show";
    }

    //查看招聘
    @RequestMapping("showRecruitment")
    public String showRecruitment(Integer pageId, Model model){
        model.addAttribute("recruitment",recruitmentService.showRecruitment(pageId));
        model.addAttribute("pageId",pageId);
        model.addAttribute("pageIdMax",recruitmentService.getMaxPageId());
        return "recruitment_show_user";
    }

    @RequestMapping("showPersonalPage")
    public String showPersonalPage(Model model,HttpSession session){
        Citizen citizen = (Citizen)infoCitizenService.showPersonalInfo((Integer) session.getAttribute("userId"));
        Integer userId = (Integer) session.getAttribute("userId");
        model.addAttribute("info",citizen);
        model.addAttribute("message",messageCitizenService.showMessageCitizen(userId));
        model.addAttribute("marriage",iMarriageService.showMarriageAppointmentPersonal(userId));
        model.addAttribute("divorce",iMarriageService.showDivorceAppointmentPersonal(userId));
        return "home_citizen";
    }

}
