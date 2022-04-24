package cn.edu.cqupt.service.impl;

import cn.edu.cqupt.dao.INewsDao;
import cn.edu.cqupt.domain.News;
import cn.edu.cqupt.service.INewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("news")
public class NewsServiceImpl implements INewsService {

    @Autowired
    private INewsDao iNewsDao;

    @Override
    public void PostNews(News news) {
        iNewsDao.insertNews(news);
    }

    @Override
    public List<News> showNewsTitles() {
        return iNewsDao.selectAllNewsTitle();
    }

    @Override
    public List<News> showNewsText(Integer newsId) {
        return iNewsDao.selectNewsAll(newsId);
    }

    @Override
    public List<News> showCountryNews() {
        List<News> news = iNewsDao.selectAllNewsTitleTop5();
        for (News n : news){
            n.setDateTime(n.getDateTime().substring(0,10));
        }
        return news;
    }

    @Override
    public List<News> showCityNews() {
        List<News> news = iNewsDao.selectAllNewsTitleBottom5();
        for (News n : news){
            n.setDateTime(n.getDateTime().substring(0,10));
        }
        return news;
    }

    @Override
    public List<News> show5NewsTitles(Integer pageId) {
        return iNewsDao.selectNewsTitleByPage((pageId - 1) * 5);
    }

    @Override
    public Integer countNews() {
        return iNewsDao.selectNewsCount();
    }
}
