/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.ThongkeOrder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import jdbc.SQLConnection;

/**
 *
 * @author ThinkPro
 */
public class ThongKeOrderDao {
    public List<ThongkeOrder> getAll() {
        String sql = "SELECT DAY(create_date) AS [day],DATENAME(dw,create_date) AS [weekday],COUNT(create_date)AS numOfOrder,SUM(total_price) AS totalMoney FROM dbo.[order] WHERE Day(GETDATE())-Day(create_date)<7 GROUP BY create_date,DAY(create_date)";
        List<ThongkeOrder> list = new ArrayList<>();
        try (Connection con = SQLConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(sql) : null;) {
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            while (rs != null && rs.next()) {
                ThongkeOrder thongkeOrder = ThongkeOrder.builder()
                        .day(rs.getInt(1))
                        .thu(rs.getString(2))
                        .numOfOrder(rs.getInt(3))
                        .totalMoney(rs.getDouble(4))
                        .build();
                list.add(thongkeOrder);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }
}
