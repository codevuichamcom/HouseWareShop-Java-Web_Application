/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import dao.OrderDao;
import entity.Account;
import entity.Category;
import entity.Order;
import entity.Product;
import entity.StatusCategory;
import entity.StatusProduct;
import entity.StatusSubCategory;
import entity.SubCategory;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.CategoryService;
import service.ProductService;
import service.StatusCategoryService;
import service.StatusProductService;
import service.StatusSubCategoryService;
import service.SubCategoryService;
import util.NumberHelper;

/**
 *
 * @author ThinkPro
 */
@WebServlet(name = "ProcessOrder", urlPatterns = {"/process-order"})
public class ProcessOrder extends HttpServlet {

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
            Account account = (Account) request.getSession().getAttribute("account");
            List<Product> listProduct = new ProductService().getAll();
                        List<Category> listCategory = new CategoryService().getAll();
                        List<SubCategory> listSubCategory = new SubCategoryService().getAll();
                        List<StatusProduct> listStatusProduct = new StatusProductService().getAll();
                        List<StatusCategory> listStatusCategory = new StatusCategoryService().getAll();
                        List<StatusSubCategory> listStatusSubCategory = new StatusSubCategoryService().getAll();
                        int check = NumberHelper.getInt(request.getParameter("check"));
                        List<Order> listOrderWatting=null;
                        if(check==0){
                             listOrderWatting = new OrderDao().getAllSucces();
                        }else{
                            if(check==1){
                             listOrderWatting = new OrderDao().getAllOrderShipping();
                            }else{
                                listOrderWatting = new OrderDao().getAllOrderNotAcceptYet();
                            }
                        }
                        
                        int numOfOrder = new OrderDao().countOrderWatting();
                        request.setAttribute("check", check);
                        request.setAttribute("numOfOrder", numOfOrder);
                        request.setAttribute("listOrderWatting", listOrderWatting);
                        request.setAttribute("listProduct", listProduct);
                        request.setAttribute("listCategory", listCategory);
                        request.setAttribute("listSubCategory", listSubCategory);
                        request.setAttribute("listStatusProduct", listStatusProduct);
                        request.setAttribute("listStatusCategory", listStatusCategory);
                        request.setAttribute("listStatusSubCategory", listStatusSubCategory);
                        request.getRequestDispatcher("admin/processOrder.jsp").forward(request, response);
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
