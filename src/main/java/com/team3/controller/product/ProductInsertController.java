package com.team3.controller.product;

import java.util.List;

import com.team3.controller.HomeController;
import com.team3.controller.SuperClass;
import com.team3.model.bean.Category;
import com.team3.model.bean.Product;
import com.team3.model.dao.CategoryDao;
import com.team3.model.dao.ProductDao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ProductInsertController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		// Categories 테이블에서 상품에 대한 카테고리 목록을 읽어 와서, request 영역에 바인딩합니다.
		// 상품 등록 jsp 파일에서 콤보 박스에 동적으로 채워 줍니다.
		CategoryDao dao = new CategoryDao() ;
		List<Category> lists = dao.getCategoryList("product", "select") ;
		request.setAttribute("categories", lists);
		
		super.gotoPage("product/prdInsertForm.jsp"); 
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
	
		Product bean = new Product();
		
		bean.setPnum(null); // 상품 번호는 시퀀스가 알아서 처리해 줌
		bean.setPrdname(request.getParameter("prdname"));
		bean.setCompany(request.getParameter("company"));
		
		bean.setImage01((String)request.getAttribute("image01")); // getFilesystemName
		bean.setImage02((String)request.getAttribute("image02")); // getFilesystemName
		bean.setImage03((String)request.getAttribute("image03")); // getFilesystemName
		
		bean.setStock(super.getNumberData(request.getParameter("stock")));			
		bean.setPrice(super.getNumberData(request.getParameter("price")));
		
		bean.setCategory(request.getParameter("category"));
		bean.setContents(request.getParameter("contents"));
		
		bean.setPoint(super.getNumberData(request.getParameter("point")));
		
		bean.setInputdate(request.getParameter("inputdate"));
		
		ProductDao dao = new ProductDao() ;
		int cnt = -99999 ;
		
		cnt = dao.insertData(bean);
		
		if(cnt == -99999) {
			super.gotoPage("product/prdInsertForm.jsp"); 
		}else {
			// 차후 상품 목록 페이지로 이동할 예정입니다.
			//new HomeController().doGet(request, response) ;
			new ProductListController().doGet(request, response) ; 
		}		
	}
}






