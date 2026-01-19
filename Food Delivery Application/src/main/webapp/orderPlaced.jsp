<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Placed Successfully</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;

            /* 🔥 Animated Orange-Red Gradient Background */
            background: linear-gradient(135deg, #ff512f, #f09819, #ff3d00);
            background-size: 300% 300%;
            animation: gradientShift 10s ease infinite;

            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }

        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* ✨ Floating AI Particles */
        .particle {
            position: absolute;
            font-size: 2rem;
            animation: floatUp 6s linear infinite;
            opacity: 0.8;
        }

        @keyframes floatUp {
            from { transform: translateY(100vh) scale(0.8); opacity: 0; }
            50% { opacity: 1; }
            to { transform: translateY(-10vh) scale(1.2); opacity: 0; }
        }

        .message-box {
            background: rgba(255, 255, 255, 0.92);
            padding: 40px;
            width: 420px;
            border-radius: 14px;
            box-shadow: 0 12px 40px rgba(0,0,0,0.3);
            text-align: center;
            z-index: 2;
        }

        .message-box h1 {
            color: #ff4500; /* orange-red */
            font-size: 32px;
            margin-bottom: 15px;
        }

        .message-box p {
            color: #444;
            font-size: 18px;
            line-height: 1.6;
            margin-bottom: 25px;
        }

        .fun-quote {
            font-style: italic;
            color: #e74c3c;
            margin-bottom: 30px;
        }

        .btn-home {
            display: inline-block;
            padding: 12px 28px;
            background: linear-gradient(135deg, #ff512f, #f09819);
            color: white;
            text-decoration: none;
            border-radius: 25px;
            font-weight: 600;
            transition: transform 0.3s ease;
        }

        .btn-home:hover {
            transform: translateY(-3px);
            background: linear-gradient(135deg, #e84118, #ff6a00);
        }

        @media (max-width: 768px) {
            .message-box {
                width: 90%;
            }
        }
    </style>
</head>

<body>

    <!-- 🎉 Floating AI-inspired particles -->
    <div class="particle" style="left:10%; animation-delay:0s;">🍔</div>
    <div class="particle" style="left:30%; animation-delay:2s;">🔥</div>
    <div class="particle" style="left:50%; animation-delay:4s;">🚀</div>
    <div class="particle" style="left:70%; animation-delay:1s;">🥗</div>
    <div class="particle" style="left:85%; animation-delay:3s;">🍕</div>

    <div class="message-box">
        <h1>Order Placed!</h1>
        <p>Your delicious food is on the way.</p>
        <p class="fun-quote">“Good food is worth waiting for… but not too long!”</p>
        <a href="Home.jsp" class="btn-home">Back to Home</a>
    </div>

</body>
</html>