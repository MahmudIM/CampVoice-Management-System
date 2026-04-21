<%-- Created by IntelliJ IDEA. User: Compeng Updated: Support Admin Feedback Loop --%>
    <%@ page import="lk.ijse.cms.model.Complain" %>
        <%@ page import="lk.ijse.cms.dao.ComplainDAO" %>
            <%@ page contentType="text/html;charset=UTF-8" language="java" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Admin Feedback Form - CMS</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css"
                        rel="stylesheet">
                    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap"
                        rel="stylesheet">
                    <style>
                        :root {
                            --primary-color: #2c3e50;
                            --secondary-color: #3498db;
                            --light-bg: #f8f9fa;
                        }

                        body {
                            font-family: 'Poppins', sans-serif;
                            background-color: var(--light-bg);
                        }

                        .navbar-custom {
                            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
                        }

                        .form-container {
                            background: #fff;
                            border-radius: 12px;
                            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
                            max-width: 800px;
                            margin: 2rem auto;
                            overflow: hidden;
                        }

                        .form-header {
                            background: #2c3e50;
                            color: #fff;
                            padding: 2rem;
                            text-align: center;
                        }

                        .form-body {
                            padding: 2rem;
                        }

                        .read-only-box {
                            background-color: #f1f3f5;
                            border-radius: 8px;
                            padding: 15px;
                            border-left: 5px solid var(--secondary-color);
                            margin-bottom: 20px;
                        }

                        .form-label {
                            font-weight: 600;
                            color: var(--primary-color);
                        }

                        .btn-primary {
                            background: var(--primary-color);
                            border: none;
                            padding: 0.8rem 2rem;
                        }

                        .btn-primary:hover {
                            background: var(--secondary-color);
                        }
                    </style>
                </head>

                <body>
                    <% String idParam=request.getParameter("complainID"); Complain complaint=null; if (idParam !=null &&
                        !idParam.isEmpty()) { // Fetch the actual data from Database
                        complaint=ComplainDAO.getComplainById(getServletContext(), Integer.parseInt(idParam)); } %>

                        <nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
                            <div class="container-fluid">
                                <span class="navbar-brand text-white"><i class="bi bi-shield-lock-fill me-2"></i>Admin
                                    Management</span>
                                <div class="ms-auto">
                                    <a href="dashboard.jsp" class="btn btn-sm btn-light"><i
                                            class="bi bi-arrow-left me-1"></i>Back</a>
                                </div>
                            </div>
                        </nav>

                        <div class="container py-4">
                            <div class="form-container">
                                <div class="form-header">
                                    <h1>Provide Feedback</h1>
                                    <p class="mb-0">Respond to student request #<%= idParam %>
                                    </p>
                                </div>

                                <form action="../addComplaint" method="post">
                                    <div class="form-body">
                                        <input type="hidden" name="complainID" value="<%= idParam %>">

                                        <% if (complaint !=null) { %>

                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <label class="small text-muted">Student ID</label>
                                                    <p class="fw-bold">
                                                        <%= complaint.getStudentId() %>
                                                    </p>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="small text-muted">Department / Course</label>
                                                    <p class="fw-bold">
                                                        <%= complaint.getDepartment() %> - <%= complaint.getCourse() %>
                                                    </p>
                                                </div>
                                            </div>

                                            <div class="read-only-box">
                                                <label class="form-label"><i
                                                        class="bi bi-info-circle me-2"></i>Student's Issue:</label>
                                                <p class="mb-1"><strong>
                                                        <%= complaint.getTitle() %>
                                                    </strong></p>
                                                <p class="mb-0 text-muted">
                                                    <%= complaint.getDescription() %>
                                                </p>
                                            </div>

                                            <div class="mb-4">
                                                <label for="status" class="form-label">Update Status</label>
                                                <select class="form-select" id="status" name="status" required>
                                                    <option value="PENDING" <%="PENDING" .equals(complaint.getStatus())
                                                        ? "selected" : "" %>>Pending</option>
                                                    <option value="IN_PROGRESS" <%="IN_PROGRESS"
                                                        .equals(complaint.getStatus()) ? "selected" : "" %>>In Progress
                                                    </option>
                                                    <option value="RESOLVED" <%="RESOLVED"
                                                        .equals(complaint.getStatus()) ? "selected" : "" %>>Resolved
                                                    </option>
                                                </select>
                                            </div>

                                            <div class="mb-3">
                                                <label for="remark" class="form-label">Official Remark /
                                                    Resolution</label>
                                                <textarea class="form-control" id="remark" name="remark" rows="4"
                                                    placeholder="Explain what steps have been taken..."
                                                    required><%= (complaint.getRemarks() != null) ? complaint.getRemarks() : "" %></textarea>
                                            </div>

                                            <div class="d-flex gap-2 justify-content-end mt-4">
                                                <a href="dashboard.jsp"
                                                    class="btn btn-outline-secondary px-4">Cancel</a>
                                                <button type="submit" class="btn btn-primary">Update & Send
                                                    Feedback</button>
                                            </div>

                                            <% } else { %>
                                                <div class="alert alert-danger text-center">
                                                    <i class="bi bi-exclamation-triangle-fill display-4"></i>
                                                    <p class="mt-3">Error: Could not retrieve complaint details.</p>
                                                </div>
                                                <% } %>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <script
                            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                </body>

                </html>