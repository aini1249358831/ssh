package com.itlike.domian;

import lombok.Getter;
import lombok.Setter;

@Getter@Setter
public class Article {
    private Integer article_id;
    private String article_title;
    private Integer article_time;
    private String article_content;
    private String article_pic;
    private Category category;
}
