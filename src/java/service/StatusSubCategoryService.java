/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.StatusSubCategoryDao;
import entity.StatusSubCategory;
import java.util.List;

/**
 *
 * @author ThinkPro
 */
public class StatusSubCategoryService implements MethodService<StatusSubCategory>{

    @Override
    public List<StatusSubCategory> getAll() {
        return new StatusSubCategoryDao().getAll();
    }

    @Override
    public StatusSubCategory getOne(int id) {
        return new StatusSubCategoryDao().getOne(id);
    }

    @Override
    public boolean add(StatusSubCategory object) {
        return new StatusSubCategoryDao().add(object);
    }

    @Override
    public boolean update(StatusSubCategory object, int id) {
        return new StatusSubCategoryDao().update(object, id);
    }

    @Override
    public boolean remove(int id) {
        return new StatusSubCategoryDao().remove(id);
    }
    
    
}
