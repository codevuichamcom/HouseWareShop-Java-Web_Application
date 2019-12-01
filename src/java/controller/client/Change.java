/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.client;

import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.AccountService;

/**
 *
 * @author ThinkPro
 */
@WebServlet(name = "Change", urlPatterns = {"/Change"})
public class Change extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String displayName = request.getParameter("displayName");
            String password = request.getParameter("password");
            String retypePassword = request.getParameter("retypePassword");
            String email = request.getParameter("email");
            
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            
            Account a = (Account) request.getSession().getAttribute("account");
            Account accountOld = new AccountService().getOne(a.getUserName());
            if(displayName.trim().equals("")){
                displayName=accountOld.getDisplayName();
            }
            if(!password.equals(retypePassword)){
                response.getWriter().println("Password and re-type not the same.");
            }
            if(password.equals("")){
                password=accountOld.getPassword();
            }
            if(email.trim().equals("")){
                email=accountOld.getEmail();
            }
            if(phone.trim().equals("")){
                email=accountOld.getPhone();
            }
            if(address.trim().equals("")){
                address=accountOld.getAddress();
            }
            Account accountNew = Account.builder()
                                 .displayName(displayName)
                                 .password(password)
                                 .email(email)
                                 .phone(phone)
                                 .address(address)
                                 .roleId(accountOld.getRoleId())
                                 .status(accountOld.getStatus())
                                .build();

            boolean check = new AccountService().update(accountNew, a.getUserName());
            if(check){
                response.sendRedirect("my-profile");
            }else{
                response.getWriter().println("Update fail");
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
