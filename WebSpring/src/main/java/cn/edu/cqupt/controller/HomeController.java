package cn.edu.cqupt.controller;

import cn.edu.cqupt.dao.IMessageDao;
import cn.edu.cqupt.dao.IUserDao;
import cn.edu.cqupt.domain.Message;
import cn.edu.cqupt.domain.MyImage;
import cn.edu.cqupt.domain.MyUser;
import cn.edu.cqupt.service.INewsService;
import cn.edu.cqupt.service.impl.RecruitmentCompanyServiceImpl;
import com.baidu.ueditor.ActionEnter;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.apache.commons.io.IOUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.UUID;

@Controller
public class HomeController {

    @Autowired
    IMessageDao iMessageDao;
    @Autowired
    IUserDao iUserDao;
    @Resource(name = "recruitmentCompany")
    private RecruitmentCompanyServiceImpl recruitmentService;
    @Autowired
    private INewsService newsService;

    @RequestMapping("/")
    public String home(HttpServletRequest req, Model model){
        req.setAttribute("recruitment",recruitmentService.showSomeRecruitment());
        model.addAttribute("countryNews",newsService.showCountryNews());
        model.addAttribute("cityNews",newsService.showCityNews());
        return "home";
    }

    @RequestMapping("/test")
    public String test(Message user){
        System.out.println(user);
        return "login_user";
    }

    @RequestMapping(value = "/testJson", produces = "application/json; charset=utf-8")
    @ResponseBody
    public String testJson(){
        System.out.println("--------------test start-----------------");
        MyUser user = new MyUser();
        user.setRoleName("小杰");
        user.setRoleId(11);
        JSONObject json = new JSONObject();
        json.put("name","杰森");
        json.put("username",user.getRoleName());
        json.put("role",user.getRoleId());
        System.out.println(json);
        return json.toString();
    }

    @RequestMapping("/testThis")
    @ResponseBody
    public void testThis(@RequestParam(value = "upfile", required = false) MultipartFile file) throws IOException {

    }

    @RequestMapping(value = "upload",method = RequestMethod.GET)
    public void imageUpload(HttpServletRequest req, HttpServletResponse resp) {
        try {
            req.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        resp.setHeader("Content-Type","text/html");
        String rootPath = req.getSession().getServletContext().getRealPath("/");

        try {
            String exec = new ActionEnter(req,rootPath).exec();
            PrintWriter writer = resp.getWriter();
            writer.write(exec);
            writer.flush();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

/*    @ResponseBody
    @RequestMapping(value = "uploadimage",method = RequestMethod.POST)
    public Object uploadImage(@RequestParam(value = "upload",required = false)MultipartFile upload) throws IOException{
        Map<String,Object> path = new HashMap<String, Object>();

        if(!upload.isEmpty()) {
            String fileName = upload.getOriginalFilename();
            String newName = UUID.randomUUID().toString().replace("-", "") + ext;
            System.out.println("上传的文件原名称:" + fileName);
        }
    }*/
    @RequestMapping(value="/uploadImage",method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
        public void uploadFile(@RequestParam(value = "upfile",required = false)MultipartFile file,
                                     HttpServletRequest request, HttpServletResponse response) {

        JSONObject json = new JSONObject();
        String realName = null;
        String uuidName = null;
        String realPath = null;

        try {
            MyImage image = new MyImage();
            realName = file.getOriginalFilename();
            uuidName = this.getUUIDFileName(file.getOriginalFilename());
            realPath = request.getServletContext().getRealPath("/ueditor/jsp/upload/image/");/*"/ueditor/jsp/upload/image/"*/
            String rootPath = request.getSession().getServletContext().getRealPath("/");
            image.setName(realName);
            image.setUrl(rootPath);
            image.setUuidName(uuidName);

            InputStream in = new BufferedInputStream(file.getInputStream());
            OutputStream out = new BufferedOutputStream(new FileOutputStream(new File(realPath,uuidName)));
            IOUtils.copy(in,out);
            in.close();
            out.close();

            System.out.println(image);

            json.put("state","SUCCESS");
            json.put("url","/ueditor/jsp/upload/image/"+uuidName);
            json.put("title","");
            json.put("original","realName");

        } catch (IOException e) {
            json.put("state","FAILURE");
            json.put("url","");
            json.put("title","");
            json.put("original","");
            e.printStackTrace();
        }

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter writer= null;
        try {
            writer = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        assert writer != null;
        writer.write(json.toString());
        writer.close();

    }

    //下面是我的两个方法，取的uuidname防止文件同名问题
    private String getExtName(String s, char split) {
        int i = s.lastIndexOf(split);
        int leg = s.length();
        return i > 0 ? (i + 1) == leg ? " " : s.substring(i+1, s.length()) : " ";
    }

    private String getUUIDFileName(String fileName){
        UUID uuid = UUID.randomUUID();
        StringBuilder sb = new StringBuilder(100);
        sb.append(uuid.toString()).append(".").append(this.getExtName(fileName, '.'));
        return sb.toString();
    }



}
