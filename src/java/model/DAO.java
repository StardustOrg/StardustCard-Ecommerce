/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author Yanna
 */
public interface DAO<T> {
    
    public boolean insert(T t);
    public T getOne(long id);
    public List<T> getAll();
    public boolean update(T t);
    public boolean delete(long id);
    
}
