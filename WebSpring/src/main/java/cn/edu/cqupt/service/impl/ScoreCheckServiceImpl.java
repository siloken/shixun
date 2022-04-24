package cn.edu.cqupt.service.impl;

import cn.edu.cqupt.dao.ITranscriptDao;
import cn.edu.cqupt.domain.Transcript;
import cn.edu.cqupt.service.ITranscriptService;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service("transcript")
public class ScoreCheckServiceImpl implements ITranscriptService {

    @Autowired
    private ITranscriptDao iTranscriptDao;

    @Override
    public Transcript checkTranscript(String idCard,String examineeId) {
        return iTranscriptDao.selectScoreByExaminee(idCard,examineeId);
    }

    @Override
    public void postTranscript(MultipartFile file, String rootPath) throws IOException {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSS");
        String res = sdf.format(new Date());
        // 原始名称
        String originalFileName = file.getOriginalFilename();
        // 新文件名
        assert originalFileName != null;
        String newFileName = "tran" + res + originalFileName.substring(originalFileName.lastIndexOf("."));
        // 创建年月文件夹
        Calendar date = Calendar.getInstance();
        File dateDirs = new File(date.get(Calendar.YEAR) + File.separator + (date.get(Calendar.MONTH) + 1));

        // 新文件
        File newFile = new File(rootPath + File.separator + dateDirs + File.separator + newFileName);
        // 判断目标文件所在目录是否存在
        if (!newFile.getParentFile().exists()) {
            // 如果目标文件所在的目录不存在，则创建父目录
            System.out.println(newFile.getParentFile().mkdirs());
        }

        // 将内存中的数据写入磁盘
        file.transferTo(newFile);


        InputStream stream = new FileInputStream(newFile);
        Workbook workbook = new XSSFWorkbook(stream);

        Sheet sheet = workbook.getSheetAt(0);

        Row row;
        Cell cell;
        Transcript tran;
        List<Transcript> trans = new ArrayList<>();

        int j;
        for (int i = 1; true; i++) {
            tran = new Transcript();
            row = sheet.getRow(i);
            if (row != null) {
                j=0;
                tran.setExamName(row.getCell(j).getStringCellValue());

                cell = row.getCell(++j);
                cell.setCellType(CellType.STRING);
                tran.setExamineeId(cell.getStringCellValue());

                tran.setExamineeName(row.getCell(++j).getStringCellValue());

                double d = row.getCell(++j).getNumericCellValue();
                Integer n = (int) d;
                tran.setScore(n);

                cell = row.getCell(++j);
                cell.setCellType(CellType.STRING);
                tran.setIdCard(cell.getStringCellValue());

                trans.add(tran);
            } else {
                break;
            }
        }

        iTranscriptDao.insertTranscript(trans);

    }
}
