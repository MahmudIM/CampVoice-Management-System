<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CampVoice | Student Resolution Hub</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;800&display=swap" rel="stylesheet">

    <style>
      :root {
        --accent: #3498db;
        --accent-dark: #2176ae;
        --bg: #0b0f1a;
      }

      * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
      }

      html {
        scroll-behavior: smooth;
      }

      body {
        background-color: var(--bg);
        background-image:
          radial-gradient(circle at 10% 20%, rgba(52, 152, 219, 0.1) 0%, transparent 40%),
          radial-gradient(circle at 90% 80%, rgba(44, 62, 80, 0.15) 0%, transparent 40%);
        color: #e2e8f0;
        font-family: 'Inter', sans-serif;
        overflow-x: hidden;
      }

      body::before {
        content: '';
        position: fixed;
        inset: 0;
        background-image: radial-gradient(rgba(255, 255, 255, 0.025) 1px, transparent 1px);
        background-size: 40px 40px;
        pointer-events: none;
        z-index: 0;
      }

      /* ── NAVBAR ── */
      .navbar-custom {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        z-index: 100;
        padding: 1rem 2rem;
        display: flex;
        align-items: center;
        justify-content: space-between;
        background: rgba(11, 15, 26, 0.85);
        backdrop-filter: blur(20px);
        border-bottom: 1px solid rgba(255, 255, 255, 0.05);
      }

      .nav-brand {
        font-weight: 800;
        font-size: 1.3rem;
        letter-spacing: 3px;
        text-transform: uppercase;
        background: linear-gradient(to right, #fff, #3498db);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        text-decoration: none;
      }

      .nav-links {
        display: flex;
        align-items: center;
        gap: 12px;
      }

      .btn-nav-outline {
        padding: 8px 20px;
        border-radius: 10px;
        border: 1px solid rgba(255, 255, 255, 0.15);
        color: #e2e8f0;
        text-decoration: none;
        font-size: 0.88rem;
        font-weight: 600;
        transition: all 0.3s;
      }

      .btn-nav-outline:hover {
        background: rgba(255, 255, 255, 0.08);
        color: white;
      }

      .btn-nav-primary {
        padding: 8px 20px;
        border-radius: 10px;
        background: var(--accent);
        color: white;
        text-decoration: none;
        font-size: 0.88rem;
        font-weight: 600;
        transition: all 0.3s;
        box-shadow: 0 4px 15px rgba(52, 152, 219, 0.3);
      }

      .btn-nav-primary:hover {
        background: var(--accent-dark);
        color: white;
        transform: translateY(-2px);
      }

      /* ── HERO ── */
      .hero {
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        text-align: center;
        padding: 8rem 2rem 4rem;
        position: relative;
        z-index: 1;
      }

      .hero-badge {
        display: inline-block;
        background: rgba(52, 152, 219, 0.12);
        border: 1px solid rgba(52, 152, 219, 0.25);
        color: var(--accent);
        padding: 6px 18px;
        border-radius: 100px;
        font-size: 0.75rem;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 2px;
        margin-bottom: 1.5rem;
        animation: fadeUp 0.8s ease both;
      }

      .hero h1 {
        font-size: clamp(3rem, 7vw, 5rem);
        font-weight: 800;
        letter-spacing: -2px;
        line-height: 1.1;
        background: linear-gradient(180deg, #fff 0%, #94a3b8 100%);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        margin-bottom: 0.5rem;
        animation: fadeUp 0.8s ease 0.1s both;
      }

      .hero-sub {
        font-size: 0.85rem;
        letter-spacing: 4px;
        text-transform: uppercase;
        color: var(--accent);
        font-weight: 600;
        margin-bottom: 1.5rem;
        animation: fadeUp 0.8s ease 0.2s both;
      }

      .hero-desc {
        font-size: 1.1rem;
        color: #94a3b8;
        line-height: 1.8;
        max-width: 580px;
        margin: 0 auto 2.5rem;
        animation: fadeUp 0.8s ease 0.3s both;
      }

      .hero-btns {
        display: flex;
        justify-content: center;
        gap: 12px;
        flex-wrap: wrap;
        animation: fadeUp 0.8s ease 0.4s both;
      }

      .btn-primary-glow {
        padding: 14px 32px;
        border-radius: 14px;
        background: var(--accent);
        color: white;
        text-decoration: none;
        font-weight: 700;
        font-size: 0.95rem;
        box-shadow: 0 8px 25px rgba(52, 152, 219, 0.4);
        transition: all 0.3s;
        display: inline-flex;
        align-items: center;
        gap: 8px;
      }

      .btn-primary-glow:hover {
        background: var(--accent-dark);
        transform: translateY(-3px);
        box-shadow: 0 14px 30px rgba(52, 152, 219, 0.5);
        color: white;
      }

      .btn-ghost {
        padding: 14px 32px;
        border-radius: 14px;
        background: rgba(255, 255, 255, 0.05);
        border: 1px solid rgba(255, 255, 255, 0.12);
        color: #e2e8f0;
        text-decoration: none;
        font-weight: 600;
        font-size: 0.95rem;
        transition: all 0.3s;
        display: inline-flex;
        align-items: center;
        gap: 8px;
      }

      .btn-ghost:hover {
        background: rgba(255, 255, 255, 0.1);
        color: white;
        transform: translateY(-3px);
      }

      /* ── STATS ── */
      .stats-bar {
        position: relative;
        z-index: 1;
        padding: 2rem;
        margin: 0 2rem;
        background: rgba(255, 255, 255, 0.02);
        border: 1px solid rgba(255, 255, 255, 0.06);
        border-radius: 20px;
        animation: fadeUp 0.8s ease 0.5s both;
      }

      .stat-item h3 {
        font-size: 2rem;
        font-weight: 800;
        color: var(--accent);
      }

      .stat-item p {
        font-size: 0.8rem;
        color: #64748b;
        text-transform: uppercase;
        letter-spacing: 1px;
      }

      /* ── SECTIONS ── */
      .section {
        position: relative;
        z-index: 1;
        padding: 6rem 2rem;
      }

      .section-label {
        font-size: 0.72rem;
        letter-spacing: 3px;
        text-transform: uppercase;
        color: var(--accent);
        font-weight: 700;
        margin-bottom: 1rem;
      }

      .section-title {
        font-size: clamp(1.8rem, 4vw, 2.8rem);
        font-weight: 800;
        letter-spacing: -1px;
        margin-bottom: 1rem;
        background: linear-gradient(180deg, #fff 0%, #94a3b8 100%);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
      }

      .section-desc {
        color: #64748b;
        font-size: 1rem;
        line-height: 1.8;
        max-width: 500px;
      }

      .divider {
        height: 1px;
        background: linear-gradient(to right, transparent, rgba(255, 255, 255, 0.07), transparent);
        margin: 0 2rem;
      }

      /* ── FEATURE CARDS ── */
      .feature-card {
        background: rgba(255, 255, 255, 0.02);
        border: 1px solid rgba(255, 255, 255, 0.06);
        border-radius: 20px;
        padding: 2rem;
        height: 100%;
        transition: all 0.3s;
      }

      .feature-card:hover {
        background: rgba(52, 152, 219, 0.05);
        border-color: rgba(52, 152, 219, 0.2);
        transform: translateY(-5px);
      }

      .feature-icon {
        width: 52px;
        height: 52px;
        background: rgba(52, 152, 219, 0.12);
        border: 1px solid rgba(52, 152, 219, 0.2);
        border-radius: 14px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.4rem;
        color: var(--accent);
        margin-bottom: 1.2rem;
      }

      .feature-card h5 {
        font-weight: 700;
        font-size: 1rem;
        margin-bottom: 0.5rem;
        color: #e2e8f0;
      }

      .feature-card p {
        color: #64748b;
        font-size: 0.88rem;
        line-height: 1.7;
      }

      /* ── HOW IT WORKS ── */
      .step-card {
        background: rgba(255, 255, 255, 0.02);
        border: 1px solid rgba(255, 255, 255, 0.06);
        border-radius: 20px;
        padding: 2rem;
        text-align: center;
        height: 100%;
        transition: all 0.3s;
        position: relative;
      }

      .step-card:hover {
        border-color: rgba(52, 152, 219, 0.2);
        transform: translateY(-5px);
      }

      .step-number {
        width: 50px;
        height: 50px;
        background: linear-gradient(135deg, var(--accent), var(--accent-dark));
        border-radius: 14px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.3rem;
        font-weight: 800;
        color: white;
        margin: 0 auto 1.2rem;
      }

      .step-card h5 {
        font-weight: 700;
        color: #e2e8f0;
        margin-bottom: 0.5rem;
      }

      .step-card p {
        color: #64748b;
        font-size: 0.85rem;
        line-height: 1.7;
      }

      /* ── FAQ ── */
      .faq-title {
        font-size: 0.72rem;
        letter-spacing: 3px;
        text-transform: uppercase;
        color: var(--accent);
        font-weight: 700;
        margin-bottom: 1.5rem;
      }

      .accordion-item {
        background: transparent !important;
        border: none !important;
        border-bottom: 1px solid rgba(255, 255, 255, 0.06) !important;
      }

      .accordion-button {
        background: transparent !important;
        color: #e2e8f0 !important;
        font-weight: 600;
        font-size: 0.95rem;
        padding: 1.1rem 0.5rem;
        box-shadow: none !important;
      }

      .accordion-button::after {
        filter: invert(1) opacity(0.4);
      }

      .accordion-button:not(.collapsed) {
        color: var(--accent) !important;
      }

      .accordion-button:not(.collapsed)::after {
        filter: invert(0) sepia(1) saturate(3) hue-rotate(180deg);
      }

      .accordion-body {
        color: #64748b;
        font-size: 0.88rem;
        line-height: 1.8;
        padding: 0.5rem 0.5rem 1.2rem;
      }

      /* ── CTA ── */
      .cta-box {
        background: linear-gradient(135deg, rgba(52, 152, 219, 0.1), rgba(33, 118, 174, 0.05));
        border: 1px solid rgba(52, 152, 219, 0.2);
        border-radius: 28px;
        padding: 4rem 2rem;
        text-align: center;
      }

      .cta-box h2 {
        font-size: clamp(1.8rem, 4vw, 2.8rem);
        font-weight: 800;
        letter-spacing: -1px;
        background: linear-gradient(180deg, #fff 0%, #94a3b8 100%);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        margin-bottom: 1rem;
      }

      /* ── DOWNLOAD ── */
      .download-box {
        background: linear-gradient(135deg, rgba(52, 152, 219, 0.08), rgba(255, 255, 255, 0.02));
        border: 1px solid rgba(52, 152, 219, 0.15);
        border-radius: 20px;
        padding: 2rem 2.5rem;
      }

      .download-btn {
        background: linear-gradient(to right, #2c3e50, #3498db);
        color: white;
        padding: 12px 24px;
        border-radius: 12px;
        font-weight: 600;
        font-size: 0.9rem;
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        gap: 8px;
        transition: all 0.3s;
        box-shadow: 0 6px 20px rgba(52, 152, 219, 0.3);
        white-space: nowrap;
      }

      .download-btn:hover {
        transform: translateY(-3px);
        box-shadow: 0 12px 28px rgba(52, 152, 219, 0.45);
        color: white;
      }

      .coming-soon {
        font-size: 0.68rem;
        background: rgba(52, 152, 219, 0.15);
        color: var(--accent);
        padding: 2px 10px;
        border-radius: 100px;
        font-weight: 700;
        letter-spacing: 1px;
        text-transform: uppercase;
      }

      /* ── FOOTER ── */
      .footer {
        text-align: center;
        padding: 2rem;
        color: rgba(255, 255, 255, 0.15);
        font-size: 0.8rem;
        border-top: 1px solid rgba(255, 255, 255, 0.04);
        position: relative;
        z-index: 1;
      }

      /* ── ANIMATIONS ── */
      @keyframes fadeUp {
        from {
          opacity: 0;
          transform: translateY(30px);
        }

        to {
          opacity: 1;
          transform: translateY(0);
        }
      }

      @media (max-width: 768px) {
        .navbar-custom {
          padding: 1rem;
        }

        .hero {
          padding: 7rem 1.5rem 3rem;
        }

        .stats-bar {
          margin: 0 1rem;
        }

        .section {
          padding: 4rem 1.5rem;
        }

        .cta-box {
          padding: 3rem 1.5rem;
        }

        .download-box {
          padding: 1.5rem;
        }

        .download-btn {
          width: 100%;
          justify-content: center;
        }
      }
    </style>
  </head>

  <body>

    <!-- ── NAVBAR ── -->
    <nav class="navbar-custom">
      <a href="#" class="nav-brand">CampVoice</a>
      <div class="nav-links">
        <a href="#features" class="btn-nav-outline d-none d-md-inline">Features</a>
        <a href="#how" class="btn-nav-outline d-none d-md-inline">How It Works</a>
        <a href="#faq" class="btn-nav-outline d-none d-md-inline">FAQ</a>
        <a href="login.jsp" class="btn-nav-outline">Sign In</a>
        <a href="register.jsp" class="btn-nav-primary">Get Started</a>
      </div>
    </nav>

    <!-- ── HERO ── -->
    <section class="hero">
      <div>
        <div class="hero-badge">✦ V1.0 Now Live — ABU Campus</div>
        <h1>CampVoice</h1>
        <p class="hero-sub">Student Resolution Hub</p>
        <p class="hero-desc">
          Empowering ABU students with a direct line to campus administration.
          Submit complaints, track feedback in real-time, and ensure every voice
          leads to measurable action.
        </p>
        <div class="hero-btns">
          <a href="login.jsp" class="btn-primary-glow">
            <i class="bi bi-box-arrow-in-right"></i> Sign In to Portal
          </a>
          <a href="register.jsp" class="btn-ghost">
            <i class="bi bi-person-plus"></i> Join the Hub
          </a>
        </div>
      </div>
    </section>

    <!-- ── STATS ── -->
    <div class="container">
      <div class="stats-bar">
        <div class="row g-3 text-center">
          <div class="col-6 col-md-3 stat-item">
            <h3>ABU</h3>
            <p>University</p>
          </div>
          <div class="col-6 col-md-3 stat-item">
            <h3>24h</h3>
            <p>Response Time</p>
          </div>
          <div class="col-6 col-md-3 stat-item">
            <h3>100%</h3>
            <p>Secure</p>
          </div>
          <div class="col-6 col-md-3 stat-item">
            <h3>Real</h3>
            <p>Time Tracking</p>
          </div>
        </div>
      </div>
    </div>

    <div class="divider mt-5"></div>

    <!-- ── FEATURES ── -->
    <section class="section container" id="features">
      <div class="row align-items-center g-5 mb-5">
        <div class="col-lg-5">
          <p class="section-label">What We Offer</p>
          <h2 class="section-title">Everything you need to be heard</h2>
          <p class="section-desc">
            CampVoice gives ABU students a powerful, secure platform to raise
            issues and get real responses from administration.
          </p>
        </div>
        <div class="col-lg-7">
          <div class="row g-3">

            <div class="col-sm-6">
              <div class="feature-card">
                <div class="feature-icon"><i class="bi bi-send-check"></i></div>
                <h5>Submit Complaints</h5>
                <p>Raise any campus issue instantly with full details and supporting information.</p>
              </div>
            </div>

            <div class="col-sm-6">
              <div class="feature-card">
                <div class="feature-icon"><i class="bi bi-bar-chart-line"></i></div>
                <h5>Real-time Tracking</h5>
                <p>Monitor your complaint status from Pending to Resolved in real time.</p>
              </div>
            </div>

            <div class="col-sm-6">
              <div class="feature-card">
                <div class="feature-icon"><i class="bi bi-envelope-check"></i></div>
                <h5>Email Notifications</h5>
                <p>Get notified instantly when your complaint is updated or resolved.</p>
              </div>
            </div>

            <div class="col-sm-6">
              <div class="feature-card">
                <div class="feature-icon"><i class="bi bi-shield-check"></i></div>
                <h5>Secure & Private</h5>
                <p>Your complaints are encrypted and only visible to authorized admins.</p>
              </div>
            </div>

          </div>
        </div>
      </div>
    </section>

    <div class="divider"></div>

    <!-- ── HOW IT WORKS ── -->
    <section class="section container" id="how">
      <div class="text-center mb-5">
        <p class="section-label">Simple Process</p>
        <h2 class="section-title">How It Works</h2>
        <p class="section-desc mx-auto">
          From registration to resolution in 3 simple steps.
        </p>
      </div>

      <div class="row g-4">
        <div class="col-md-4">
          <div class="step-card">
            <div class="step-number">1</div>
            <h5>Register with Student ID</h5>
            <p>Create your account using your ABU matriculation number (e.g. U23CO1010) and university email.</p>
          </div>
        </div>
        <div class="col-md-4">
          <div class="step-card">
            <div class="step-number">2</div>
            <h5>Submit Your Complaint</h5>
            <p>Describe your issue in detail — department, course, date of incident, and full description.</p>
          </div>
        </div>
        <div class="col-md-4">
          <div class="step-card">
            <div class="step-number">3</div>
            <h5>Get Resolution</h5>
            <p>Admin reviews your complaint, sends a personalized response and updates your status in real time.</p>
          </div>
        </div>
      </div>
    </section>

    <div class="divider"></div>

    <!-- ── FAQ ── -->
    <section class="section container" id="faq">
      <div class="text-center mb-5">
        <p class="section-label">Got Questions?</p>
        <h2 class="section-title">Frequently Asked Questions</h2>
      </div>

      <div class="row justify-content-center">
        <div class="col-lg-8">
          <div class="accordion accordion-flush" id="faqAccordion">

            <div class="accordion-item">
              <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                  data-bs-target="#faq1">
                  <i class="bi bi-question-circle me-2" style="color:var(--accent);"></i>
                  How do I submit a complaint?
                </button>
              </h2>
              <div id="faq1" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                <div class="accordion-body">
                  Register and log in, then click <strong style="color:#e2e8f0;">"New Complaint"</strong>
                  on your dashboard. Fill in the subject, department, and description — it will be
                  instantly forwarded to the relevant admin.
                </div>
              </div>
            </div>

            <div class="accordion-item">
              <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                  data-bs-target="#faq2">
                  <i class="bi bi-search me-2" style="color:var(--accent);"></i>
                  How do I track my complaint?
                </button>
              </h2>
              <div id="faq2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                <div class="accordion-body">
                  Log in to your dashboard to see real-time status updates. You will also receive
                  an email notification once the admin responds to your complaint.
                </div>
              </div>
            </div>

            <div class="accordion-item">
              <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                  data-bs-target="#faq3">
                  <i class="bi bi-shield-lock me-2" style="color:var(--accent);"></i>
                  Who can see my complaint?
                </button>
              </h2>
              <div id="faq3" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                <div class="accordion-body">
                  Only authorized faculty administrators can view your complaint.
                  Your privacy is fully protected at all times.
                </div>
              </div>
            </div>

            <div class="accordion-item">
              <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                  data-bs-target="#faq4">
                  <i class="bi bi-person-badge me-2" style="color:var(--accent);"></i>
                  What Student ID format should I use?
                </button>
              </h2>
              <div id="faq4" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                <div class="accordion-body">
                  Use your ABU matric number: <strong style="color:#e2e8f0;">U23CO1010</strong>
                  — U + year (19–25) + CO + stream (1 or 2) + 3 digits.
                  Both uppercase and lowercase are accepted.
                </div>
              </div>
            </div>

            <div class="accordion-item">
              <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                  data-bs-target="#faq5">
                  <i class="bi bi-clock-history me-2" style="color:var(--accent);"></i>
                  How long does resolution take?
                </button>
              </h2>
              <div id="faq5" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                <div class="accordion-body">
                  Most complaints are reviewed within
                  <strong style="color:#e2e8f0;">3–5 working days</strong>.
                  Check your dashboard anytime for live updates.
                </div>
              </div>
            </div>

          </div>
        </div>
      </div>
    </section>

    <div class="divider"></div>

    <!-- ── CTA ── -->
    <section class="section container">
      <div class="cta-box">
        <p class="section-label">Get Started Today</p>
        <h2>Ready to make your voice heard?</h2>
        <p style="color:#64748b; margin-bottom:2rem;">
          Join hundreds of ABU students already using CampVoice.
        </p>
        <div class="hero-btns">
          <a href="register.jsp" class="btn-primary-glow">
            <i class="bi bi-person-plus"></i> Create Account
          </a>
          <a href="login.jsp" class="btn-ghost">
            <i class="bi bi-box-arrow-in-right"></i> Sign In
          </a>
        </div>
      </div>
    </section>

    <div class="divider"></div>

    <!-- ── DOWNLOAD ── -->
    <section class="section container">
      <div class="download-box">
        <div class="row align-items-center gy-3">
          <div class="col-md-7 text-md-start text-center">
            <div class="d-flex align-items-center justify-content-md-start justify-content-center gap-2 mb-1">
              <i class="bi bi-phone-fill" style="color:var(--accent); font-size:1.2rem;"></i>
              <h5 class="fw-bold mb-0">Take CampVoice with you.</h5>
              <span class="coming-soon">Soon</span>
            </div>
            <p class="text-muted small mb-0 mt-1">
              Native mobile experience for faster notifications and offline access.
            </p>
          </div>
          <div class="col-md-5 text-md-end text-center">
            <a href="#" class="download-btn">
              <i class="bi bi-download"></i> Download Mobile App
            </a>
          </div>
        </div>
      </div>
    </section>

    <!-- ── FOOTER ── -->
    <footer class="footer">
      © 2026 @Compeng | Ahmadu Bello University — CampVoice
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

  </body>

  </html>