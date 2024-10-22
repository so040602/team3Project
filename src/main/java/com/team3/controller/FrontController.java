package com.team3.controller;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Map;

import com.team3.utility.AppConfig;
import com.team3.utility.FileTransferApi;
import com.team3.utility.TeamUtility;

//import com.oreilly.servlet.MultipartRequest;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebInitParam;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;


// urlPatterns 이름은 common.jsp 파일 내에
// mappingName 이라는 변수명의 값과 동일해야 합니다.

//berryapp 경로로 들어오는 HTTP 요청을 처리하도록 설정합니다. 
// 즉, 웹 애플리케이션에서 /coolapp 경로로 접근하면 이 서블릿이 호출됩니다.
@WebServlet(
	urlPatterns = { "/coolapp" }, 
	initParams = { 
	  	//@WebInitParam(name = "todolist", value = "/WEB-INF/todolist.properties"),
		@WebInitParam(name = "settings", value = "/WEB-INF/settings.properties")
	}		
)

@MultipartConfig
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIRECTORY = "team3_uploads"; //"uploads";		

    public FrontController() { }
    
    // 초기화 파라미터 변수들
    private String settings = null ;
    
    // map for controllers
    private Map<String, SuperController> controllerMap = null ;
    
    // 전역 설정 정보를 저장하고 있는 자바 Map 컬렉션
    private Map<String, String> settingsMap = null; 
	
	// uploadFilePath : 실제 파일이 업로드되는 웹 서버 상에 존재하는 전체 경로
  	private String fileUploadPath = null;    
    
	
	public void init(ServletConfig config) throws ServletException {
		
		System.out.println("start with init() in FrontController extends HttpServlet");
	
		this.controllerMap = TeamUtility.getControllerMap();
		System.out.println("controller map size = [" + controllerMap.size() + "]");
		
		this.settings = config.getInitParameter("settings") ;
		System.out.println("settings 파일 위치 : " + this.settings);
		
		ServletContext application = config.getServletContext() ;
		
		String settingsRealPath = application.getRealPath(settings) ;
		System.out.println("settings 파일 실제 웹서버 경로 : " + settingsRealPath);
		 
		this.settingsMap = TeamUtility.getSettingMap(settingsRealPath) ;
		System.out.println("setting file element size = [" + settingsMap.size() + "]");
	
		// 모든 페이지에서 application 영역의 settings를 참조할 수 있습니다.
		application.setAttribute("settings", settingsMap);
	
		String os = System.getProperty("os.name").toLowerCase();

        if (os.contains("win")) {
            System.out.println("Windows");
            
    		//this.fileUploadPath = "F:\\eclipse-team3-jsp-workspace\\GoldBerry\\src\\main\\webapp\\team3_uploads";
    		this.fileUploadPath = application.getRealPath(UPLOAD_DIRECTORY) ;
    		System.out.println("this.fileUploadPath : " + this.fileUploadPath);
            
    		File uploadDir = new File(this.fileUploadPath);
            System.out.println("uploadDir.exists() : " + uploadDir.exists());
            
            if (!uploadDir.exists()) {
                boolean result = uploadDir.mkdirs(); // Create the directory if it does not exist
                System.out.println("result of mkdirs() :" + result); 
            }
            
         // Initialize the file upload path using AppConfig
            AppConfig.getInstance().setFileUploadPath(this.fileUploadPath);
    		System.out.println("fileUploadPath is [" + fileUploadPath + "]");

        } else if (os.contains("linux")) {
            System.out.println("Linux");
            
            // "/bonspring/tomcat/webapps/" + UPLOAD_DIRECTORY;
            // http://heavyplus.com/team3_uploads/BB1700Dg_20240918162552.jpg
    		this.fileUploadPath = "tomcat/webapps/" + UPLOAD_DIRECTORY; 
            
    		File uploadDir = new File(this.fileUploadPath);
            
    		if (!uploadDir.exists()) {
                boolean result = uploadDir.mkdirs(); // Create the directory if it does not exist
                System.out.println("result of mkdirs() :" + result); 
            }    	
            
            // Initialize the file upload path using AppConfig
            AppConfig.getInstance().setFileUploadPath(this.fileUploadPath);
            System.out.println("fileUploadPath is [" + fileUploadPath + "]");

        } else if (os.contains("mac")) {
            System.out.println("Mac");

        } else if (os.contains("nix") || os.contains("nux") || os.contains("aix")) {
            System.out.println("Unix");
            
        } else if (os.contains("sunos")) {
            System.out.println("Solaris");
        }
       
        // Optionally, you can log or print the path to verify
        System.out.println("File upload path initialized to: " + AppConfig.getInstance().getFileUploadPath());

	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("doGet 요청 들어옴");
		//response.getWriter().println("Test servlet is working!");
		this.doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// System.out.println("doPost 요청 들어옴"); 
        // Extract the 'opsmode' parameter from the request
        String opsmode = request.getParameter("opsmode");
        System.out.println("opsmode in doPost(): " + opsmode);
        
        // Call another method to process additional logic
        this.doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 한글 깨짐 방지
		
		// command 파라미터 : 컨트롤러 분기를 위한 핵심 파라미터입니다.
        String opsmode = null;
		opsmode = request.getParameter("opsmode");
		System.out.println("opsmode in doProcess() : " + opsmode);

	
//        // Check if the request is multipart/form-data
//        if (request.getContentType() != null && request.getContentType().startsWith("multipart/form-data")) {
//            
//        	System.out.println("It's multipart.");
//        	
//        	try {
//                Part filePart = request.getPart("attachfile"); // Retrieve the file part
//                String fileName = filePart.getSubmittedFileName(); // Get the file name
//
//                // Define the upload directory
//                String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
//                File uploadDir = new File(uploadPath);
//                if (!uploadDir.exists()) {
//                    uploadDir.mkdirs(); // Create the directory if it does not exist
//                }
//
//                // Write the file to the server
//                filePart.write(uploadPath + File.separator + fileName);
//
//                // Save the file name to the database
//                //saveFileNameToDatabase(fileName);
//
//                response.getWriter().println("File uploaded successfully: " + fileName);
//
//            } catch (Exception e) {
//                e.printStackTrace();
//                response.getWriter().println("File upload failed: " + e.getMessage());
//            }
//        } else {
//            response.getWriter().println("Request is not multipart/form-data");
//        }
		
				
//		if (request.getContentType() != null && request.getContentType().startsWith("multipart/form-data")) {
//		    System.out.println("It's multipart.");
//		    
//		    try {
//		        for (Part part : request.getParts()) {
//		            if (part.getSubmittedFileName() != null) {
//		                String fileName = part.getSubmittedFileName();
//		                String filePath = this.fileUploadPath + File.separator; // Ensure this.path is correctly set
//		                File uploadDir = new File(filePath);
//		                
//		                if (!uploadDir.exists()) {
//		                    boolean created = uploadDir.mkdirs(); // Use mkdirs() to ensure directory creation
//		                    if (!created) {
//		                        throw new IOException("Failed to create upload directory.");
//		                    }
//		                }
//		                
//		                File file = new File(filePath + File.separator + fileName);
//		                System.out.println("Attempting to write file to: " + file.getAbsolutePath());
//		                
//		                // Write the file to the specified directory
//		                part.write(file.getAbsolutePath());
//		                
//		                if (file.exists()) {
//		                    System.out.println("File exists at: " + file.getAbsolutePath());
//		                } else {
//		                    System.out.println("File does not exist.");
//		                }
//
//		            }
//		        }
//		    } catch (Exception e) {
//		        e.printStackTrace();
//		        System.out.println("File upload failed: " + e.getMessage());
//		    }
//		} else {
//		    System.out.println("Request is not multipart/form-data");
//		}

		///////////////////////////////////////////////////////////////////////////////////////////////
		
		// Ensure the request is multipart/form-data
	    if (request.getContentType() != null && request.getContentType().startsWith("multipart/form-data")) {
	        // Iterate through all parts
	        for (Part part : request.getParts()) {
	            if (part.getSubmittedFileName() != null && !part.getSubmittedFileName().isEmpty()) {
	                // Get the original file name
	                String originalFileName = part.getSubmittedFileName();
	                
	                // Generate a unique filename
	                String timeStamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	                String fileExtension = originalFileName.substring(originalFileName.lastIndexOf('.'));
	                String baseFileName = originalFileName.substring(0, originalFileName.lastIndexOf('.'));
	                String uniqueFileName = baseFileName + "_" + timeStamp + fileExtension;
	                
	                // Determine the field name
	                String fieldName = part.getName(); // e.g., attach01, attach02, etc
	                
	                // Set the unique filename as an attribute
	                request.setAttribute(fieldName, uniqueFileName);
	                
	                // Define the path to save the file
	                String filePath = this.fileUploadPath + File.separator + uniqueFileName;
	                File file = new File(filePath);
	                part.write(file.getAbsolutePath());
	                
	                // file transfer to file server api
	                String targetUrl = "http://heavyplus.com/fileapi";
	                FileTransferApi sendFile = new FileTransferApi();
	                String uploadDir = "team3_uploads";
	                String jsonData = "{\"uploadDir\": \"" + uploadDir + "\"}";
	                // Now jsonData is: {"uploadDir": "team3_uploads"}
	                sendFile.sendFileToServer(file, targetUrl, jsonData);
	                
	                // Log for debugging
	                System.out.println(fieldName + ": " + uniqueFileName);
	                System.out.println("Attempting to write file to: " + file.getAbsolutePath());
	                System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
	            }
	        }

		    // Retrieve filenames from attributes to println
	    
		    System.out.println("attach01: " + (String)request.getAttribute("attach01"));
		    System.out.println("attach02: " + (String)request.getAttribute("attach02"));
		    System.out.println("attach03: " + (String)request.getAttribute("attach03"));
		    System.out.println("attach04: " + (String)request.getAttribute("attach04"));
	        
	    }
	    
		///////////////////////////////////////////////////////////////////////////////////////////////

	    // Continue with processing and database insertion...
	    
		System.out.println("opsmode=[" + opsmode + "]"); 
		
		SuperController controller = this.controllerMap.get(opsmode) ;
		
		if(controller != null) {
			String method = request.getMethod();
			
			try {
				if(method.equalsIgnoreCase("get")) {
					System.out.println(this.getClass() + " get method called");
					controller.doGet(request, response);
				} else {
					System.out.println(this.getClass() + " post method called");
					controller.doPost(request, response); 
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else {
			System.out.println("request opsmode is not found"); 
		}
	}	
}


