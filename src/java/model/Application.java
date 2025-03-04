/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author -Asus-
 */
public class Application {
    private int applicationId;
    private String title;
    private Date startDate;
    private Date endDate;
    private String reason;
    private String status;
    private int createdBy;
    private int processedBy;
    private String note;

    public Application(int applicationId, String title, Date startDate, Date endDate, String reason, 
                       String status, int createdBy, int processedBy, String note) {
        this.applicationId = applicationId;
        this.title = title;
        this.startDate = startDate;
        this.endDate = endDate;
        this.reason = reason;
        this.status = status;
        this.createdBy = createdBy;
        this.processedBy = processedBy;
        this.note = note;
    }

    // Getters, Setters, toString() đầy đủ nếu cần

    public int getApplicationId() {
        return applicationId;
    }

    public void setApplicationId(int applicationId) {
        this.applicationId = applicationId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public int getProcessedBy() {
        return processedBy;
    }

    public void setProcessedBy(int processedBy) {
        this.processedBy = processedBy;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    @Override
    public String toString() {
        return "Application{" + "applicationId=" + applicationId + ", title=" + title + ", startDate=" + startDate + ", endDate=" + endDate + ", reason=" + reason + ", status=" + status + ", createdBy=" + createdBy + ", processedBy=" + processedBy + ", note=" + note + '}';
    }
    
    
}

