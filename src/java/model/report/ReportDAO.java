/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.report;

import config.Config;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.DAO;
import model.product.Product;

/**
 *
 * @author vladi
 */
public class ReportDAO implements DAO<Report> {

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

    public List<SaleReport> getClientSalesReport() {
        List<SaleReport> reports = new ArrayList<>();
        String query = """
                       SELECT su.id AS customer_id, su.name AS customer_name, COUNT(s.id) AS total_purchases
                       FROM stardust_user AS su
                       JOIN sale AS s ON su.id = s.user_id
                       WHERE s.date_time >= CURRENT_DATE - INTERVAL '30' DAY
                       GROUP BY su.id, su.name
                       ORDER BY total_purchases DESC
                       """;

        try (Connection c = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD); PreparedStatement pstmt = c.prepareStatement(query)) {
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                long id = rs.getLong("customer_id");
                String name = rs.getString("customer_name");
                int salesAmount = rs.getInt("total_purchases");

                reports.add(new SaleReport(id, name, salesAmount));
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return reports;
    }

    public List<Product> getNoStockProducts() {
        List<Product> noStockProducts = new ArrayList<>();
        try {
            Class.forName(Config.JDBC_DRIVER);
            Connection c = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);
            PreparedStatement ps = c.prepareStatement("SELECT id, description,"
                    + "amount, price FROM product WHERE amount <= 0");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                long id = rs.getLong("id");
                String description = rs.getString("description");
                int amount = rs.getInt("amount");
                double price = rs.getDouble("price");

                Product product = new Product(id, description, amount, null, price, null);

                noStockProducts.add(product);
            }

        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
        return noStockProducts;

    }
}
