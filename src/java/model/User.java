/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import database.ConnectionFactory;
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

    private String nama, image, email, password, gender = "";
    private int id;

    public User() {
        nama = "";
        image = "";
        email = "";
        password = "";
        gender = "";
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
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

    public void registerUser() throws ClassNotFoundException {
        try {
            DB dbconn = new DB();
            Connection myconnection = dbconn.Connection();
            String query = "INSERT INTO user (nama,image,email,password,gender) VALUES ('" + nama + "','" + image + "','" + email + "','" + password + "','" + gender + "')";

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

    public static boolean loginUser(String user, String pwd) {
        boolean check = false;
        try {
            Connection myconnection = ConnectionFactory.getConnection();

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
        try {
            Connection myconnection = ConnectionFactory.getConnection();
            PreparedStatement ps1 = myconnection.prepareStatement("select * from user where email=?");
            ps1.setString(1, email);
            ResultSet rs1 = ps1.executeQuery();
            check = rs1.next();
            myconnection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public void getUser() throws ClassNotFoundException {
        try {
            Connection myconnection = ConnectionFactory.getConnection();
            String sqlString = "SELECT * FROM user WHERE email = '" + email + "'";
            Statement myStatement = myconnection.createStatement();
            ResultSet rs = myStatement.executeQuery(sqlString);
            while (rs.next()) {
                id = rs.getInt("id");
                nama = rs.getString("nama");
                image = rs.getString("image");
                id = rs.getInt("id");
                email = rs.getString("email");
                password = rs.getString("password");
                gender = rs.getString("gender");
            }
            System.out.println("user id" + id);
            myStatement.close();
            myconnection.close();

        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
