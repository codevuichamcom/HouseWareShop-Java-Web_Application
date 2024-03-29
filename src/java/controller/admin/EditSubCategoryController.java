/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import entity.Category;
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
import service.StatusCategoryService;
import service.StatusProductService;
import service.StatusSubCategoryService;
import service.SubCategoryService;
import util.NumberHelper;

/**
 *
 * @author ThinkPro
 */
@WebServlet(name = "EditSubCategoryController", urlPatterns = {"/edit-sub-category"})
public class EditSubCategoryController extends HttpServlet {

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
             
            int id = NumberHelper.getInt(request.getParameter("id"));
            SubCategory subCategory = new SubCategoryService().getOne(id);
            List<Category> listCategory = new CategoryService().getAll();
            List<SubCategory> listSubCategory = new SubCategoryService().getAll();
            List<StatusProduct> listStatusProduct = new StatusProductService().getAll();
            List<StatusCategory> listStatusCategory = new StatusCategoryService().getAll();
            List<StatusSubCategory> listStatusSubCategory = new StatusSubCategoryService().getAll();

            request.setAttribute("subCategory", subCategory);
            request.setAttribute("listCategory", listCategory);
            request.setAttribute("listSubCategory", listSubCategory);
            request.setAttribute("listStatusProduct", listStatusProduct);
            request.setAttribute("listStatusCategory", listStatusCategory);
            request.setAttribute("listStatusSubCategory", listStatusSubCategory);
            request.getRequestDispatcher("admin/subCategory.jsp").forward(request, response);
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
        
        int id =NumberHelper.getInt(request.getParameter("id"));
        System.out.println("subid = "+id);
        if(id==-1){
            response.sendRedirect("client/error.jsp");
        }else{
            SubCategory subCategoryOld = new SubCategoryService().getOne(id);
            
            String name = request.getParameter("name");
            System.out.println("name = "+name);
            
            if(name.trim().equals("")){
                name=subCategoryOld.getSubCategoryName();
            }
            int category = NumberHelper.getInt(request.getParameter("category"));
            if(category==-1){
                category=subCategoryOld.getCategoryId();
            }
            System.out.println("category= "+category);
            int status = NumberHelper.getInt(request.getParameter("status"));
            if(status==-1){
                status=subCategoryOld.getStatus();
            }
            System.out.println("status = "+status);
            SubCategory subCategoryNew = SubCategory.builder()
                                    .id(id).subCategoryName(name).categoryId(category)
                                    .status(status).build();
            System.out.println("new "+subCategoryNew);
            boolean check =new SubCategoryService().update(subCategoryNew, id);
            System.out.println("check = "+check);
            if(!check){
                request.setAttribute("error", "Update Failed!");
                request.setAttribute("message", "Please go to dashboard and try again!");
                request.getRequestDispatcher("admin/ErrorAdmin.jsp").forward(request, response);
            }else{
                response.sendRedirect("get-sub-category");
            }
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
