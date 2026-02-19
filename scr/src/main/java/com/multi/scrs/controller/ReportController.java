package com.multi.scrs.controller;

import com.multi.scrs.model.SummaryReport;
import com.multi.scrs.service.ReportService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/reports/summary")
public class ReportController extends HttpServlet {
    private ReportService reportService = new ReportService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SummaryReport summaryReport = reportService.generateGlobalSummary();
        request.setAttribute("report", summaryReport);
        request.getRequestDispatcher("/views/report-summary.jsp").forward(request, response);
    }
}
