package com.team3.model.bean;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Notice {
    private int noticeId;
    private String noticeTitle;
    private String noticeContent;
    private String noticeAuthor;
    private Timestamp noticeCreated;  // 변경된 부분
    private int noticeViews;
    private String noticeAttachments;

    public Notice(int noticeId, String noticeTitle, String noticeContent, String noticeAuthor, Timestamp noticeCreated,
                  int noticeViews, String noticeAttachments) {
        super();
        this.noticeId = noticeId;
        this.noticeTitle = noticeTitle;
        this.noticeContent = noticeContent;
        this.noticeAuthor = noticeAuthor;
        this.noticeCreated = noticeCreated;  // 변경된 부분
        this.noticeViews = noticeViews;
        this.noticeAttachments = noticeAttachments;
    }

    @Override
    public String toString() {
        return "Notice [noticeId=" + noticeId + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
                + ", noticeAuthor=" + noticeAuthor + ", noticeCreated=" + noticeCreated + ", noticeViews=" + noticeViews
                + ", noticeAttachments=" + noticeAttachments + "]";
    }

    public int getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(int noticeId) {
        this.noticeId = noticeId;
    }

    public String getNoticeTitle() {
        return noticeTitle;
    }

    public void setNoticeTitle(String noticeTitle) {
        this.noticeTitle = noticeTitle;
    }

    public String getNoticeContent() {
        return noticeContent;
    }

    public void setNoticeContent(String noticeContent) {
        this.noticeContent = noticeContent;
    }

    public String getNoticeAuthor() {
        return noticeAuthor;
    }

    public void setNoticeAuthor(String noticeAuthor) {
        this.noticeAuthor = noticeAuthor;
    }

    public Timestamp getNoticeCreated() {  // 변경된 부분
        return noticeCreated;
    }

    public void setNoticeCreated(Timestamp noticeCreated) {  // 변경된 부분
        this.noticeCreated = noticeCreated;
    }

    public int getNoticeViews() {
        return noticeViews;
    }

    public void setNoticeViews(int noticeViews) {
        this.noticeViews = noticeViews;
    }

    public String getNoticeAttachments() {
        return noticeAttachments;
    }

    public void setNoticeAttachments(String noticeAttachments) {
        this.noticeAttachments = noticeAttachments;
    }

    public Notice() {
        super();
    }
    
    public String getFormattedNoticeCreated() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        return sdf.format(noticeCreated);
    }
}
