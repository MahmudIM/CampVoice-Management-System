<%-- Created by IntelliJ IDEA. User: Compeng Updated for: CampVoice Admin Management --%>
    <%@ page import="lk.ijse.cms.model.Complain" %>
        <%@ page import="java.util.List" %>
            <%@ page import="lk.ijse.cms.model.StatusCount" %>
                <%@ page contentType="text/html;charset=UTF-8" language="java" %>
                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <title>Admin Dashboard | CampVoice</title>

                        <!-- 🚀 GLOBAL BRANDING: Replaces the Tomcat Cat from image_3e891b.png -->
                        <link rel="icon" type="image/png" href="<%= request.getContextPath() %>/assets/img/logo.png">

                        <link rel="manifest" href="<%= request.getContextPath() %>/manifest.json">
                        <meta name="mobile-web-app-capable" content="yes">
                        <meta name="apple-mobile-web-app-capable" content="yes">
                        <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
                        <meta name="theme-color" content="#1e293b">

                        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap"
                            rel="stylesheet">
                        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css"
                            rel="stylesheet">
                        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
                            rel="stylesheet">

                        <style>
                            body {
                                font-family: 'Poppins', sans-serif;
                                background-color: #f4f7f6;
                            }

                            :root {
                                --primary-color: #1e293b;
                                --secondary-color: #3498db;
                            }

                            .navbar-custom {
                                background: linear-gradient(to right, var(--primary-color), #0f172a);
                                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
                                padding: 0.8rem 1rem;
                            }

                            /* 🎨 Logo Glow Effect */
                            .brand-logo-img {
                                width: 40px;
                                height: 40px;
                                object-fit: contain;
                                filter: drop-shadow(0 0 5px rgba(52, 152, 219, 0.5));
                                margin-right: 12px;
                            }

                            .card {
                                border: none;
                                border-radius: 15px;
                                transition: transform 0.3s ease;
                            }

                            .border-warning-custom {
                                border-left: 5px solid #f1c40f !important;
                            }

                            .border-info-custom {
                                border-left: 5px solid #17a2b8 !important;
                            }

                            .border-success-custom {
                                border-left: 5px solid #28a745 !important;
                            }

                            .border-primary-custom {
                                border-left: 5px solid #3498db !important;
                            }

                            .search-input {
                                border-radius: 20px;
                                padding-left: 2.5rem !important;
                                background: rgba(255, 255, 255, 0.1);
                                border: 1px solid rgba(255, 255, 255, 0.2);
                                color: white !important;
                            }

                            .brand-text {
                                letter-spacing: 1px;
                                font-weight: 700;
                                color: #fff;
                                text-transform: uppercase;
                            }

                            .app-footer {
                                margin-top: 3rem;
                                padding: 2rem 0;
                                color: #94a3b8;
                                font-size: 0.85rem;
                                text-align: center;
                                border-top: 1px solid #e2e8f0;
                            }
                        </style>
                    </head>

                    <body>
                        <% List<Complain> complaints = (List<Complain>) request.getAttribute("complaintList");
                                String message = (String) request.getAttribute("message");
                                StatusCount statusCount = (StatusCount) request.getAttribute("statusCount");
                                int displayId = 0;
                                %>

                                <nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
                                    <div class="container-fluid">
                                        <a class="navbar-brand d-flex align-items-center" href="#">
                                            <!-- 🎨 REAL LOGO IMAGE -->
                                            <img src="<%= request.getContextPath() %>/assets/img/logo.png"
                                                class="brand-logo-img" alt="CV">
                                            <span class="brand-text">CampVoice</span>
                                            <span class="badge bg-info text-dark ms-2 fw-bold d-none d-sm-inline">ADMIN
                                                PANEL</span>
                                        </a>

                                        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse"
                                            data-bs-target="#adminNav">
                                            <span class="navbar-toggler-icon"></span>
                                        </button>

                                        <div class="collapse navbar-collapse" id="adminNav">
                                            <div class="ms-auto d-lg-flex align-items-center mt-3 mt-lg-0">
                                                <div class="position-relative me-lg-3 mb-2 mb-lg-0">
                                                    <i
                                                        class="fas fa-search position-absolute top-50 translate-middle-y ms-3 text-white-50"></i>
                                                    <input class="form-control form-control-sm search-input w-100"
                                                        type="search" id="searchInput"
                                                        placeholder="Filter complaints..." onkeyup="filterComplaints()">
                                                </div>
                                                <a href="<%= request.getContextPath() %>/logout"
                                                    class="btn btn-danger btn-sm rounded-pill px-4">
                                                    <i class="fas fa-sign-out-alt me-1"></i>Logout
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </nav>

                                <div class="container py-4 py-lg-5">
                                    <div class="d-flex justify-content-between align-items-center mb-4">
                                        <h2 class="fw-bold text-dark mb-0">System Overview</h2>
                                        <span class="text-muted small">Academic Session 2025/2026</span>
                                    </div>

                                    <% if (message !=null) { %>
                                        <div class="alert alert-success alert-dismissible fade show border-0 shadow-sm"
                                            role="alert">
                                            <i class="fas fa-check-circle me-2"></i>
                                            <%= message %>
                                                <button type="button" class="btn-close"
                                                    data-bs-dismiss="alert"></button>
                                        </div>
                                        <% } %>

                                            <!-- Statistics Cards -->
                                            <div class="row g-3 g-lg-4 mb-5">
                                                <div class="col-6 col-md-3">
                                                    <div
                                                        class="card shadow-sm text-center p-3 border-warning-custom h-100">
                                                        <i class="fas fa-clock fa-2x text-warning mb-2"></i>
                                                        <h3 class="fw-bold mb-0">
                                                            <%= statusCount !=null ? statusCount.getPending() : 0 %>
                                                        </h3>
                                                        <p class="small text-muted mb-0">Pending</p>
                                                    </div>
                                                </div>
                                                <div class="col-6 col-md-3">
                                                    <div
                                                        class="card shadow-sm text-center p-3 border-info-custom h-100">
                                                        <i class="fas fa-sync fa-spin fa-2x text-info mb-2"></i>
                                                        <h3 class="fw-bold mb-0">
                                                            <%= statusCount !=null ? statusCount.getInProgress() : 0 %>
                                                        </h3>
                                                        <p class="small text-muted mb-0">In Progress</p>
                                                    </div>
                                                </div>
                                                <div class="col-6 col-md-3">
                                                    <div
                                                        class="card shadow-sm text-center p-3 border-success-custom h-100">
                                                        <i class="fas fa-check-circle fa-2x text-success mb-2"></i>
                                                        <h3 class="fw-bold mb-0">
                                                            <%= statusCount !=null ? statusCount.getResolved() : 0 %>
                                                        </h3>
                                                        <p class="small text-muted mb-0">Resolved</p>
                                                    </div>
                                                </div>
                                                <div class="col-6 col-md-3">
                                                    <div
                                                        class="card shadow-sm text-center p-3 border-primary-custom h-100">
                                                        <i class="fas fa-database fa-2x text-primary mb-2"></i>
                                                        <h3 class="fw-bold mb-0">
                                                            <%= statusCount !=null ? statusCount.getTotalCount() : 0 %>
                                                        </h3>
                                                        <p class="small text-muted mb-0">Total Cases</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="card shadow-sm">
                                                <div class="card-header bg-white border-bottom py-3">
                                                    <h5 class="mb-0 fw-bold"><i
                                                            class="fas fa-list-ul me-2 text-primary"></i>Active
                                                        Complaints Queue</h5>
                                                </div>
                                                <div class="card-body p-0">
                                                    <div class="table-responsive">
                                                        <table class="table table-hover mb-0 align-middle">
                                                            <thead class="table-light text-uppercase"
                                                                style="font-size: 0.75rem;">
                                                                <tr>
                                                                    <th class="ps-4">ID</th>
                                                                    <th>Student ID</th>
                                                                    <th>Subject</th>
                                                                    <th width="30%">Message</th>
                                                                    <th>Status</th>
                                                                    <th>Actions</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody id="complaintsTableBody">
                                                                <% if (complaints !=null && !complaints.isEmpty()) { for
                                                                    (Complain c : complaints) { %>
                                                                    <tr>
                                                                        <td class="ps-4 text-muted">#<%= ++displayId %>
                                                                        </td>
                                                                        <td>
                                                                            <span class="fw-bold text-dark">
                                                                                <%= c.getStudentId() %>
                                                                            </span><br>
                                                                            <small class="text-muted">
                                                                                <%= c.getDepartment() %>
                                                                            </small>
                                                                        </td>
                                                                        <td class="fw-semibold">
                                                                            <%= c.getTitle() %>
                                                                        </td>
                                                                        <td class="small text-secondary">
                                                                            <%= c.getDescription() %>
                                                                        </td>
                                                                        <td>
                                                                            <% String status=(c.getStatus() !=null) ?
                                                                                c.getStatus().toLowerCase() : "pending"
                                                                                ; String
                                                                                badge=status.contains("pending")
                                                                                ? "warning" :
                                                                                status.contains("progress") ? "info"
                                                                                : "success" ; %>
                                                                                <span
                                                                                    class="badge rounded-pill bg-<%= badge %> px-3 py-2 text-uppercase">
                                                                                    <%= c.getStatus() %>
                                                                                </span>
                                                                        </td>
                                                                        <td>
                                                                            <div class="btn-group">
                                                                                <a href="<%= request.getContextPath() %>/admin/editComplaint.jsp?complainID=<%= c.getId() %>&studentId=<%= c.getStudentId() %>"
                                                                                    class="btn btn-sm btn-outline-primary">
                                                                                    <i class="fas fa-edit"></i>
                                                                                </a>
                                                                                <button
                                                                                    onclick="confirmDelete(<%= c.getId() %>)"
                                                                                    class="btn btn-sm btn-outline-danger">
                                                                                    <i class="fas fa-trash"></i>
                                                                                </button>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <% } } else { %>
                                                                        <tr>
                                                                            <td colspan="6" class="text-center py-5">
                                                                                <i
                                                                                    class="fas fa-check-circle fa-3x mb-3 text-success opacity-25"></i>
                                                                                <p class="text-muted">No pending
                                                                                    complaints. Well done!</p>
                                                                            </td>
                                                                        </tr>
                                                                        <% } %>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>

                                            <footer class="app-footer">
                                                <p>© 2026 CampVoice | Dept of Computer Engineering | Ahmadu Bello
                                                    University</p>
                                            </footer>
                                </div>

                                <script
                                    src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
                                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
                                <script>
                                    function filterComplaints() {
                                        const input = document.getElementById('searchInput').value.toLowerCase();
                                        const rows = document.getElementById('complaintsTableBody').getElementsByTagName('tr');
                                        for (let row of rows) {
                                            row.style.display = row.textContent.toLowerCase().includes(input) ? '' : 'none';
                                        }
                                    }

                                    function confirmDelete(id) {
                                        Swal.fire({
                                            title: 'Are you sure?',
                                            text: "This complaint will be permanently removed!",
                                            icon: 'warning',
                                            showCancelButton: true,
                                            confirmButtonColor: '#d33',
                                            cancelButtonColor: '#3085d6',
                                            confirmButtonText: 'Yes, delete it!'
                                        }).then((result) => {
                                            if (result.isConfirmed) {
                                                window.location.href = "<%= request.getContextPath() %>/dashboard?complainID=" + id + "&delete=true";
                                            }
                                        });
                                    }
                                </script>
                    </body>

                    </html>