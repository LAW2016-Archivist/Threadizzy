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
@WebServlet(name = "ProfileController", urlPatterns = {"/ProfileController"})
public class ProfileController extends HttpServlet {

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

        if (action.equals("view") && request.getParameter("id") != null) {
            // id profil yang dilihat
            int viewedId = Integer.parseInt(request.getParameter("id"));

            // user yang melihat
            User user = (User) request.getSession().getAttribute("userObj");

            if (user == null) {
                // view kalau user tidak login
                response.sendRedirect(request.getContextPath());
                return;
            }
            // view kalau user login
            UserTable ut = new UserTable();
            User viewedUser = null;
            try {
                viewedUser = ut.get(viewedId);
            } catch (SQLException ex) {
                Logger.getLogger(ProfileController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            //cek apakah yang dilihat itu profile sendiri atau orang lain
            String viewURL = "";
            request.setAttribute("viewedUser", viewedUser);
            // kalau lihat diri sendiri
            if (user.getId() == viewedUser.getId()) {
                 viewURL = "/dashboard/user/my-profile.jsp";
            }
            
            else {
                try {
                    // kalau lihat orang lain
                    if (UserFollowersTable.isFollowing(user, viewedUser)) {
                        viewURL = "/dashboard/view-other-user-profile-follow.jsp";
                    }
                    else {
                        viewURL = "/dashboard/view-other-user-profile-unfollow.jsp";
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(ProfileController.class.getName()).log(Level.SEVERE, null, ex);
                }
                
            }
            
            request.getServletContext().getRequestDispatcher(viewURL).forward(request, response);

        }

        if (action.equals("edit")) {
            // get profile
            User user = (User) request.getSession().getAttribute("userObj");
            int viewedId = Integer.parseInt(request.getParameter("id"));
            // redirect to profile edit page

            UserTable ut = new UserTable();
            User editedUser = null;
                    try {
                        editedUser = ut.get(viewedId);
                    } catch (SQLException ex) {
                        Logger.getLogger(ProfileController.class.getName()).log(Level.SEVERE, null, ex);
                    }

            if (user == null || editedUser == null) {
                response.sendRedirect(request.getContextPath());
                return;
            }
            if (user.getId() != editedUser.getId()) {
                response.sendRedirect(request.getContextPath());
                return;
            }

            request.setAttribute("editedUser", editedUser);
            String viewURL = "/dashboard/user/edit-profile.jsp";
            request.getServletContext().getRequestDispatcher(viewURL).forward(request, response);
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
        
        // Action       POST	/profile/{id}/edit 			
        // Mapped to    ProfileController?action=edit&id={id} 									
        // Go to        /profile
        if (action.equals("edit")) {
            int editedId = Integer.parseInt(request.getParameter("id"));
            String editedName = request.getParameter("nama");
            String editedEmail = request.getParameter("email");
            String oldPassword = request.getParameter("oldPassword");
            String newPassword = request.getParameter("password");
            String newPasswordAgain = request.getParameter("newPasswordAgain");
            String editedImage = request.getParameter("image");
            String editedGender = request.getParameter("gender");

            // TODO: check the confirmed password
            User editedUser = new User();
            editedUser.setId(editedId);
            editedUser.setNama(editedName);
            editedUser.setPassword(newPassword);
            editedUser.setEmail(editedEmail);
            editedUser.setImage(editedImage+"");
            editedUser.setGender(editedGender);
            
            try {
                UserTable.update(editedUser);
            } catch (SQLException ex) {
                Logger.getLogger(ProfileController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            response.sendRedirect(request.getContextPath()+"/profile/"+editedUser.getId());
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Controller for viewing and editing profile";
    }// </editor-fold>

}
