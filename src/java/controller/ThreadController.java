/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

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
import model.Thread;

/**
 *
 * @author arrianda
 */
@WebServlet(name = "ThreadController", urlPatterns = {"/ThreadController"})
public class ThreadController extends HttpServlet {

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

        PrintWriter out = response.getWriter();
        String test = request.getParameter("action");
        if(request.getParameter("action")!= null && test.equalsIgnoreCase("edit")) {
            Thread thread = new Thread();
            thread.setId(Integer.parseInt(request.getParameter("id")));
            thread.setIdCategory(Integer.parseInt(request.getParameter("category")));
            thread.setJudul(request.getParameter("judul"));
            thread.setStatus(Integer.parseInt(request.getParameter("status")));

            thread.editThread();
            HttpSession session = request.getSession(true);
            session.setAttribute("threadSuccess", "Success Update Thread");
            String redirectURL = session.getAttribute("baseUrl") + "dashboard/panel/manage-thread.jsp";
            response.sendRedirect(redirectURL);
        }
        
        else  if(request.getParameter("action")!= null && test.equalsIgnoreCase("delete")) {
            Thread thread = new Thread();
            thread.setId(Integer.parseInt(request.getParameter("id")));
            boolean check = thread.deleteThread();
            HttpSession session = request.getSession(true);
            if(check) {
                session.setAttribute("threadSuccess", "Success Delete Thread");
            }
            else {
                session.setAttribute("threadSuccess", "Delete your post from that thread first");
            }
            String redirectURL = session.getAttribute("baseUrl") + "dashboard/panel/manage-thread.jsp";
            response.sendRedirect(redirectURL);
        }
        else {
            Thread thread = new Thread();
            
            
            thread.setIdUser(Integer.parseInt(request.getParameter("id_user")));
            thread.setIdCategory(Integer.parseInt(request.getParameter("id_category")));
            thread.setJudul(request.getParameter("judul"));
            thread.setStatus(Integer.parseInt(request.getParameter("status")));

            thread.registerThread();
            HttpSession session = request.getSession(true);
            session.setAttribute("threadSuccess", "Success Create Thread");
            String redirectURL = session.getAttribute("baseUrl") + "dashboard/panel/manage-thread.jsp";
            response.sendRedirect(redirectURL);
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
