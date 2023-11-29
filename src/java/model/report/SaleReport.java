/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.report;

/**
 *
 * @author joaov
 */
public class SaleReport {

    private long customerId;
    private String customerName;
    private int totalPurchases;

    public SaleReport() {
    }

    public SaleReport(long customerId, String customerName, int totalPurchases) {
        this.customerId = customerId;
        this.customerName = customerName;
        this.totalPurchases = totalPurchases;
    }

    public long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(long customerId) {
        this.customerId = customerId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public int getTotalPurchases() {
        return totalPurchases;
    }

    public void setTotalPurchases(int totalPurchases) {
        this.totalPurchases = totalPurchases;
    }

    @Override
    public String toString() {
        return "ID: " + this.getCustomerId() + ", NAME: " + this.getCustomerName() + ", TOTAL PURCHASES: " + this.getTotalPurchases();
    }

}
