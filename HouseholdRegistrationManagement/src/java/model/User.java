/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
public class User {
    private int userId;
    private String fullName;
    private String email;
    private String password;
    private String role;
    private String address;

    public User() {
    }

    public User(int userId, String fullName, String email, String password, String role, String address) {
        this.userId = userId;
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.role = role;
        this.address = address;
    }
    

    public User(int userId, String fullName, String email, String role, String address) {
        this.userId = userId;
        this.fullName = fullName;
        this.email = email;
        this.role = role;
        this.address = address;
    }

    public User(String fullName, String email, String password, String role, String address) {
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.role = role;
        this.address = address;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
    
}


