package model.product;

import config.Config;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.DAO;

/**
 *
 * @author Yanna
 */
public class ProductDAO implements DAO<Product> {

    @Override
    public boolean insert(Product t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Product getOne(long id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Product> getAll() {
        List<Product> productList = new ArrayList<>();

        try {
            Class.forName(Config.JDBC_DRIVER);
            Connection c = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);
            PreparedStatement ps = c.prepareStatement("SELECT * FROM product"); // Executar a consulta SQL
            ResultSet rs = ps.executeQuery();
            // Processar os resultados
            while (rs.next()) {
                // Substitua os nomes de colunas pelos corretos da sua tabela
                long id = rs.getLong("id");
                String description = rs.getString("description");
                int amount = rs.getInt("amount");
                String picture = rs.getString("picture_path");
                double price = rs.getDouble("price");

                // Crie um objeto Product com os dados do banco de dados
                Product product = new Product(id, description, amount, picture, price, null);

                // Adicione o objeto à lista
                productList.add(product);
            }
            // Fechar recursos

        } catch (ClassNotFoundException | SQLException ex) {
            // Trate a exceção de forma apropriada para o seu aplicativo
            ex.printStackTrace();
        }
        return productList;
    }

    @Override
    public boolean update(Product t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(long id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public List<Product> getAllLastUnits() {
        List<Product> productList = new ArrayList<>();
        try {
            Class.forName(Config.JDBC_DRIVER);
            Connection c = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);
            PreparedStatement ps = c.prepareStatement("SELECT id, description, amount, picture_path, price FROM product WHERE amount <= 5");
            ResultSet rs = ps.executeQuery(); // Processar os resultados
            while (rs.next()) {
                // Substitua os nomes de colunas pelos corretos da sua tabela
                long id = rs.getLong("id");
                String description = rs.getString("description");
                int amount = rs.getInt("amount");
                String picture = rs.getString("picture_path");
                double price = rs.getDouble("price");

                // Crie um objeto Product com os dados do banco de dados
                Product product = new Product(id, description, amount, picture, price, null);

                // Adicione o objeto à lista
                productList.add(product);
            }
            // Fechar recursos

        } catch (ClassNotFoundException | SQLException ex) {
            // Trate a exceção de forma apropriada para o seu aplicativo
            ex.printStackTrace();
        }
        return productList;
    }

}
