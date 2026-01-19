<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register - 🍔 BloomBite</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

     /* 🌈 AI Animated Background */
body {
    height: 100vh;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #ff512f, #f09819, #ff512f);
    background-size: 300% 300%;
    animation: gradientAI 8s ease infinite;
    display: flex;
    justify-content: center;
    align-items: center;
    overflow: hidden; /* important for particles */
}

/* Gradient animation */
@keyframes gradientAI {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

/* ✨ AI Particle Effect */
body::before {
    content: "";
    position: absolute;
    width: 200%;
    height: 200%;
    background: radial-gradient(circle, rgba(255,255,255,0.15) 2px, transparent 3px);
    background-size: 60px 60px;
    animation: moveParticles 20s linear infinite;
    z-index: 0;
}

/* Particle motion */
@keyframes moveParticles {
    from { transform: translate(0,0); }
    to { transform: translate(-60px,-60px); }
}

/* Ensure login card stays above background */
.login-card {
    position: relative;
    z-index: 1;
}

        /* 🤖 Floating Register Card */
        .register-container {
            background-color: white;
            padding: 40px 50px;
            border-radius: 18px;
            box-shadow: 0 20px 50px rgba(255, 81, 47, 0.4);
            width: 400px;
            animation: floatAI 6s ease-in-out infinite, fadeInAI 1.2s ease;
        }

        @keyframes floatAI {
            0% { transform: translateY(0); }
            50% { transform: translateY(-12px); }
            100% { transform: translateY(0); }
        }

        @keyframes fadeInAI {
            from { opacity: 0; transform: scale(0.9); }
            to { opacity: 1; transform: scale(1); }
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #ff512f;
            font-size: 2rem;
            font-weight: 800;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #555;
        }

        /* 🧠 Smart Inputs */
        input[type="text"],
        input[type="password"],
        input[type="email"],
        textarea {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #ddd;
            border-radius: 8px;
            font-size: 1rem;
            transition: 0.3s;
        }

        input:focus,
        textarea:focus {
            outline: none;
            border-color: #ff512f;
            box-shadow: 0 0 0 4px rgba(255, 81, 47, 0.25);
        }

        textarea {
            resize: vertical;
            min-height: 80px;
        }

        /* 🚀 AI Register Button */
        .btn-register {
            background: linear-gradient(135deg, #ff512f, #f09819);
            color: white;
            padding: 15px;
            border: none;
            border-radius: 30px;
            width: 100%;
            font-size: 1.1rem;
            font-weight: 700;
            cursor: pointer;
            margin-top: 10px;
            animation: pulseAI 2.5s infinite;
            transition: transform 0.3s;
        }

        @keyframes pulseAI {
            0% { box-shadow: 0 0 0 0 rgba(255, 81, 47, 0.6); }
            70% { box-shadow: 0 0 0 14px rgba(255, 81, 47, 0); }
            100% { box-shadow: 0 0 0 0 rgba(255, 81, 47, 0); }
        }

        .btn-register:hover {
            transform: translateY(-3px) scale(1.02);
        }

        /* 🔐 Login Link */
        .login-link {
            display: block;
            text-align: center;
            margin-top: 22px;
            color: #ff512f;
            text-decoration: none;
            font-weight: 700;
            transition: color 0.3s;
        }

        .login-link:hover {
            color: #f09819;
            text-decoration: underline;
        }
    </style>
</head>

<body>

<div class="register-container">
    <h1>Create Account</h1>

    <form action="register" method="post">
        <div class="form-group">
            <label for="username">Username <span style="color:red;">*</span></label>
            <input type="text" id="username" name="username" placeholder="Enter username" required>
        </div>

        <div class="form-group">
            <label for="password">Password <span style="color:red;">*</span></label>
            <input type="password" id="password" name="password" placeholder="Enter password" required>
        </div>

        <div class="form-group">
            <label for="email">Email <span style="color:red;">*</span></label>
            <input type="email" id="email" name="email" placeholder="Enter email" required>
        </div>

        <div class="form-group">
            <label for="address">Address <span style="color:red;">*</span></label>
            <textarea id="address" name="address" placeholder="Enter your address" required></textarea>
        </div>

        <button type="submit" class="btn-register">Create Account</button>
    </form>

    <a href="login.jsp" class="login-link">Already have an account? Login here</a>
</div>

</body>
</html>
