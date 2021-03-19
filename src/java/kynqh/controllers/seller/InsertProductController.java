/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kynqh.controllers.seller;

import java.io.File;
import java.io.IOException;
import java.io.FileOutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import knqh.models.RegistrationDAO;
import kynqh.dtos.Account;
import kynqh.dtos.Product;
import java.io.InputStream;
import java.io.OutputStream;

/**
 *
 * @author KyNQH
 */
@WebServlet(name = "InsertProductController", urlPatterns = {"/InsertProductController"})

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
public class InsertProductController extends HttpServlet {

    public static final String UPLOAD_DIR = "images";
    public String dbFileName = "";
    public static final String ERROR = "error.jsp";
    public static final String SUCCESS = "ViewProductController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            String productName = request.getParameter("txtProName");
            int price = Integer.parseInt(request.getParameter("productPrice"));
            // session có attr=account sau login
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("account");
            String proOwner = account.getUsername();
            String description = request.getParameter("txtDescription");
            int cateID = Integer.parseInt(request.getParameter("listType"));

            int quantity = Integer.parseInt(request.getParameter("productQuantity"));
            Part part = request.getPart("imgUp");//
            String fileName = extractFileName(part);//file name

            /**
             * *** Get The Absolute Path Of The Web Application ****
             */
            String applicationPath = getServletContext().getRealPath("");
            String uploadPath = applicationPath + File.separator + UPLOAD_DIR;

            System.out.println("applicationPath:" + applicationPath);
            File fileUploadDirectory = new File(uploadPath);
            if (!fileUploadDirectory.exists()) {
                fileUploadDirectory.mkdirs();
            }
            String savePath = uploadPath + File.separator + fileName;
            System.out.println("savePath: " + savePath);
            String sRootPath = new File(savePath).getAbsolutePath();
            System.out.println("sRootPath: " + sRootPath);
            part.write(savePath + File.separator);
//            File fileSaveDir1 = new File(savePath);
            dbFileName = UPLOAD_DIR + File.separator + fileName;
            part.write(savePath + File.separator);

            RegistrationDAO dao = new RegistrationDAO();
            Product product = new Product(productName, price * 1000, proOwner, description, cateID, fileName, quantity);

            if (dao.insertProduct(product)) {
//                url = SUCCESS;
                response.sendRedirect(SUCCESS);
            }
        } catch (Exception e) {
            log("ERROR at InsertProductController: " + e.getMessage());
        }
//        } finally {
//            request.getRequestDispatcher(url).forward(request, response);
//        }
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

    private String extractFileName(Part part) {
        // form-data; name="file"; filename="C:\file1.zip"
        // form-data; name="file"; filename="C:\Note\file2.zip"
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                // C:\file1.zip
                // C:\Note\file2.zip
                String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
                clientFileName = clientFileName.replace("\\", "/");
                int i = clientFileName.lastIndexOf('/');
                // file1.zip
                // file2.zip
                return clientFileName.substring(i + 1);
            }
        }
        return null;
    }
}
