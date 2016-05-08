/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import database.UserFollowersTable;
import database.UserTable;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author ismail.hassan
 */
@WebServlet(name = "UserFollowController", urlPatterns = {"/UserFollowController"})
public class UserFollowController extends HttpServlet {

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
        String action = request.getParameter("action");
        if (action.equals("following")) {
            //get all the following
            
            // add to request

            // redirect using request dispatcher 
        }
        else if (action.equals("follower")) {
            //get all the follower

            // add to request

            // redirect using request dispatcher
        }
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
        String action = request.getParameter("action");
        if (action.equals("follow")) {
            // do the follow
//            response.getWriter().print("YEY");
            int followedId = Integer.parseInt(request.getParameter("id"));
            User user = (User) request.getSession().getAttribute("userObj");
            UserTable ut = new UserTable();
            UserFollowersTable uft = new UserFollowersTable();
            
            try {
                uft.follow(user, ut.get(followedId));
            } catch (SQLException ex) {
                Logger.getLogger(UserFollowController.class.getName()).log(Level.SEVERE, null, ex);
            }
//            response.getWriter().print("YEY");
            response.sendRedirect(request.getContextPath()+"/profile/"+followedId);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Controller for things about following or followers.";
    }// </editor-fold>

}
