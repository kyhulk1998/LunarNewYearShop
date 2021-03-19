/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kynqh.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import knqh.models.RegistrationDAO;
import kynqh.dtos.Product;

/**
 *
 * @author KyNQH
 */
@WebServlet(name = "GetProductByCateID", urlPatterns = {"/GetProductByCateID"})
public class GetProductByCateID extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int cateID = Integer.parseInt(request.getParameter("id"));
        try {
            RegistrationDAO dao = new RegistrationDAO();
            System.out.println(cateID);
            List<Product> list = dao.getAllProductByCateID(cateID);
            List<Product> listCategory = dao.viewCategory();
            List<Product> maxPriceProduct = dao.viewMaxPriceProduct();
            request.setAttribute("listP", list);
            request.setAttribute("listC", listCategory);
            request.setAttribute("Max", maxPriceProduct);
            request.getRequestDispatcher("home.jsp").forward(request, response);
        } catch (Exception e) {
            log("ERROR at GetProductByCateID: " + e.getMessage());
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
