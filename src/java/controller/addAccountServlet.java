/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DAOStaff;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

/**
 *
 * @author Admin
 */
@WebServlet(name="addAccountServlet", urlPatterns={"/addaccount"})
public class addAccountServlet extends HttpServlet {
   
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
            out.println("<title>Servlet addAccountServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addAccountServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     private int id;
    private String nameUser;
    private double money;
    private String username;
    private String password;
    private int role;
     * @param request
     * @param response
     * @throws jakarta.servlet.ServletException
     * @throws java.io.IOException
     */
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        
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
        String nameAcc = request.getParameter("txtNameAcc");
        String moneyAcc = request.getParameter("txtMoneyAcc");
        String userAcc = request.getParameter("txtUserAcc");
        String passAcc = request.getParameter("txtPassAcc");
        String roleAcc = request.getParameter("txtRoleAcc");
        double money;
        int role;
        log(nameAcc);
        log(moneyAcc);
        log(userAcc);
        log(passAcc);
        log(roleAcc);
        
        try {
            money = Double.parseDouble(moneyAcc);
            role = Integer.parseInt(roleAcc);
            Account a = new Account(0, nameAcc, money, userAcc, passAcc, role);
            new DAOStaff().addAccount(a);
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
