package model.sale;

import java.time.LocalDateTime;
import java.util.Map;
import model.product.Product;

/**
 *
 * @author Yanna
 */
public class Sale {

    private long id;
    private LocalDateTime date;
    private long userId;
    private Map<Product, Integer> products;

    public Sale(long id, LocalDateTime date, long userId) {
        this.id = id;
        this.date = date;
        this.userId = userId;
    }
    
    public Sale(LocalDateTime date, long userId) {
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

    public Map<Product, Integer> getProducts() {
        return products;
    }

    public void setProduct(Map<Product, Integer> products) {
        this.products = products;
    }
    
}
