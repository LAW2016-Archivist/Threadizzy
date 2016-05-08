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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Category;

/**
 *
 * @author ismail.hassan
 */
public class CategoryTable {
    private static String TABLE_NAME = "category";
    
    private Connection conn;
    private PreparedStatement ps;
    
    public CategoryTable() {
        
    }
    
    public List<Category> getAllCategory(int idUser) throws SQLException {
        String query = "SELECT * from "+TABLE_NAME+" WHERE id_user=?";
        
        List<Category> list = new ArrayList<Category>();
        
        ResultSet rs = null;
        
        try {
            conn = DB.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, idUser);
            
            rs = ps.executeQuery();
            
            while (rs.next()) {
                Category tmp = new Category();
                tmp.setId(rs.getInt("id"));
                tmp.setNama(rs.getString("nama"));
                list.add(tmp);
            }
            
        } 
        finally {
            if (rs != null) { rs.close(); }
            if (ps != null) { ps.close(); }
            if (conn != null) { conn.close(); }
        }
        
        return list;
    }
    
    public Category get(int id) throws SQLException {
        String query = "select * from "+Category.TABLE_NAME+" where id=?";
        
        Category category = null;
        ResultSet rs = null;
        
        try {
            conn = DB.getConnection();
            ps = conn.prepareStatement(query);
            
            ps.setInt(1, id);
            
            rs = ps.executeQuery();
            if (rs.next()) {
                category.setId(rs.getInt("id"));
                category.setNama(rs.getString("nama"));
            }
            conn.close();
            
        } finally {
            if (rs != null) { rs.close(); }
            if (ps != null) { ps.close(); }
            if (conn != null) { conn.close(); }
        }
        
        return category;
    }
    
    public Category get(int idUser, String nama) throws SQLException {
        String query = "select * from "+Category.TABLE_NAME+" where id_user=? AND nama=?";
        
        Category category = null;
        ResultSet rs = null;
        
        try {
            conn = DB.getConnection();
            ps = conn.prepareStatement(query);
            
            ps.setInt(1, idUser);
            ps.setString(2, nama);
            
            rs = ps.executeQuery();
            if (rs.next()) {
                category = new Category();
                category.setId(rs.getInt("id"));
                category.setNama(rs.getString("nama"));
            }
            
        } 
        finally {
            if (rs != null) { rs.close(); }
            if (ps != null) { ps.close(); }
            if (conn != null) { conn.close(); }
        }
        
        return category;
    }
    
    public void add(Category category) throws SQLException {
        String query = "INSERT INTO category (id_user, nama) VALUE (?, ?)";
        
        try {
            conn = DB.getConnection();
            ps = conn.prepareStatement(query);
            
            ps.setInt(1, category.getIdUser());
            ps.setString(2, category.getNama());
            
            ps.executeUpdate();
        }
        finally {
            if (ps != null) { ps.close(); }
            if (conn != null) { conn.close(); }
        }
    }
    
    // update category 
    public void update(Category category) throws SQLException {
        String query = "UPDATE category SET nama=? where id=? AND id_user=?";
        
        try {
            conn = DB.getConnection();
            ps = conn.prepareStatement(query);
            
            ps.setString(1, category.getNama());
            ps.setInt(2, category.getId());
            ps.setInt(3, category.getIdUser());
            
            ps.executeUpdate();
        } 
        finally {
            if (ps != null) { ps.close(); }
            if (conn != null) { conn.close(); }
        }
    }
    
    public void delete(Category category) throws SQLException {
        String query = "DELETE FROM category WHERE id=?";
        try {
            conn = DB.getConnection();
            ps = conn.prepareStatement(query);
            
            ps.setInt(1, category.getId());
            
            ps.executeUpdate();
        } 
        finally {
            if (ps != null) { ps.close(); }
            if (conn != null) { conn.close(); }
        }
    }
    
}
