/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyPack;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Arpit Kesharwani
 */
@WebServlet(name = "InsertAlbumServlet", urlPatterns = {"/InsertAlbumServlet"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB 
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 1000)	// 1000MB
public class InsertAlbumServlet extends HttpServlet {

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
        String albumName = request.getParameter("q");
        if (albumName != null) {
            s.setAttribute("albumName", albumName);
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

        // getting Session Object
        HttpSession s = request.getSession(true);
        System.out.println(s.getAttribute("user"));
        if (s.getAttribute("user") == null) {
            s.setAttribute("message", "Please Login to Continue");
            response.sendRedirect("index.jsp");
        } else if (s.getAttribute("user") != null) {
            // gets absolute path of the web application
            String appPath = request.getServletContext().getRealPath("");
            // constructs path of the directory to save uploaded file
            String SAVE_DIR = "MyImage/" + s.getAttribute("albumName");
            String savePath = appPath + File.separator + SAVE_DIR;
            String saveThumb = savePath + "/thumb";
            // creates the save directory if it does not exists
            File fileSaveDir = new File(savePath);
            File fileSaveDir1 = new File(saveThumb);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdir();
            }
            if (!fileSaveDir1.exists()) {
                fileSaveDir1.mkdir();
            }
            try {
                Connection con = ConnectionClass.getConnected();
                for (Part part : request.getParts()) {
                    String fileName = extractFileName(part);
                    part.write(savePath + File.separator + fileName);
                    String filePath = "MyImage/" + s.getAttribute("albumName") + "/" + fileName;
                    String imagePath = savePath + File.separator + fileName;
                    String thumbImagePath = savePath + "/thumb/" + fileName;
                    String thumbImage = SAVE_DIR + "/thumb/" + fileName;
                    CreateThumbnail.thumb(imagePath, thumbImagePath);
                    PreparedStatement p = con.prepareStatement("insert into gallery_images (imagepath,thumbImage,albumName,totalLike,totalUnlike) values ('" + filePath + "','" + thumbImage + "','" + s.getAttribute("albumName") + "',0,0)");
                    int t = p.executeUpdate();
                    if (t > 0) {
                        s.setAttribute("message", "Images Uploaded Successfully");
                    } else {
                        System.out.println("Image Upload Not Completed");
                         s.setAttribute("message", "Images Uploaded Failed");
                    }
                }
            } catch (SQLException | IOException ea) {
                System.out.println("InsertAlbumServletError=" + ea.toString());
                s.setAttribute("Error", ea.toString());
                s.setAttribute("message", "Images Uploaded Failed");
                response.sendRedirect("ErrorPage.jsp");                
            }
            response.sendRedirect("index.jsp");
        }
    }

    /**
     * Extracts file name from HTTP header content-disposition
     */
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
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
