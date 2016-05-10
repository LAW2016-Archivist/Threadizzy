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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Arrianda
 */
public class Thread {
    private String judul  ="";
    private int id, id_category, id_user, status;
    private ArrayList<Integer> arrayId = new ArrayList();
    private Timestamp datel;

    public Thread() {
        judul = "";
    
    }

    public int getIdUser() {
        return id_user;
    }

    public void setIdUser(int id_user) {
        this.id_user = id_user;
    }
    
    public int getIdCategory() {
        return id_category;
    }

    public void setIdCategory(int id_category) {
        this.id_category = id_category;
    }
    
    public String getJudul() {
        return judul;
    }

    public void setJudul(String judul) {
        this.judul = judul;
    }
        
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    public Timestamp getDatel() {
        return datel;
    }

    public void setDatel(Timestamp datel) {
        this.datel = datel;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    public ArrayList<Integer> getArrayId() {
        return arrayId;
    }

    public void setArrayId(ArrayList<Integer> arrayId) {
        this.arrayId = arrayId;
    }
     public void registerThread() throws ClassNotFoundException {
        try {
            DB dbconn = new DB();
            Connection myconnection = dbconn.Connection();
            String query = "INSERT INTO thread (id_user, id_category, judul, status) VALUES ('" + id_user + "','" + id_category + "','" + judul + "','" + status + "')";
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
     
    public void getUserThread() throws ClassNotFoundException {
        try {
            DB dbconn = new DB();
            Connection myconnection = dbconn.Connection();
            String sqlString = "SELECT * FROM thread WHERE id_user='"+ id_user+"'";
            Statement myStatement = myconnection.createStatement();
            ResultSet rs = myStatement.executeQuery(sqlString);
            ArrayList<Integer> idThread = new ArrayList();
            while (rs.next()) {
                idThread.add(rs.getInt("id"));
            }
            this.arrayId = idThread;
            myStatement.close();
            myconnection.close();
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void getPublicThread() throws ClassNotFoundException {
        try {
            DB dbconn = new DB();
            Connection myconnection = dbconn.Connection();
            String sqlString = "SELECT * FROM thread WHERE status='"+ 1+"'";
            Statement myStatement = myconnection.createStatement();
            ResultSet rs = myStatement.executeQuery(sqlString);
            ArrayList<Integer> idThread = new ArrayList();
            while (rs.next()) {
                idThread.add(rs.getInt("id"));
            }
            this.arrayId = idThread;
            myStatement.close();
            myconnection.close();
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
     public void getThread() throws ClassNotFoundException {
        try {
            DB dbconn = new DB();
            Connection myconnection = dbconn.Connection();
            String sqlString = "SELECT * FROM thread WHERE id='"+ id+"'";
            Statement myStatement = myconnection.createStatement();
            ResultSet rs = myStatement.executeQuery(sqlString);
            while (rs.next()) {
                this.id_category=rs.getInt("id_category");
                this.id_user=rs.getInt("id_user");
                this.judul=rs.getString("judul");
                this.status=rs.getInt("status");
                this.datel = rs.getTimestamp("datel");
            }
            myStatement.close();
            myconnection.close();
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
