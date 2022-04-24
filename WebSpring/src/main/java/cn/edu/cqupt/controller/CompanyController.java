package cn.edu.cqupt.controller;

import cn.edu.cqupt.domain.Company;
import cn.edu.cqupt.domain.Recruitment;
import cn.edu.cqupt.service.impl.InfoCompanyServiceImpl;
import cn.edu.cqupt.service.impl.RecruitmentCompanyServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("company")
public class CompanyController {

    @Autowired
    private InfoCompanyServiceImpl infoCompanyService;

    @Resource(name = "recruitmentCompany")
    private RecruitmentCompanyServiceImpl recruitmentService;


    //注册
    @RequestMapping("toregister")
    public String toRegister(){
        return "register";
    }
    @RequestMapping("register")
    public String register(Company company){
        company.setRoleId(2);
        infoCompanyService.register(company);
        return "redirect:/";
    }

    @RequestMapping("toPostRecruitment")
    public String toPostRecruitment(){
        return "recruitment_post";
    }
    @RequestMapping("postRecruitment")
    public String postRecruitment(HttpServletRequest req,Recruitment recruitment){
        HttpSession session = req.getSession();
        recruitment.setCompanyId((Integer) session.getAttribute("userId"));
        recruitmentService.postRecruitment(recruitment);
        return "redirect:/";
    }

    @RequestMapping("showRecruitment")
    public String showRecruitment(HttpServletRequest req){
        //req.setAttribute("recruitment",recruitmentService.showRecruitment());
        return "recruitment_show_user";
    }

    @RequestMapping("showPersonalPage")
    public String showPersonalPage(Model model, HttpSession session){
        Integer userId = (Integer) session.getAttribute("userId");
        Company company = (Company) infoCompanyService.showPersonalInfo(userId);
        model.addAttribute("info",company);
        model.addAttribute("recruitment",recruitmentService.showRecruitmentPersonal(userId));
        return "home_company";
    }


}
