package com.demo.controller;

import com.model.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

/**
 * @author 方锐
 * @since 2023/4/26 14:16
 */
@Controller
public class ArticleController {
    @Autowired
    @Qualifier("getArticle1")
    private Article article;

    public void creating() {
        System.out.println(article.toString());
    }

}

// 1）属性注入
//    @Autowired
//    private ArticleService articleService;
//
//    public Article getArticle(int id) {
//        return articleService.getArticle(id);
//    }
//    2）setter注入
//
//
//    //@Autowired
//    @Resource
//    public void setArticleService(ArticleService articleService) {
//        this.articleService = articleService;
//    }
//    3)构造方法注入
//    private ArticleService articleService;
//    @Resource
//    public ArticleController(ArticleService articleService) {
//        this.articleService = articleService;
//    }
//    @Autowired
//    private ArticleService getArticle1;
//
//
//    public Article getArticle(int id) {
//        return getArticle1.getArticle1(id);
//    }

//    @Bean(name="a1")
//    public Article article() {
//        Article article = new Article();
//        article.setId(1);
//        article.setName("朝花夕拾");
//        return article;
//    }
//属性注入这里不是Article，而是 ArticleService
//    @Autowired
//    private Article article;
//ArticleController 来获取 ArticleService，然后ArticleService，来获取Article对象