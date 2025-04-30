package com.yx.po;

import java.util.Date;

public class Feedback {
    private Integer id;
    private Integer readerId;
    private String content;
    private Date submissionTime;

    // 为了方便显示，可以冗余读者姓名
    private String readerName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getReaderId() {
        return readerId;
    }

    public void setReaderId(Integer readerId) {
        this.readerId = readerId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getSubmissionTime() {
        return submissionTime;
    }

    public void setSubmissionTime(Date submissionTime) {
        this.submissionTime = submissionTime;
    }

    public String getReaderName() {
        return readerName;
    }

    public void setReaderName(String readerName) {
        this.readerName = readerName;
    }

    @Override
    public String toString() {
        return "Feedback{" +
                "id=" + id +
                ", readerId=" + readerId +
                ", content='" + content + '\'' +
                ", submissionTime=" + submissionTime +
                ", readerName='" + readerName + '\'' +
                '}';
    }
}