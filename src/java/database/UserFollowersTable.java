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
import java.util.ArrayList;
import java.util.List;
import model.User;

/**
 *
 * @author ismail.hassan
 */
public class UserFollowersTable {
    private Connection conn;
    private PreparedStatement ps;
    
    public ArrayList<User> getAllFollowers(int idUser) throws SQLException {
        String query = "SELECT * FROM user_followers WHERE id_user=?";
        List<User> list = new ArrayList<User>();
        
        ResultSet rs = null;
        
        try {
            conn = ConnectionFactory.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, idUser);
            
            rs = ps.executeQuery();
            
            while (rs.next()) {
                User tmp = new User();
                tmp.setId(rs.getInt("id"));
                tmp.setNama(rs.getString("nama"));
                tmp.setEmail(rs.getString("email"));
                list.add(tmp);
            }
            
        } 
        finally {
            if (rs != null) { rs.close(); }
            if (ps != null) { ps.close(); }
            if (conn != null) { conn.close(); }
        }
        
        return (ArrayList<User>) list;
    }
    
    public ArrayList<User> getAllFollowing(int idUser) throws SQLException {
        String query = "SELECT * FROM user_followers WHERE id_followers=?";
        List<User> list = new ArrayList<User>();
        
        ResultSet rs = null;
        
        try {
            conn = ConnectionFactory.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, idUser);
            
            rs = ps.executeQuery();
            
            while (rs.next()) {
                User tmp = new User();
                tmp.setId(rs.getInt("id"));
                tmp.setNama(rs.getString("nama"));
                tmp.setEmail(rs.getString("email"));
                list.add(tmp);
            }
            
        } 
        finally {
            if (rs != null) { rs.close(); }
            if (ps != null) { ps.close(); }
            if (conn != null) { conn.close(); }
        }
        
        return (ArrayList<User>) list;
    }
    
    // user1 follow user2
    // user2 memiliki follower user1
    public void follow(User user1, User user2) throws SQLException {
        String query = "INSERT INTO user_followers (id_user, id_followers) VALUES (?, ?)";
        try {
            conn = ConnectionFactory.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, user2.getId());
            ps.setInt(2, user1.getId());
            ps.executeUpdate();
        }
        finally {
            if (ps != null) { ps.close(); }
            if (conn != null) { conn.close(); }
        }
    }
    
    
    
}
