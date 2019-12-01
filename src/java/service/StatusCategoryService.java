/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.StatusCategoryDao;
import entity.StatusCategory;
import java.util.List;

/**
 *
 * @author ThinkPro
 */
public class StatusCategoryService implements MethodService<StatusCategory>{

    @Override
    public List<StatusCategory> getAll() {
        return new StatusCategoryDao().getAll();
    }

    @Override
    public StatusCategory getOne(int id) {
        return new StatusCategoryDao().getOne(id);
    }

    @Override
    public boolean add(StatusCategory object) {
        return new StatusCategoryDao().add(object);
    }

    @Override
    public boolean update(StatusCategory object, int id) {
        return new StatusCategoryDao().update(object, id);
    }

    @Override
    public boolean remove(int id) {
        return new StatusCategoryDao().remove(id);
    }
    
    
}
