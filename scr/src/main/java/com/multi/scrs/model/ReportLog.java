package com.multi.scrs.model;

import java.sql.Timestamp;

public class ReportLog {
    private int id;
    private String reportType;
    private Timestamp generatedAt;
    private String dataSummary;
    private String generatedBy;

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getReportType() {
        return reportType;
    }

    public void setReportType(String reportType) {
        this.reportType = reportType;
    }

    public Timestamp getGeneratedAt() {
        return generatedAt;
    }

    public void setGeneratedAt(Timestamp generatedAt) {
        this.generatedAt = generatedAt;
    }

    public String getDataSummary() {
        return dataSummary;
    }

    public void setDataSummary(String dataSummary) {
        this.dataSummary = dataSummary;
    }

    public String getGeneratedBy() {
        return generatedBy;
    }

    public void setGeneratedBy(String generatedBy) {
        this.generatedBy = generatedBy;
    }
}
