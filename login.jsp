<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
    <title>Ministore</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<style>
    body {
        color: #fff;
        background: #63738a;
        font-family: 'Roboto', sans-serif;
    }
    .form-control{
        height: 40px;
        box-shadow: none;
        color: #969fa4;
    }
    .form-control:focus{
        border-color: #5cb85c;
    }
    .form-control, .btn{        
        border-radius: 3px;
    }
    .signup-form{
        width: 400px;
        margin: 0 auto;
        padding: 30px 0;
    }
    .signup-form h2{
        color: #636363;
        margin: 0 0 15px;
        position: relative;
        text-align: center;
    }
    .signup-form h2:before, .signup-form h2:after{
        content: "";
        height: 2px;
        width: 30%;
        background: #d4d4d4;
        position: absolute;
        top: 50%;
        z-index: 2;
    }    
    .signup-form h2:before{
        left: 0;
    }
    .signup-form h2:after{
        right: 0;
    }
    .signup-form .hint-text{
        color: #999;
        margin-bottom: 30px;
        text-align: center;
    }
    .signup-form form{
        color: #999;
        border-radius: 3px;
        margin-bottom: 15px;
        background: #f2f3f7;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
    .signup-form .form-group{
        margin-bottom: 20px;
    }
    .signup-form input[type="checkbox"]{
        margin-top: 3px;
    }
    .signup-form .btn{        
        font-size: 16px;
        font-weight: bold;        
        min-width: 140px;
        outline: none !important;
    }
    .signup-form .row div:first-child{
        padding-right: 10px;
    }
    .signup-form .row div:last-child{
        padding-left: 10px;
    }        
    .signup-form a{
        color: #fff;
        text-decoration: underline;
    }
    .signup-form a:hover{
        text-decoration: none;
    }
    .signup-form form a{
        color: #5cb85c;
        text-decoration: none;
    }    
    .signup-form form a:hover{
        text-decoration: underline;
    }  
    .position-relative {
        position: relative;
    }

    .toggle-password {
        position: absolute;
        right: 10px;
        top: 50%;
        transform: translateY(-50%);
        cursor: pointer;
    }
</style>
</head>
<body>
<div class="signup-form">
    <form action="loginservice.jsp" method="post" onsubmit="return validateForm()">
        <h2>Login</h2>
        <%
            String registered = request.getParameter("registered");
            String error = request.getParameter("error");
            if (registered != null && registered.equals("1")) {
                out.println("<p style='color:green;'>Registration successful. Please login.</p>");
            } else if (error != null && error.equals("1")) {
                out.println("<p style='color:red;'>Login failed. Please try again.</p>");
            }
        %>
        <div class="form-group">
            <input type="email" class="form-control" name="email" id="email" placeholder="Email" >
        </div>
        <div class="form-group position-relative">
            <input type="password" class="form-control" name="password" id="password" placeholder="Password" >
            <span class="toggle-password" onclick="togglePassword('password')">&#128065;</span>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-success btn-lg btn-block">Login</button>
            <div class="text-center"><a href="forgotpassword.jsp">Forgot Password?</a></div>
        </div>
    </form>
    <div class="text-center">No account yet? <a href="register.jsp">Register</a></div>
</div>

<script>
function validateForm() {
    // Get the input fields
    var email = document.getElementById('email').value;
    var password = document.getElementById('password').value;
    
    // Regular expression for email validation
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    
    // Regular expression for password validation
    // Example: At least 8 characters, 1 uppercase letter, 1 lowercase letter, 1 number, and 1 special character
    var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
    
    // Validate email
    if (!emailRegex.test(email)) {
        alert('Please enter a valid email address.');
        document.getElementById('email').focus();
        return false;
    }
    
    // Validate password
    if (!passwordRegex.test(password)) {
        alert('Password must be at least 8 characters long, include at least one uppercase letter, one lowercase letter, one number, and one special character.');
        document.getElementById('password').focus();
        return false;
    }
    
    return true; // Submit the form
}

function togglePassword(fieldId) {
    var passwordField = document.getElementById(fieldId);
    if (passwordField.type === 'password') {
        passwordField.type = 'text';
    } else {
        passwordField.type = 'password';
    }
}
</script>
</body>
</html>
