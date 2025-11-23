<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>404 Error</title>

<style>
    body {
        margin: 0;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background: #0d0d0d;
        font-family: "Segoe UI", sans-serif;
        color: #fff;
        overflow: hidden;
    }

    .container {
        text-align: center;
        animation: fadeIn 1.2s ease forwards;
    }

    /* Animated 404 */
    .error {
        font-size: 140px;
        font-weight: bold;
        letter-spacing: 5px;
        display: flex;
        justify-content: center;
        gap: 20px;
    }

    .digit {
        display: inline-block;
        animation: float 2.2s ease-in-out infinite;
    }

    .digit:nth-child(1) { animation-delay: 0s; color: #ff5757; }
    .digit:nth-child(2) { animation-delay: 0.3s; color: #ffd057; }
    .digit:nth-child(3) { animation-delay: 0.6s; color: #57ff9a; }

    @keyframes float {
        0%, 100% { transform: translateY(0px); }
        50% { transform: translateY(-18px); }
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    p {
        font-size: 20px;
        margin-top: 15px;
        opacity: 0.7;
    }

    a.button {
        margin-top: 30px;
        display: inline-block;
        padding: 12px 24px;
        color: #000;
        background: #fff;
        border-radius: 6px;
        font-weight: bold;
        text-decoration: none;
        transition: 0.25s;
    }

    a.button:hover {
        background: #ff5757;
        color: #fff;
        transform: translateY(-3px);
    }
</style>
</head>
<body>

<div class="container">
    <div class="error">
        <div class="digit">4</div>
        <div class="digit">0</div>
        <div class="digit">4</div>
    </div>

    <p>Oops! The page you're looking for doesn't exist.</p>


</div>

</body>
</html>
