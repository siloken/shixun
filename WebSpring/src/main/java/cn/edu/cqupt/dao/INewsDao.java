package cn.edu.cqupt.dao;

import cn.edu.cqupt.domain.News;

import java.util.List;

public interface INewsDao {
    void insertNews(News news);
    List<News> selectAllNewsTitle();
    List<News> selectNewsAll(Integer newsId);
    List<News> selectAllNewsTitleTop5();
    List<News> selectAllNewsTitleBottom5();
    List<News> selectNewsTitleByPage(Integer nodeNewsId);
    Integer selectNewsCount();
}
