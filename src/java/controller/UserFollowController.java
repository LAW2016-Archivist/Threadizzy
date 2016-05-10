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
        String action = request.getParameter("action");
        
        if (action.equals("follow") && request.getParameter("id") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            follow(request, response, id);
        }
        if (action.equals("unfollow") && request.getParameter("id") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            unfollow(request, response, id);
        }
    }

    
    private void follow(HttpServletRequest request, HttpServletResponse response, int id) throws IOException {
        User user = (User) request.getSession().getAttribute("userObj");
        try {
            User toBeFollowed = UserTable.get(id);
            if (toBeFollowed != null) {
                UserFollowersTable.follow(user, toBeFollowed);
            }
            else {
                request.getSession().setAttribute("followStatus", "fail");
            }
            response.sendRedirect(request.getContextPath()+"/profile/"+toBeFollowed.getId());
            
        } 
        catch (SQLException ex) {
            Logger.getLogger(UserFollowController.class.getName()).log(Level.SEVERE, null, ex);
        }   
    }
    
    private void unfollow(HttpServletRequest request, HttpServletResponse response, int id) throws IOException {
        User user = (User) request.getSession().getAttribute("userObj");
        try {
            User toBeUnfollowed = UserTable.get(id);
            if (toBeUnfollowed != null) {
                System.out.println("Trying to unfollow");
                UserFollowersTable.unfollow(user, toBeUnfollowed);
                request.getSession().setAttribute("unfollowStatus", "success");
            }
            else {
                request.getSession().setAttribute("unfollowStatus", "fail");
            }
            response.sendRedirect(request.getContextPath()+"/profile/"+toBeUnfollowed.getId());
            
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
        processRequest(request, response);
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
