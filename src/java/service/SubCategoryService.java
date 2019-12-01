/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.SubCategoryDao;
import entity.SubCategory;
import java.util.List;

/**
 *
 * @author ThinkPro
 */
public class SubCategoryService implements MethodService<SubCategory>{

    @Override
    public List<SubCategory> getAll() {
        return new SubCategoryDao().getAll();
    }

    @Override
    public SubCategory getOne(int id) {
        return new SubCategoryDao().getOne(id);
    }

    @Override
    public boolean add(SubCategory object) {
        return new SubCategoryDao().add(object);
    }

    @Override
    public boolean update(SubCategory object, int id) {
        return new SubCategoryDao().update(object, id);
    }

    @Override
    public boolean remove(int id) {
        return new SubCategoryDao().remove(id);
    }
    
    public int countSubCategory() {
        return new SubCategoryDao().countSubCategory();
    }
    
    
    
}
