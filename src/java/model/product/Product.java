/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.product;

import java.util.List;
import model.artist.Artist;

/**
 *
 * @author Yanna
 */
public class Product {

    private long id;
    private String description;
    private int amount;
    private String picture;
    private double price;
    private List<Artist> artists;

    public Product(long id, String description, int amount, String picture, double price, List<Artist> artists) {
        this.id = id;
        this.description = description;
        this.amount = amount;
        this.picture = picture;
        this.price = price;
        this.artists = artists;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public List<Artist> getArtists() {
        return artists;
    }
    
    public void addCategory(Artist category) {
        this.artists.add(category);
    }

}
