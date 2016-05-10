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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Arrianda
 */
public class Category {

    private String nama = "";
    private int id;
    private int idUser;
    private ArrayList<String> arrayNama;
    private ArrayList<Integer> arrayId;

    public Category() {
        nama = "";

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public int getIdUser() {
        return idUser;
    }
     public void setIdUser(int idUser) {
        this.idUser = idUser;
     }

    public ArrayList<String> getArrayNama() {
        return arrayNama;
    }

    public void setArrayNama(ArrayList<String> arrayNama) {
        this.arrayNama = arrayNama;
    }

    public ArrayList<Integer> getArrayId() {
        return arrayId;
    }

    public void setArrayId(ArrayList<Integer> arrayId) {
        this.arrayId = arrayId;
    }

    public void registerCategory() throws ClassNotFoundException {
        try {
            DB dbconn = new DB();
            Connection myconnection = dbconn.Connection();
            String query = "INSERT INTO category (nama, id_user) VALUES ('" + nama + "' , '" + idUser + "')";
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

    public void GetAllCategory() throws ClassNotFoundException {
        try {
            DB dbconn = new DB();
            Connection myconnection = dbconn.Connection();
            String sqlString = "SELECT * FROM category";
            Statement myStatement = myconnection.createStatement();
            ResultSet rs = myStatement.executeQuery(sqlString);
            ArrayList<String> namaCategory = new ArrayList();
            ArrayList<Integer> idCategory = new ArrayList();
            int id = 1;
            while (rs.next()) {
                namaCategory.add(rs.getString("nama"));
                idCategory.add(id);
                id++;
            }
            this.arrayId = idCategory;
            this.arrayNama = namaCategory;
            myStatement.close();
            myconnection.close();
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void getCategory() throws ClassNotFoundException {
        try {
            DB dbconn = new DB();
            Connection myconnection = dbconn.Connection();
            String sqlString = "SELECT * FROM category WHERE id='" + id + "'";
            Statement myStatement = myconnection.createStatement();
            ResultSet rs = myStatement.executeQuery(sqlString);
            while (rs.next()) {
                this.nama = rs.getString("nama");
            }

            myStatement.close();
            myconnection.close();
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void deleteCategory() throws ClassNotFoundException {
        try {
            DB dbconn = new DB();
            Connection myconnection = dbconn.Connection();
            String sqlString = "Delete  FROM category WHERE id='" + id + "'";
            Statement myStatement = myconnection.createStatement();
            myStatement.executeUpdate(sqlString);
 

            myStatement.close();
            myconnection.close();
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }

    
    }
}
