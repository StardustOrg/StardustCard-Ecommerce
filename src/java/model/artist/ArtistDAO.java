/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.artist;

import config.Config;
import java.util.List;
import model.DAO;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author Yanna
 */
public class ArtistDAO implements DAO<Artist> {

    @Override
    public boolean insert(Artist t) {
        try {
            Class.forName(Config.JDBC_DRIVER);
            Connection c = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);
            PreparedStatement ps = c.prepareStatement("INSERT INTO artist (name, icon_url, cover_url, group_id) VALUES (?, ?, ?, ?)");

            ps.setString(1, t.getName());
            ps.setString(2, t.getIcon());
            ps.setString(3, t.getCover());
            ps.setLong(4, t.getGroupId());

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
    public Artist getOne(long id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public List<Artist> getAllIdols(long group_id) {
        List<Artist> artists = new ArrayList<>();
        try {
            Class.forName(Config.JDBC_DRIVER);
            Connection c = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);
            Statement stmt = c.createStatement();

            String query = "SELECT id, name, icon_url, cover_url, group_id FROM artist WHERE group_id = " + group_id;
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                long id = rs.getLong("id");
                String name = rs.getString("name");
                String iconURL = rs.getString("icon_url");
                String coverURL = rs.getString("cover_url");
                long groupId = rs.getLong("group_id");

                Artist artist = new Artist(id, name, iconURL, coverURL, groupId);
                artists.add(artist);
            }

            rs.close();
            stmt.close();
            c.close();
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
        return artists;
    }

    @Override
    public List<Artist> getAll() {
        List<Artist> artists = new ArrayList<>();

        try {
            Class.forName(Config.JDBC_DRIVER);
            Connection c = DriverManager.getConnection(Config.JDBC_URL, Config.USER, Config.PASSWORD);
            Statement stmt = c.createStatement();

            String query = "SELECT id, name, icon_url, cover_url, group_id FROM artist";
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                long id = rs.getLong("id");
                String name = rs.getString("name");
                String iconURL = rs.getString("icon_url");
                String coverURL = rs.getString("cover_url");
                long groupId = rs.getLong("group_id");

                Artist artist = new Artist(id, name, iconURL, coverURL, groupId);
                artists.add(artist);
            }

            rs.close();
            stmt.close();
            c.close();
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
        
        return artists;
    }

    @Override
    public boolean update(Artist t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(long id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
