<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>SmartCampus - Student Report</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
                rel="stylesheet">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
            <style>
                body {
                    background-color: #f0f2f5;
                    font-family: 'Inter', sans-serif;
                }

                .navbar {
                    background: linear-gradient(135deg, #4361ee, #3f37c9);
                }

                .profile-card {
                    border: none;
                    border-radius: 20px;
                    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                    background: white;
                }

                .stat-box {
                    background: #f8f9fa;
                    border-radius: 15px;
                    padding: 20px;
                    transition: 0.3s;
                }

                .stat-box:hover {
                    background: #e9ecef;
                }

                .course-list {
                    border-left: 4px solid #4361ee;
                    padding-left: 15px;
                }

                .badge-academic {
                    font-size: 0.9rem;
                    padding: 8px 15px;
                    border-radius: 30px;
                }
            </style>
        </head>

        <body>
            <nav class="navbar navbar-expand-lg navbar-dark mb-4">
                <div class="container">
                    <a class="navbar-brand fw-bold" href="summary"><i class="fas fa-university me-2"></i>SmartCampus
                        Reports</a>
                    <div class="navbar-nav">
                        <a class="nav-link" href="summary">Dashboard</a>
                        <a class="nav-link" href="logs">History</a>
                    </div>
                </div>
            </nav>

            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-9">
                        <!-- Search Box -->
                        <div class="card profile-card p-4 mb-4">
                            <form action="student" method="get" class="row g-3">
                                <div class="col-md-9">
                                    <input type="text" name="name" class="form-control form-control-lg rounded-pill"
                                        placeholder="Enter Student Name (e.g. Havugimana Muhamadi)..." required>
                                </div>
                                <div class="col-md-3">
                                    <button type="submit" class="btn btn-primary btn-lg w-100 rounded-pill"><i
                                            class="fas fa-search me-2"></i>Generate</button>
                                </div>
                            </form>
                        </div>

                        <c:if test="${not empty studentReport}">
                            <div class="card profile-card p-5">
                                <div class="d-flex align-items-center mb-5">
                                    <div class="bg-primary text-white rounded-circle d-flex align-items-center justify-content-center me-4"
                                        style="width: 80px; height: 80px;">
                                        <i class="fas fa-user-graduate fa-2x"></i>
                                    </div>
                                    <div>
                                        <h1 class="fw-bold mb-0">${studentReport.name}</h1>
                                        <p class="text-muted mb-0">ID: ${studentReport.studentId} |
                                            ${studentReport.department}</p>
                                        <span
                                            class="badge ${studentReport.academicStatus == 'Active' ? 'bg-success' : 'bg-warning'} badge-academic mt-2">
                                            ${studentReport.academicStatus}
                                        </span>
                                    </div>
                                    <div class="ms-auto">
                                        <button class="btn btn-outline-primary" onclick="window.print()"><i
                                                class="fas fa-print me-2"></i>Print Report</button>
                                    </div>
                                </div>

                                <div class="row g-4 mb-5">
                                    <div class="col-md-4 text-center">
                                        <div class="stat-box">
                                            <p class="text-muted small text-uppercase fw-bold mb-2">Academic GPA</p>
                                            <h3 class="fw-bold text-primary mb-0">${studentReport.gpa} / 4.0</h3>
                                        </div>
                                    </div>
                                    <div class="col-md-4 text-center">
                                        <div class="stat-box">
                                            <p class="text-muted small text-uppercase fw-bold mb-2">Total Paid</p>
                                            <h3 class="fw-bold text-success mb-0">${studentReport.totalPaid} RWF</h3>
                                        </div>
                                    </div>
                                    <div class="col-md-4 text-center">
                                        <div class="stat-box">
                                            <p class="text-muted small text-uppercase fw-bold mb-2">Current Courses</p>
                                            <h3 class="fw-bold text-dark mb-0">${studentReport.enrolledCourses.size()}
                                                Courses</h3>
                                        </div>
                                    </div>
                                </div>

                                <h5 class="fw-bold mb-4"><i class="fas fa-book-open me-2 text-primary"></i>Enrolled
                                    Courses</h5>
                                <div class="row">
                                    <c:forEach var="course" items="${studentReport.enrolledCourses}">
                                        <div class="col-md-6 mb-3">
                                            <div class="course-list p-2 bg-light rounded">
                                                <h6 class="mb-0 fw-bold">${course}</h6>
                                                <small class="text-muted">Semester 1, 2024</small>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${empty studentReport}">
                            <div class="text-center py-5">
                                <i class="fas fa-search fa-4x text-muted mb-3"></i>
                                <h4 class="text-muted">Enter a student's name to see their full report</h4>
                                <p class="text-muted">Try searching for "Havugimana Muhamadi" or "Uwimana Clarisse"</p>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </body>

        </html>