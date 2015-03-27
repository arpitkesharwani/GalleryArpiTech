/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyPack;

import java.awt.image.BufferedImage;
import java.awt.image.ImagingOpException;
import java.io.File;
import java.io.IOException;
import org.imgscalr.Scalr;
import org.imgscalr.Scalr.Method;
import javax.imageio.ImageIO;
import java.io.ByteArrayOutputStream;

/**
 *
 * @author Arpit Kesharwani
 */
public class CreateThumbnail {

    public static void thumb(String imagePath, String thumbImagePath) throws IOException {
        try {
            //reading file from sspecified location Using ImageIO
            File f = new File(imagePath);
            BufferedImage img = ImageIO.read(f);
            //Creating thumImage using ImageScalar
            BufferedImage thumbImg = Scalr.resize(img, Method.QUALITY, Scalr.Mode.AUTOMATIC, 350, 350, Scalr.OP_ANTIALIAS);
            ByteArrayOutputStream os = new ByteArrayOutputStream();
            //Writing File to Specified Location
            File f2 = new File(thumbImagePath);
            ImageIO.write(thumbImg, "jpg", f2);
        } catch (IOException | IllegalArgumentException | ImagingOpException e) {
            System.out.println("CreateThumNailClassError="+e.toString());
        }
    }

}
