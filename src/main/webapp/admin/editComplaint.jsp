<%-- Created by IntelliJ IDEA. User: Compeng Updated: Support Admin Feedback Loop --%>
    <%@ page import="lk.ijse.cms.model.Complain" %>
        <%@ page import="lk.ijse.cms.dao.ComplainDAO" %>
            <%@ page contentType="text/html;charset=UTF-8" language="java" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Admin Feedback Form - CampVoice</title>
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
                            --light-bg: #f0f4f8;
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
                            border-radius: 16px;
                            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
                            max-width: 820px;
                            margin: 2rem auto;
                            overflow: hidden;
                        }

                        .form-header {
                            background: linear-gradient(135deg, #1e293b, #2c3e50);
                            color: #fff;
                            padding: 2rem;
                            text-align: center;
                        }

                        .form-header h1 {
                            font-size: 1.6rem;
                            font-weight: 700;
                            margin-bottom: 0.3rem;
                        }

                        .form-header p {
                            color: rgba(255, 255, 255, 0.6);
                            font-size: 0.88rem;
                        }

                        .form-body {
                            padding: 2rem;
                        }

                        .student-info-card {
                            background: linear-gradient(135deg, #f0f7ff, #e8f4fd);
                            border-radius: 12px;
                            border-left: 5px solid var(--secondary-color);
                            padding: 1.2rem 1.5rem;
                            margin-bottom: 1.5rem;
                        }

                        .student-info-card .label {
                            font-size: 0.75rem;
                            text-transform: uppercase;
                            letter-spacing: 1px;
                            color: #94a3b8;
                            font-weight: 600;
                        }

                        .student-info-card .value {
                            font-size: 1rem;
                            font-weight: 700;
                            color: var(--primary-color);
                        }

                        .read-only-box {
                            background-color: #f8fafc;
                            border-radius: 10px;
                            padding: 1.2rem 1.5rem;
                            border-left: 5px solid #e2e8f0;
                            margin-bottom: 1.5rem;
                        }

                        .read-only-box .issue-title {
                            font-weight: 700;
                            color: #1e293b;
                            margin-bottom: 0.4rem;
                        }

                        .read-only-box .issue-desc {
                            color: #64748b;
                            font-size: 0.9rem;
                            margin: 0;
                        }

                        .form-label {
                            font-weight: 600;
                            color: var(--primary-color);
                            font-size: 0.9rem;
                        }

                        .form-select,
                        .form-control {
                            border-radius: 10px;
                            border: 1px solid #e2e8f0;
                            font-size: 0.9rem;
                        }

                        .form-select:focus,
                        .form-control:focus {
                            border-color: var(--secondary-color);
                            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.1);
                        }

                        .greeting-badge {
                            display: inline-flex;
                            align-items: center;
                            gap: 6px;
                            background: rgba(52, 152, 219, 0.1);
                            color: var(--secondary-color);
                            border: 1px solid rgba(52, 152, 219, 0.25);
                            border-radius: 100px;
                            padding: 4px 14px;
                            font-size: 0.78rem;
                            font-weight: 600;
                            margin-bottom: 8px;
                        }

                        textarea.form-control {
                            resize: vertical;
                            line-height: 1.7;
                        }

                        .btn-primary {
                            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
                            border: none;
                            padding: 0.8rem 2rem;
                            border-radius: 10px;
                            font-weight: 600;
                            transition: all 0.3s ease;
                        }

                        .btn-primary:hover {
                            transform: translateY(-2px);
                            box-shadow: 0 6px 16px rgba(52, 152, 219, 0.35);
                        }

                        .btn-outline-secondary {
                            border-radius: 10px;
                            font-weight: 600;
                        }
                    </style>
                </head>

                <body>
                    <% String idParam=request.getParameter("complainID"); Complain complaint=null; if (idParam !=null &&
                        !idParam.isEmpty()) { complaint=ComplainDAO.getComplainById(getServletContext(),
                        Integer.parseInt(idParam)); } %>

                        <nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
                            <div class="container-fluid">
                                <span class="navbar-brand text-white">
                                    <i class="bi bi-shield-lock-fill me-2"></i>Admin Management
                                </span>
                                <div class="ms-auto">
                                    <a href="dashboard" class="btn btn-sm btn-light">
                                        <i class="bi bi-arrow-left me-1"></i>Back
                                    </a>
                                </div>
                            </div>
                        </nav>

                        <div class="container py-4">
                            <div class="form-container">
                                <div class="form-header">
                                    <h1><i class="bi bi-chat-left-text-fill me-2"></i>Provide Feedback</h1>
                                    <p class="mb-0">Responding to student complaint #<%= idParam %>
                                    </p>
                                </div>

                                <form action="../addComplaint" method="post">
                                    <div class="form-body">
                                        <input type="hidden" name="complainID" value="<%= idParam %>">

                                        <% if (complaint !=null) { String studentId=complaint.getStudentId(); String
                                            existingRemark=complaint.getRemarks(); %>

                                            <!-- Student Info -->
                                            <div class="student-info-card">
                                                <div class="row">
                                                    <div class="col-md-6 mb-2 mb-md-0">
                                                        <div class="label">Student ID</div>
                                                        <div class="value">
                                                            <i class="bi bi-person-badge me-1"
                                                                style="color:#3498db;"></i>
                                                            <%= studentId %>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="label">Department / Course</div>
                                                        <div class="value">
                                                            <i class="bi bi-mortarboard me-1"
                                                                style="color:#3498db;"></i>
                                                            <%= complaint.getDepartment() %> — <%= complaint.getCourse()
                                                                    %>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Student's Issue -->
                                            <div class="read-only-box">
                                                <label class="form-label">
                                                    <i class="bi bi-info-circle me-1"></i>Student's Issue
                                                </label>
                                                <p class="issue-title">
                                                    <%= complaint.getTitle() %>
                                                </p>
                                                <p class="issue-desc">
                                                    <%= complaint.getDescription() %>
                                                </p>
                                            </div>

                                            <!-- Status -->
                                            <div class="mb-4">
                                                <label for="status" class="form-label">
                                                    <i class="bi bi-flag me-1"></i>Update Status
                                                </label>
                                                <select class="form-select" id="status" name="status" required>
                                                    <option value="PENDING" <%="PENDING" .equals(complaint.getStatus())
                                                        ? "selected" : "" %>>⏳ Pending</option>
                                                    <option value="IN_PROGRESS" <%="IN_PROGRESS"
                                                        .equals(complaint.getStatus()) ? "selected" : "" %>>🔄 In
                                                        Progress</option>
                                                    <option value="RESOLVED" <%="RESOLVED"
                                                        .equals(complaint.getStatus()) ? "selected" : "" %>>✅ Resolved
                                                    </option>
                                                </select>
                                            </div>

                                            <!-- ✅ Resolution Textarea with personalized greeting -->
                                            <div class="mb-3">
                                                <label for="remark" class="form-label">
                                                    <i class="bi bi-pencil-square me-1"></i>Official Remark / Resolution
                                                </label>
                                                <div class="greeting-badge">
                                                    <i class="bi bi-person-check"></i>
                                                    Auto-addressed to: <%= studentId %>
                                                </div>
                                                <textarea class="form-control" id="remark" name="remark" rows="8"
                                                    required><%=
(existingRemark != null && !existingRemark.isEmpty()) ? existingRemark :
"Hi " + studentId + ",\n" +
"Regarding the issue you reported: \"" + complaint.getTitle() + "\"\n\n" +
"Resolution:\n\n" +
"Best regards,\n" +
"Campus Administration"
%></textarea>
                                            </div>

                                            <div class="d-flex gap-2 justify-content-end mt-4">
                                                <a href="dashboard" class="btn btn-outline-secondary px-4">
                                                    <i class="bi bi-x me-1"></i>Cancel
                                                </a>
                                                <button type="submit" class="btn btn-primary">
                                                    <i class="bi bi-send me-2"></i>Update & Send Feedback
                                                </button>
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