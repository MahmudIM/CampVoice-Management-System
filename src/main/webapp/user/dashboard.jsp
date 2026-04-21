<%-- Created by IntelliJ IDEA. User: Compeng Updated for: CampVoice Management System --%>
  <%@ page import="lk.ijse.cms.model.Complain" %>
    <%@ page import="java.util.List" %>
      <%@ page import="lk.ijse.cms.model.StatusCount" %>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
          <!DOCTYPE html>
          <html lang="en">

          <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Student Dashboard - CampVoice</title>

            <link rel="manifest" href="<%= request.getContextPath() %>/manifest.json">
            <meta name="mobile-web-app-capable" content="yes">
            <meta name="apple-mobile-web-app-capable" content="yes">
            <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
            <meta name="theme-color" content="#1e293b">
            <link rel="apple-touch-icon" href="https://cdn-icons-png.flaticon.com/512/5058/5058432.png">

            <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
            <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">

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
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
              }

              .card {
                border: none;
                border-radius: 15px;
                transition: transform 0.3s ease;
              }

              .card:hover {
                transform: translateY(-5px);
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

              .search-input:focus {
                background: rgba(255, 255, 255, 0.2);
                box-shadow: none;
              }

              .search-input::placeholder {
                color: rgba(255, 255, 255, 0.5);
              }

              .brand-text {
                letter-spacing: 2px;
                font-weight: 700;
                color: #3498db;
              }

              @media (max-width: 768px) {
                .navbar-brand span {
                  font-size: 0.9rem;
                }

                .display-header {
                  text-align: center;
                }
              }
            </style>
          </head>

          <body>
            <% List<Complain> complaints = (List<Complain>) request.getAttribute("complaintList");
                String message = (String) request.getAttribute("message");
                StatusCount statusCount = (StatusCount) request.getAttribute("statusCount");
                int rowId = 0;
                %>

                <nav class="navbar navbar-expand-lg navbar-dark navbar-custom py-3">
                  <div class="container">
                    <a class="navbar-brand d-flex align-items-center" href="#">
                      <i class="fas fa-bullhorn me-2 text-info"></i>
                      <span class="brand-text">CampVoice</span>
                      <span class="badge bg-info ms-2 fw-light d-none d-sm-inline">Student Portal</span>
                    </a>

                    <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse"
                      data-bs-target="#dashboardNav">
                      <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="dashboardNav">
                      <div class="ms-auto d-lg-flex align-items-center mt-3 mt-lg-0">
                        <div class="position-relative me-lg-3 mb-2 mb-lg-0">
                          <i class="fas fa-search position-absolute top-50 translate-middle-y ms-3 text-white-50"></i>
                          <input class="form-control form-control-sm search-input w-100" type="search" id="searchInput"
                            placeholder="Search history..." onkeyup="filterComplaints()">
                        </div>

                        <a href="addComplaint.jsp"
                          class="btn btn-info btn-sm rounded-pill px-3 me-lg-2 mb-2 mb-lg-0 text-white d-block d-lg-inline-block">
                          <i class="fas fa-plus me-1"></i>New Complaint
                        </a>

                        <a href="logout"
                          class="btn btn-outline-light btn-sm rounded-pill px-3 d-block d-lg-inline-block">
                          <i class="fas fa-sign-out-alt me-1"></i>Logout
                        </a>
                      </div>
                    </div>
                  </div>
                </nav>

                <div class="container py-4 py-lg-5">
                  <div class="row align-items-center mb-4 display-header">
                    <div class="col-lg-8">
                      <h2 class="fw-bold text-dark">Complaints Overview</h2>
                    </div>
                    <div class="col-lg-4 text-lg-end">
                      <p class="text-muted mb-0">Welcome, <span class="text-primary fw-bold">
                          <%= session.getAttribute("user") %>
                        </span></p>
                    </div>
                  </div>

                  <% if (message !=null) { %>
                    <div class="alert alert-success alert-dismissible fade show border-0 shadow-sm" role="alert">
                      <i class="fas fa-check-circle me-2"></i>
                      <%= message %>
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                    <% } %>

                      <div class="row g-3 g-lg-4 mb-5">
                        <div class="col-6 col-md-3">
                          <div class="card shadow-sm h-100 text-center p-2 p-lg-3 border-warning-custom">
                            <div class="card-body">
                              <i class="fas fa-hourglass-half fa-lg text-warning mb-2"></i>
                              <h4 class="fw-bold mb-0">
                                <%= statusCount !=null ? statusCount.getPending() : 0 %>
                              </h4>
                              <p class="small text-muted mb-0">Pending</p>
                            </div>
                          </div>
                        </div>
                        <div class="col-6 col-md-3">
                          <div class="card shadow-sm h-100 text-center p-2 p-lg-3 border-info-custom">
                            <div class="card-body">
                              <i class="fas fa-spinner fa-spin fa-lg text-info mb-2"></i>
                              <h4 class="fw-bold mb-0">
                                <%= statusCount !=null ? statusCount.getInProgress() : 0 %>
                              </h4>
                              <p class="small text-muted mb-0">In Progress</p>
                            </div>
                          </div>
                        </div>
                        <div class="col-6 col-md-3">
                          <div class="card shadow-sm h-100 text-center p-2 p-lg-3 border-success-custom">
                            <div class="card-body">
                              <i class="fas fa-check-double fa-lg text-success mb-2"></i>
                              <h4 class="fw-bold mb-0">
                                <%= statusCount !=null ? statusCount.getResolved() : 0 %>
                              </h4>
                              <p class="small text-muted mb-0">Resolved</p>
                            </div>
                          </div>
                        </div>
                        <div class="col-6 col-md-3">
                          <div class="card shadow-sm h-100 text-center p-2 p-lg-3 border-primary-custom">
                            <div class="card-body">
                              <i class="fas fa-folder-open fa-lg text-primary mb-2"></i>
                              <h4 class="fw-bold mb-0 text-truncate">
                                <%= statusCount !=null ? statusCount.getTotalCount() : 0 %>
                              </h4>
                              <p class="small text-muted mb-0">Total</p>
                            </div>
                          </div>
                        </div>
                      </div>

                      <div class="card shadow-sm">
                        <div
                          class="card-header bg-white py-3 border-bottom d-flex justify-content-between align-items-center">
                          <h5 class="mb-0 fw-bold small"><i class="fas fa-history me-2 text-secondary"></i>History</h5>
                        </div>
                        <div class="card-body p-0">
                          <div class="table-responsive">
                            <table class="table table-hover mb-0 align-middle" style="min-width: 600px;">
                              <thead class="bg-light">
                                <tr>
                                  <th class="ps-4">No.</th>
                                  <th>Subject</th>
                                  <th>Academic Info</th>
                                  <th width="25%">Description</th>
                                  <th>Status</th>
                                  <th>Date</th>
                                  <th class="text-center">Actions</th>
                                </tr>
                              </thead>
                              <tbody id="complaintsTableBody">
                                <% if (complaints !=null && !complaints.isEmpty()) { for (Complain c : complaints) { %>
                                  <tr>
                                    <td class="ps-4 text-muted small">
                                      <%= ++rowId %>
                                    </td>
                                    <td class="fw-semibold small">
                                      <%= c.getTitle() %>
                                    </td>
                                    <td class="small">
                                      <span class="d-block text-dark">
                                        <%= c.getDepartment() %>
                                      </span>
                                      <span class="text-muted d-block" style="font-size: 0.75rem;">
                                        <%= c.getCourse() %>
                                      </span>
                                    </td>
                                    <td class="small text-secondary" style="font-size: 0.8rem;">
                                      <%= c.getDescription() %>
                                    </td>
                                    <td>
                                      <% String status=(c.getStatus() !=null) ? c.getStatus().toLowerCase() : "pending"
                                        ; String badge=status.contains("pending") ? "warning" :
                                        status.contains("progress") ? "info" : "success" ; %>
                                        <span class="badge rounded-pill bg-<%= badge %> px-2 py-1"
                                          style="font-size: 0.7rem;">
                                          <%= c.getStatus().toUpperCase() %>
                                        </span>
                                    </td>
                                    <td class="small text-muted" style="font-size: 0.75rem;">
                                      <%= c.getCreated_at() %>
                                    </td>
                                    <td class="text-center">
                                      <div class="btn-group shadow-sm rounded">
                                        <a href="addComplaint?complainID=<%= c.getId() %>"
                                          class="btn btn-white btn-sm border-end">
                                          <i class="fas fa-edit text-primary"></i>
                                        </a>
                                        <button onclick="confirmDelete(<%= c.getId() %>)" class="btn btn-white btn-sm">
                                          <i class="fas fa-trash-alt text-danger"></i>
                                        </button>
                                      </div>
                                    </td>
                                  </tr>
                                  <% } } else { %>
                                    <tr>
                                      <td colspan="7" class="text-center py-5">
                                        <img src="https://cdn-icons-png.flaticon.com/512/5058/5058432.png" width="60"
                                          class="mb-3 opacity-25">
                                        <p class="text-muted small">No voices raised yet.</p>
                                      </td>
                                    </tr>
                                    <% } %>
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </div>
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
                      text: "Delete this permanently?",
                      icon: 'warning',
                      showCancelButton: true,
                      confirmButtonColor: '#3498db',
                      cancelButtonColor: '#d33',
                      confirmButtonText: 'Delete'
                    }).then((result) => {
                      if (result.isConfirmed) {
                        window.location.href = "dashboard?complainID=" + id;
                      }
                    })
                  }
                </script>
          </body>

          </html>