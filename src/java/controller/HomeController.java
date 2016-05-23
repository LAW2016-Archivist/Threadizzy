/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import database.StatusTable;
import database.ThreadTable;
import database.UserFollowersTable;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Status;
import model.User;
import model.Thread;

/**
 *
 * @author ismail.hassan
 */
@WebServlet(name = "HomeController", urlPatterns = {"/HomeController"})
public class HomeController extends HttpServlet {

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
//        if (request.getSession().getAttribute("userObj") == null) {
//            response.sendRedirect(request.getSession().getAttribute("baseUrl") + "login-form.jsp");
//        }
        
        
        String action = request.getParameter("action");
        if (action.equals("view")) {
            view(request, response);
        }
    }
    
    private void view(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        User user = (User) request.getSession().getAttribute("userObj");
        try {
            ArrayList<User> followed = (ArrayList<User>) UserFollowersTable.getAllFollowing(user.getId());
            ArrayList<Status> followedStatus = (ArrayList<Status>) StatusTable.getFollowedStatus(user.getId());
            ArrayList<Thread> followedThread = (ArrayList<Thread>) ThreadTable.getFollowedThread(user.getId());
            request.setAttribute("followed", followed);
            request.setAttribute("followedStatus", followedStatus);
            request.setAttribute("followedThread", followedThread);
            
            String viewURL = "/dashboard/user-home.jsp";
            request.getServletContext().getRequestDispatcher(viewURL).forward(request, response);
        }
        catch (SQLException ex) {
            Logger.getLogger(UserFollowController.class.getName()).log(Level.SEVERE, null, ex);
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
