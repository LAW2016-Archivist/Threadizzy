/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import database.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ismail.hassan
 */
public class Category {
    public static String TABLE_NAME = "category";
    private int id;
    private int idUser;
    private String nama;
    
    public Category() {
        
    }
    
    public int getId() {
        return this.id;
    }
    
    public String getNama() {
        return this.nama;
    }
    
    public void setId(int id) {
        this.id = id;
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
}
