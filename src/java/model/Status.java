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
 * @author Arrianda
 */
public class Status {
     private String isi ="";
    private int id, id_user;

    public Status() {
        isi = "";
      
    }

    public int getId_user() {
        return id_user;
    }

    public void setIdUser(int id_user) {
        this.id_user = id_user;
    }

    public String getIsi() {
        return isi;
    }

    public void setIsi(String isi) {
        this.isi = isi;
    }


    public void RegisterStatus() throws ClassNotFoundException {
        try {
            DB dbconn = new DB();
            Connection myconnection = dbconn.Connection();
            String query = "INSERT INTO status (id_user, isi) VALUES ('" + id_user + "','" + isi + "')";
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
}
