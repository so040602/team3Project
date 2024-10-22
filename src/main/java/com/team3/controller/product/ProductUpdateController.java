package com.team3.controller.product;

import java.util.List;

import com.team3.controller.SuperClass;
import com.team3.model.bean.Category;
import com.team3.model.bean.Product;
import com.team3.model.dao.CategoryDao;
import com.team3.model.dao.ProductDao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ProductUpdateController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		CategoryDao cdao = new CategoryDao() ;
		List<Category> lists = cdao.getCategoryList("product", "select") ;
		request.setAttribute("categories", lists);
		
		// 상품 등록과의 다른 점
		// 기존 상품 정보를 기본키를 이용하여 가져 옵니다.
		int pnum = Integer.parseInt(request.getParameter("pnum"));
		
		ProductDao dao = new ProductDao();
		Product bean = dao.getDataByPk(pnum) ;
		
		request.setAttribute("bean", bean);
		
		
		super.gotoPage("product/prUpdateForm.jsp"); 		
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		//MultipartRequest mr = (MultipartRequest)request.getAttribute("mr") ;
		
		Product bean = new Product();
		
		// 수정시 상품 번호는 반드시 챙겨야 합니다.
		//bean.setPnum(super.getNumberData(mr.getParameter("pnum")));
		
		
		//bean.setName(mr.getParameter("name"));
		//bean.setCompany(mr.getParameter("company"));
		
		//bean.setImage01(mr.getFilesystemName("image01"));
		//bean.setImage02(mr.getFilesystemName("image02"));
		//.setImage03(mr.getFilesystemName("image03"));
		
		//bean.setStock(super.getNumberData(mr.getParameter("stock")));			
		//bean.setPrice(super.getNumberData(mr.getParameter("price")));
		
		//bean.setCategory(mr.getParameter("category"));
		//bean.setContents(mr.getParameter("contents"));
		
		//bean.setPoint(super.getNumberData(mr.getParameter("point")));
		
		//bean.setInputdate(mr.getParameter("inputdate"));
		
		ProductDao dao = new ProductDao() ;
		int cnt = -99999 ;
		
		cnt = dao.updateData(bean);
		
		if(cnt == -99999) {
			super.gotoPage("product/prUpdateForm.jsp");
			
		}else {
			new ProductListController().doGet(request, response) ; 
		}
	}
}
