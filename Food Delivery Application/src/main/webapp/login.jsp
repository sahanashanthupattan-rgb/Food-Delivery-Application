<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - 🍔 BloomBite</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* 🌈 AI Animated Gradient Background */
        body {
            height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #ff512f, #f09819, #ff512f);
            background-size: 300% 300%;
            animation: gradientAI 8s ease infinite;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden; /* keep particles inside */
            position: relative;
        }

        @keyframes gradientAI {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* ✨ AI Particle Layer */
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

        @keyframes moveParticles {
            from { transform: translate(0,0); }
            to { transform: translate(-60px,-60px); }
        }

        /* 🤖 Floating Login Card */
        .login-card {
            background: #ffffff;
            width: 380px;
            padding: 35px 30px;
            border-radius: 18px;
            box-shadow: 0 20px 50px rgba(255, 81, 47, 0.4);
            text-align: center;
            animation: floatAI 6s ease-in-out infinite, fadeInAI 1.2s ease;
            position: relative;
            z-index: 1; /* keep above particles */
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

        .login-card h2 {
            margin-bottom: 25px;
            color: #ff512f;
            font-size: 2rem;
            font-weight: 800;
        }

        .form-group {
            text-align: left;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            color: #555;
            font-weight: 600;
        }

        /* 🧠 Smart Inputs */
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            border: 2px solid #ddd;
            font-size: 1rem;
            transition: 0.3s;
        }

        input:focus {
            outline: none;
            border-color: #ff512f;
            box-shadow: 0 0 0 4px rgba(255, 81, 47, 0.25);
        }

        /* 🚀 AI Login Button */
        .login-btn {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #ff512f, #f09819);
            color: #ffffff;
            border: none;
            border-radius: 30px;
            font-size: 1.1rem;
            font-weight: 700;
            cursor: pointer;
            margin-top: 12px;
            position: relative;
            overflow: hidden;
            animation: pulseAI 2.5s infinite;
            transition: transform 0.3s;
        }

        @keyframes pulseAI {
            0% { box-shadow: 0 0 0 0 rgba(255, 81, 47, 0.6); }
            70% { box-shadow: 0 0 0 14px rgba(255, 81, 47, 0); }
            100% { box-shadow: 0 0 0 0 rgba(255, 81, 47, 0); }
        }

        .login-btn:hover {
            transform: translateY(-3px) scale(1.02);
        }

        /* ✨ Register Link */
        .register-link {
            margin-top: 22px;
            font-size: 0.95rem;
            color: #555;
        }

        .register-link a {
            color: #ff512f;
            text-decoration: none;
            font-weight: 700;
            transition: color 0.3s;
        }

        .register-link a:hover {
            color: #f09819;
            text-decoration: underline;
        }
    </style>
</head>

<body>

    <div class="login-card">
        <h2>Login</h2>

        <!-- LOGIN FORM -->
        <form action="login" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" name="username" id="username" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" required>
            </div>

            <button type="submit" class="login-btn">Login</button>
            
        </form>

        <!-- REGISTER LINK -->
        <div class="register-link">
            New user?
            <a href="register.jsp">Create an account</a>
        </div>
    </div>

</body>
</html>