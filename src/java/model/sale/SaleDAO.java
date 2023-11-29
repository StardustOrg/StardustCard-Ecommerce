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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.DAO;
import model.product.Product;

/**
 *
 * @author João Victor
 */
public class SaleDAO implements DAO<Sale> {

    @Override
    public boolean insert(Sale sale) {
        try (Connection connection = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD)) {
            connection.setAutoCommit(false);

            // Insert sale details
            try (PreparedStatement saleStatement = connection.prepareStatement("INSERT INTO sale (user_id, date_time) VALUES (?, CURRENT_TIMESTAMP)", Statement.RETURN_GENERATED_KEYS)) {
                saleStatement.setLong(1, sale.getUserId());

                int rowsAffected = saleStatement.executeUpdate();
                long saleId = -1;

                if (rowsAffected > 0) {
                    try (ResultSet generatedKeys = saleStatement.getGeneratedKeys()) {
                        if (generatedKeys != null && generatedKeys.next()) {
                            saleId = generatedKeys.getLong(1); // Obtain the generated sale ID
                        }
                    }
                }

                if (saleId == -1) {
                    connection.rollback();
                    return false;
                }

                // Insert sale products into the sale_product table
                try (PreparedStatement productStatement = connection.prepareStatement("INSERT INTO sale_product (sale_id, product_id, quantity) VALUES (?, ?, ?)")) {
                    for (Map.Entry<Product, Integer> entry : sale.getProducts().entrySet()) {
                        Product product = entry.getKey();
                        int quantity = entry.getValue();

                        productStatement.setLong(1, saleId);
                        productStatement.setLong(2, product.getId());
                        productStatement.setInt(3, quantity);

                        productStatement.addBatch();

                        // Update product quantity in the product table
                        try (PreparedStatement updateProductStatement = connection.prepareStatement("UPDATE product SET amount = amount - ? WHERE id = ?")) {
                            updateProductStatement.setInt(1, quantity);
                            updateProductStatement.setLong(2, product.getId());
                            updateProductStatement.executeUpdate();
                        }
                    }

                    int[] productsRowsAffected = productStatement.executeBatch();

                    for (int rows : productsRowsAffected) {
                        if (rows <= 0) {
                            connection.rollback();
                            return false;
                        }
                    }

                    connection.commit();
                    return true;
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
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
                        "SELECT PR.DESCRIPTION, PR.PRICE, PR.ID, PR.AMOUNT, SP.QUANTITY "
                        + "FROM SALE AS S "
                        + "INNER JOIN SALE_PRODUCT AS SP ON S.ID = SP.SALE_ID "
                        + "INNER JOIN PRODUCT AS PR ON SP.PRODUCT_ID = PR.ID "
                        + "WHERE S.ID = ?");

                productStatement.setLong(1, sale.getId());
                ResultSet productResultSet = productStatement.executeQuery();

                Map<Product, Integer> products = new HashMap<>();
                while (productResultSet.next()) {
                    String description = productResultSet.getString("description");
                    double price = productResultSet.getDouble("price");
                    int quantity = productResultSet.getInt("quantity");
                    int amount = productResultSet.getInt("amount");
                    long id = productResultSet.getLong("id");

                    Product product = new Product(id, description, amount, null, price, null);
                    products.put(product, quantity);
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
        try {
            Class.forName(Config.JDBC_DRIVER);
            Connection connection = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);
            connection.setAutoCommit(false);

            PreparedStatement deleteProductsStatement = connection.prepareStatement("DELETE FROM SALE_PRODUCT WHERE SALE_PRODUCT.SALE_ID = ?");
            deleteProductsStatement.setLong(1, id);
            int rowsAffectedInProducts = deleteProductsStatement.executeUpdate();
            deleteProductsStatement.close();

            PreparedStatement deleteSaleStatement = connection.prepareStatement("DELETE FROM SALE WHERE SALE.ID = ?");
            deleteSaleStatement.setLong(1, id);
            int rowsAffectedInSale = deleteSaleStatement.executeUpdate();
            deleteSaleStatement.close();

            if (rowsAffectedInProducts > 0 && rowsAffectedInSale > 0) {
                connection.commit();
                connection.close();
                return true;
            } else {
                connection.rollback(); 
                connection.close();
                return false;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
            return false;
        }
    }
}
