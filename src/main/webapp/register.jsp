<%-- Created by IntelliJ IDEA. User: Compeng --%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Register - CampVoice</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
            <style>
                :root {
                    --primary-color: #2c3e50;
                    --secondary-color: #3498db;
                    --success-color: #27ae60;
                    --warning-color: #f39c12;
                    --danger-color: #e74c3c;
                    --light-bg: #f8f9fa;
                    --card-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
                }

                body {
                    background: linear-gradient(to right, #141e30, #243b55);
                    font-family: 'Poppins', 'Segoe UI', sans-serif;
                    min-height: 100vh;
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    justify-content: center;
                    padding: 20px;
                    margin: 0;
                }

                .register-container {
                    background: white;
                    border-radius: 15px;
                    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
                    overflow: hidden;
                    width: 100%;
                    max-width: 950px;
                    display: flex;
                    min-height: 600px;
                }

                .register-left {
                    background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%);
                    color: white;
                    padding: 3rem;
                    display: flex;
                    flex-direction: column;
                    justify-content: center;
                    align-items: center;
                    text-align: center;
                    flex: 1.2;
                    position: relative;
                }

                .brand-logo-box {
                    background: rgba(255, 255, 255, 0.05);
                    border: 1px solid rgba(255, 255, 255, 0.1);
                    border-radius: 20px;
                    padding: 1.5rem;
                    display: inline-block;
                    margin-bottom: 1.5rem;
                }

                .brand-name {
                    letter-spacing: 5px;
                    font-weight: 800;
                    text-transform: uppercase;
                    margin: 0;
                    background: linear-gradient(to right, #ffffff, #3498db);
                    -webkit-background-clip: text;
                    -webkit-text-fill-color: transparent;
                    font-size: 2.5rem;
                }

                .brand-tagline {
                    font-size: 0.85rem;
                    letter-spacing: 3px;
                    color: #3498db;
                    text-transform: uppercase;
                    font-weight: 600;
                    margin-top: 5px;
                }

                .register-left-content {
                    position: relative;
                    z-index: 2;
                }

                .register-right {
                    padding: 3rem;
                    display: flex;
                    flex-direction: column;
                    justify-content: center;
                    flex: 1;
                    background-color: white;
                }

                .register-header h2 {
                    color: var(--primary-color);
                    font-weight: 700;
                    font-size: 1.8rem;
                }

                .form-control,
                .form-select {
                    height: 50px;
                    border-radius: 8px;
                    border: 1px solid #e0e0e0;
                    padding-left: 45px;
                }

                .input-icon {
                    position: absolute;
                    left: 15px;
                    top: 50%;
                    transform: translateY(-50%);
                    color: #6c757d;
                    z-index: 5;
                    font-size: 1.1rem;
                }

                .btn-register {
                    background: linear-gradient(to right, #2c3e50, #3498db);
                    border: none;
                    padding: 12px;
                    font-weight: 600;
                    border-radius: 8px;
                    color: white;
                    transition: all 0.3s ease;
                }

                .btn-register:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 5px 15px rgba(52, 152, 219, 0.3);
                }

                .app-footer {
                    margin-top: 2rem;
                    color: rgba(255, 255, 255, 0.6);
                    font-size: 0.85rem;
                    text-align: center;
                }

                @media (max-width: 768px) {
                    .register-container {
                        flex-direction: column;
                    }

                    .register-left {
                        padding: 2rem;
                    }
                }
            </style>
        </head>

        <body>
            <% String errorMessage=(String) request.getAttribute("errorMessage"); String successMessage=(String)
                request.getAttribute("successMessage"); %>

                <div class="register-container">
                    <div class="register-left">
                        <div class="register-left-content">
                            <div class="brand-logo-box">
                                <i class="bi bi-chat-right-quote-fill" style="font-size: 3rem; color: #3498db;"></i>
                            </div>
                            <h1 class="brand-name">CampVoice</h1>
                            <p class="brand-tagline">Student Resolution Hub</p>

                            <div class="mt-5">
                                <h2 class="h4 fw-bold text-white mb-3">Join Us Today!</h2>
                                <p class="px-lg-5">Create your account to start managing campus complaints efficiently
                                    and transparently.</p>
                            </div>
                        </div>
                    </div>

                    <div class="register-right">
                        <div class="register-header text-center mb-4">
                            <h2>Create Account</h2>
                            <p class="text-muted">Fill in your details to get started</p>
                        </div>

                        <% if (errorMessage !=null && !errorMessage.trim().isEmpty()) { %>
                            <div class="alert alert-danger d-flex align-items-center" role="alert">
                                <i class="bi bi-exclamation-triangle-fill me-2"></i>
                                <%= errorMessage %>
                            </div>
                            <% } %>

                                <% if (successMessage !=null && !successMessage.trim().isEmpty()) { %>
                                    <div class="alert alert-success d-flex align-items-center" role="alert">
                                        <i class="bi bi-check-circle-fill me-2"></i>
                                        <%= successMessage %>
                                    </div>
                                    <% } %>

                                        <form method="post" action="register">
                                            <div class="form-floating mb-3 position-relative">
                                                <i class="bi bi-person input-icon"></i>
                                                <input type="text" class="form-control" id="username" name="username"
                                                    placeholder="Username" required autocomplete="username">
                                                <label for="username" class="ms-4 ps-3">Username</label>
                                            </div>

                                            <div class="form-floating mb-3 position-relative">
                                                <i class="bi bi-lock input-icon"></i>
                                                <input type="password" class="form-control" id="password"
                                                    name="password" placeholder="Password" required minlength="8">
                                                <label for="password" class="ms-4 ps-3">Password</label>
                                            </div>

                                            <div class="form-floating mb-3 position-relative">
                                                <i class="bi bi-shield-lock input-icon"></i>
                                                <input type="password" class="form-control" id="password2"
                                                    name="password2" placeholder="Confirm Password" required>
                                                <label for="password2" class="ms-4 ps-3">Confirm Password</label>
                                            </div>

                                            <div class="form-floating mb-4 position-relative">
                                                <i class="bi bi-person-badge input-icon"></i>
                                                <select class="form-select" id="role" name="role" required>
                                                    <option value="STUDENT" selected>Student</option>
                                                </select>
                                                <label for="role" class="ms-4 ps-3">Role (Student Account)</label>
                                                <div class="form-text mt-2 text-muted" style="font-size: 0.75rem;">
                                                    <i class="bi bi-info-circle me-1"></i> Staff/Faculty accounts must
                                                    be created by IT Administration.
                                                </div>
                                            </div>

                                            <button type="submit" class="btn btn-register w-100 mb-3">Create
                                                Account</button>

                                            <div class="text-center mt-3">
                                                <span class="text-muted small">Already have an account? </span>
                                                <a href="login.jsp" class="text-decoration-none fw-bold"
                                                    style="color: #3498db;">Sign In Here</a>
                                            </div>
                                        </form>
                    </div>
                </div>

                <footer class="app-footer">
                    <p>© 2026 @Compeng - Ahmadu Bello University (CampVoice)</p>
                </footer>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>