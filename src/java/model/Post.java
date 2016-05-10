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
public class Post {
    private String judul,isi  ="";
    private int id, id_thread, id_user;
    private ArrayList<Integer> arrayId = new ArrayList();
    private Timestamp datel;

    public Post() {
        judul = "";
    
    }

    public int getIdUser() {
        return id_user;
    }

    public void setIdUser(int id_user) {
        this.id_user = id_user;
    }
    
     public int getIdThread() {
        return id_thread;
    }

    public void setIdThread(int id_thread) {
        this.id_thread = id_thread;
    }
    
    public String getJudul() {
        return judul;
    }

    public void setJudul(String judul) {
        this.judul = judul;
    }
        
    public String getIsi() {
        return isi;
    }

    public void setIsi(String status) {
        this.isi = isi;
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
     public void registerPost() throws ClassNotFoundException {
        try {
            DB dbconn = new DB();
            Connection myconnection = dbconn.Connection();
            String query = "INSERT INTO post (id_user, id_thread, judul, isi) VALUES ('" + id_user + "','" + id_thread + "','" + judul + "','" + isi + "')";
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
     
    public void getUserPost() throws ClassNotFoundException {
        try {
            DB dbconn = new DB();
            Connection myconnection = dbconn.Connection();
            String sqlString = "SELECT * FROM post WHERE (id_user='"+ id_user+"'AND id_thread='"+id_thread+"')";
            Statement myStatement = myconnection.createStatement();
            ResultSet rs = myStatement.executeQuery(sqlString);
            ArrayList<Integer> idPost = new ArrayList();
            while (rs.next()) {
                idPost.add(rs.getInt("id"));
            }
            this.arrayId = idPost;
            myStatement.close();
            myconnection.close();
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     public void getPost() throws ClassNotFoundException {
        try {
            DB dbconn = new DB();
            Connection myconnection = dbconn.Connection();
            String sqlString = "SELECT * FROM post WHERE id='"+ id+"'";
            Statement myStatement = myconnection.createStatement();
            ResultSet rs = myStatement.executeQuery(sqlString);
            while (rs.next()) {
                this.id_thread=rs.getInt("id_thread");
                this.id_user=rs.getInt("id_user");
                this.judul=rs.getString("judul");
                this.isi=rs.getString("isi");
                this.datel = rs.getTimestamp("datel");
            }
            myStatement.close();
            myconnection.close();
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
