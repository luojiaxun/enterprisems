package service;


import java.util.List;

import pojo.Product;

public interface IProductService {

    public List<Product> findAll() throws Exception;

    void save(Product product) throws Exception;
}
