package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pojo.Product;
import service.IProductService;

@Controller 
@RequestMapping("/product")
public class ProductController {
	  @Autowired    
	  private IProductService productService;
	  
	  	@Secured("ROLE_manager")
	    @RequestMapping("/findAll.do")   
	    public ModelAndView findAll() throws Exception 
	    {       
	    	 ModelAndView mv = new ModelAndView();      
	    	 List<Product> products = productService.findAll();       
	    	 mv.addObject("productList", products);       
	    	 mv.setViewName("product-list");   
	    	 return mv;
	    }
	    
	    @RequestMapping("/save.do")   
	    public String save(Product product) throws Exception
	    {       
	    	productService.save(product);        
	    	return "redirect:findAll.do";    
	    }     
}
