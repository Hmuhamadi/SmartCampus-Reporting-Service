package com.multi.scrs.controller;

import com.multi.scrs.dao.ReportDAO;
import com.multi.scrs.model.ReportLog;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/reports/logs")
public class LogController extends HttpServlet {
    private ReportDAO reportDAO = new ReportDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<ReportLog> logs = reportDAO.getAllLogs();
        request.setAttribute("logs", logs);
        request.getRequestDispatcher("/views/report-logs.jsp").forward(request, response);
    }
}
