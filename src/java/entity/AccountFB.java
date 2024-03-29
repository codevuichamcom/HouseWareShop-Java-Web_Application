/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jdbc.SQLConnection;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author ThinkPro
 */
@Getter
@Setter
@Builder
@ToString
public class AccountFB {
    private String id;
    private String displayName;
    private String createDate;
    private int roleId;
    private int status;
    
    public RoleAccount getRole(int id) {
        String query = "SELECT * FROM dbo.role_Account WHERE code =?";
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, this.roleId);
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    RoleAccount roleAccount = RoleAccount.builder()
                            .code(rs.getInt(1))
                            .role(rs.getString(2))
                            .build();
                    return roleAccount;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }
    
    public StatusAccount getStatus(int id) {
        String query = "SELECT * FROM dbo.status_Account WHERE code =?";
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, this.status);
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    StatusAccount statusAccount = StatusAccount.builder()
                            .code(rs.getInt(1))
                            .status(rs.getString(2))
                            .build();
                    return statusAccount;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }
}
