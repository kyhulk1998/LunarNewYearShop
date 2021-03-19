/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kynqh.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import knqh.models.RegistrationDAO;
import kynqh.config.MailConfig;
import kynqh.dtos.CartObj;
import kynqh.dtos.Order;
import kynqh.dtos.OrderDetail;
import kynqh.dtos.Product;

/**
 *
 * @author KyNQH
 */
@WebServlet(name = "CheckOutController", urlPatterns = {"/CheckOutController"})
public class CheckOutController extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String fullName = request.getParameter("txtFullName");
        String address = request.getParameter("txtAddress");
        String phone = request.getParameter("txtPhone");
        String re_mail = request.getParameter("txtMail");
        HttpSession session = request.getSession();
        CartObj cart = (CartObj) session.getAttribute("cart");
        try {
            
            long ordID = new Date().getTime();
            
            Order order = new Order(ordID, cart.getCustomerName(), cart.getTotal(), fullName, address, phone, new Timestamp(new Date().getTime()));
            RegistrationDAO dao = new RegistrationDAO();
            dao.insertOrder(order);
            
            for (Map.Entry<Integer, Product> list : cart.getCart().entrySet()) {
                OrderDetail ordDetail = new OrderDetail(new Date().getTime(), ordID, list.getValue().getProID(), list.getValue().getPrice(), list.getValue().getQuantity());
                dao.insertOrderDetail(ordDetail);
            }
            Properties p = new Properties();
            p.put("mail.smtp.auth", "true");
            p.put("mail.smtp.host", MailConfig.HOST_NAME);
            p.put("mail.smtp.socketFactory.port", MailConfig.SSL_PORT);
            p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            p.put("mail.smtp.port", MailConfig.SSL_PORT);
            
            Session sess = Session.getDefaultInstance(p, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(MailConfig.APP_EMAIL, MailConfig.APP_PASSWORD);
                }
            });
            
            MimeMessage message = new MimeMessage(sess);
            message.setFrom(new InternetAddress(MailConfig.APP_EMAIL));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(re_mail));

            // 3) create HTML content
            message.setSubject("Thông báo #" + ordID);
            String htmlContent = "<h1>Cám ơn bạn đã mua hàng tại shop</h1>"
                    + "Mã đơn hàng của bạn là: " + ordID + " . Vui lòng theo dõi đơn hàng tại <a href='http://localhost:8084/KYNQH_SE62812_Project/searchOrder.jsp'>đây</a> "
                    + ". Cám ơn!";
            message.setContent(htmlContent, "text/html;charset=UTF-8");

            // 4) send message
            Transport.send(message);
            
            session.setAttribute("orderID", ordID);
            session.removeAttribute("cart");
            
        } catch (Exception e) {
            log("ERROR at CheckOutController " + e.getMessage());
        } finally {
            response.sendRedirect("thank.jsp");
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
