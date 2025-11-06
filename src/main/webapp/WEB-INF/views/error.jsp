<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oops! Something Went Wrong</title>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">

<style>
    * {
        box-sizing: border-box;
    }

    body {
        margin: 0;
        padding: 0;
        font-family: 'Poppins', sans-serif;
        background: radial-gradient(circle at 25% 25%, #1f1c2c, #928dab);
        color: #fff;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 100vh;
        overflow: hidden;
    }

    .glow {
        font-size: 10rem;
        font-weight: 700;
        letter-spacing: 5px;
        color: #fff;
        text-shadow: 0 0 10px #ff006e, 0 0 20px #ff006e, 0 0 40px #ff006e;
        animation: pulse 2s infinite alternate;
    }

    @keyframes pulse {
        0% { text-shadow: 0 0 10px #ff006e, 0 0 20px #ff006e; }
        100% { text-shadow: 0 0 40px #00f5d4, 0 0 80px #00f5d4; }
    }

    h2 {
        font-size: 2rem;
        margin: 20px 0 10px 0;
        animation: fadeInUp 1.2s ease-out;
    }

    p {
        font-size: 1.1rem;
        max-width: 500px;
        text-align: center;
        opacity: 0.8;
        animation: fadeInUp 1.6s ease-out;
    }

    @keyframes fadeInUp {
        from { transform: translateY(40px); opacity: 0; }
        to { transform: translateY(0); opacity: 1; }
    }

    .btn {
        margin-top: 30px;
        padding: 12px 30px;
        background: linear-gradient(90deg, #ff006e, #8338ec);
        color: white;
        border: none;
        border-radius: 50px;
        font-weight: bold;
        letter-spacing: 1px;
        cursor: pointer;
        transition: 0.4s ease;
        text-decoration: none;
        animation: fadeInUp 1.8s ease-out;
    }

    .btn:hover {
        background: linear-gradient(90deg, #00f5d4, #06d6a0);
        box-shadow: 0 0 20px rgba(255,255,255,0.4);
        transform: translateY(-3px);
    }

    /* Floating animation background circles */
    .bubble {
        position: absolute;
        border-radius: 50%;
        background: rgba(255,255,255,0.1);
        animation: float 10s infinite ease-in-out;
    }

    .bubble:nth-child(1) { width: 100px; height: 100px; top: 10%; left: 20%; animation-delay: 0s;}
    .bubble:nth-child(2) { width: 150px; height: 150px; bottom: 15%; right: 25%; animation-delay: 2s;}
    .bubble:nth-child(3) { width: 80px; height: 80px; top: 40%; right: 15%; animation-delay: 4s;}
    .bubble:nth-child(4) { width: 120px; height: 120px; bottom: 10%; left: 15%; animation-delay: 6s;}

    @keyframes float {
        0%, 100% { transform: translateY(0px) rotate(0deg); }
        50% { transform: translateY(-30px) rotate(20deg); }
    }

</style>
</head>

<body>
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>

    <div class="glow">404</div>
    <h2>Oops! Something Went Wrong</h2>
    <p>The page you’re looking for might have been removed, renamed, or is temporarily unavailable.</p>
    <a href="index.jsp" class="btn">🏠 Go Back Home</a>
</body>
</html>
	