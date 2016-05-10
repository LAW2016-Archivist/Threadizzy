/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import controller.*;
import database.StatusTable;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Status;
import model.User;

/**
 *
 * @author arrianda
 */
@WebServlet(name = "StatusController", urlPatterns = {"/StatusController"})
public class StatusController extends HttpServlet {
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        
        // jika user belum login, akan langsung redirect ke halaman utama
        User user = (User) request.getSession().getAttribute("userObj");
        if (user == null) {
            response.sendRedirect(request.getContextPath());
        }
        
        String action = request.getParameter("action");
        if (action.equals("create")) {
            create(request, response);
        }
        if (action.equals("store")) {
            store(request, response);
        }
        if (action.equals("edit") && request.getParameter("id") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            edit(request, response, id);
        }
        if (action.equals("update") && request.getParameter("id") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            update(request, response, id);
        }
        if (action.equals("delete") && request.getParameter("id") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            delete(request, response, id);
        }
    }
    
    // GET
    // mengembalikan halaman untuk membuat status baru
    private void create(HttpServletRequest request, HttpServletResponse response) {
        
    }
    
    // POST
    // menyimpan status baru yang telah dibuat
    private void store(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute("userObj");
        String isiStatus = request.getParameter("isiStatus");
        Status status = new Status();
        status.setIdUser(user.getId());
        status.setIsi(isiStatus);
        
        try {
            StatusTable.add(status);
        } catch (SQLException ex) {
            Logger.getLogger(StatusController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String redirectURL = request.getContextPath()+"/dashboard/user-home.jsp";
        response.sendRedirect(redirectURL);
    }
    
    // GET
    private void edit(HttpServletRequest request, HttpServletResponse response, int id) {
        
    }
    
    // POST
    private void update(HttpServletRequest request, HttpServletResponse response, int id) throws IOException {
        User user = (User) request.getSession().getAttribute("userObj");
        String isiStatus = request.getParameter("isiStatus");
        Status status = StatusTable.find(id);
        if (status == null) {
            // balik ke halaman yang manggil
            response.sendRedirect(request.getHeader("referer"));
        }
        else {
            status.setIdUser(user.getId());
            status.setIsi(isiStatus);
            
            try {
                StatusTable.update(status);
            } catch (SQLException ex) {
                Logger.getLogger(StatusController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            response.sendRedirect(request.getHeader("referer"));
        }
    }
    
    private void delete(HttpServletRequest request, HttpServletResponse response, int id) {
        
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
