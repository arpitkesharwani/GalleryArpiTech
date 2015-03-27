/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyPack;

/**
 *
 * @author Arpit Kesharwani
 */
public class AlbumImage {

    private String imagepath;
    private String thumbImage;
    private int totalLike;
    private int totalUnlike;
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImagepath() {
        return imagepath;
    }

    public void setImagepath(String imagepath) {
        this.imagepath = imagepath;
    }

    public String getThumbImage() {
        return thumbImage;
    }

    public void setThumbImage(String thumbImage) {
        this.thumbImage = thumbImage;
    }

    public int getTotalUnlike() {
        return totalUnlike;
    }

    public void setTotalUnlike(int totalUnlike) {
        this.totalUnlike = totalUnlike;
    }

    public int getTotalLike() {
        return totalLike;
    }

    public void setTotalLike(int totalLike) {
        this.totalLike = totalLike;
    }

}
