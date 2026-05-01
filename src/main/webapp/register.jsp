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
                    width: 100%;
                    max-width: 950px;
                    display: flex;
                    min-height: 700px;
                    overflow: hidden;
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
                }

                .brand-name {
                    letter-spacing: 5px;
                    font-weight: 800;
                    text-transform: uppercase;
                    background: linear-gradient(to right, #ffffff, #3498db);
                    -webkit-background-clip: text;
                    -webkit-text-fill-color: transparent;
                    font-size: 2.5rem;
                }

                .register-right {
                    padding: 2.5rem;
                    flex: 1;
                    background-color: white;
                    overflow-y: auto;
                }

                /* UI Fix for Icons and Floating Labels */
                .form-control,
                .form-select {
                    height: 55px;
                    padding-left: 3.5rem !important;
                    border-radius: 10px;
                }

                .input-icon {
                    position: absolute;
                    left: 1.2rem;
                    top: 50%;
                    transform: translateY(-50%);
                    color: #3498db;
                    z-index: 10;
                    font-size: 1.2rem;
                }

                .form-floating>label {
                    padding-left: 3.5rem;
                }

                .form-floating>.form-control:focus~label,
                .form-floating>.form-control:not(:placeholder-shown)~label,
                .form-floating>.form-select~label {
                    transform: scale(.85) translateY(-1rem) translateX(1.5rem);
                    background: white;
                    padding: 0 10px;
                    height: auto;
                }

                .btn-register {
                    background: linear-gradient(to right, #2c3e50, #3498db);
                    border: none;
                    padding: 14px;
                    font-weight: 600;
                    border-radius: 10px;
                    color: white;
                    margin-top: 10px;
                }

                @media (max-width: 768px) {
                    .register-container {
                        flex-direction: column;
                    }
                }
            </style>
        </head>

        <body>
            <% String errorMessage=(String) request.getAttribute("errorMessage"); %>

                <div class="register-container">
                    <div class="register-left">
                        <div class="brand-logo-box">
                            <i class="bi bi-chat-right-quote-fill" style="font-size: 3rem; color: #3498db;"></i>
                        </div>
                        <h1 class="brand-name">CampVoice</h1>
                        <p style="letter-spacing: 3px; color: #3498db; text-transform: uppercase; font-weight: 600;">
                            Student Resolution Hub</p>
                        <div class="mt-5 d-none d-lg-block">
                            <h2 class="h4 fw-bold">Join Us Today!</h2>
                            <p>Manage your campus complaints efficiently with your ABU Student ID.</p>
                        </div>
                    </div>

                    <div class="register-right">
                        <div class="text-center mb-4">
                            <h2 class="fw-bold">Create Account</h2>
                            <p class="text-muted">Register with your Student ID</p>
                        </div>

                        <% if (errorMessage !=null) { %>
                            <div class="alert alert-danger py-2">
                                <%= errorMessage %>
                            </div>
                            <% } %>

                                <!-- ✅ autocomplete="off" on the form prevents browser autofill -->
                                <form method="post" action="register" autocomplete="off">

                                    <div class="form-floating mb-3 position-relative">
                                        <i class="bi bi-person-badge input-icon"></i>
                                        <input type="text" class="form-control" id="username" name="username"
                                            placeholder="Matric Number" required autocomplete="off"
                                            pattern="^[uU](19|2[0-5])[cC][oO][1-2]\d{3}$"
                                            title="Format: U19CO1... to U25CO2... (e.g. U23CO1010)">
                                        <label for="username">Student ID</label>
                                    </div>

                                    <div class="form-floating mb-3 position-relative">
                                        <i class="bi bi-envelope input-icon"></i>
                                        <input type="email" class="form-control" id="email" name="email"
                                            placeholder="name@example.com" required autocomplete="off">
                                        <label for="email">Email Address</label>
                                    </div>

                                    <div class="form-floating mb-3 position-relative">
                                        <i class="bi bi-lock input-icon"></i>
                                        <input type="password" class="form-control" id="password" name="password"
                                            placeholder="Password" required minlength="8" autocomplete="new-password">
                                        <label for="password">Password</label>
                                    </div>

                                    <div class="form-floating mb-3 position-relative">
                                        <i class="bi bi-shield-lock input-icon"></i>
                                        <input type="password" class="form-control" id="password2" name="password2"
                                            placeholder="Confirm Password" required autocomplete="new-password">
                                        <label for="password2">Confirm Password</label>
                                    </div>

                                    <div class="form-floating mb-3 position-relative">
                                        <i class="bi bi-building input-icon"></i>
                                        <select id="facultySelect" class="form-select" onchange="updateDepts()"
                                            required>
                                            <option value="">-- Choose Faculty --</option>
                                            <option value="engineering">Faculty of Engineering</option>
                                            <option value="pharmacy" disabled>Faculty of Pharmacy (Soon)</option>
                                            <option value="medicine" disabled>College of Medicine (Soon)</option>
                                            <option value="education" disabled>Faculty of Education (Soon)</option>
                                        </select>
                                        <label for="facultySelect">Faculty</label>
                                    </div>

                                    <div class="form-floating mb-4 position-relative">
                                        <i class="bi bi-mortarboard input-icon"></i>
                                        <select id="deptSelect" name="department" class="form-select" required disabled>
                                            <option value="">Select Faculty First</option>
                                        </select>
                                        <label for="deptSelect">Department</label>
                                    </div>

                                    <input type="hidden" name="role" value="STUDENT">
                                    <button type="submit" class="btn btn-register w-100">Create Account</button>

                                    <div class="text-center mt-3">
                                        <span class="text-muted small">Already have an account? </span>
                                        <a href="login.jsp" class="text-decoration-none fw-bold"
                                            style="color: #3498db;">Sign In</a>
                                    </div>
                                </form>
                    </div>
                </div>

                <footer style="margin-top: 2rem; color: rgba(255,255,255,0.6); font-size: 0.85rem;">
                    © 2026 @Compeng - Ahmadu Bello University
                </footer>

                <script>
                    function updateDepts() {
                        const faculty = document.getElementById('facultySelect').value;
                        const dept = document.getElementById('deptSelect');
                        dept.innerHTML = "";
                        dept.disabled = false;
                        if (faculty === "engineering") {
                            const options = [
                                { val: "Computer Engineering", text: "Computer Engineering" },
                                { val: "Electrical", text: "Electrical Engineering (Soon)", disabled: true },
                                { val: "Telecom", text: "Telecommunication (Soon)", disabled: true }
                            ];
                            options.forEach(opt => {
                                let el = document.createElement("option");
                                el.value = opt.val;
                                el.textContent = opt.text;
                                if (opt.disabled) el.disabled = true;
                                dept.appendChild(el);
                            });
                        }
                    }
                </script>
        </body>

        </html>