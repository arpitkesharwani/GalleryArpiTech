/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyPack;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Arpit Kesharwani
 */
@WebServlet(name = "ImageFeedbackServlet", urlPatterns = {"/ImageFeedbackServlet"})
public class ImageFeedbackServlet extends HttpServlet {

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
        String choice = request.getParameter("q");
        String userId = (String) s.getAttribute("user");
        String albumName = (String) s.getAttribute("albumName");
        String imageName = request.getParameter("r");
        int totalLike,totalUnlike;
        try {
            Connection con = ConnectionClass.getConnected();
            PreparedStatement p = con.prepareStatement("select choice from userimagefeedback where imageName='" + imageName + "' and userId='" + userId + "' ");
            ResultSet rs = p.executeQuery();
            if (rs.next() == true) {
                PreparedStatement p1 = con.prepareStatement("update userimagefeedback set choice='" + choice + "' where imageName='" + imageName + "' and userId='" + userId + "' ");
                int t = p1.executeUpdate();
                if (t > 0) {
                    PreparedStatement p2 = con.prepareStatement("select totalLike,totalUnlike from gallery_images where imagepath='" + imageName + "' ");
                    ResultSet rs1 = p2.executeQuery();
                    if (rs1.next() == true) {
                        totalLike = rs1.getInt(1);
                        totalUnlike = rs1.getInt(2);
                        if (choice.equalsIgnoreCase("like")) {
                            totalLike++;
                            totalUnlike--;
                        } else if (choice.equalsIgnoreCase("unlike")) {
                            totalUnlike++;
                            totalLike--;
                        }
                        PreparedStatement p3 = con.prepareStatement("update gallery_images set totallike='" + totalLike + "',totalUnlike='" + totalUnlike + "' where imagepath='" + imageName + "'");
                        int t1 = p3.executeUpdate();
                    }
                } else {
                    System.out.println("Sorry");
                }
            } else {
                PreparedStatement p1 = con.prepareStatement("insert into userimagefeedback(imageName,albumName,userId,choice)values ('" + imageName + "','" + albumName + "','" + userId + "','" + choice + "')");
                int t = p1.executeUpdate();
                if (t > 0) {
                    PreparedStatement p2 = con.prepareStatement("select totalLike,totalUnlike from gallery_images where imagepath='" + imageName + "' ");
                    ResultSet rs1 = p2.executeQuery();
                    if (rs1.next() == true) {
                        totalLike = rs1.getInt(1);
                        totalUnlike = rs1.getInt(2);
                        if (choice.equalsIgnoreCase("like")) {
                            totalLike++;
                        } else if (choice.equalsIgnoreCase("unlike")) {
                            totalUnlike++;
                        }
                        PreparedStatement p3 = con.prepareStatement("update gallery_images set totallike='" + totalLike + "',totalUnlike='" + totalUnlike + "' where imagepath='" + imageName + "'");
                        int t1 = p3.executeUpdate();
                    }
                } else {
                    System.out.println("Sorry");
                }
            }
        } catch (SQLException ea) {
            System.out.println("ImageFeedBackServlet Error=" + ea.toString());
            s.setAttribute("Error", ea.toString());
            response.sendRedirect("ErrorPage.jsp");
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
