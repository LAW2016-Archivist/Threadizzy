/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;

/**
 *
 * @author ismail.hassan
 */
public class UserTable {
    private static Connection conn;
    private static PreparedStatement ps;
    
    public static User get(int id) throws SQLException {
        String query = "select * from user where id=?";
        
        User user = new User();
        ResultSet rs = null;
        
        try {
            conn = ConnectionFactory.getConnection();
            ps = conn.prepareStatement(query);
            
            ps.setInt(1, id);
            
            rs = ps.executeQuery();
            
            if (rs.next()) {
                user.setId(rs.getInt("id"));
                user.setNama(rs.getString("nama"));
                user.setImage(rs.getString("image"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
            }
            conn.close();
            
        } finally {
            if (rs != null) { rs.close(); }
            if (ps != null) { ps.close(); }
            if (conn != null) { conn.close(); }
        }
        return user;
    }
    
    public static void add(User user) throws SQLException {
        String query = "INSERT INTO user (nama,image,email,password,gender) VALUES (?,?,?,?,?)";
        try {
            conn = ConnectionFactory.getConnection();
            ps = conn.prepareStatement(query);
            
            ps.setString(1, user.getNama());
            ps.setString(2, user.getImage());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getGender());
            
            ps.executeUpdate();
        }
        finally {
            if (ps != null) { ps.close(); }
            if (conn != null) { conn.close(); }
        }
    }
    
    public static void update(User user) throws SQLException {
        String query = "UPDATE user SET nama=?,image=?,email=?,password=?,gender=? WHERE id=?";
        try {
            conn = ConnectionFactory.getConnection();
            ps = conn.prepareStatement(query);
            
            ps.setString(1, user.getNama());
            ps.setString(2, user.getImage());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getGender());
            ps.setInt(6, user.getId());
            
            ps.executeUpdate();
        }
        finally {
            if (ps != null) { ps.close(); }
            if (conn != null) { conn.close(); }
        }
    }
    
    
    
}
