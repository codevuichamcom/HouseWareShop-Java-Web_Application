/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.client;

import dao.OrderDao;
import entity.Account;
import entity.Order;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ThinkPro
 */
@WebFilter(filterName = "FillterCheckLogined", urlPatterns = {"/checkout","/add-to-cart-now","/add-to-cart-from-home"
        ,"/prepare-shipping","/admin-manager","/accept-order","/add-account","/add-category","/add-product"
        ,"/add-sub-category","/delete-category","/delete-order","/detail-product","/delete-product"
        ,"/edit-account","/edit-category","/edit-product","/edit-sub-category","/get-accounts"
        ,"/get-categories","/get-products","/get-sub-category","/process-order","/add-to-cart","/delete-account","/get-charts"})
public class FillterCheckLogined implements Filter {
    
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");
        if(account!=null){
            chain.doFilter(request, response);
        }else{
            resp.sendRedirect("login");
        }
    }

   
    @Override
    public void destroy() {        
    }

    /**
     * Init method for this filter
     */
    @Override
    public void init(FilterConfig filterConfig) {        
        
        
    }

    
}
