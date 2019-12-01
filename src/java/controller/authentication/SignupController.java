/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.authentication;

import entity.Account;
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
import service.AccountService;
import service.SendMail;

/**
 *
 * @author ThinkPro
 */
@WebServlet(name = "SignupController", urlPatterns = {"/sign-up"})
public class SignupController extends HttpServlet {

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
            request.getRequestDispatcher("client/signup.jsp").forward(request, response);
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
        String retypePassword = request.getParameter("retypePassword");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        System.out.println("user= " + username);
        System.out.println("pass= " + password);
        System.out.println("re= " + retypePassword);
        System.out.println("phone= " + phone);
        List<Account> listAccount = new AccountService().getAll();
        String warning = "";
        boolean check = false;
        AccountService service = new AccountService();
        if (!password.equals(retypePassword)) {
            warning = "Password and RetypePassword is not the same";
        } else if (!email.matches("^[a-zA-Z]\\w+@([a-zA-Z]\\w+\\.)+[a-zA-Z]\\w+$")) {
            warning = "Email invalid, enter egain";
        } else if (!phone.matches("[0-9]{10,11}")) {
            warning = "Phone just include number and >10 and <11 character";
        } else {
            for (Account A : listAccount) {
                if (A.getUserName().equalsIgnoreCase(username)) {
                    warning = "Username is exist";
                    check = true;
                    break;
                }
                if (A.getEmail() != null && A.getEmail().equalsIgnoreCase(email)) {
                    warning = "Email is exist";
                    check = true;
                    break;
                }
                if (A.getEmail() != null && A.getPhone().equalsIgnoreCase(phone)) {
                    warning = "Phone is exist";
                    check = true;
                    break;
                }
            }
            if (!check) {
                String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                        + "0123456789"
                        + "abcdefghijklmnopqrstuvxyz";

                // create StringBuffer size of AlphaNumericString 
                StringBuilder sb = new StringBuilder(6);

                for (int i = 0; i < 6; i++) {

                    // generate a random number between 
                    // 0 to AlphaNumericString variable length 
                    int index
                            = (int) (AlphaNumericString.length()
                            * Math.random());

                    // add Character one by one in end of sb 
                    sb.append(AlphaNumericString
                            .charAt(index));
                }
                Account account = Account.builder()
                        .userName(username)
                        .password(password)
                        .displayName(username)
                        .email(email)
                        .phone(phone)
                        .roleId(4)
                        .status(2)
                        .activeCode(sb.toString())
                        .build();
                check = service.add(account);

                if (!check) {
                    warning = "account or email or phone is exist";
                }
            } else {
                check = false;
            }

        }
        if (!check) {
            request.setAttribute("warning", warning);
            request.setAttribute("username", username);
            request.setAttribute("password", password);
            request.setAttribute("retypePassword", retypePassword);
            request.setAttribute("email", email);
            request.setAttribute("phone", phone);
            request.getRequestDispatcher("client/errorSignup.jsp").forward(request, response);
        } else {
            
            Account account = new AccountService().getOne(username);
            
            String subject = "Forgot Password";
            String message = "Active code is : " + account.getActiveCode();
            String user = "lehongquan15a@gmail.com";
            String pass = "qU@nIhh313O736";
            SendMail.send(account.getEmail(), subject, message, user, pass);
            request.setAttribute("account", account);
            request.getRequestDispatcher("client/activeCode.jsp").forward(request, response);
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
