/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.StatusAccountDao;
import entity.StatusAccount;
import java.util.List;

/**
 *
 * @author ThinkPro
 */
public class StatusAccountService implements MethodService<StatusAccount>{

    @Override
    public List<StatusAccount> getAll() {
        return new StatusAccountDao().getAll();
    }

    @Override
    public StatusAccount getOne(int id) {
        return new StatusAccountDao().getOne(id);
    }

    @Override
    public boolean add(StatusAccount object) {
        return new StatusAccountDao().add(object);
    }

    @Override
    public boolean update(StatusAccount object, int id) {
        return new StatusAccountDao().update(object, id);
    }

    @Override
    public boolean remove(int id) {
        return new StatusAccountDao().remove(id);
    }
    
}
