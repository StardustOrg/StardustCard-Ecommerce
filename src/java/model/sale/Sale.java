/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.sale;

import java.time.LocalDateTime;
import java.util.List;
import model.product.Product;

/**
 *
 * @author Yanna
 */
public class Sale {

    private long id;
    private LocalDateTime date;
    private long userId;
    private List<Product> product;

    public Sale(long id, LocalDateTime date, long userId) {
        this.id = id;
        this.date = date;
        this.userId = userId;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }
    

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public List<Product> getProduct() {
        return product;
    }

    public void setProduct(List<Product> product) {
        this.product = product;
    }
    
}
