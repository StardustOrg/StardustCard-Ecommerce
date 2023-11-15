/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.user;

import config.Config;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import model.DAO;

/**
 *
 * @author Yanna
 */
public class UserDAO implements DAO<User> {

    public boolean validateAccess(String login, String password) {
        boolean success = false;
        try {
            Class.forName(Config.JDBC_DRIVER);
            Connection c = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);
            PreparedStatement ps = c.prepareStatement("SELECT * FROM stardust_user WHERE login = ? AND password = ?");
            ps.setString(1, login);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                success = true;
            }
            rs.close();
            ps.close();
            c.close();
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
            return false;
        }
        return success;
    }

    @Override
    public boolean insert(User t) {
        try {
            Class.forName(Config.JDBC_DRIVER);
            Connection c = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);
            PreparedStatement ps = c.prepareStatement("INSERT INTO stardust_user (login, email, admin, password, address, name) VALUES (?, ?, ?, ?, ?, ?)");

            // Define os valores para os parâmetros do PreparedStatement
            ps.setString(1, t.getLogin());
            ps.setString(2, t.getEmail());
            ps.setBoolean(3, false);
            ps.setString(4, t.getPassword());
            ps.setString(5, t.getAddress());
            ps.setString(6, t.getName());

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
    public User getOne(long id) {
        try {
            Class.forName(Config.JDBC_DRIVER);
            Connection c = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);
            PreparedStatement ps = c.prepareStatement("SELECT * FROM stardust_user WHERE id = ?");
            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();

            User user = null;
            if (rs.next()) {
                String login = rs.getString("login");
                String email = rs.getString("email");
                boolean admin = rs.getBoolean("admin");
                String password = rs.getString("password");
                String address = rs.getString("address");
                String name = rs.getString("name");

                user = new User(id, login, email, admin, address, name);
            }

            rs.close();
            ps.close();
            c.close();

            return user;
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }

    public User getOne(String login) {
        try {
            Class.forName(Config.JDBC_DRIVER);
            Connection c = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);
            PreparedStatement ps = c.prepareStatement("SELECT * FROM stardust_user WHERE login = ?");
            ps.setString(1, login);
            ResultSet rs = ps.executeQuery();

            User user = null;
            if (rs.next()) {
                String email = rs.getString("email");
                long id = rs.getLong("id");
                boolean admin = rs.getBoolean("admin");
                String password = rs.getString("password");
                String address = rs.getString("address");
                String name = rs.getString("name");

                user = new User(id, login, password, email, admin, address, name);
            }

            rs.close();
            ps.close();
            c.close();

            return user;
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }

    @Override
    public List<User> getAll() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean update(User t) {
        try {
            Class.forName(Config.JDBC_DRIVER);
            try (Connection c = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD); PreparedStatement ps = c.prepareStatement("UPDATE stardust_user SET email=?, address=?, name=? WHERE id=?")) {

                ps.setString(1, t.getEmail());
                ps.setString(2, t.getAddress());
                ps.setString(3, t.getName());
                ps.setLong(4, t.getId());

                int rowsAffected = ps.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
            return false;
        }
    }

    @Override
    public boolean delete(long id) {
        try {
            Class.forName(Config.JDBC_DRIVER);
            Connection c = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);
            PreparedStatement ps = c.prepareStatement("DELETE FROM stardust_user WHERE id=?");
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

}
