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
import java.sql.Statement;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

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
            c.setAutoCommit(false); // Desativar o commit automático

            PreparedStatement ps = c.prepareStatement("INSERT INTO product (description, amount, picture_path, price) VALUES (?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, t.getDescription());
            ps.setInt(2, t.getAmount());
            ps.setString(3, t.getPicture());
            ps.setDouble(4, t.getPrice());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    long productId = generatedKeys.getLong(1);
                    List<Artist> artists = t.getArtists();
                    String query = "INSERT INTO product_artist (product_id, artist_id) VALUES (?, ?)";
                    PreparedStatement psProductArtist = c.prepareStatement(query);

                    for (Artist artist : artists) {
                        psProductArtist.setLong(1, productId);
                        psProductArtist.setLong(2, artist.getId());
                        psProductArtist.addBatch(); // Adicionar a inserção do relacionamento à batch
                    }

                    psProductArtist.executeBatch(); // Executar a batch de inserção dos relacionamentos
                    psProductArtist.close();
                }
                generatedKeys.close();
                c.commit(); // Realizar commit da transação
            }

            ps.close();
            c.close();
            return rowsAffected > 0;

        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }

        return false;
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
            PreparedStatement ps = c.prepareStatement("SELECT pr.id, pr.description, pr.amount, pr.picture_path, pr.price, ar.id as artist_id, "
                    + "ar.name, ar.icon_url, ar.cover_url, ar.group_id "
                    + "FROM product AS pr "
                    + "JOIN product_artist AS pa ON pr.id = pa.product_id "
                    + "JOIN artist AS ar ON pa.artist_id = ar.id");
            ResultSet rs = ps.executeQuery();

            Map<Long, Product> productMap = new HashMap<>();

            while (rs.next()) {
                long productId = rs.getLong("id");

                // Verifica se o produto já está no mapa; se não estiver, cria um novo objeto Product
                Product product = productMap.getOrDefault(productId,
                        new Product(
                                productId,
                                rs.getString("description"),
                                rs.getInt("amount"),
                                rs.getString("picture_path"),
                                rs.getDouble("price"),
                                new ArrayList<>()
                        )
                );

                // Cria um objeto Artist para cada linha do resultado e adiciona à lista de artistas do produto
                Artist artist = new Artist(
                        rs.getLong("artist_id"),
                        rs.getString("name"),
                        rs.getString("icon_url"),
                        rs.getString("cover_url"),
                        rs.getLong("group_id")
                );
                product.getArtists().add(artist);

                // Atualiza o mapa com o produto atualizado
                productMap.put(productId, product);
            }

            // Adiciona os produtos do mapa à lista final
            productList.addAll(productMap.values());

            // Fechar recursos
            rs.close();
            ps.close();
            c.close();

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
        Connection c = null;
        PreparedStatement ps = null;
        try {
            Class.forName(Config.JDBC_DRIVER);
            c = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);
            c.setAutoCommit(false);

            // Atualizar os detalhes do produto na tabela product
            ps = c.prepareStatement("UPDATE product SET description = ?, amount = ?, picture_path = ?, price = ? WHERE id = ?");
            ps.setString(1, t.getDescription());
            ps.setInt(2, t.getAmount());
            ps.setString(3, t.getPicture());
            ps.setDouble(4, t.getPrice());
            ps.setLong(5, t.getId());

            int rowsAffectedProduct = ps.executeUpdate();

            // Deletar as entradas antigas na tabela product_artist
            ps = c.prepareStatement("DELETE FROM product_artist WHERE product_id = ?");
            ps.setLong(1, t.getId());
            ps.executeUpdate();

            // Inserir novas entradas na tabela product_artist para os artistas associados ao produto
            ps = c.prepareStatement("INSERT INTO product_artist (product_id, artist_id) VALUES (?, ?)");
            for (Artist artist : t.getArtists()) {
                ps.setLong(1, t.getId());
                ps.setLong(2, artist.getId());
                ps.addBatch();
            }
            int[] rowsAffectedProductArtist = ps.executeBatch();

            // Confirmar a transação se tudo ocorreu bem
            c.commit();

            // Fechar recursos
            if (ps != null) {
                ps.close();
            }
            if (c != null) {
                c.close();
            }

            return rowsAffectedProduct > 0 && Arrays.stream(rowsAffectedProductArtist).allMatch(count -> count > 0);
        } catch (ClassNotFoundException | SQLException ex) {
            try {
                // Em caso de exceção, realizar o rollback
                if (c != null) {
                    c.rollback();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            ex.printStackTrace();
            return false;
        }
    }

    //TESTAR
    @Override
    public boolean delete(long id) {
        Connection c = null;
        try {
            Class.forName(Config.JDBC_DRIVER);
            c = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);
            c.setAutoCommit(false);

            // Excluir as entradas da tabela product_artist relacionadas ao product_id
            PreparedStatement psDeleteProductArtist = c.prepareStatement("DELETE FROM product_artist WHERE product_id = ?");
            psDeleteProductArtist.setLong(1, id);
            psDeleteProductArtist.executeUpdate();

            // Excluir o produto da tabela product
            PreparedStatement psDeleteProduct = c.prepareStatement("DELETE FROM product WHERE id = ?");
            psDeleteProduct.setLong(1, id);
            int rowsAffected = psDeleteProduct.executeUpdate();

            c.commit();

            // Fechar recursos
            if (psDeleteProductArtist != null) {
                psDeleteProductArtist.close();
            }
            if (psDeleteProduct != null) {
                psDeleteProduct.close();
            }
            if (c != null) {
                c.close();
            }

            return rowsAffected > 0;
        } catch (ClassNotFoundException | SQLException ex) {
            try {
                // Em caso de exceção, realizar o rollback
                if (c != null) {
                    c.rollback();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            ex.printStackTrace();
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
