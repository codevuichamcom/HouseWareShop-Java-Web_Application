/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.CategoryDao;
import dao.MethodDao;
import entity.Category;
import java.util.List;

/**
 *
 * @author ThinkPro
 */
public class CategoryService implements MethodService<Category>{
    MethodDao<Category> md = new CategoryDao();
    /**
     * 
     * @inheritDoc
     */
    @Override
    public List<Category> getAll() {
        return md.getAll();
    }

    @Override
    public Category getOne(int id) {
        return md.getOne(id);
    }

    @Override
    public boolean add(Category object) {
        return md.add(object);
    }

    @Override
    public boolean update(Category object, int id) {
        return md.update(object, id);
    }

    @Override
    public boolean remove(int id) {
        return md.remove(id);
    }
    
}
