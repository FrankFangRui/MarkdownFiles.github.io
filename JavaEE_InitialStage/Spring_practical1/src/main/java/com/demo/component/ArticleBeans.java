package com.demo.component;

import com.model.Article;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

/**
 * @author 方锐
 * @since 2023/4/26 16:43
 */
@Component
public class ArticleBeans {
    @Bean
    public Article getArticle1() {
        Article article = new Article();
        article.setId(1);
        article.setName("朝花夕拾");
        return article;
    }
    @Bean
    public Article getArticle2() {
        Article article = new Article();
        article.setId(2);
        article.setName("朝花夕拾2");
        return article;
    }
}
