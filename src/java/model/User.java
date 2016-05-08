/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import database.DB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author seryuzaki-woorld
 */
public class User {

    private String name, image, email, password, gender ="";
    private int id;

    public User() {
        name = "";
        image = "";
        email = "";
        password = "";
        gender = "";
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void RegisterUser() throws ClassNotFoundException {
        try {
            DB dbconn = new DB();
            Connection myconnection = dbconn.Connection();
            String query = "INSERT INTO user (name,image,email,password,gender) VALUES ('" + name + "','" + image + "','" + email + "','" + password + "','" + gender + "')";
            Statement myStatement = myconnection.createStatement();

            try {
                myStatement.executeUpdate(query);
                myStatement.close();
                myconnection.close();
            } catch (SQLException ex) {
                Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static boolean LoginUser(String user, String pwd) {
        boolean check = false;
        try {
            DB dbconn = new DB();
            Connection myconnection = dbconn.Connection();

            PreparedStatement ps1 = myconnection.prepareStatement("select * from user where email=? and password=?");

            ps1.setString(1, user);
            ps1.setString(2, pwd);
            ResultSet rs1 = ps1.executeQuery();
            check = rs1.next();
            myconnection.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return check;
    }

    public static boolean checkEmail(String email) throws ClassNotFoundException, SQLException {
        boolean check = false;
        DB dbconn = new DB();
        Connection myconnection = dbconn.Connection();
        PreparedStatement ps1 = myconnection.prepareStatement("select * from user where email=?");
        ps1.setString(1, email);
        ResultSet rs1 = ps1.executeQuery();
        check = rs1.next();
        myconnection.close();
        return check;

    }

    public void GetUser() throws ClassNotFoundException {
        try {
            DB dbconn = new DB();
            Connection myconnection = dbconn.Connection();
            String sqlString = "SELECT * FROM user WHERE email = '" + email + "'";
            Statement myStatement = myconnection.createStatement();
            ResultSet rs = myStatement.executeQuery(sqlString);
            while (rs.next()) {

                name = rs.getString("name");
                image = rs.getString("image");
                email = rs.getString("email");
                password = rs.getString("password");
                gender = rs.getString("gender");
            }
            myStatement.close();
            myconnection.close();

        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}