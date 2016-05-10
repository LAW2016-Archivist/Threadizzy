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
    public Connection Connection() throws ClassNotFoundException, SQLException
    {
            Connection connection = ConnectionFactory.getConnection();
            return connection;
            
     }
}
