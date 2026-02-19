package com.multi.scrs.controller;

import com.multi.scrs.dao.ReportDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/reports/delete")
public class DeleteLogController extends HttpServlet {
    private ReportDAO reportDAO = new ReportDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                reportDAO.deleteLog(id);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect("logs");
    }
}
