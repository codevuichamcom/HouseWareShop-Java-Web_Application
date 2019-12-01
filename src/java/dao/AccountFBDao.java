/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.AccountFB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import jdbc.SQLConnection;

/**
 *
 * @author ThinkPro
 */
public class AccountFBDao implements MethodDao<AccountFB> {

    @Override
    public List<AccountFB> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public AccountFB getOne(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean add(AccountFB obj) {
        String query = "INSERT INTO [dbo].[AccountFB]\n"
                + "           ([id]\n"
                + "           ,[displayName]\n"
                + "           ,[role_id]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        int check = 0;
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, obj.getId());
                ps.setObject(2, obj.getDisplayName());
                ps.setObject(3, obj.getRoleId());
                ps.setObject(4, obj.getStatus());
                check = ps.executeUpdate();
            }
        } catch (SQLException e) {
//            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    @Override
    public boolean update(AccountFB object, int id) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean remove(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
