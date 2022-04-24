package cn.edu.cqupt.service;

import cn.edu.cqupt.domain.News;

import java.util.List;

public interface INewsService {
    void PostNews(News news);
    List<News> showNewsTitles();
    List<News> showNewsText(Integer newsId);
    List<News> showCountryNews();
    List<News> showCityNews();
    List<News> show5NewsTitles(Integer pageId);
    Integer countNews();
}
