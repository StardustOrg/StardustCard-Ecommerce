/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.report.card;

import config.Config;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.List;
import model.DAO;

/**
 *
 * @author joaov
 */
public class CardReportDAO implements DAO<CardReport> {

    public String dailyBilling() {
        try {
            String query = "SELECT SUM(sp.quantity * pr.price) AS total_vendido_no_dia "
                    + "FROM sale AS s "
                    + "INNER JOIN sale_product AS sp ON s.id = sp.sale_id "
                    + "INNER JOIN product AS pr ON sp.product_id = pr.id "
                    + "WHERE DATE(s.date_time) = CURRENT_DATE";

            DecimalFormat df = new DecimalFormat("#,##0.00");
            String formattedAmount = "$0.00";

            Class.forName(Config.JDBC_DRIVER);
            java.sql.Connection c = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);
            PreparedStatement ps = c.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                double totalBilling = rs.getDouble("total_vendido_no_dia");
                formattedAmount = "R$ " + df.format(totalBilling);
            }

            rs.close();
            ps.close();
            c.close();

            return formattedAmount;

        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }

    public String trendingPhotocard() {
        try {
            String query = """
                           SELECT pr.description
                           FROM sale AS s
                           JOIN sale_product AS sp ON s.id = sp.sale_id
                           JOIN product AS pr ON sp.product_id = pr.id
                           WHERE s.date_time >= CURRENT_DATE - INTERVAL '30' DAY
                           GROUP BY pr.id, pr.description
                           ORDER BY SUM (sp.quantity) DESC
                           LIMIT 1;
                           """;

            Class.forName(Config.JDBC_DRIVER);
            java.sql.Connection c = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);
            PreparedStatement ps = c.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            String trendingPhotocard = null;
            if (rs.next()) {
                trendingPhotocard = rs.getString("description");
            }

            rs.close();
            ps.close();
            c.close();

            return trendingPhotocard;

        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }

    public String trendingArtist() {
        try {
            String query = """
                           SELECT ar.name
                           FROM sale AS s
                           JOIN sale_product AS sp ON s.id = sp.sale_id
                           JOIN product AS pr ON sp.product_id = pr.id
                           JOIN product_artist AS pa ON pr.id = pa.product_id
                           JOIN artist AS ar ON pa.artist_id = ar.id
                           WHERE s.date_time >= CURRENT_DATE - INTERVAL '30' DAY
                           GROUP BY ar.name
                           ORDER BY COUNT (ar.name) DESC
                           LIMIT 1;
                           """;

            Class.forName(Config.JDBC_DRIVER);
            java.sql.Connection c = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);
            PreparedStatement ps = c.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            String trendingArtist = null;
            if (rs.next()) {
                trendingArtist = rs.getString("name");
            }

            rs.close();
            ps.close();
            c.close();

            return trendingArtist;

        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }

    public CardSaleReport salesReport() {
        try {
            String query = """
                         SELECT SUM (sp.quantity * pr.price) AS total_value,
                                  SUM (sp.quantity) AS total_items,
                                  AVG (sp.quantity * pr.price) AS average_value
                           FROM sale AS s
                           JOIN sale_product AS sp ON s.id = sp.sale_id
                           JOIN product AS pr ON sp.product_id = pr.id
                           JOIN product_artist AS pa ON pr.id = pa.product_id
                           JOIN artist AS ar ON pa.artist_id = ar.id
                           WHERE s.date_time >= CURRENT_DATE - INTERVAL '30' DAY;
                           """;

            Class.forName(Config.JDBC_DRIVER);
            java.sql.Connection c = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);
            PreparedStatement ps = c.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            Double totalValue = 0.0;
            Integer totalItems = 0;
            Double averageValue = 0.0;
            
            if (rs.next()) {
                totalValue = rs.getDouble("total_value");
                totalItems = rs.getInt("total_items");
                averageValue = rs.getDouble("average_value");
            }

            rs.close();
            ps.close();
            c.close();

            return new CardSaleReport(totalValue, totalItems, averageValue);

        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }

    @Override
    public boolean insert(CardReport t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public CardReport getOne(long id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<CardReport> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean update(CardReport t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(long id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
