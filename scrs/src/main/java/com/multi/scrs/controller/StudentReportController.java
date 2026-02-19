package com.multi.scrs.controller;

import com.multi.scrs.model.StudentReport;
import com.multi.scrs.service.ReportService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/reports/student")
public class StudentReportController extends HttpServlet {
    private ReportService reportService = new ReportService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String studentName = request.getParameter("name");

        if (studentName != null && !studentName.trim().isEmpty()) {
            StudentReport studentReport = reportService.generateStudentReport(studentName);
            request.setAttribute("studentReport", studentReport);
        }

        request.getRequestDispatcher("/views/student-report.jsp").forward(request, response);
    }
}
