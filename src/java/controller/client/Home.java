/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.client;

import entity.Account;
import entity.Cart;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.AccountService;
import service.CategoryService;
import service.ProductService;

/**
 *
 * @author ThinkPro
 */
@WebServlet(name = "Home", urlPatterns = {"/home"})
public class Home extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            request.getSession().setAttribute("url", "home");

            Cookie[] cookie = request.getCookies();
            if (cookie != null) {
                String username = null;
                String password = null;
                for (Cookie C : cookie) {
                    if (C.getName().equals("username")) {
                        username = C.getValue();
                    }
                    if (C.getName().equals("password")) {
                        password = C.getValue();
                    }
                    if (username != null && password != null) {
                        break;
                    }
                }
                if (username != null && password != null) {
                    List<Account> accounts = new AccountService().getAll();
                    for (Account A : accounts) {
                        if (A.getUserName().equals(username) && A.getPassword().equals(password)) {
                            Account account = new AccountService().getOne(username);
                            request.getSession().setAttribute("account", account);
                        }
                    }
                }
            }

            List<Product> listTemp = new ProductService().getAll();
            List<Product> listProduct = new ArrayList<>();
            Collections.shuffle(listTemp);
            for (int i = 0; i < 12; i++) {
                listProduct.add(listTemp.get(i));
            }
            
            listTemp = new ProductService().getAllByCategoryId(2);
            List<Product> listMeasurement = new ArrayList<>();
            Collections.shuffle(listTemp);
            for (int i = 0; i < 12; i++) {
                listMeasurement.add(listTemp.get(i));
            }
            
            listTemp = new ProductService().getAllByCategoryId(5);
            List<Product> listHomeAndGarden = new ArrayList<>();
            Collections.shuffle(listTemp);
            for (int i = 0; i < 12; i++) {
                listHomeAndGarden.add(listTemp.get(i));
            }

            listTemp = new ProductService().getAllByCategoryId(1);
            List<Product> listTool = new ArrayList<>();
            Collections.shuffle(listTemp);
            for (int i = 0; i < 12; i++) {
                listTool.add(listTemp.get(i));
            }
            listTemp = new ProductService().sortByDateDsC();
            List<Product> newArrival = new ArrayList<>();
            for (int i = 0; i < 4; i++) {
                newArrival.add(listTemp.get(i));
            }
            List<Category> listCategory = new CategoryService().getAll();
            if(request.getSession().getAttribute("account")==null){
                request.getSession().removeAttribute("listCart");
            }
            
            request.setAttribute("listCategory", listCategory);
            request.setAttribute("listHomeAndGarden", listHomeAndGarden);
            request.setAttribute("listMeasurement", listMeasurement);
            request.setAttribute("listProduct", listProduct);
            request.setAttribute("listTool", listTool);
            request.setAttribute("newArrival", newArrival);
            request.getRequestDispatcher("client/home.jsp").forward(request, response);
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
