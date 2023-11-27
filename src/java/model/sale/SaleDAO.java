/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.sale;

import config.Config;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import model.DAO;
import model.product.Product;

/**
 *
 * @author João Victor
 */
public class SaleDAO implements DAO<Sale> {

    @Override
    public boolean insert(Sale sale) {
        try {
            Class.forName(Config.JDBC_DRIVER);
            Connection connection = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);
            connection.setAutoCommit(false);

            PreparedStatement saleStatement = connection.prepareStatement("INSERT INTO sale (user_id, date_time) VALUES (?, CURRENT_TIMESTAMP)", Statement.RETURN_GENERATED_KEYS);
            saleStatement.setLong(1, sale.getUserId());

            int rowsAffected = saleStatement.executeUpdate();
            long saleId = -1;

            if (rowsAffected > 0) {
                ResultSet generatedKeys = saleStatement.getGeneratedKeys();
                if (generatedKeys != null && generatedKeys.next()) {
                    saleId = generatedKeys.getLong(1); // Obtém o ID da venda gerado
                }
                if (generatedKeys != null) {
                    generatedKeys.close();
                }
            }

            saleStatement.close();

            if (saleId != -1) { // Se a inserção da venda foi bem-sucedida
                // Inserção dos produtos vendidos na tabela 'sale_product'
                PreparedStatement productStatement = connection.prepareStatement("INSERT INTO sale_product (sale_id, product_id, quantity) VALUES (?, ?, ?)");

                for (Product product : sale.getProduct()) {
                    productStatement.setLong(1, saleId);
                    productStatement.setLong(2, product.getId());
                    productStatement.setInt(3, product.getAmount());

                    productStatement.addBatch();
                }

                int[] productsRowsAffected = productStatement.executeBatch();
                productStatement.close();

                for (int rows : productsRowsAffected) {
                    if (rows <= 0) {
                        connection.rollback();
                        connection.close();
                        return false;
                    }
                }

                connection.commit();
                connection.close();
                return true;
            }

            connection.close();
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }

        return false;
    }

    @Override
    public Sale getOne(long id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Sale> getAll() {
        List<Sale> sales = new ArrayList<>();
        try {
            Class.forName(Config.JDBC_DRIVER);
            Connection connection = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);

            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM SALE");

            while (resultSet.next()) {
                long saleId = resultSet.getLong("id");
                long userId = resultSet.getLong("user_id");
                Timestamp dateTime = resultSet.getTimestamp("date_time");

                Sale sale = new Sale(saleId, dateTime, userId);
                sales.add(sale);
            }

            resultSet.close();
            statement.close();

            for (Sale sale : sales) {
                PreparedStatement productStatement = connection.prepareStatement(
                        "SELECT PR.DESCRIPTION, PR.PRICE, SP.QUANTITY "
                        + "FROM SALE AS S "
                        + "INNER JOIN SALE_PRODUCT AS SP ON S.ID = SP.SALE_ID "
                        + "INNER JOIN PRODUCT AS PR ON SP.PRODUCT_ID = PR.ID "
                        + "WHERE S.ID = ?");

                productStatement.setLong(1, sale.getId());
                ResultSet productResultSet = productStatement.executeQuery();

                List<Product> products = new ArrayList<>();
                while (productResultSet.next()) {
                    String description = productResultSet.getString("description");
                    double price = productResultSet.getDouble("price");
                    int quantity = productResultSet.getInt("quantity");

                    Product product = new Product(0, description, quantity, null, price, null);
                    products.add(product);
                }

                productResultSet.close();
                productStatement.close();

                sale.setProduct(products);
            }

            connection.close();
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }

        return sales;
    }

    @Override
    public boolean update(Sale t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(long id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
