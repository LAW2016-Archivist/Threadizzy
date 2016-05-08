/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author seryuzaki-woorld
 */
public class DB {
    
    public static DB instance = new DB();
    public static final String URL = "jdbc:mysql://localhost/threadizzy";
    public static final String USER = "root";
    public static final String PASSWORD = "qwert12345";
    public static final String DRIVER_CLASS = "com.mysql.jdbc.Driver"; 
    
    private DB() {
        try { 
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Connection createConnection() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn;
            
     }
    
    public static Connection getConnection() {
        return instance.createConnection();
    }
    
}