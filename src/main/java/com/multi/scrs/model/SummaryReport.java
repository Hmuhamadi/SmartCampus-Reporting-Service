package com.multi.scrs.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SummaryReport {
    private int totalStudents;
    private double totalPayments;
    private int totalEnrollments;
    private double averageGPA;
    private Map<String, Integer> enrollmentByDepartment;
    private List<String> recentStudents;
    private Map<String, String> serviceStatus = new HashMap<>();

    public SummaryReport() {
    }

    // Getters and Setters
    public int getTotalStudents() {
        return totalStudents;
    }

    public void setTotalStudents(int totalStudents) {
        this.totalStudents = totalStudents;
    }

    public double getTotalPayments() {
        return totalPayments;
    }

    public void setTotalPayments(double totalPayments) {
        this.totalPayments = totalPayments;
    }

    public int getTotalEnrollments() {
        return totalEnrollments;
    }

    public void setTotalEnrollments(int totalEnrollments) {
        this.totalEnrollments = totalEnrollments;
    }

    public double getAverageGPA() {
        return averageGPA;
    }

    public void setAverageGPA(double averageGPA) {
        this.averageGPA = averageGPA;
    }

    public Map<String, Integer> getEnrollmentByDepartment() {
        return enrollmentByDepartment;
    }

    public void setEnrollmentByDepartment(Map<String, Integer> enrollmentByDepartment) {
        this.enrollmentByDepartment = enrollmentByDepartment;
    }

    public List<String> getRecentStudents() {
        return recentStudents;
    }

    public void setRecentStudents(List<String> recentStudents) {
        this.recentStudents = recentStudents;
    }

    public Map<String, String> getServiceStatus() {
        return serviceStatus;
    }

    public void setServiceStatus(Map<String, String> serviceStatus) {
        this.serviceStatus = serviceStatus;
    }
}
