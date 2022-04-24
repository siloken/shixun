package cn.edu.cqupt.controller;

import cn.edu.cqupt.domain.Bidding;
import cn.edu.cqupt.domain.Message;
import cn.edu.cqupt.domain.News;
import cn.edu.cqupt.service.IBiddingService;
import cn.edu.cqupt.service.IMarriageService;
import cn.edu.cqupt.service.INewsService;
import cn.edu.cqupt.service.ITranscriptService;
import cn.edu.cqupt.service.impl.MessageAdminServiceImpl;
import cn.edu.cqupt.service.impl.RecruitmentAdminServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("admin")
public class AdminController {

    @Autowired
    private MessageAdminServiceImpl messageAdminService;

    @Autowired
    public RecruitmentAdminServiceImpl recruitmentService;

    @Resource(name = "marriage")
    private IMarriageService iMarriageService;

    @Autowired
    private ITranscriptService transcriptService;

    @Autowired
    private IBiddingService biddingService;

    @Autowired
    private INewsService newsService;

    @RequestMapping("checkmessage")
    public void checkMessage(Message message, HttpSession session){
        Integer adminId = (Integer) session.getAttribute("userId");
        message.newAdmin();
        message.getAdmin().setUserId(adminId);
        System.out.println(message);
        messageAdminService.checkMessage(message);
    }

    @RequestMapping("showmessage")
    public String showMessage(Integer pageId,Model model) {

        model.addAttribute("messages",messageAdminService.showMessage(pageId));
        model.addAttribute("pageId",pageId);
        model.addAttribute("pageIdMax",messageAdminService.countMessage());

        return "message_show_admin";
    }

    @RequestMapping("showRecruitment")
    public String showRecruitment(Integer pageId, Model model){
        model.addAttribute("recruitment",recruitmentService.showRecruitment(pageId));
        model.addAttribute("pageId",pageId);
        model.addAttribute("pageIdMax",recruitmentService.getMaxPageId());
        return "recruitment_show_admin";
    }

    @RequestMapping("checkRecruitment")
    public void checkRecruitment(Integer recruitmentId){
        recruitmentService.checkRecruitment(recruitmentId);
    }

    @RequestMapping("showMarriage")
    public String showMarriageAppointment(Integer pageId, Model model){
        model.addAttribute("appointment",iMarriageService.showMarriageAppointment(pageId));
        model.addAttribute("pageId",pageId);
        model.addAttribute("pageIdMax",iMarriageService.getMarriageMaxPageId());
        return "marriage_appointment_show";
    }

    @RequestMapping("showDivorce")
    public String showDivorceAppointment(Integer pageId, Model model){
        model.addAttribute("appointment",iMarriageService.showDivorceAppointment(pageId));
        model.addAttribute("pageId",pageId);
        model.addAttribute("pageIdMax",iMarriageService.getDivorceMaxPageId());
        return "divorce_appointment_show";
    }

    @RequestMapping("toposttranscript")
    public String toUpload() {
        return "transcript_post";
    }
    @RequestMapping(value="posttranscript",method= RequestMethod.POST)
    String upload(@RequestParam("file") MultipartFile file, HttpServletRequest request) throws IOException {
        // uploads文件夹位置
        String rootPath = request.getSession().getServletContext().getRealPath("WEB-INF/upload");
        transcriptService.postTranscript(file,rootPath);
        return  "redirect:/";
    }

    @RequestMapping("topostbidding")
    public String toPostBidding() { return "bidding_post"; }
    @RequestMapping("postbidding")
    public String postBidding(Bidding bidding,HttpSession session) {
        bidding.setAdminId((Integer)session.getAttribute("userId"));
        biddingService.postBidding(bidding);
        return "redirect:/";
    }

    @RequestMapping("topostnews")
    public String toPostNews() {return "news_post";}
    @RequestMapping("postnews")
    public String postNews(News news,HttpSession session) {
        news.setAdminId((Integer) session.getAttribute("userId"));
        newsService.PostNews(news);
        return "redirect:/";
    }

}
