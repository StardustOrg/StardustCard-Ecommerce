/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.report;

import java.util.List;
import model.product.Product;
import model.user.User;

/**
 *
 * @author vladi
 */
public class Report {
    private List<User> clients;
    private List<Product> products;

    public Report(List<User> clients, List<Product> products) {
        this.clients = clients;
        this.products = products;
    }

    public List<User> getClients() {
        return clients;
    }

    public void setClients(List<User> clients) {
        this.clients = clients;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }
    
    
}
