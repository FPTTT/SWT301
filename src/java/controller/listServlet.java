/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author Admin
 */
//@WebServlet(name = "listServlet", urlPatterns = {"/list"})
public class listServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");

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
        DAO dao = new DAO();
        String url = "home.jsp";  
        List<Category> list = dao.getAll();
        String cid_raw = request.getParameter("key");
        String search = request.getParameter("search");
        String from_raw = request.getParameter("fromdate");
        String to_raw = request.getParameter("todate");
        String fromprice_raw = request.getParameter("fromprice");
        String toprice_raw = request.getParameter("toprice");
        Double price1, price2;
        Date from, to;
        int cid;
        int start, size, end, page, num, numperpage = 4;
        String npage = request.getParameter("page");
        
        
        try {
            cid = (cid_raw == null) ? 0 : Integer.parseInt(cid_raw);
            price1 = ((fromprice_raw == null) || (fromprice_raw.equals(""))) ? null
                    : Double.parseDouble(fromprice_raw);
            price2 = ((toprice_raw == null) || (toprice_raw.equals(""))) ? null
                    : Double.parseDouble(toprice_raw);
            from = ((from_raw == null) || (from_raw.equals(""))) ? null
                    : Date.valueOf(from_raw);
            to = ((to_raw == null) || (to_raw.equals(""))) ? null
                    : Date.valueOf(to_raw);

            List<Product> products = dao.search(search, from, to, price1, price2, cid);
            
            if(npage == null) {
                page = 1; 
            } else {
                page = Integer.parseInt(npage);
            }
            size = products.size();
            start = (page - 1)*numperpage;
            end = Math.min((page*numperpage), size);
            num = (size % numperpage == 0?(size / numperpage):(size / numperpage) + 1);
            List<Product> listPage = dao.getListByPage(products, start, end);
            
            
            request.setAttribute("cid", cid);
            request.setAttribute("search", search);
            request.setAttribute("fromprice", fromprice_raw);
            request.setAttribute("toprice", toprice_raw);
            request.setAttribute("fromdate", from_raw);
            request.setAttribute("todate", to_raw);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("categories", list);
            request.setAttribute("products", listPage);

        } catch (NumberFormatException e) {
        
            }
            request.getRequestDispatcher(url).forward(request, response);

        

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAO dao = new DAO();
        String url = "home.jsp";
        List<Category> list = dao.getAll();
        String cid_raw = request.getParameter("key");
        String search = request.getParameter("search");
        String from_raw = request.getParameter("fromdate");
        String to_raw = request.getParameter("todate");
        String fromprice_raw = request.getParameter("fromprice");
        String toprice_raw = request.getParameter("toprice");
        Double price1, price2;
        Date from, to;
        int cid;
        int start, size, end, page, num, numperpage = 4;
        String npage = request.getParameter("page");
        
        
        try {
            cid = (cid_raw == null) ? 0 : Integer.parseInt(cid_raw);
            price1 = ((fromprice_raw == null) || (fromprice_raw.equals(""))) ? null
                    : Double.parseDouble(fromprice_raw);
            price2 = ((toprice_raw == null) || (toprice_raw.equals(""))) ? null
                    : Double.parseDouble(toprice_raw);
            from = ((from_raw == null) || (from_raw.equals(""))) ? null
                    : Date.valueOf(from_raw);
            to = ((to_raw == null) || (to_raw.equals(""))) ? null
                    : Date.valueOf(to_raw);

            List<Product> products = dao.search(search, from, to, price1, price2, cid);
            
            if(npage == null) {
                page = 1; 
            } else {
                page = Integer.parseInt(npage);
            }
            size = products.size();
            start = (page - 1)*numperpage;
            end = Math.min((page*numperpage), size);
            num = (size % numperpage == 0?(size / numperpage):(size / numperpage) + 1);
            List<Product> listPage = dao.getListByPage(products, start, end);
            
            request.setAttribute("page", page);
            request.setAttribute("cid", cid);
            request.setAttribute("num", num);
            request.setAttribute("categories", list);
            request.setAttribute("products", listPage);

        } catch (NumberFormatException e) {
        } finally {
            request.getRequestDispatcher(url).forward(request, response);

        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
