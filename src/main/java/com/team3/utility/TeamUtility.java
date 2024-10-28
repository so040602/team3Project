package com.team3.utility;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Paths;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import com.team3.controller.SuperController;

//import com.oreilly.servlet.MultipartRequest;
//import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part; 

public class TeamUtility {

//	public static void deleteOldImageFile(String webPath, MultipartRequest mr) {
//		// 상품 등록시 업로드 했던 이미지 정보를 웹 서버 경로에서 삭제하도록 합니다.
//		String[] deleteImages = {
//			mr.getParameter("deleteImage01"),
//			mr.getParameter("deleteImage02"),
//			mr.getParameter("deleteImage03")
//		}; 
//		
//		for(String delFile : deleteImages) {
//			if(delFile != null) {
//				String deleteFile = webPath + "/" + delFile ;
//				File target = new File(deleteFile) ;
//				if(target.delete()) {
//					System.out.println(deleteFile + " file delete success"); 
//				}
//			}
//		}
//	}
	
//	public static MultipartRequest getMultipartRequest(HttpServletRequest request, String uploadPath) {
//		// 파일 업로드와 관련된 `멀티 파트` 객체를 구하여 반환합니다.
//		
//		MultipartRequest mr = null ;
//		int maxPostSize = 1024 * 1024 * 10;
//		String ENCODING = "UTF-8" ;
//		
//        //fileSizeThreshold = 1024 * 1024;
//        //maxFileSize = 1024 * 1024 * 5;
//        //maxRequestSize = 1024 * 1024 * 10;
//		
//		try {
//			mr = new MultipartRequest(
//					request,
//					uploadPath,
//					maxPostSize,
//					ENCODING,
//					new DefaultFileRenamePolicy()
//				);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}		
//				
//		return mr ;
//	}	

	public static void handleMultipartRequest_deprecated
		(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		MultipartRequest mr = null ;
//		int maxPostSize = 1024 * 1024 * 10;
//		String ENCODING = "UTF-8" ;
//		
//      //fileSizeThreshold = 1024 * 1024;
//      //maxFileSize = 1024 * 1024 * 5;
//      //maxRequestSize = 1024 * 1024 * 10;
		
	    // Gets the file part from the request
	    Part filePart = request.getPart("file");
	    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
	        
	    // Define the upload path
	    String uploadPath = AppConfig.getInstance().getFileUploadPath();
	        
	    // Write file to the upload path
	    filePart.write(uploadPath + File.separator + fileName);
	}
	
	/*
	* https://velog.io/@yu-jin-song/Servlet-JSP-Servlet-5.0-jakarta-%ED%8C%8C%EC%9D%BC-%EC%B2%98%EB%A6%AC-1-%EC%97%85%EB%A1%9C%EB%93%9C 
	*/
	
	public static Map<String, String> getSettingMap(String settingFileName) {
		// settingFileName 파일을 이용하여 전역적으로 참조할 항목들을 map 컬렉션에 담아서 반환합니다.
		Map<String, String> map = new HashMap<String, String>();
		
		Properties prop = null ;
		prop = getPropertiesData(settingFileName);
		
		Enumeration<Object> keys = prop.keys() ;
		
		while(keys.hasMoreElements()) {
			String key = keys.nextElement().toString();
			String value = prop.getProperty(key) ;
			
			try { // 한글 깨짐 방지				
				map.put(key, new String(value.getBytes("ISO-8859-1"), "UTF-8"));
				
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
	
		return map;
	}
	

	private static Properties getPropertiesData(String filename) {
		// 스트림을 이용하여 프로퍼티 목록을 생성하여 반환합니다.
		Properties prop = null ;
		FileInputStream fis = null ;
		
		try {
			fis = new FileInputStream(filename) ;
			prop = new Properties() ;
			prop.load(fis); 
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			try {
				if(fis != null) {fis.close();}
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return prop;
	}

	public static Map<String, SuperController> getTodolistMap(String filename) {
		// properties 파일의 내용을 읽어서, 모두 객체 형태로 만들고, 이를 Map 컬렉션에 담아서 반환합니다.
		
		Map<String, SuperController> map = new HashMap<String, SuperController>();
		
		Properties prop = getPropertiesData(filename);
//		System.out.println("프로퍼티 정보들");
//		System.out.println(prop);
		
		Enumeration<Object> keys = prop.keys() ;
		
		while(keys.hasMoreElements()) {
			String command = keys.nextElement().toString() ; // 강등
			String className = prop.getProperty(command) ;
//			System.out.println(command + "/" + className );
			
			try {
				// 동적 객체 생성
				Class<?> handleClass = Class.forName(className);
				
				// 강등을 이용한 컨트롤러 생성
				SuperController controller 
					= (SuperController)handleClass.getDeclaredConstructor().newInstance();
				
				map.put(command, controller); // 맵 컬렉션에 담기
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return map;
	}

	
	public static Map<String, SuperController> getControllerMap() {
		// 전역적으로 참조할 항목들을 map 컬렉션에 담아서 반환합니다.
		Map<String, String> opsMap = new HashMap<String, String>();
		Map<String, SuperController> controllrMap = new HashMap<String, SuperController>();
		
		// home section
		opsMap.put("home", "com.team3.controller.HomeController");
		
		// member section
		opsMap.put("memInsert", "com.team3.controller.member.MemberInsertController");
		opsMap.put("memDetail", "com.team3.controller.member.MemberDetailController");
		opsMap.put("memUpdate", "com.team3.controller.member.MemberUpdateController");
		//opsMap.put("memDelete", "com.team3.controller.member.MemberDeleteController");
		opsMap.put("memList",   "com.team3.controller.member.MemberListController");
		opsMap.put("memLogin",  "com.team3.controller.member.MemberLoginController");
		opsMap.put("memLogout", "com.team3.controller.member.MemberLogoutController");
				
		// user auth section
		opsMap.put("userAuthStart", "com.team3.controller.member.UserAuthStartController");
		opsMap.put("userCardParse", "com.team3.controller.member.UserCardAuthController");

		// aibbs section
		opsMap.put("aibbsInsert", "com.team3.controller.aibbs.AibbsInsertController");
		opsMap.put("aibbsDetail", "com.team3.controller.aibbs.AibbsDetailController");
		opsMap.put("aibbsUpdate", "com.team3.controller.aibbs.AibbsUpdateController");
		opsMap.put("aibbsDelete", "com.team3.controller.aibbs.AibbsDeleteController");
		opsMap.put("aibbsList",   "com.team3.controller.aibbs.AibbsListController");
		
		// board section
		opsMap.put("brdInsert", "com.team3.controller.board.BoardInsertController");
		opsMap.put("brdDetail", "com.team3.controller.board.BoardDetailController");
		opsMap.put("brdUpdate", "com.team3.controller.board.BoardUpdateController");
		opsMap.put("brdDelete", "com.team3.controller.board.BoardDeleteController");
		opsMap.put("brdList",   "com.team3.controller.board.BoardListController");
	
		// product section
		opsMap.put("prdInsert", "com.team3.controller.product.ProductInsertController");
		opsMap.put("prdDetail", "com.team3.controller.product.ProductDetailController");
		opsMap.put("prdUpdate", "com.team3.controller.product.ProductUpdateController");
		//opsMap.put("prdDelete", "com.team3.controller.product.ProductDeleteController");
		opsMap.put("prdList",   "com.team3.controller.product.ProductListController");
		
		// mall section
		opsMap.put("maInsert",   "com.team3.controller.mall.MallInsertController");
		opsMap.put("maUpdate",   "com.team3.controller.mall.MallUpdateController");
		opsMap.put("maDelete",   "com.team3.controller.mall.MallDeleteController");
		opsMap.put("maList",     "com.team3.controller.mall.MallListController");
		opsMap.put("maDetail",   "com.team3.controller.mall.MallDetailController");
		opsMap.put("maHistory",  "com.team3.controller.mall.MallHistoryController");
		opsMap.put("maCalculate","com.team3.controller.mall.MallCalculateController");

		// view section
		opsMap.put("vwList",   "com.team3.controller.view.ViewListController");
		opsMap.put("vwExam01", "com.team3.controller.view.View01Controller");
		opsMap.put("vwExam02", "com.team3.controller.view.View02Controller");
		opsMap.put("vwExam03", "com.team3.controller.view.View03Controller");
		opsMap.put("vwExam04", "com.team3.controller.view.View04Controller");
		opsMap.put("vwExam05", "com.team3.controller.view.View05Controller");

		
		// book section
		opsMap.put("bookList", "com.team3.controller.book.BookListController");
		opsMap.put("bookDetail", "com.team3.controller.book.BookDetailController");
		opsMap.put("bookMain", "com.team3.controller.book.BookMainController");
		opsMap.put("bookCategory", "com.team3.controller.book.BookCategoryController");
		opsMap.put("bookSearch", "com.team3.controller.book.BookSearchController");	
		// big data section
		//opsMap.put("bigCorr01","com.team3.controller.bigdata.corr01Controller");
		
		for ( String key : opsMap.keySet() ) {
			String opsmode = key;
			String className = opsMap.get(key) ;
				
			try {
				// 동적 객체 생성
				Class<?> handleClass = Class.forName(className);
				
				// 강등을 이용한 컨트롤러 생성
				SuperController controller 
					= (SuperController)handleClass.getDeclaredConstructor().newInstance();
				
				controllrMap.put(opsmode, controller); // 맵 컬렉션에 담기
				System.out.println(opsmode + "/" + controllrMap.get(key));
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		System.out.println(controllrMap);
		return controllrMap;
			
	}
	
//	
//	public static String getSavedFileDirectoryPath() {
//        Properties properties = new Properties();
//        try (InputStream input =
//                     FileUtil.class.getClassLoader().getResourceAsStream("config.properties")
//        ) {
//            properties.load(input);
//            return properties.getProperty("saved.directory");
//        } catch (IOException ex) {
//            ex.printStackTrace();
//            return null; // 또는 기본값을 반환
//        }
//    }
//
//    /**
//     * 업로드 디렉토리가 존재하는지 확인하고, 존재하지 않으면 생성
//     *
//     * @return 파일 업로드 디렉토리
//     */
//    public static File getUploadDirectory() {
//
//        String directoryPath = getSavedFileDirectoryPath();
//
//        // 파일을 upload 할 directory 생성
//        File uploadDirectory = new File(directoryPath);
//        if (!uploadDirectory.exists()) {
//            uploadDirectory.mkdirs();
//        }
//
//        return uploadDirectory;
//    }
//
//    private FileVO handleUploadFile(
//            HttpServletRequest request,
//            File uploadDir
//    ) throws IOException, ServletException {
//        // 파일 처리
//        Part filePart = request.getPart("upload_file");
//        
//        return saveFileAndGetVO(part, uploadDir);
//    }
//
//    private FileVO saveFileAndGetVO(Part part, File uploadDir) throws IOException {
//        // 파일 원본 이름, 확장자, 저장 이름 추출
//        String originalName = part.getSubmittedFileName();
//        String extension = FilenameUtils.getExtension(originalName);
//        String savedName = UUID.randomUUID() + "_" + originalName;
//        File file = new File(uploadDir, savedName);
//
//        // 파일 저장
//        try (InputStream inputStream = part.getInputStream();
//             OutputStream outputStream = Files.newOutputStream(file.toPath())) {
//            inputStream.transferTo(outputStream);
//        }
//
//        // 파일 메타데이터 반환
//        return FileVO.builder()
//                .originalName(originalName)
//                .savedName(savedName)
//                .savedPath(file.getAbsolutePath())
//                .ext(extension)
//                .size(part.getSize())
//                .build();
//    }
//    
//    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// 파일을 업로드할 디렉토리 경로 가져오기
//		File uploadDirectory = getUploadDirectory();
//		
//		// 파일 업로드 및 파일 정보 반환
//        FileVO file = handleUploadFile(request, uploadDirectory);
//		
//		// 파일 정보를 DB에 저장
//        if (!file.isEmpty()) {
//            FileDAO fileDAO = new FileDAO();
//            fileDAO.insertFile(file);
//        }
//		
//        response.sendRedirect("/upload.do");
//    }
	
}
