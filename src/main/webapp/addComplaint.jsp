<%-- Created by IntelliJ IDEA. User: compeng Updated for: CampVoice --%>
    <%@ page import="lk.ijse.cms.model.Complain" %>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Submit Voice - CampVoice</title>
                <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap"
                    rel="stylesheet">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css"
                    rel="stylesheet">
                <style>
                    :root {
                        --primary-color: #1e293b;
                        --secondary-color: #3498db;
                        --light-bg: #f4f7f6;
                    }

                    body {
                        font-family: 'Poppins', sans-serif;
                        background-color: var(--light-bg);
                        min-height: 100vh;
                    }

                    .navbar-custom {
                        background: linear-gradient(to right, var(--primary-color), #0f172a);
                        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                    }

                    .brand-text {
                        letter-spacing: 2px;
                        font-weight: 700;
                        color: #3498db;
                    }

                    .form-container {
                        background: #fff;
                        border-radius: 15px;
                        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
                        max-width: 800px;
                        margin: 2rem auto;
                        overflow: hidden;
                        border: none;
                    }

                    .form-header {
                        background: linear-gradient(135deg, #1e293b 0%, #34495e 100%);
                        color: #fff;
                        padding: 2rem;
                        text-align: center;
                    }

                    .form-body {
                        padding: 1.5rem;
                    }

                    .form-label {
                        font-weight: 600;
                        color: var(--primary-color);
                        font-size: 0.85rem;
                        margin-bottom: 0.4rem;
                    }

                    .form-control {
                        border-radius: 8px;
                        padding: 0.7rem;
                        border: 1px solid #e2e8f0;
                        background-color: #f8fafc;
                        font-size: 0.9rem;
                    }

                    .form-control:focus {
                        background-color: #fff;
                        border-color: var(--secondary-color);
                        box-shadow: 0 0 0 4px rgba(52, 152, 219, 0.1);
                    }

                    .form-control[readonly] {
                        background-color: #e2e8f0;
                        cursor: not-allowed;
                        color: #64748b;
                    }

                    .btn-submit {
                        background: linear-gradient(to right, #3498db, #2980b9);
                        border: none;
                        padding: 0.7rem 1.5rem;
                        font-weight: 600;
                        border-radius: 8px;
                        transition: all 0.3s ease;
                        color: white;
                    }

                    .required {
                        color: #e74c3c;
                    }

                    /* Tablet/Mobile Adjustments */
                    @media (max-width: 768px) {
                        .form-container {
                            margin: 1rem;
                            border-radius: 10px;
                        }

                        .form-header {
                            padding: 1.5rem;
                        }

                        .brand-text {
                            font-size: 1.1rem;
                        }
                    }
                </style>
            </head>

            <body>
                <% /* Safe Logic Initialization */ lk.ijse.cms.model.Complain complaint=(lk.ijse.cms.model.Complain)
                    request.getAttribute("complain"); String message=(String) request.getAttribute("message"); String
                    pageTitle=(complaint !=null) ? "Refine Your Voice" : "Raise a New Voice" ; String
                    buttonText=(complaint !=null) ? "Update Complaint" : "Submit Complaint" ; String
                    currentUser="Student User" ; if (session !=null && session.getAttribute("user") !=null) {
                    currentUser=(String) session.getAttribute("user"); } %>

                    <nav class="navbar navbar-expand-lg navbar-dark navbar-custom py-2">
                        <div class="container">
                            <a class="navbar-brand d-flex align-items-center" href="dashboard">
                                <i class="bi bi-bullhorn me-2 text-info"></i>
                                <span class="brand-text">CampVoice</span>
                            </a>
                            <div class="ms-auto">
                                <a href="dashboard" class="btn btn-outline-light btn-sm rounded-pill px-3">
                                    <i class="bi bi-arrow-left me-1"></i> Dashboard
                                </a>
                            </div>
                        </div>
                    </nav>

                    <div class="container">
                        <div class="form-container shadow-sm">
                            <div class="form-header">
                                <h3 class="fw-bold mb-1">
                                    <%= pageTitle %>
                                </h3>
                                <p class="opacity-75 mb-0 small">Please provide accurate details for faster resolution.
                                </p>
                            </div>

                            <% if (message !=null) { %>
                                <div class="alert alert-info m-3 border-0 shadow-sm small">
                                    <i class="bi bi-info-circle-fill me-2"></i>
                                    <%= message %>
                                </div>
                                <% } %>

                                    <form action="addComplaint" method="post">
                                        <div class="form-body">
                                            <input type="hidden" name="complainID"
                                                value="<%= (complaint != null) ? complaint.getId() : "" %>">

                                            <div class="row g-3">
                                                <div class="col-12 col-md-6">
                                                    <label class="form-label">Student Identity</label>
                                                    <input type="text" class="form-control" name="studentId"
                                                        value="<%= currentUser %>" readonly>
                                                </div>

                                                <div class="col-12 col-md-6">
                                                    <label class="form-label">Department <span
                                                            class="required">*</span></label>
                                                    <input type="text" class="form-control" name="department"
                                                        placeholder="e.g. Computer Science"
                                                        value="<%= (complaint != null) ? complaint.getDepartment() : "" %>"
                                                        required>
                                                </div>

                                                <div class="col-12 col-md-6">
                                                    <label class="form-label">Course / Program <span
                                                            class="required">*</span></label>
                                                    <input type="text" class="form-control" name="course"
                                                        placeholder="e.g. B.Sc Software"
                                                        value="<%= (complaint != null) ? complaint.getCourse() : "" %>"
                                                        required>
                                                </div>

                                                <div class="col-12 col-md-6">
                                                    <label class="form-label">Date of Incident <span
                                                            class="required">*</span></label>
                                                    <input type="date" class="form-control" name="incidentDate"
                                                        value="<%= (complaint != null) ? complaint.getCreated_at() : "" %>"
                                                        required>
                                                </div>

                                                <div class="col-12">
                                                    <label class="form-label">Subject Title <span
                                                            class="required">*</span></label>
                                                    <input type="text" class="form-control" name="subject"
                                                        placeholder="Brief summary of the issue"
                                                        value="<%= (complaint != null) ? complaint.getTitle() : "" %>"
                                                        required>
                                                </div>

                                                <div class="col-12">
                                                    <label class="form-label">Detailed Description <span
                                                            class="required">*</span></label>
                                                    <textarea class="form-control" name="description" rows="4"
                                                        placeholder="Explain the issue in detail..."
                                                        required><%= (complaint != null) ? complaint.getDescription() : "" %></textarea>
                                                </div>
                                            </div>

                                            <% if (complaint !=null && complaint.getRemarks() !=null &&
                                                !complaint.getRemarks().isEmpty()) { %>
                                                <div
                                                    class="mt-4 p-3 bg-light rounded border-start border-4 border-info">
                                                    <h6 class="fw-bold text-info small"><i
                                                            class="bi bi-patch-question me-1"></i>Official Feedback:
                                                    </h6>
                                                    <p class="mb-0 text-secondary small">
                                                        <%= complaint.getRemarks() %>
                                                    </p>
                                                </div>
                                                <% } %>
                                        </div>

                                        <div
                                            class="bg-light px-3 py-3 d-flex flex-column flex-sm-row justify-content-between align-items-center">
                                            <span class="text-muted small mb-3 mb-sm-0"><span class="required">*</span>
                                                Required fields</span>
                                            <div class="d-flex w-100 w-sm-auto justify-content-end">
                                                <a href="dashboard"
                                                    class="btn btn-link text-decoration-none text-secondary me-3 small align-self-center">Discard</a>
                                                <button type="submit" class="btn btn-submit shadow-sm">
                                                    <%= buttonText %>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                        </div>
                    </div>

                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>