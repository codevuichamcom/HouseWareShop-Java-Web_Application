/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.MethodDao;
import dao.ProductDao;
import entity.Product;
import java.util.List;

/**
 *
 * @author ThinkPro
 */
public class ProductService implements MethodService<Product>{

    MethodDao<Product> md =new ProductDao();
     /**
      * 
      * @inheritDOc
      */
    @Override
    public List<Product> getAll() {
        return md.getAll();
    }

    @Override
    public Product getOne(int id) {
        return md.getOne(id);
    }

    @Override
    public boolean add(Product object) {
        return md.add(object);
    }

    @Override
    public boolean update(Product object, int id) {
        return md.update(object, id);
    }

    @Override
    public boolean remove(int id) {
        return md.remove(id);
    }
    
    public List<Product> getAllByCategoryId(int categoryId) {
        return new ProductDao().getAllByCategoryId(categoryId);
    }
    
    public List<Product> getAllBySubCategoryId(int subCategoryId) {
        return new ProductDao().getAllBySubCategoryId(subCategoryId);
    }
    
    public List<Product> search(String text,int pageindex, int pagesize) {
        return new ProductDao().search(text, pageindex, pagesize);
    }
    
    public List<Product> sortByNameAsc() {
        return new ProductDao().sortByNameAsc();
    }
    
    public List<Product> getAllFreeShip(){
        return new ProductDao().getAllFreeShip();
    }
    
    public List<Product> sortByDateDsC() {
        return new ProductDao().sortByDateDsC();
    }
    
    public List<Product> getAllbyRangeMoney(double min, double max) {
        return new ProductDao().getAllByRangeMoney(min, max);
    }
    
    public List<Product> getAllProductAreSaling(){
        return new ProductDao().getAllProductAreSaling();
    }
    public int addProductReturnProductId(Product obj) {
        return new ProductDao().addProductReturnProductId(obj);
    }
    public List<Product> getAllPaging(int pageindex, int pagesize) {
        return new ProductDao().getAllPaging(pageindex, pagesize);
    }
    public int countPage() {
        return new ProductDao().countPage();
    }
    public List<Product> getAllByCategoryIdPaging(int categoryId, int pageindex, int pagesize) {
        return new ProductDao().getAllByCategoryIdPaging(categoryId, pageindex, pagesize);
    }
    public List<Product> getAllBySubCategoryIdPaging(int subCategoryId,int pageindex, int pagesize) {
        return new ProductDao().getAllBySubCategoryIdPaging(subCategoryId, pageindex, pagesize);
    }
    public int countPageByCategory(int id) {
        return new ProductDao().countPageByCategory(id);
    }
    public int countPageBySubCategory(int id) {
        return new ProductDao().countPageBySubCategory(id);
    }
    public List<Product> sortAllAttribute(int price,double min,double max, int news, int free,int pageindex, int pagesize){
        return new ProductDao().sortAllAttribute(price, min, max, news, free, pageindex, pagesize);
    }
    public int countPageByAllAttribute(int price,double min,double max, int news, int free) {
        return new ProductDao().countPageByAllAttribute(price, min, max, news, free);
    }
    
    public int countProduct() {
        return new ProductDao().countProduct();
    }
    public List<Integer> countProductGroupByCategoryId() {
        return new ProductDao().countProductGroupByCategoryId();
    }
    
    public int countProductWhenSearch(String text) {
        return new ProductDao().countProductWhenSearch(text);
    }
}
