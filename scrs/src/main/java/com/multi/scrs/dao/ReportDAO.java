package com.multi.scrs.dao;

import com.multi.scrs.model.ReportLog;
import com.multi.scrs.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReportDAO {
    public void logReportGeneration(String reportType, String summaryJson, String generatedBy) {
        String sql = "INSERT INTO report_logs (report_type, data_summary, generated_by) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, reportType);
            pstmt.setString(2, summaryJson);
            pstmt.setString(3, generatedBy);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<ReportLog> getAllLogs() {
        List<ReportLog> logs = new ArrayList<>();
        String sql = "SELECT * FROM report_logs ORDER BY generated_at DESC";
        try (Connection conn = DBConnection.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                ReportLog log = new ReportLog();
                log.setId(rs.getInt("id"));
                log.setReportType(rs.getString("report_type"));
                log.setGeneratedAt(rs.getTimestamp("generated_at"));
                log.setDataSummary(rs.getString("data_summary"));
                log.setGeneratedBy(rs.getString("generated_by"));
                logs.add(log);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return logs;
    }

    public void deleteLog(int id) {
        String sql = "DELETE FROM report_logs WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
