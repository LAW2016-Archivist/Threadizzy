/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.Status;

/**
 *
 * @author ismail.hassan
 */
public class StatusTable {
    private static Connection conn;
    private static PreparedStatement ps;
    public static Status find(int id) {
        Status st = null;
        
        
        return st;
    }
    
    public static void add(Status status) throws SQLException {
        String query = "INSERT INTO status (id_user, isi) VALUES (?, ?)";
        try {
            conn = ConnectionFactory.getConnection();
            ps = conn.prepareStatement(query);
            
            ps.setInt(1, status.getIdUser());
            ps.setString(2, status.getIsi());
            
            ps.executeUpdate();
        }
        finally {
            if (ps != null) { ps.close(); }
            if (conn != null) { conn.close(); }
        }
        
    }
    
    public static void update(Status status) throws SQLException {
        String query = "UPDATE status SET isi=? WHERE id=?";
        try {
            conn = ConnectionFactory.getConnection();
            ps = conn.prepareStatement(query);
            
            ps.setString(1, status.getIsi());
            ps.setInt(2, status.getId());
            
            ps.executeUpdate();
        }
        finally {
            if (ps != null) { ps.close(); }
            if (conn != null) { conn.close(); }
        }
    }
    public static void delete(Status status) throws SQLException {
        String query = "DELETE FROM status WHERE id=?";
        try {
            conn = ConnectionFactory.getConnection();
            ps = conn.prepareStatement(query);
            
            ps.setInt(1, status.getId());
            
            ps.executeUpdate();
        }
        finally {
            if (ps != null) { ps.close(); }
            if (conn != null) { conn.close(); }
        }
    }
}
