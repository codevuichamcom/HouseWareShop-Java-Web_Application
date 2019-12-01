/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.ImageDao;
import entity.Image;
import java.util.List;

/**
 *
 * @author ThinkPro
 */
public class ImageService implements MethodService<Image>{
    public List<Image> getAllImageByProductId(int id){
        return new ImageDao().getAllImageByProductId(id);
    }

    @Override
    public List<Image> getAll() {
        return new ImageDao().getAll();
    }

    @Override
    public Image getOne(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean add(Image object) {
        return new ImageDao().add(object);
    }

    @Override
    public boolean update(Image object, int id) {
        return new ImageDao().update(object, id);
    }

    @Override
    public boolean remove(int id) {
        return new ImageDao().remove(id);
    }
    public boolean UpdateListImage(List<Image> list, int productId) {
        return new ImageDao().UpdateListImage(list, productId);
    }
    
    public static void main(String[] args) {
        Image image = Image.builder()
                    .productId(80)
                    .imageName("aaaa")
                    .build();
        new ImageService().update(image, 396);
    }
}
