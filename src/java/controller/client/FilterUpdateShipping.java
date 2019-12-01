/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.client;

import dao.OrderDao;
import entity.Order;
import java.io.IOException;
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

/**
 *
 * @author ThinkPro
 */
@WebFilter(filterName = "FilterUpdateShipping", urlPatterns = {"/*"})
public class FilterUpdateShipping implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        List<Order> listOrder = new OrderDao().getOrderByCustomer();
        listOrder.forEach(System.out::println);
        Date now = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for (int i = 0; i < listOrder.size(); i++) {
                if(listOrder.get(i).getStatus()==2){
                    try {
                    Date date = sdf.parse(listOrder.get(i).getCreateDate());
                    System.out.println("date" + date);
                    if (now.after(date)) {
                        new OrderDao().updateStatus(3, listOrder.get(i).getId());
                    }
                } catch (ParseException ex) {
                    Logger.getLogger(FillterCheckLogined.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
        }
        chain.doFilter(request, response);

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
