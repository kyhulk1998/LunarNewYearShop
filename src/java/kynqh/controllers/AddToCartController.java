/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kynqh.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import knqh.models.RegistrationDAO;
import kynqh.dtos.Account;
import kynqh.dtos.CartObj;
import kynqh.dtos.Product;

/**
 *
 * @author KyNQH
 */
@WebServlet(name = "AddToCartController", urlPatterns = {"/AddToCartController"})
public class AddToCartController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try {
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("account");
            
            CartObj shoppingCart = (CartObj) session.getAttribute("cart");
            int proID = Integer.parseInt(request.getParameter("intProID"));
            String proName = request.getParameter("txtProName");
            int price = Integer.parseInt(request.getParameter("intPrice"));
            
            if (account == null) {
                
                if (shoppingCart == null) {
                    shoppingCart = new CartObj();
                }
                Product dto = new Product(proName, proID, price);
                dto.setQuantity(1);
                shoppingCart.addCart(dto);
                session.setAttribute("cart", shoppingCart);
                
            } else {
               
                if (shoppingCart == null) {
                    shoppingCart = new CartObj(account.getUsername());
                }
                Product dto = new Product(proName, proID, price);
                dto.setQuantity(1);
                shoppingCart.addCart(dto);
                session.setAttribute("cart", shoppingCart);
            }

        } catch (Exception e) {
            log("ERROR at AddToCartController: " + e.getMessage());
        } finally {
            response.sendRedirect("home");
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
