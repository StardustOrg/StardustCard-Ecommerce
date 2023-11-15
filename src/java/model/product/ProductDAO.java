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
import model.artist.Artist;

/**
 *
 * @author Yanna
 */
public class ProductDAO implements DAO<Product> {

    //adicionar insert dos artistas
    @Override
    public boolean insert(Product t) {
        try {
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
        Product result = new Product();
        try {
            Class.forName(Config.JDBC_DRIVER);
            Connection c = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);

            // Fetch product information
            String productQuery = "SELECT id, description, amount, picture_path, price FROM product WHERE id = ?";
            System.out.println(productQuery);
            PreparedStatement productPs = c.prepareStatement(productQuery);
            productPs.setLong(1, id);
            ResultSet productRs = productPs.executeQuery();

            while (productRs.next()) {
                result.setId(id);
                result.setDescription(productRs.getString("description"));
                result.setAmount(productRs.getInt("amount"));
                result.setPicture(productRs.getString("picture_path"));
                result.setPrice(productRs.getDouble("price"));
            }

            // Fetch artists for the product
            String artistQuery = "SELECT a.id, a.name, a.icon_url, a.cover_url, a.group_id FROM artist a "
                    + "JOIN product_artist pa ON a.id = pa.artist_id "
                    + "WHERE pa.product_id = ?";
            System.out.println(artistQuery);
            PreparedStatement artistPs = c.prepareStatement(artistQuery);
            artistPs.setLong(1, id);
            ResultSet artistRs = artistPs.executeQuery();

            List<Artist> artists = new ArrayList<>();
            while (artistRs.next()) {
                Artist artist = new Artist();
                artist.setId(artistRs.getLong("id"));
                artist.setName(artistRs.getString("name"));
                artist.setIcon(artistRs.getString("icon_url"));
                artist.setCover(artistRs.getString("cover_url"));
                artist.setGroupId(artistRs.getLong("group_id"));
                artists.add(artist);
            }

            result.setArtists(artists);

            productRs.close();
            productPs.close();
            artistRs.close();
            artistPs.close();
            c.close();

        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
            return null;
        }
        return result;
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
            ex.printStackTrace();
        }
        return productList;
    }

    public List<Product> getAllInStock() {
        List<Product> productList = new ArrayList<>();

        try {
            Class.forName(Config.JDBC_DRIVER);
            Connection c = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);
            PreparedStatement ps = c.prepareStatement("SELECT * FROM product WHERE amount > 0"); // Executar a consulta SQL
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
            ex.printStackTrace();
        }
        return productList;
    }

    public List<Product> getAllInStock(long artistId) {
        List<Product> productList = new ArrayList<>();

        try {
            Class.forName(Config.JDBC_DRIVER);
            Connection c = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);

            // Use a subquery to filter products associated with the specified artistId
            String query = "SELECT * FROM product WHERE id IN (SELECT product_id FROM product_artist WHERE artist_id = ?) AND amount > 0";
            PreparedStatement ps = c.prepareStatement(query);
            ps.setLong(1, artistId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                long id = rs.getLong("id");
                String description = rs.getString("description");
                int amount = rs.getInt("amount");
                String picture = rs.getString("picture_path");
                double price = rs.getDouble("price");

                Product product = new Product(id, description, amount, picture, price, null);
                productList.add(product);
            }

            rs.close();
            ps.close();
            c.close();

        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
        return productList;
    }

    public List<Product> getRecommended(long notId) {
        List<Product> productList = new ArrayList<>();

        try {
            Class.forName(Config.JDBC_DRIVER);
            Connection c = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);
            PreparedStatement ps = c.prepareStatement("SELECT * FROM product WHERE amount > 0 AND id <> " + notId); // Executar a consulta SQL
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
            ex.printStackTrace();
        }
        return productList;
    }

    public List<Product> getAllFromArtist(long artistId) {
        List<Product> productList = new ArrayList<>();

        try {
            Class.forName(Config.JDBC_DRIVER);
            Connection c = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);

            // Use a subquery to filter products associated with the specified artistId
            String query = "SELECT * FROM product WHERE id IN (SELECT product_id FROM product_artist WHERE artist_id = ?)";
            PreparedStatement ps = c.prepareStatement(query);
            ps.setLong(1, artistId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                long id = rs.getLong("id");
                String description = rs.getString("description");
                int amount = rs.getInt("amount");
                String picture = rs.getString("picture_path");
                double price = rs.getDouble("price");

                Product product = new Product(id, description, amount, picture, price, null);
                productList.add(product);
            }

            rs.close();
            ps.close();
            c.close();

        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
        return productList;
    }

    //array de artistas
    @Override
    public boolean update(Product t) {
        try {
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
        try {
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
            PreparedStatement ps = c.prepareStatement("SELECT id, description, amount, picture_path, price FROM product WHERE amount <= 5 AND amount > 0");
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

    public List<Product> getAllLastUnits(long artistId) {
        List<Product> productList = new ArrayList<>();

        try {
            Class.forName(Config.JDBC_DRIVER);
            Connection c = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);

            // Use a subquery to filter products associated with the specified artistId
            String query = "SELECT id, description, amount, picture_path, price "
                    + "FROM product "
                    + "WHERE id IN (SELECT product_id FROM product_artist WHERE artist_id = ?) "
                    + "AND amount <= 5 AND amount > 0";
            PreparedStatement ps = c.prepareStatement(query);
            ps.setLong(1, artistId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                long id = rs.getLong("id");
                String description = rs.getString("description");
                int amount = rs.getInt("amount");
                String picture = rs.getString("picture_path");
                double price = rs.getDouble("price");

                Product product = new Product(id, description, amount, picture, price, null);
                productList.add(product);
            }

            rs.close();
            ps.close();
            c.close();

        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
        return productList;
    }

}
