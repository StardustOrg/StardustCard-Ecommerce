/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.sale;

import config.Config;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.List;
import model.DAO;

/**
 *
 * @author Yanna
 */
public class SaleDAO implements DAO<Sale> {

    @Override
    public boolean insert(Sale t) {
        try{
            Class.forName(Config.JDBC_DRIVER);
            Connection c = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);
            PreparedStatement ps = c.prepareStatement("INSERT INTO sales (user_id, date_time, "
                    + "cover_url, group_id) VALUES (?, ?)");
            
            ps.setLong(1, t.getUserId());
            ps.setDate(2, (Date) t.convertDate(t.getDate()));
        
        }catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
        return false;

    }

    @Override
    public Sale getOne(long id) {
        
        Sale sale = null;

        try{
            Class.forName(Config.JDBC_DRIVER);
            Connection c = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);
            Statement stmt = c.createStatement();

            PreparedStatement ps = c.prepareStatement("SELECT id, user_id, date_time,FROM sales WHERE id = ? ");
            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();

            
            while (rs.next()) {
                
                Long userId = rs.getLong("user_id");
                Date date = rs.getDate("date_time");
                
                java.sql.Date sqlDate = date;
                LocalDateTime dateConverted = sqlDate.toLocalDate().atStartOfDay();
                
                sale = new Sale(id, dateConverted, userId);

                
            }
            rs.close();
            stmt.close();
            c.close();
            
        }catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
        
        return sale;
    }

    @Override
    public List<Sale> getAll() {
        return null;
    }

    @Override
    public boolean delete(long id) {
        try {
            Class.forName(Config.JDBC_DRIVER);
            Connection c = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);
            PreparedStatement ps = c.prepareStatement("DELETE FROM sale WHERE id = ?");

            ps.setLong(1, id);

            int rowsAffected = ps.executeUpdate();

            ps.close();
            c.close();

            return rowsAffected > 0;
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
            return false;
        }

    }

    @Override
    public boolean update(Sale t) {
        return false;
    }
    
}
