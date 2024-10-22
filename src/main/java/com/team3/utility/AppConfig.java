package com.team3.utility;

public class AppConfig {

    private static final AppConfig INSTANCE = new AppConfig();
    private String fileUploadPath;

    // Private constructor prevents instantiation
    private AppConfig() {
        initFileUploadPath();
    }

    // Static method to get the single instance of the class
    public static AppConfig getInstance() {
        return INSTANCE;
    }

    private void initFileUploadPath() {
        // Initialize with a default path; this can be overridden later
        fileUploadPath = "/default/path";
    }

    public void setFileUploadPath(String path) {
        // Allow setting the path only once
        if (fileUploadPath.equals("/default/path")) {
            fileUploadPath = path;
        } else {
            throw new IllegalStateException("fileUploadPath has already been initialized.");
        }
    }

    public String getFileUploadPath() {
        return fileUploadPath;
    }
}
