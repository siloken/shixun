import org.junit.Test;

import javax.servlet.ServletException;
import java.io.*;

/*@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/spring-context.xml","classpath:spring/spring-mvc.xml"})*/
public class JdbcTest {

/*    @Autowired
    LoginController controller;*/
    private int sumLines = 0;

    @Test
    public void AnythingTest() throws IOException, ServletException {

        String[] rootPath = {"D:\\WebSpring\\src\\main\\java", "D:\\WebSpring\\src\\main\\resources\\mapper"};
        for (String p : rootPath){
            File file = new File(p);
            count(file);
        }

        System.out.println(sumLines);
    }

    public void count(File file) throws FileNotFoundException {

        File[] files = file.listFiles();
        if (files != null) {
            for (File f:files){
                if (f.isFile()){
                    BufferedReader br = new BufferedReader(new FileReader(f));
                    sumLines += br.lines().count();
                }
                if (f.isDirectory()){
                    count(f);
                }
            }
        }
    }
}
