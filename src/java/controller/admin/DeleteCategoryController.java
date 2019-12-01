/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import entity.Account;
import entity.Product;
import entity.SubCategory;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.AccountService;
import service.CategoryService;
import service.ProductService;
import service.SubCategoryService;
import util.NumberHelper;

/**
 *
 * @author ThinkPro
 */
@WebServlet(name = "DeleteCategoryController", urlPatterns = {"/delete-category"})
public class DeleteCategoryController extends HttpServlet {

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

            if (account != null) {
                List<Account> listAccounts = new AccountService().getAll();
                int check = 0;
                for (Account A : listAccounts) {
                    if (A.getUserName().equals(account.getUserName())
                            && A.getPassword().equals(account.getPassword()) && account.getRoleId() == 1) {
                        check = 1;
                        List<Product> listProduct = new ProductService().getAll();
                        List<SubCategory> listSubCategory = new SubCategoryService().getAll();

                        request.setAttribute("listProduct", listProduct);
                        request.setAttribute("listSubCategory", listSubCategory);
                        request.getRequestDispatcher("admin/management.jsp").forward(request, response);
                    }
                }
                if (check == 0) {
                    response.sendRedirect("client/error.jsp");
                }else{
                    int id = NumberHelper.getInt(request.getParameter("id"));
//                    if(id!=-1)
//                        new CategoryService().remove(id);
                    System.out.println("id-remove= "+id);
                    response.getWriter().println("Delete success");
                }
            } else {
                response.sendRedirect("login");
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
        
        int id = NumberHelper.getInt(request.getParameter("id"));
//            if(id==-1){
//                response.sendRedirect("client/error.jsp");
//            }else{
//                new ProductService().remove(id);
//            }
        System.out.println("id-remove= " + id);
        response.sendRedirect("admin-manager");
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
