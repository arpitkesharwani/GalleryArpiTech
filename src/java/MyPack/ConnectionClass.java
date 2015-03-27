/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyPack;

import java.sql.*;

/**
 *
 * @author Arpit Kesharwani
 */
public class ConnectionClass {

    static Connection c = null;

    public static Connection getConnected() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            c = DriverManager.getConnection("jdbc:mysql://localhost:3306/gallery", "root", "root");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("ConnectionClassError=" + e.toString());
        }
        return c;
    }

}
