package com.model;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

/**
 * @author 方锐
 * @since 2023/4/26 14:16
 */
@Component
public class Article {
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    private String name;
    private int id;

    public void create() {
        System.out.println("Article created");
    }

    @Override
    public String toString() {
        return "Article{" +
                "name='" + name + '\'' +
                ", id=" + id +
                '}';
    }
    //    public Article getArticle(int id) {
//        Article article = new Article();
//        article.setId(id);
//        article.setName("朝花夕拾");
//        return article;
//    }

}
