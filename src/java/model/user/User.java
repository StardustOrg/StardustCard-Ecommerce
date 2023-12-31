/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.user;

/**
 *
 * @author Yanna
 */
public class User {

    private long id;
    private String login;
    private String password;
    private String email;
    private boolean admin;
    private String address;
    private String name;

    public User(long id, String login, String email, boolean admin, String address, String name) {
        this.id = id;
        this.login = login;
        this.email = email;
        this.admin = admin;
        this.address = address;
        this.name = name;
    }

    public User(long id, String login, String password, String email, boolean admin, String address, String name) {
        this.id = id;
        this.login = login;
        this.password = password;
        this.email = email;
        this.admin = admin;
        this.address = address;
        this.name = name;
    }

    public User(String login, String password, String email, boolean admin, String address, String name) {
        this.id = id;
        this.login = login;
        this.password = password;
        this.email = email;
        this.admin = admin;
        this.address = address;
        this.name = name;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
