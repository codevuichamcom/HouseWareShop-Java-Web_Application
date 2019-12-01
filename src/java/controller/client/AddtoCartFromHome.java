/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.client;

import entity.Account;
import entity.Cart;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.ProductService;
import util.NumberHelper;

/**
 *
 * @author ThinkPro
 */
@WebServlet(name = "AddtoCartFromHome", urlPatterns = {"/add-to-cart-from-home"})
public class AddtoCartFromHome extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {


                int productId = NumberHelper.getInt(request.getParameter("id"));
                Product product = new ProductService().getOne(productId);
                Cart cart = Cart.builder()
                        .productId(productId)
                        .productName(product.getName())
                        .productImg(product.getImage())
                        .productPrice(product.getPrice())
                        .productQuantity(product.getQuantity())
                        .quantity(1)
                        .totalPrice(product.getPrice())
                        .build();
                List<Cart> listCart = (List<Cart>) request.getSession().getAttribute("listCart");
                if (listCart == null) {
                    listCart = new ArrayList<>();
                    listCart.add(cart);
                } else {
                    boolean isCheck = true;
                    for (Cart c : listCart) {
                        if (c.getProductId() == productId) {
                            c.setQuantity(c.getQuantity()+ 1);
                            isCheck = false;
                        }
                    }
                    if (isCheck) {
                        listCart.add(cart);
                    }
                }
                String url = (String) request.getSession().getAttribute("url");
                request.getSession().setAttribute("listCart", listCart);
                response.sendRedirect(url);
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
