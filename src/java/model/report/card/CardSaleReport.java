/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.report.card;

/**
 *
 * @author joaov
 */
public class CardSaleReport {

    private Double totalValue = 0.0;
    private Integer totalItems = 0;
    private Double averageValue = 0.0;

    public CardSaleReport() {
    }

    public CardSaleReport(Double totalValue, Integer totalItems, Double averageValue) {
        this.totalValue = totalValue;
        this.totalItems = totalItems;
        this.averageValue = averageValue;
    }

    public Double getTotalValue() {
        return totalValue;
    }

    public void setTotalValue(Double totalValue) {
        this.totalValue = totalValue;
    }

    public Integer getTotalItems() {
        return totalItems;
    }

    public void setTotalItems(Integer totalItems) {
        this.totalItems = totalItems;
    }

    public Double getAverageValue() {
        return averageValue;
    }

    public void setAverageValue(Double averageValue) {
        this.averageValue = averageValue;
    }

}
