package com.itlike.service;

import com.itlike.domian.Category;

import java.util.List;

public interface CategoryService {

   void save(Category category);

    List<Category> getAllCategory();

    Category getOneCategory(Integer cid);

    void update(Category category);

    void delete(Category category);
}
