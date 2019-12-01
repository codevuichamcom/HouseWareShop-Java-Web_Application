/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import dao.OrderDao;
import dao.ThongKeOrderDao;
import dao.ViewDao;
import entity.Category;
import entity.Order;
import entity.Product;
import entity.StatusCategory;
import entity.StatusProduct;
import entity.StatusSubCategory;
import entity.SubCategory;
import entity.ThongkeOrder;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.AccountService;
import service.CategoryService;
import service.ProductService;
import service.StatusCategoryService;
import service.StatusProductService;
import service.StatusSubCategoryService;
import service.SubCategoryService;

/**
 *
 * @author ThinkPro
 */
@WebServlet(name = "GetChart", urlPatterns = {"/get-charts"})
public class GetChart extends HttpServlet {

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
            List<Product> listProduct = new ProductService().getAll();
            List<Category> listCategory = new CategoryService().getAll();
            List<SubCategory> listSubCategory = new SubCategoryService().getAll();
            List<StatusProduct> listStatusProduct = new StatusProductService().getAll();
            List<StatusCategory> listStatusCategory = new StatusCategoryService().getAll();
            List<StatusSubCategory> listStatusSubCategory = new StatusSubCategoryService().getAll();
//                        List<Order> listOrderWatting = new OrderDao().getOrderNotSuccesYetByCustomer(account.getUserName(), 4);
            int numOfOrder = new OrderDao().countOrderWatting();
            int count = new ViewDao().getView();
            int count2 = new ProductService().countProduct();
            int count3 = new AccountService().countAccount();
            int count4 = new SubCategoryService().countSubCategory();
            String label="";
            String soluong="";
            List<Integer> soluongProduct = new ProductService().countProductGroupByCategoryId();
            for (Category C : listCategory) {
                label+="\""+C.getCategory()+"\",";
            }
            label.substring(0,label.length()-1);
            for (Integer integer : soluongProduct) {
                soluong+=(double)Math.round((((double)integer/count2)*100)*100)/100+",";
            }
            soluong.substring(0, soluong.length()-1);
            List<Double> listRevenue = new ArrayList<>();
//            for(int i=7;i<=12;i++){
                double a = new OrderDao().calRevenueInMonth(11);
                listRevenue.add(a);
//            }
            String revenue="";
            for (Double double1 : listRevenue) {
                revenue+=(double)Math.round(double1*100)/100+",";
            }
            revenue.substring(0, revenue.length()-1);
             System.out.println("sss"+revenue);
            
             String thu="";
             String data="";
             List<ThongkeOrder> listThongKe = new ThongKeOrderDao().getAll();
             for (ThongkeOrder T : listThongKe) {
                thu+="\""+T.getThu()+"\", ";
                data+=T.getNumOfOrder()+",";
            }
             
            
            request.setAttribute("thu", thu);
            request.setAttribute("data", data);
            request.setAttribute("label", label);
            request.setAttribute("soluong", soluong);
            request.setAttribute("revenue", revenue);
            request.setAttribute("view", count);
            request.setAttribute("numSubCategory", count4);
            request.setAttribute("numAccount", count3);
            request.setAttribute("numProduct", count2);
            request.setAttribute("numOfOrder", numOfOrder);
//                        request.setAttribute("listOrderWatting", listOrderWatting);
            request.setAttribute("listProduct", listProduct);
            request.setAttribute("listCategory", listCategory);
            request.setAttribute("listSubCategory", listSubCategory);
            request.setAttribute("listStatusProduct", listStatusProduct);
            request.setAttribute("listStatusCategory", listStatusCategory);
            request.setAttribute("listStatusSubCategory", listStatusSubCategory);
            request.getRequestDispatcher("admin/chart.jsp").forward(request, response);
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
