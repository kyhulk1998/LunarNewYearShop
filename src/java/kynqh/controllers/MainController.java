/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kynqh.controllers;

import kynqh.controllers.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author USER
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "LoginController";
    private static final String REGISTER = "RegisterController";
    private static final String SEARCHUSER = "SearchController";
    private static final String ENABLE = "EnableController";
    private static final String DISABLE = "DisableController";
    private static final String ADDPRODUCT = "InsertProductController";
    private static final String UPDATEPRODUCT = "UpdateProductController";
    private static final String SEARCHPRODUCT = "SearchProductController";
    private static final String ADDTOCART = "AddToCartController";
    private static final String CONFIRMORDER = "CheckOutController";
    private static final String SEARCHORDER = "SearchOrder";
    private static final String UPDATECART = "UpdateCartController";
    private static final String REMOVEITEM = "RemoveItemController";
    private static final String GETPRODBYCATEID = "GetProductByCateID";
    private static final String CANCELORDERINSEARCH = "CancelOrder";
    private static final String CANCELORDER = "CancelOrderController";

    ;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (action.equals("Login")) {
                url = LOGIN;
            } else if (action.equals("Register")) {
                url = REGISTER;
            } else if (action.equals("GetProductByCateID")) {
                url = GETPRODBYCATEID;
            } else if (action.equals("CancelOrder")) {
                url = CANCELORDERINSEARCH;
            } else if (action.equals("CancelOrderController")) {
                url = CANCELORDER;
            } else if (action.equals("addCart")) {
                url = ADDTOCART;
            } else if (action.equals("searchUser")) {
                url = SEARCHUSER;
            } else if (action.equals("Enable")) {
                url = ENABLE;
            } else if (action.equals("Disable")) {
                url = DISABLE;
            } else if (action.equals("Search")) {
                url = SEARCHPRODUCT;
            } else if (action.equals("searchOrder")) {
                url = SEARCHORDER;
            } else if (action.equals("AddProduct")) {
                url = ADDPRODUCT;
            } else if (action.equals("UpdateProduct")) {
                url = UPDATEPRODUCT;
            } else if (action.equals("confirmOrder")) {
                url = CONFIRMORDER;
            } else if (action.equals("UpdateCart")) {
                url = UPDATECART;
            } else if (action.equals("RemoveItem")) {
                url = REMOVEITEM;
            } else {
                request.setAttribute("ERROR", "Your request is invalid");
            }
        } catch (Exception e) {
            log("ERROR at MainController" + e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
