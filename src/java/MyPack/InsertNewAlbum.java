/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyPack;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.util.codec.binary.Base64;

/**
 *
 * @author Arpit Kesharwani
 */
@WebServlet(name = "InsertNewAlbum", urlPatterns = {"/InsertNewAlbum"})
public class InsertNewAlbum extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession s = request.getSession(true);
        if (s.getAttribute("user") == null) {
            s.setAttribute("message", "Please Login to Continue");
            response.sendRedirect("index.jsp");
        } else if (s.getAttribute("user") != null) {
            String albumName = request.getParameter("albumName");
            String imageStr = request.getParameter("coverImg");
            String albumDate = request.getParameter("albumDate");
            String albumDetail = request.getParameter("albumDetail");
            if (imageStr != null) {
                String uuid = java.util.UUID.randomUUID().toString();
                String fileName = uuid + "_" + "CoverImage";
                imageStr = imageStr.substring(22);
                byte[] imgByteArray = Base64.decodeBase64(imageStr.getBytes());
                InputStream in = new ByteArrayInputStream(imgByteArray);
                try {
                    BufferedImage bufferedImage = ImageIO.read(in);
                    String appPath = request.getServletContext().getRealPath("");
                    // constructs path of the directory to save uploaded file
                    String SAVE_DIR = "MyImage/AlbumCoverImage";
                    String savePath = appPath + File.separator + SAVE_DIR;
                    // creates the save directory if it does not exists
                    File fileSaveDir = new File(savePath);
                    if (!fileSaveDir.exists()) {
                        fileSaveDir.mkdir();
                    }
                    String actualPath = savePath + "/" + fileName + ".png";
                    ImageIO.write(bufferedImage, "png", new File(actualPath));
                    System.out.println("success");
                    String image = "MyImage/AlbumCoverImage/" + fileName + ".png";
                    Connection con = ConnectionClass.getConnected();
                    PreparedStatement p = con.prepareStatement("insert into album (albumName,albumDate,albumCover,albumDetail) values ('" + albumName + "','" + albumDate + "','" + image + "','" + albumDetail + "')");
                    int t = p.executeUpdate();
                    if (t > 0) {
                        s.setAttribute("message", "Album Created Successfully");
                        response.sendRedirect("index.jsp");
                    } else {
                        System.out.println("Sorry");
                    }
                } catch (IOException | SQLException ea) {
                    System.out.println("InsertNewAlbumServlet Error" + ea.getMessage());
                    s.setAttribute("Error", ea.toString());
                    response.sendRedirect("ErrorPage.jsp");
                }
            }
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
