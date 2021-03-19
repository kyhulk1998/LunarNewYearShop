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

/**
 *
 * @author USER
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String ADMIN = "admin.jsp";
    private static final String HOME = "home";
//    private static final String SELL = "seller.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;

        try {
            String username = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");

            RegistrationDAO dao = new RegistrationDAO();
            Account acc = dao.checkLogin(username, password);
            
            if (acc == null) {
                request.setAttribute("message", "Đăng nhập thất bại. Tên tài khoản hoặc mật khẩu không đúng!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else if (acc.getIsActive() == 0) {
                request.setAttribute("message", "Đăng nhập thất bại. Tài khoản đã bị vô hiệu hóa.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                if (acc.getIsAdmin() == 1) {
                    url = ADMIN;
                    HttpSession session = request.getSession();
                    session.setAttribute("account", acc);
                } else if (acc.getIsSell() == 1 && acc.getIsAdmin() == 0) {
                    HttpSession session = request.getSession();
                    session.setAttribute("account", acc);
                    session.removeAttribute("cart");
                    url = HOME;
                } else if (acc.getIsSell() == 0 && acc.getIsAdmin() == 0) {
                    HttpSession session = request.getSession();
                    session.setAttribute("account", acc);
                    session.removeAttribute("cart");
                    url = HOME;
                }
            }
        } catch (Exception e) {
            log("ERROR at LoginController" + e.getMessage());
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
