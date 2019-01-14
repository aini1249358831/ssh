package com.itlike.dao;

import com.itlike.domian.Category;

import java.util.List;

public interface CategoryDao {
    void save(Category category);

    List<Category> getAllCategory();

    Category getOneCategory(Integer cid);

    void update(Category category);

    void delete(Category category);
}
