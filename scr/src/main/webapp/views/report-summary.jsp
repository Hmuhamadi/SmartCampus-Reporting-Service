<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>SmartCampus - Campus Dashboard</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
                rel="stylesheet">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
            <style>
                :root {
                    --primary-color: #4361ee;
                    --secondary-color: #3f37c9;
                    --accent-color: #4cc9f0;
                    --background-color: #f8f9fa;
                    --card-shadow: 0 10px 20px rgba(0, 0, 0, 0.05);
                }

                body {
                    background-color: var(--background-color);
                    font-family: 'Inter', sans-serif;
                    color: #333;
                }

                .navbar {
                    background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
                    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                }

                .report-card {
                    border: none;
                    border-radius: 15px;
                    box-shadow: var(--card-shadow);
                    transition: transform 0.3s ease;
                    overflow: hidden;
                }

                .report-card:hover {
                    transform: translateY(-5px);
                }

                .card-icon {
                    font-size: 2.5rem;
                    margin-bottom: 1rem;
                    color: var(--primary-color);
                }

                .stat-value {
                    font-size: 2rem;
                    font-weight: 700;
                    margin-bottom: 0;
                }

                .stat-label {
                    color: #666;
                    text-transform: uppercase;
                    font-size: 0.8rem;
                    letter-spacing: 1px;
                    font-weight: 600;
                }
            </style>
        </head>

        <body>
            <nav class="navbar navbar-expand-lg navbar-dark mb-4">
                <div class="container">
                    <a class="navbar-brand fw-bold" href="#"><i class="fas fa-university me-2"></i>SmartCampus
                        Reports</a>
                    <div class="navbar-nav">
                        <a class="nav-link active" href="summary">Dashboard</a>
                        <a class="nav-link" href="student">Student Report</a>
                        <a class="nav-link" href="logs">History</a>
                    </div>
                </div>
            </nav>

            <div class="container">
                <div class="row mb-4">
                    <div class="col-12">
                        <h1 class="fw-bold"><i class="fas fa-chart-line me-2 text-primary"></i>Campus-Wide Statistics
                        </h1>
                        <p class="text-muted">Real-time aggregated data from all campus microservices</p>
                        <hr>
                    </div>
                </div>

                <div class="row g-4">
                    <!-- Total Students -->
                    <div class="col-md-3">
                        <div class="card report-card h-100 p-4">
                            <div class="card-body text-center">
                                <div class="card-icon"><i class="fas fa-user-graduate"></i></div>
                                <p class="stat-label">Total Students</p>
                                <h2 class="stat-value">${report.totalStudents}</h2>
                            </div>
                            <div class="card-footer bg-transparent border-0 text-center">
                                <span class="badge bg-success-subtle text-success">+5% this month</span>
                            </div>
                        </div>
                    </div>

                    <!-- Total Payments -->
                    <div class="col-md-3">
                        <div class="card report-card h-100 p-4">
                            <div class="card-body text-center">
                                <div class="card-icon"><i class="fas fa-money-bill-wave text-success"></i></div>
                                <p class="stat-label">Total Revenue</p>
                                <h2 class="stat-value">
                                    <c:out value="${report.totalPayments}" /> RWF
                                </h2>
                            </div>
                            <div class="card-footer bg-transparent border-0 text-center">
                                <span class="badge bg-primary-subtle text-primary">Collected Fees</span>
                            </div>
                        </div>
                    </div>

                    <!-- Total Enrollments -->
                    <div class="col-md-3">
                        <div class="card report-card h-100 p-4">
                            <div class="card-body text-center">
                                <div class="card-icon"><i class="fas fa-book-reader text-warning"></i></div>
                                <p class="stat-label">Course Enrollments</p>
                                <h2 class="stat-value">${report.totalEnrollments}</h2>
                            </div>
                            <div class="card-footer bg-transparent border-0 text-center">
                                <span class="badge bg-warning-subtle text-warning">Active Courses</span>
                            </div>
                        </div>
                    </div>

                    <!-- Average GPA -->
                    <div class="col-md-3">
                        <div class="card report-card h-100 p-4">
                            <div class="card-body text-center">
                                <div class="card-icon"><i class="fas fa-star text-primary"></i></div>
                                <p class="stat-label">Avg. Academic GPA</p>
                                <h2 class="stat-value">${report.averageGPA}</h2>
                            </div>
                            <div class="card-footer bg-transparent border-0 text-center">
                                <span class="badge bg-info-subtle text-info">Overall Performance</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row mt-5">
                    <div class="col-md-6">
                        <div class="card report-card p-4">
                            <h5 class="fw-bold mb-4">Inter-Service Communication Status</h5>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Service</th>
                                        <th>Endpoint</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Student Service</td>
                                        <td>/api/count</td>
                                        <td>
                                            <span
                                                class="badge ${report.serviceStatus['Student'] == 'Connected' ? 'bg-success' : 'bg-danger'}">
                                                ${report.serviceStatus['Student']}
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Payment Service</td>
                                        <td>/api/total</td>
                                        <td>
                                            <span
                                                class="badge ${report.serviceStatus['Payment'] == 'Connected' ? 'bg-success' : 'bg-danger'}">
                                                ${report.serviceStatus['Payment']}
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Enrollment Service</td>
                                        <td>/api/summary</td>
                                        <td>
                                            <span
                                                class="badge ${report.serviceStatus['Enrollment'] == 'Connected' ? 'bg-success' : 'bg-danger'}">
                                                ${report.serviceStatus['Enrollment']}
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Result Service</td>
                                        <td>/api/gpa/average</td>
                                        <td>
                                            <span
                                                class="badge ${report.serviceStatus['Result'] == 'Connected' ? 'bg-success' : 'bg-danger'}">
                                                ${report.serviceStatus['Result']}
                                            </span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="card report-card p-4">
                            <h5 class="fw-bold mb-4"><i class="fas fa-users me-2 text-info"></i>Latest Registrations
                            </h5>
                            <ul class="list-group list-group-flush">
                                <c:forEach var="student" items="${report.recentStudents}">
                                    <li class="list-group-item d-flex align-items-center">
                                        <i class="fas fa-user-circle me-3 text-secondary"></i>
                                        <span>${student}</span>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="card report-card p-4 bg-primary text-white">
                            <h5 class="fw-bold mb-3">Service Actions</h5>
                            <button class="btn btn-light w-100 mb-2" onclick="window.print()"><i
                                    class="fas fa-file-pdf me-2"></i>Generate PDF Report</button>
                            <a href="summary" class="btn btn-outline-light w-100 mb-2"><i
                                    class="fas fa-sync-alt me-2"></i>Refresh Data</a>
                            <hr>
                            <p class="small mb-0">Reporting Service (Group 10) - Decentralized Campus Management</p>
                        </div>
                    </div>
                </div>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>