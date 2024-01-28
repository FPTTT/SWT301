/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import model.Category;
import model.Product;

/**
 *
 * @author Admin
 */
@WebServlet(name="addServlet", urlPatterns={"/add"})
public class addServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {       
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("txtId");
        String name = request.getParameter("txtName");
        String quantity_raw = request.getParameter("txtQuantity");
        String price_raw = request.getParameter("txtPrice");
        String date_raw = request.getParameter("txtDate");
        String Description = request.getParameter("txtDescription");
        String image = request.getParameter("txtImage");
        String cid_raw = request.getParameter("category");
        int quantity, cid;
        double price;
        PrintWriter out = response.getWriter();
        out.print(cid_raw);
        try {
            quantity = Integer.parseInt(quantity_raw);
            cid = Integer.parseInt(cid_raw);
            price = Double.parseDouble(price_raw);
            Date date = Date.valueOf(date_raw);
            Category c = new DAO().getCategoryById(cid);
            Product x = new Product(id, name, quantity, price, date, Description, image, c);
            new DAO().addProduct(x);
            response.sendRedirect("manager");
            
        } catch (NumberFormatException e) {
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
