CREATE DATABASE IF NOT EXISTS reporting_db;
USE reporting_db;

CREATE TABLE IF NOT EXISTS report_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    report_type VARCHAR(100) NOT NULL,
    generated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_summary JSON,
    generated_by VARCHAR(100)
);
