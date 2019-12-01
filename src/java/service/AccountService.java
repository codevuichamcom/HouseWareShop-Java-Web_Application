/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.AccountDao;
import entity.Account;
import java.util.List;

/**
 *
 * @author ThinkPro
 */
public class AccountService implements MethodService<Account>{

    @Override
    public List<Account> getAll() {
        return new AccountDao().getAll();
    }

    @Override
    public Account getOne(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public Account getOne(String userName) {
        return new AccountDao().getOne(userName);
    }
    @Override
    public boolean add(Account object) {
        return new AccountDao().add(object);
    }

    @Override
    public boolean update(Account object, int id) {
        return new AccountDao().update(object, id);
    }

    @Override
    public boolean remove(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    public Account getOneByEmail(String email) {
        return new AccountDao().getOneByEmail(email);
    }
    public boolean update(Account object, String username) {
        return new AccountDao().update(object, username);
    }
    
    public int countAccount() {
        return new AccountDao().countAccount();
    }
    public boolean updateStatus(String username,int status) {
        return new AccountDao().updateStatus(username, status);
    }
    public boolean removebyUser(String user){
        return new AccountDao().removebyUser(user);
    }
        
}
