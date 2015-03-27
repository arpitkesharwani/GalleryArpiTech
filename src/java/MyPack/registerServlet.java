/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyPack;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
@WebServlet(name = "registerServlet", urlPatterns = {"/registerServlet"})
public class registerServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     *
     *
     */
    private static MessageDigest md;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession s = request.getSession(true);
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String encryptPass = CryptWithMD5.cryptMD5(password);
        System.out.println("encryptPassword=" + encryptPass);
        String type = "RegisterEmail";
        try {
            Connection con = ConnectionClass.getConnected();
            PreparedStatement p = con.prepareStatement("insert into register (firstName,lastName,gender,email) values('" + firstName + "','" + lastName + "','" + gender + "','" + email + "')");
            int t = p.executeUpdate();
            if (t > 0) {
                s.setAttribute("register", "success");
                PreparedStatement p1 = con.prepareStatement("insert into login (username,password) values('" + email + "','" + encryptPass + "')");
                int t1 = p1.executeUpdate();
                if (t1 > 0) {
                    s.setAttribute("login", "success");
                    s.setAttribute("message","Registered Successfully");
                    mailSender.mailsender(type, firstName, email, null);
                }
                response.sendRedirect("index.jsp");
            } else {
                System.out.println("Sorry");
            }
        } catch (SQLException | IOException ea) {
            System.out.println("Error=" + ea.toString());
            s.setAttribute("RegisterServlet Error=", ea.toString());
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
