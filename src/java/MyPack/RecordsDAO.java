/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyPack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author Arpit Kesharwani
 */
public class RecordsDAO {

    private int noOfRecords;

    public List<AlbumImage> viewAllRecords(int offset, int noOfRecords,String albumName) {
        
        String query = "select SQL_CALC_FOUND_ROWS * from gallery_images where albumName='"+albumName+"' limit " + offset + ", " + noOfRecords;

        List<AlbumImage> list = new ArrayList<>();
        try {
            Connection con = ConnectionClass.getConnected();
            PreparedStatement p = con.prepareStatement(query);
            ResultSet rs = p.executeQuery();
            while (rs.next()) {
                AlbumImage albumImage = new AlbumImage();
                albumImage.setId(rs.getInt(1));
                albumImage.setImagepath(rs.getString(2));
                albumImage.setThumbImage(rs.getString(3));
                albumImage.setTotalLike(rs.getInt(5));
                albumImage.setTotalUnlike(rs.getInt(6));
                list.add(albumImage);
            }
            rs.close();

            rs = p.executeQuery("SELECT COUNT(*) FROM gallery_images where albumName='"+albumName+"'");
            if (rs.next()) {
                this.noOfRecords = rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int getNoOfRecords() {
        return noOfRecords;
    }

}
