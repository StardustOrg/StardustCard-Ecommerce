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

    //adicionar insert dos artistas
    @Override
    public boolean insert(Product t) {
        try{
        Class.forName(Config.JDBC_DRIVER);
            Connection c = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);
            PreparedStatement ps = c.prepareStatement("INSERT INTO product (description, amount, picture_path, price) VALUES (?, ?, ?, ?)");

            ps.setString(1, t.getDescription());
            ps.setInt(2, t.getAmount());
            ps.setString(3, t.getPicture());
            ps.setDouble(4, t.getPrice());
            
            int rowsAffected = ps.executeUpdate();

            ps.close();
            c.close();

            return rowsAffected > 0;
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
            return false;
        }


    }

    //adicionar forma de pegar o array de artistas
    @Override
    public Product getOne(long id) {
        return null;
        /*Product result = new Product();
        try{
            Class.forName(Config.JDBC_DRIVER);
            Connection c = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);
            Statement stmt = c.createStatement();

            String query = "SELECT id, descripton, amount, picture_path, "
                    + "price FROM product WHERE id = " + id;
            ResultSet rs = stmt.executeQuery(query);
            
            while (rs.next()) {
                result.setDescription(rs.getString("descreption"));
                result.setAmount(rs.getInt("amount"));
                result.setPicture(rs.getString("picture_path"));
                result.setPrice(rs.getInt("price"));  

            }
            
        
        
            rs.close();
            stmt.close();
            c.close();
            
            return result;

        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }

*/
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
                Product product = new Product(id, description, amount, picture, price, null)

                // Adicione o objeto à lista
                productList.add(product);
            }
            // Fechar recursos

        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
        return productList;
    }

    
    //array de artistas
    @Override
    public boolean update(Product t) {
        try{
            Class.forName(Config.JDBC_DRIVER);
            Connection c = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);
            PreparedStatement ps = c.prepareStatement("UPDATE product "
                    + "SET description = ?, amount = ?, picture_path = ?, "
                    + "price = ? WHERE id = ?");
            
            ps.setString(1, t.getDescription());
            ps.setInt(2, t.getAmount());
            ps.setString(3, t.getPicture());
            ps.setDouble(4, t.getPrice());
            
        int rowsAffected = ps.executeUpdate();

            ps.close();
            c.close();

            return rowsAffected > 0;
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
            return false;
        }



    }

    
    //TESTAR
    @Override
    public boolean delete(long id) {
        try{
            Class.forName(Config.JDBC_DRIVER);
            Connection c = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);
            PreparedStatement ps = c.prepareStatement("DELETE FROM product WHERE id=?");
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
