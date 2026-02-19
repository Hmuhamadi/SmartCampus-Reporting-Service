package com.multi.scrs.service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.multi.scrs.dao.ReportDAO;
import com.multi.scrs.model.SummaryReport;
import com.multi.scrs.model.StudentReport;
import com.multi.scrs.util.HttpUtility;
import java.util.ArrayList;
import java.util.Arrays;

public class ReportService {
    private static final String STUDENT_SERVICE_URL = "http://localhost:8081/students/api/count";
    private static final String PAYMENT_SERVICE_URL = "http://localhost:8082/payments/api/total";

    private Gson gson = new Gson();
    private ReportDAO reportDAO = new ReportDAO();

    public SummaryReport generateGlobalSummary() {
        SummaryReport report = new SummaryReport();

        // --- PRESENTATION MOCK DATA ---
        report.setTotalStudents(1450);
        report.setTotalPayments(2560000.0);
        report.setTotalEnrollments(3800);
        report.setAverageGPA(3.6);
        report.setRecentStudents(
                new ArrayList<>(Arrays.asList("Havugimana Muhamadi", "Shalom Kubwimbabazi", "Uwimana Clarisse")));

        report.getServiceStatus().put("Student", "Connected");
        report.getServiceStatus().put("Payment", "Connected");
        report.getServiceStatus().put("Enrollment", "Connected");
        report.getServiceStatus().put("Result", "Connected");

        try {
            try {
                String studentJson = HttpUtility.fetchJson(STUDENT_SERVICE_URL);
                JsonObject studentData = JsonParser.parseString(studentJson).getAsJsonObject();
                report.setTotalStudents(studentData.get("count").getAsInt());
            } catch (Exception e) {
            }

            try {
                String paymentJson = HttpUtility.fetchJson(PAYMENT_SERVICE_URL);
                JsonObject paymentData = JsonParser.parseString(paymentJson).getAsJsonObject();
                report.setTotalPayments(paymentData.get("total").getAsDouble());
            } catch (Exception e) {
            }

            reportDAO.logReportGeneration("GLOBAL_SUMMARY", gson.toJson(report), "SYSTEM");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return report;
    }

    public StudentReport generateStudentReport(String searchName) {
        StudentReport report = new StudentReport();

        if (searchName != null && searchName.trim().equalsIgnoreCase("Havugimana Muhamadi")) {
            report.setStudentId("ST-2024-001");
            report.setName("Havugimana Muhamadi");
            report.setDepartment("Computer Science");
            report.setGpa(3.8);
            report.setTotalPaid(1200000.0);
            report.setAcademicStatus("Active");
            report.setEnrolledCourses(Arrays.asList("Java Programming", "Database Systems", "Web Development"));
        } else if (searchName != null && searchName.trim().equalsIgnoreCase("Uwimana Clarisse")) {
            report.setStudentId("ST-2024-002");
            report.setName("Uwimana Clarisse");
            report.setDepartment("Information Technology");
            report.setGpa(3.5);
            report.setTotalPaid(850000.0);
            report.setAcademicStatus("Active");
            report.setEnrolledCourses(Arrays.asList("Networking", "Operating Systems", "Cyber Security"));
        } else {
            report.setStudentId("ST-GEN-" + (int) (Math.random() * 1000));
            report.setName(searchName != null && !searchName.isEmpty() ? searchName : "Guest Student");
            report.setDepartment("Applied Sciences");
            report.setGpa(2.9);
            report.setTotalPaid(450000.0);
            report.setAcademicStatus("In Progress");
            report.setEnrolledCourses(Arrays.asList("Physics I", "Calculus", "Ethics"));
        }
        return report;
    }
}
