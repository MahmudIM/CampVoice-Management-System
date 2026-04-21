<%-- Created by IntelliJ IDEA. User: compeng Updated for: CampVoice --%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Login - CampVoice</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
            <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800&display=swap"
                rel="stylesheet">

            <style>
                :root {
                    --primary-color: #1e293b;
                    --secondary-color: #3498db;
                    --accent-color: #0f172a;
                }

                body {
                    background: linear-gradient(to right, #141e30, #243b55);
                    font-family: 'Poppins', sans-serif;
                    min-height: 100vh;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    padding: 20px;
                    margin: 0;
                }

                .login-container {
                    background: white;
                    border-radius: 15px;
                    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.4);
                    overflow: hidden;
                    width: 100%;
                    max-width: 900px;
                    display: flex;
                    min-height: 550px;
                }

                /* Left Side Branding Section */
                .login-left {
                    background: linear-gradient(135deg, #000000 0%, #1a1a1a 100%);
                    color: white;
                    padding: 3rem;
                    display: flex;
                    flex-direction: column;
                    justify-content: center;
                    align-items: center;
                    text-align: center;
                    flex: 1;
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

                /* Right Side Form Section */
                .login-right {
                    padding: 4rem 3rem;
                    display: flex;
                    flex-direction: column;
                    justify-content: center;
                    flex: 1;
                    background-color: white;
                }

                .login-header h2 {
                    color: var(--primary-color);
                    font-weight: 700;
                    font-size: 2rem;
                    margin-bottom: 0.5rem;
                }

                .form-control {
                    height: 55px;
                    border-radius: 10px;
                    border: 1px solid #e2e8f0;
                    padding-left: 45px !important;
                    transition: all 0.3s ease;
                }

                .form-control:focus {
                    border-color: var(--secondary-color);
                    box-shadow: 0 0 0 4px rgba(52, 152, 219, 0.1);
                }

                .input-icon {
                    position: absolute;
                    left: 15px;
                    top: 50%;
                    transform: translateY(-50%);
                    color: #94a3b8;
                    z-index: 5;
                    font-size: 1.2rem;
                }

                .btn-login {
                    background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
                    border: none;
                    padding: 14px;
                    font-weight: 600;
                    border-radius: 10px;
                    color: white;
                    font-size: 1.1rem;
                    transition: all 0.3s ease;
                    margin-top: 10px;
                }

                .btn-login:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 10px 20px rgba(30, 41, 59, 0.2);
                    color: white;
                }

                .alert-custom {
                    border-radius: 10px;
                    border: none;
                    font-size: 0.9rem;
                    background-color: #fee2e2;
                    color: #b91c1c;
                    padding: 12px;
                }

                @media (max-width: 768px) {
                    .login-container {
                        flex-direction: column;
                        max-width: 450px;
                    }

                    .login-left {
                        padding: 2rem;
                        min-height: 200px;
                    }
                }
            </style>
        </head>

        <body>
            <% String errorMessage=(String) request.getAttribute("errorMessage"); String successMessage=(String)
                request.getAttribute("successMessage"); %>

                <div class="login-container shadow-lg">
                    <div class="login-left">
                        <div class="brand-logo-box">
                            <i class="bi bi-chat-right-quote-fill" style="font-size: 3.5rem; color: #3498db;"></i>
                        </div>
                        <h1 class="brand-name">CampVoice</h1>
                        <p class="brand-tagline">Student Resolution Hub</p>
                        <p class="mt-4 px-4 opacity-75 small">Access your dashboard to track and manage your campus
                            voices.</p>
                    </div>

                    <div class="login-right">
                        <div class="login-header text-center">
                            <h2>Welcome Back</h2>
                            <p class="text-muted small">Sign in to your account</p>
                        </div>

                        <% if (errorMessage !=null && !errorMessage.trim().isEmpty()) { %>
                            <div class="alert alert-custom d-flex align-items-center mb-4" role="alert">
                                <i class="bi bi-exclamation-circle-fill me-2"></i>
                                <%= errorMessage %>
                            </div>
                            <% } %>

                                <% if (successMessage !=null && !successMessage.trim().isEmpty()) { %>
                                    <div class="alert alert-success alert-custom d-flex align-items-center mb-4 text-success bg-success-subtle"
                                        role="alert">
                                        <i class="bi bi-check-circle-fill me-2"></i>
                                        <%= successMessage %>
                                    </div>
                                    <% } %>

                                        <form method="post" action="login">
                                            <div class="form-floating position-relative mb-3">
                                                <i class="bi bi-person input-icon"></i>
                                                <input type="text" class="form-control" id="username" name="username"
                                                    placeholder="Username" required>
                                                <label for="username" class="ms-4 ps-3">Username</label>
                                            </div>

                                            <div class="form-floating position-relative mb-4">
                                                <i class="bi bi-lock input-icon"></i>
                                                <input type="password" class="form-control" id="password"
                                                    name="password" placeholder="Password" required>
                                                <label for="password" class="ms-4 ps-3">Password</label>
                                            </div>

                                            <button type="submit" class="btn btn-login w-100 mb-3">Sign In</button>

                                            <div class="text-center mt-3">
                                                <span class="text-muted small">Don't have an account? </span>
                                                <a href="register.jsp" class="text-decoration-none fw-bold"
                                                    style="color: #3498db;">Register here</a>
                                            </div>
                                        </form>
                    </div>
                </div>
        </body>

        </html>