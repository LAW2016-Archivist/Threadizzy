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
import model.Thread;

/**
 *
 * @author ismail.hassan
 */
public class ThreadTable {
    private static Connection conn;
    private static PreparedStatement ps;
    
    public static List<Thread> getFollowedThread(int idUser) throws SQLException {
        String query = "SELECT * FROM user_followers " +
                "JOIN user ON user.id = user_followers.id_user " +
                "JOIN thread ON user_followers.id_user = thread.id_user " +
                "WHERE id_followers=? ";
        
        List<Thread> list = new ArrayList<Thread>();
        
        ResultSet rs = null;
        
        try {
            conn = ConnectionFactory.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, idUser);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                Thread tmp = new Thread();
                tmp.setId(rs.getInt("id"));
                tmp.setIdUser(rs.getInt("id_user"));
                tmp.setIdCategory(rs.getInt("id_category"));
                tmp.setJudul(rs.getString("judul"));
                tmp.setDatel(rs.getTimestamp("datel"));
                tmp.setNamaUser(rs.getString("nama"));
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
}
