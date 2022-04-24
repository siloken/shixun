package cn.edu.cqupt.controller;

import cn.edu.cqupt.domain.Transcript;
import cn.edu.cqupt.service.IBiddingService;
import cn.edu.cqupt.service.ILoginService;
import cn.edu.cqupt.service.INewsService;
import cn.edu.cqupt.service.ITranscriptService;
import cn.edu.cqupt.service.impl.MessageCitizenServiceImpl;
import cn.edu.cqupt.service.impl.RecruitmentCitizenServiceImpl;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private MessageCitizenServiceImpl messageCitizenService;

    @Resource(name = "recruitmentCitizen")
    private RecruitmentCitizenServiceImpl recruitmentService;

    @Resource(name = "login")
    ILoginService iLoginService;

    @Autowired
    ITranscriptService iTranscriptService;

    @Autowired
    private IBiddingService biddingService;

    @Autowired
    private INewsService newsService;

    @RequestMapping("success")
    public String success(){
        return "success";
    }

    @RequestMapping("failer")
    public String failer(){
        return "failer";
    }

    @RequestMapping("toregister")
    public String toRegister() {
        return "register";
    }

    //查看合格留言
    @RequestMapping(value = "showmessage",method = RequestMethod.GET)
    public String showMessage(Integer pageId, Model model) {
        model.addAttribute("messages",messageCitizenService.showMessage(pageId));
        model.addAttribute("pageId",pageId);
        model.addAttribute("pageIdMax",messageCitizenService.countMessage());

        return "message_show_user";
    }

    @RequestMapping("tochecktranscript")
    public String toCheckTranscript() {
        return "transcript_check";
    }
    @RequestMapping(value = "checktranscript", produces = "application/json; charset=utf-8")
    @ResponseBody
    public String checkScore(String examineeId,String idCard) {
        Transcript transcript = iTranscriptService.checkTranscript(idCard,examineeId);

        JSONObject object = new JSONObject();
        object.put("examName",transcript.getExamName());
        object.put("examineeId",transcript.getExamineeId());
        object.put("examineeName",transcript.getExamineeName());
        object.put("score",transcript.getScore());

        return object.toString();
    }

    @RequestMapping("tologin")
    public String login() {
        return "login_user";
    }

    @RequestMapping("toresetpassword")
    public String toResetPassword(){
        return "reset_password";
    }

    @RequestMapping("resetpassword")
    public String identityCheck(Model model,String username,String password,String passwordNew) {

        if (password.equals(iLoginService.identityCheck(username, password))) {
            iLoginService.resetPassword(username,passwordNew);
            return "redirect:/";
        } else {
            model.addAttribute("mes","账号密码错误，请重新验证身份");
            return "reset_password";
        }
    }

    @RequestMapping("showRecruitment")
    public String showRecruitment(Integer pageId, Model model){
        model.addAttribute("recruitment",recruitmentService.showRecruitment(pageId));
        model.addAttribute("pageId",pageId);
        model.addAttribute("pageIdMax",recruitmentService.getMaxPageId());
        return "recruitment_show_user";
    }

    @RequestMapping("showbidding")
    public String showBidding(Integer pageId, Model model){
        model.addAttribute("bidding",biddingService.showBidding(pageId));
        model.addAttribute("pageId",pageId);
        model.addAttribute("pageIdMax",biddingService.getMaxPageId());

        return "bidding_show";
    }

    @RequestMapping("showbiddingdetail")
    public String showBiddingDetail(Integer biddingId,HttpServletRequest req) {
        req.setAttribute("bidding",biddingService.showBiddingDetail(biddingId));
        return "bidding_show_detail";
    }

    @RequestMapping(value = "shownewstitles",method = RequestMethod.GET)
    public String showNewsTitles(Integer pageId,Model model){
        model.addAttribute("news",newsService.show5NewsTitles(pageId));
        model.addAttribute("pageId",pageId);

        Integer pageIdMax = newsService.countNews();

        if (pageIdMax%5 == 0) {
            model.addAttribute("pageIdMax",newsService.countNews()/5);
        } else {
            model.addAttribute("pageIdMax",newsService.countNews()/5 + 1);
        }

        return "news_show";
    }

    @RequestMapping(value = "shownewstext",method = RequestMethod.GET)
    public String showNewsText(Integer newsId,Model model){
        model.addAttribute("news",newsService.showNewsText(newsId));
        return "news_show_text";
    }

}
