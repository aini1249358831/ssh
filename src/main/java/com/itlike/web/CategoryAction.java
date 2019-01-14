package com.itlike.web;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.itlike.domian.Category;
import com.itlike.service.CategoryService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import jdk.nashorn.internal.scripts.JS;
import org.apache.struts2.ServletActionContext;

import java.io.IOException;
import java.util.List;

public class CategoryAction extends ActionSupport implements ModelDriven<Category>{
    private  Category category =  new Category();
    @Override
    public Category getModel() {
        return category;
    }

    //注入业务层
    private CategoryService categoryService;
    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;

    }
    /*登录*/
    public String add(){
        System.out.println("添加分类");
        System.out.println(category);
        //登录业务逻辑
        categoryService.save(category);

        return null;


    }
    public String list(){
        List<Category> list = categoryService.getAllCategory();
        System.out.println(list);
        ActionContext.getContext().getValueStack().set("categorylist",list);


        return "list";
    }
    public String updateUI() throws IOException {
        System.out.println(this.category.getCid());
        Category oneCategory = categoryService.getOneCategory(category.getCid());
        System.out.println(oneCategory);
    //把查询出来的数据以json数据的形式返回给客户端
        JSONArray jsonObject = new JSONArray();
        jsonObject.add(oneCategory);
        System.out.println(jsonObject);
        //将json打印到页面
        ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
        ServletActionContext.getResponse().getWriter().println(jsonObject.toJSONString());
        return null;

    }
    public String update(){
        System.out.println(this.category);
        categoryService.update(category);

        return "listAction";
    }
    public String delete(){

        System.out.println("删除");
        categoryService.delete(category);
        return "listAction";

    }

}
