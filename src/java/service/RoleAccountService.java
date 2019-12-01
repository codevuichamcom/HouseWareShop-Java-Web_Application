/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.RoleAccountDao;
import entity.RoleAccount;
import java.util.List;

/**
 *
 * @author ThinkPro
 */
public class RoleAccountService implements MethodService<RoleAccount>{

    @Override
    public List<RoleAccount> getAll() {
        return new RoleAccountDao().getAll();
    }

    @Override
    public RoleAccount getOne(int id) {
        return new RoleAccountDao().getOne(id);
    }

    @Override
    public boolean add(RoleAccount object) {
        return new RoleAccountDao().add(object);
    }

    @Override
    public boolean update(RoleAccount object, int id) {
        return new RoleAccountDao().update(object, id);
    }

    @Override
    public boolean remove(int id) {
        return new RoleAccountDao().remove(id);
    }
    
}
