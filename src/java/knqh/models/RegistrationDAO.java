/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package knqh.models;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import knqh.db.MyConnection;
import kynqh.dtos.Account;
import kynqh.dtos.Order;
import kynqh.dtos.OrderDetail;
import kynqh.dtos.Product;

/**
 *
 * @author USER
 */
public class RegistrationDAO implements Serializable {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    public RegistrationDAO() {
    }

    private void closeConnection() throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (preStm != null) {
            preStm.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
// login + register

    public Account checkLogin(String usr, String pwd) throws Exception {
        Account acc = null;
        try {
            String sql = "Select username, password, isSell, isAdmin, isActive From Account Where username = ? and password = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, usr);
            preStm.setString(2, pwd);
            rs = preStm.executeQuery();
            if (rs.next()) {
                acc = new Account(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5));
            }
        } finally {
            closeConnection();
        }
        return acc;
    }

    public boolean registerNormalAccount(Account acc) throws Exception {
        boolean check = false;
        try {
            String sql = "Insert Into Account(username, password, isSell, isAdmin, isActive) values (?,?,?,0,1)";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, acc.getUsername());
            preStm.setString(2, acc.getPassword());
            preStm.setInt(3, acc.getIsSell());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
//Admin page

    public List<Account> findByUsername(String search) throws Exception {
        List<Account> result = null;
        String username;
        int isSell, isActive, isAdmin;
        Account acc = null;
        try {
            String sql = "Select username, isSell, isAdmin, isActive "
                    + "From Account WHERE username LIKE ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + search + "%");
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                username = rs.getString("username");
                isSell = rs.getInt("isSell");
                isAdmin = rs.getInt("isAdmin");
                isActive = rs.getInt("isActive");
                acc = new Account(username, isSell, isAdmin, isActive);
                result.add(acc);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean disableAccount(String username) throws Exception {
        boolean check = false;
        try {
            String sql = "Update Account set isActive=0 Where username=?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, username);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean enableAccount(String username) throws Exception {
        boolean check = false;
        try {
            String sql = "Update Account set isActive = 1 Where username=?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, username);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
//seller page

    public boolean insertProduct(Product product) throws Exception {
        boolean check = false;
        try {
            String sql = "INSERT INTO Product(proName, price, proOwner, description, cateID, imgName, quantity) values (?,?,?,?,?,?,?)";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, product.getProName());
            preStm.setInt(2, product.getPrice());
            preStm.setString(3, product.getProOwner());
            preStm.setString(4, product.getDescription());
            preStm.setInt(5, product.getCateID());
            preStm.setString(6, product.getImgName());
            preStm.setInt(7, product.getQuantity());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean updateProduct(Product prod) throws Exception {
        boolean check = false;
        try {
            String sql = "UPDATE Product SET description=?, price=?, quantity=? WHERE proID=?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, prod.getDescription());
            preStm.setInt(2, prod.getPrice());
            preStm.setInt(3, prod.getQuantity());
            preStm.setInt(4, prod.getProID());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public List<Product> viewProductByProOwner(String proOwner) throws Exception {
        List<Product> result = null;
        String proName, description, imgName;
        int proID, price, cateID, quantity;
        Product product = null;
        try {
            String sql = "Select proID, proName, proOwner, price, [description], cateID, imgName, quantity from Product where proOwner = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, proOwner);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                proID = rs.getInt("proID");
                proName = rs.getString("proName");
                proOwner = rs.getString("proOwner");
                price = rs.getInt("price");
                description = rs.getString("description");
                cateID = rs.getInt("cateID");
                imgName = rs.getString("imgName");
                quantity = rs.getInt("quantity");

                product = new Product(proID, proName, price, proOwner, description, cateID, imgName, quantity);
                result.add(product);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<Map> viewOrderBySeller(String proOwner) throws Exception {
        List<Map> result = new ArrayList<Map>();
        long ordID, orderDetailID;
        String proName, imgName, customerName, fullName, phoneNumber, address;
        int price, quantity, status, proID;
        Timestamp date;
        try {
            String sql = "Select UserOrder.ordID as ordID,OrderDetail.proID as proID,Order_Detail_ID as orderDetailID,proName,imgName, Customer_Name as customerName,OrderDetail.price as price,"
                    + "OrderDetail.Quantity as quantity,FullName,PhoneNumber,[Date],[Address], [Status] From ((OrderDetail JOIN Product ON OrderDetail.proID = Product.proID) \n"
                    + "JOIN UserOrder ON UserOrder.ordID = OrderDetail.ordID) where proOwner=?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, proOwner);
            rs = preStm.executeQuery();
            while (rs.next()) {
                ordID = rs.getLong("ordID");
                proID = rs.getInt("proID");
                orderDetailID = rs.getLong("orderDetailID");
                proName = rs.getString("proName");
                imgName = rs.getString("imgName");
                customerName = rs.getString("customerName");
                price = rs.getInt("price");
                quantity = rs.getInt("quantity");
                fullName = rs.getString("FullName");
                phoneNumber = rs.getString("PhoneNumber");
                date = rs.getTimestamp("Date");
                address = rs.getString("Address");
                status = rs.getInt("Status");

                Map map = new HashMap();
                map.put("ordID", ordID);
                map.put("proID", proID);
                map.put("orderDetailID", orderDetailID);
                map.put("proName", proName);
                map.put("imgName", imgName);
                map.put("customerName", customerName);
                map.put("price", price);
                map.put("quantity", quantity);
                map.put("fullName", fullName);
                map.put("phoneNumber", phoneNumber);
                map.put("address", address);
                map.put("date", date);
                map.put("status", status);
                result.add(map);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    //Manage Order
    public List<Order> viewOrderCustomerName(String customerName) throws Exception {
        List<Order> list = new ArrayList<>();
        long ordID;
        float amount;
        String fullName, phoneNumber, address;
        int status;
        Timestamp date;
        Order ord = null;
        try {
            String sql = "SELECT ordID, Amount, FullName, PhoneNumber, Date, Address, Status From UserOrder where Customer_Name = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, customerName);
            rs = preStm.executeQuery();
            while (rs.next()) {
                ordID = rs.getLong("ordID");
                amount = rs.getFloat("Amount");
                fullName = rs.getString("Fullname");
                phoneNumber = rs.getString("PhoneNumber");
                address = rs.getString("Address");
                status = rs.getInt("Status");
                date = rs.getTimestamp("Date");

                ord = new Order(ordID, amount, fullName, address, phoneNumber, date, status);
                list.add(ord);
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public List<Order> findOrderByOrderID(long ordID) throws Exception {
        List<Order> result = new ArrayList<>();
        String customerName;
        float amount;
        String fullName, phoneNumber, address;
        int status;
        Timestamp date;
        Order ord = null;
        try {
            String sql = "SELECT ordID, Amount, FullName, PhoneNumber, Date, Address, Status, Customer_Name From UserOrder where ordID = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setLong(1, ordID);
            rs = preStm.executeQuery();
            while (rs.next()) {
                customerName = rs.getString("Customer_Name");
                amount = rs.getFloat("Amount");
                fullName = rs.getString("Fullname");
                phoneNumber = rs.getString("PhoneNumber");
                address = rs.getString("Address");
                status = rs.getInt("Status");
                date = rs.getTimestamp("Date");

                ord = new Order(ordID, customerName, amount, fullName, address, phoneNumber, date, status);
                result.add(ord);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean cancelOrder(long ordID) throws Exception {
        boolean check = false;
        try {
            String sql = "Update UserOrder set Status=0 Where ordID=?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setLong(1, ordID);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean cancelOrderWithCustomerName(long ordID, String customerName) throws Exception {
        boolean check = false;
        try {
            String sql = "Update UserOrder set Status=0 Where ordID=? and Customer_Name=?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setLong(1, ordID);
            preStm.setString(2, customerName);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    //HomePage
    public List<Product> viewAllProduct() throws Exception {
        List<Product> result = new ArrayList<>();
        String proName, imgName, description;
        int price, cateID, proID;

        try {
            String sql = "SELECT proID,description, proName, imgName, price, cateID FROM Product";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            while (rs.next()) {
                proName = rs.getString("proName");
                imgName = rs.getString("imgName");
                description = rs.getString("description");
                price = rs.getInt("price");
                cateID = rs.getInt("cateID");
                proID = rs.getInt("proID");
                result.add(new Product(proID, proName, imgName, description, price, cateID));
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<Product> viewCategory() throws Exception {
        List<Product> result = new ArrayList<>();
        int cateID;
        try {
            String sql = "SELECT cateID from Category";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            while (rs.next()) {
                cateID = rs.getInt("cateID");
                result.add(new Product(cateID));
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<Product> searchByProductName(String txtSearchProduct) throws Exception {
        List<Product> result = new ArrayList<>();
        String proName, imgName, description;
        int price, cateID, proID;
        try {
            String sql = "SELECT proID, proName,description, imgName, price, cateID FROM Product WHERE proName LIKE ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + txtSearchProduct + "%");
            rs = preStm.executeQuery();
            while (rs.next()) {
                proName = rs.getString("proName");
                imgName = rs.getString("imgName");
                description = rs.getString("description");
                price = rs.getInt("price");
                cateID = rs.getInt("cateID");
                proID = rs.getInt("proID");
                result.add(new Product(proID, proName, imgName, description, price, cateID));
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<Product> getAllProductByCateID(int cateID) throws Exception {
        List<Product> result = new ArrayList<>();
        String proName, imgName, description;
        int price, proID;
        try {
            String sql = "SELECT proID, proName,description, imgName, price, cateID FROM Product WHERE cateID = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, cateID);
            rs = preStm.executeQuery();
            while (rs.next()) {
                proName = rs.getString("proName");
                imgName = rs.getString("imgName");
                description = rs.getString("description");
                price = rs.getInt("price");
                cateID = rs.getInt("cateID");
                proID = rs.getInt("proID");
                result.add(new Product(proID, proName, imgName, description, price, cateID));
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<Product> viewMaxPriceProduct() throws Exception {
        List<Product> result = new ArrayList<>();
        String proName, imgName, description;
        int price, cateID, proID;
        try {
            String sql = "SELECT proID, proName,description, imgName, price , cateID FROM Product where price = (SELECT MAX(price) FROM Product)";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            while (rs.next()) {
                proName = rs.getString("proName");
                imgName = rs.getString("imgName");
                price = rs.getInt("price");
                description = rs.getString("description");
                cateID = rs.getInt("cateID");
                proID = rs.getInt("proID");
                result.add(new Product(proID, proName, imgName, description, price, cateID));
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    // Check out
    public boolean insertOrder(Order order) throws Exception {
        boolean check = false;
        try {
            String sql = "INSERT INTO UserOrder(ordID,Customer_Name,Amount,FullName,Address,PhoneNumber,Date,Status) VALUES (?,?,?,?,?,?,?,1)";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setLong(1, order.getOrdID());
            preStm.setString(2, order.getCustomerName());
            preStm.setFloat(3, order.getAmount());
            preStm.setString(4, order.getFullName());
            preStm.setString(5, order.getAddress());
            preStm.setString(6, order.getPhoneNumber());
            preStm.setTimestamp(7, order.getDate());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean insertOrderDetail(OrderDetail orderDetail) throws Exception {
        boolean check = false;
        try {
            String sql = "INSERT INTO OrderDetail VALUES (?,?,?,?,?)";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setLong(1, orderDetail.getOrderDetailID());
            preStm.setLong(2, orderDetail.getOrdID());
            preStm.setInt(3, orderDetail.getProID());
            preStm.setInt(4, orderDetail.getPrice());
            preStm.setInt(5, orderDetail.getQuantity());

            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

}
