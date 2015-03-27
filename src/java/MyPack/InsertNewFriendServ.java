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
import java.sql.*;
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
@WebServlet(name = "InsertNewFriendServ", urlPatterns = {"/InsertNewFriendServ"})

public class InsertNewFriendServ extends HttpServlet {

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
            String name = request.getParameter("name");
            String imageStr = request.getParameter("cropImg");
            if (imageStr != null) {
                String uuid = java.util.UUID.randomUUID().toString();
                String fileName = uuid + "_" + "FriendsImage";
                imageStr = imageStr.substring(22);
                byte[] imgByteArray = Base64.decodeBase64(imageStr.getBytes());
                InputStream in = new ByteArrayInputStream(imgByteArray);
                try {
                    BufferedImage bufferedImage = ImageIO.read(in);
                    String filePath = s.getServletContext().getRealPath("/MyImage/FrndsImage") + "";
                    String actualPath = filePath + "/" + fileName + ".png";
                    ImageIO.write(bufferedImage, "png", new File(actualPath));
                    String image = "MyImage/FrndsImage/" + fileName + ".png";
                    Connection con = ConnectionClass.getConnected();
                    PreparedStatement p = con.prepareStatement("update friend set image='" + image + "' where email='" + s.getAttribute("email") + "'");
                    int t = p.executeUpdate();
                    if (t > 0) {
                        s.setAttribute("success", null);
                        s.setAttribute("email", null);
                        s.setAttribute("message", "Friend Details Uploaded Successfully");
                        response.sendRedirect("index.jsp");
                    } else {
                        System.out.println("Sorry");
                    }
                } catch (IOException | SQLException ex) {
                    System.out.println(ex.getMessage());
                    s.setAttribute("InsertNewFriendServlet Error=", ex.toString());
                    response.sendRedirect("ErrorPage.jsp");
                }
            }
            if (name != null) {
                String email = request.getParameter("email");
                String gender = request.getParameter("gender");
                String companyName = request.getParameter("companyName");
                String designation = request.getParameter("designation");
                String twitterUrl = request.getParameter("twitterUrl");
                String FacebookUrl = request.getParameter("FacebookUrl");
                String LinkedInUrl = request.getParameter("LinkedInUrl");
                String type = "friendAddMail";
                try {
                    Connection con = ConnectionClass.getConnected();
                    PreparedStatement p = con.prepareStatement("insert into friend (name,email,designation,companyName,gender,linkedInUrl,fbUrl,twitterUrl) values ('" + name + "','" + email + "','" + designation + "','" + companyName + "','" + gender + "','" + LinkedInUrl + "','" + FacebookUrl + "','" + twitterUrl + "')");
                    int t = p.executeUpdate();
                    if (t > 0) {
                        s.setAttribute("email", email);
                        s.setAttribute("success", "success");
                        mailSender.mailsender(type, name, email, null);
                        response.sendRedirect("index.jsp");
                    } else {
                        System.out.println("Sorry");
                    }
                } catch (SQLException | IOException e) {
                    System.out.println("InsertNewFriendServlet Error=" + e.toString());
                    s.setAttribute("Error", e.toString());
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
