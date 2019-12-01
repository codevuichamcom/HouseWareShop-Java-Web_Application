/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.ShippingDao;
import entity.Shipping;

/**
 *
 * @author ThinkPro
 */
public class ShippingService {
    public int addShippingReturnId(Shipping shipping) {
        return new ShippingDao().addShippingReturnId(shipping);
    }
}
