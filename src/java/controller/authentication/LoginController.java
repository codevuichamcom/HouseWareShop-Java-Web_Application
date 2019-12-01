/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.authentication;

import entity.Account;
import entity.Category;
import java.io.IOException;
import java.io.PrintWriter;
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

/**
 *
 * @author ThinkPro
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

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
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("account");
            if (account == null) {
                request.getRequestDispatcher("client/login.jsp").forward(request, response);
            } else {
                response.sendRedirect("home");
            }
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

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");

        List<Account> accounts = new AccountService().getAll();
        int check = 0;
        for (Account A : accounts) {
            if (A.getUserName().equals(username) && A.getPassword().equals(password)) {
                check = 1;
                Account account = new AccountService().getOne(username);
                request.getSession().setAttribute("account", account);
                if (remember != null) {
                    Cookie uUser = new Cookie("username", username);
                    uUser.setMaxAge(24 * 3600);
                    Cookie uPass = new Cookie("password", password);
                    uPass.setMaxAge(24 * 3600);
                    response.addCookie(uUser);
                    response.addCookie(uPass);
                }
                if(account.getStatus()==3){
                    check=3;
                    break;
                }else{
                if(account.getRoleId()==1){
                    response.sendRedirect("admin-manager");
                }else{
                    if(account.getStatus()==2){
                        request.getRequestDispatcher("client/activeCode.jsp").forward(request, response);
                    }else{
                        response.sendRedirect("home");
                    }
                    break;
                }
                }
                
            }
        }
        if (check == 0) {
            String warning = "Username or password is incorrect";
            request.setAttribute("warning", warning);
            request.getRequestDispatcher("client/errorLogin.jsp").forward(request, response);
        }
        if(check==3){
            String warning = "You do not have access to this website";
            request.setAttribute("warning", warning);
            request.getRequestDispatcher("client/errorLogin.jsp").forward(request, response);
        }

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
