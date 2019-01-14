package com.itlike.service.impl;

import com.itlike.dao.CategoryDao;
import com.itlike.domian.Category;
import com.itlike.service.CategoryService;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public class CategoryServiceImpl implements CategoryService {

    private CategoryDao categoryDao;

    public void setCategoryDao(CategoryDao categoryDao) {
        this.categoryDao = categoryDao;
    }

    @Override
    public void save(Category category) {

        categoryDao.save(category);

    }

    @Override
    public List<Category> getAllCategory() {
        return categoryDao.getAllCategory();
    }

    @Override
    public Category getOneCategory(Integer cid) {
        return categoryDao.getOneCategory(cid);
    }

    @Override
    public void update(Category category) {
     categoryDao.update(category);
    }

    @Override
    public void delete(Category category) {

        categoryDao.delete(category);
    }
}
