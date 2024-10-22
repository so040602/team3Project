package com.team3.controller.product;

import java.util.List;

import com.team3.controller.SuperClass;
import com.team3.model.bean.Product;
import com.team3.model.dao.ProductDao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ProductListController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		ProductDao dao = new ProductDao() ;
		List<Product> lists = dao.selectAll();
		
		request.setAttribute("datalist", lists);
		
		super.gotoPage("product/prdList.jsp");
	}
}
