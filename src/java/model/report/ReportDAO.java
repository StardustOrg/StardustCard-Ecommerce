/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.report;

import config.Config;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.DAO;
import model.artist.Artist;
import model.user.User;

/**
 *
 * @author vladi
 */
public class ReportDAO implements DAO<Report>{

    @Override
    public boolean insert(Report t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Report getOne(long id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Report> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean update(Report t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(long id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    
    public List<Map<String, Object>> getClientReport(int timeInterval) {
    List<Map<String, Object>> clients = new ArrayList<>();

        try{
            Class.forName(Config.JDBC_DRIVER);
            Connection c = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);
            Statement stmt = c.createStatement();

            String query = "SELECT client.id,client.name, COUNT(sale.user_id) AS sales_amount" +
                    "FROM stardust_user AS client" +
                    "LEFT JOIN sale ON client.id = sale.user_id" +
                    "WHERE sale.date_time >= CURRENT_DATE - INTERVAL '"+timeInterval
                    +"' DAY" + "GROUP BY client.id, client.name;";
            ResultSet rs = stmt.executeQuery(query);
            
            
            while(rs.next()){
            long id = rs.getLong("id");
            String name = rs.getString("name");
            int salesAmount = rs.getInt("sales_amount");

            Map<String, Object> clientMap = new HashMap<>();
            clientMap.put("id", id);
            clientMap.put("name", name);
            clientMap.put("salesAmount", salesAmount);
            clients.add(clientMap);
            }
            
            rs.close();
            stmt.close();
            c.close();
            
        }catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
        return clients;
        
    }

}
