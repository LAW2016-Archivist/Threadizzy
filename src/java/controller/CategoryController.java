/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import database.CategoryTable;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.User;
import org.eclipse.persistence.sessions.Session;

/**
 * URL yang di-handle oleh controller ini:
 * 
 * GET /category?action=list          : halaman list category dan tambah category baru
 * GET /category?id=xy&action=edit    : halaman update category
 * GET /category?id=xy&action=delete  : halaman delete category
 * 
 * POST /category?action=create       : menambahkan category baru
 * POST /category?id=xy&action=edit   : mengupdate sebuah category, lalau redirect ke /category?action=list
 * POST /category?id=xy&action=delete : menghapus sebuah category, lalu redirect ke /category?action=list
 * 
 * @author ismail.hassan        
 */
@WebServlet(name = "CategoryController", urlPatterns = {"/CategoryController"})
public class CategoryController extends HttpServlet {

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
        try {
            // action yang akan dilakukan ke kategori
            String action = request.getParameter("action");
            
            String redirectURL = "";
            User user = (User) request.getSession().getAttribute("userObj");
            
            // jika tidak ada user yang sedang login, redirect ke halaman utama
            if(user == null) {
                response.sendRedirect(request.getContextPath());
                return;
            }
            
            Category c = new Category();
            c.setNama(request.getParameter("judul"));
            c.setIdUser(user.getId());
            CategoryTable ct = new CategoryTable();
            
            if (request.getMethod().equalsIgnoreCase("POST")) {
                // menambah category baru
                if (action.equals("add")) {
                    
                    ct.add(c);
                    
                    ArrayList<Category> userCategory = (ArrayList) ct.getAllCategory(user.getId());
                    request.setAttribute("userCategory", userCategory);
                    
                    String viewURL = "/dashboard/panel/form-add-category-thread.jsp";
                    request.getServletContext().getRequestDispatcher(viewURL).forward(request, response);
                }
                
                // mengubah category yang sudah ada
                if (action.equals("edit") && request.getParameter("id") != null) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    c.setId(id);
                    ct.update(c);
                    ArrayList<Category> userCategory = (ArrayList)ct.getAllCategory(user.getId());
                    request.setAttribute("userCategory", userCategory);
                    redirectURL = "/dashboard/panel/form-add-category-thread.jsp";
                    RequestDispatcher rd = request.getServletContext().getRequestDispatcher(redirectURL);
                    rd.forward(request, response);
                }
                
                // menghapus category yang sudah ada
                if (action.equals("delete") && request.getParameter("id") != null) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    c.setId(id);
                    ct.delete(c);
                    ArrayList<Category> userCategory = (ArrayList)ct.getAllCategory(user.getId());
                    request.setAttribute("userCategory", userCategory);
                    redirectURL = "/dashboard/panel/form-add-category-thread.jsp";
                    RequestDispatcher rd = request.getServletContext().getRequestDispatcher(redirectURL);
                    rd.forward(request, response);
                }
            }
            
            if (request.getMethod().equalsIgnoreCase("GET")) {
                if (action == null || action.equals("list")) {
                    // tambahkan data tentang kategori milik user
                    ArrayList<Category> userCategory = (ArrayList)ct.getAllCategory(user.getId());
                    request.setAttribute("userCategory", userCategory);
                    
                    redirectURL = "/dashboard/panel/form-add-category-thread.jsp";
                    RequestDispatcher rd = request.getServletContext().getRequestDispatcher(redirectURL);
                    rd.forward(request, response);
                }
                
                if (action.equals("edit")) {
                    // TODO
                }
                
                if (action.equals("delete")) {
                    // TODO
                }
                
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(CategoryController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
//            out.close();
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
