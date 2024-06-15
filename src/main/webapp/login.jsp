<!DOCTYPE html>
<html>
<head>
  <title>Login Page</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f0f0f0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }
    .login-container {
      background-color: #fff;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      width: 400px;
    }
    .login-container h1 {
      margin-bottom: 20px;
      text-align: center;
    }
    .form-group {
      display: flex;
      align-items: center;
      margin-bottom: 15px;
    }
    .form-group label {
      flex: 0 0 100px;
      text-align: right;
      margin-right: 10px;
    }
    .form-group input {
      flex: 1;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }
    .login-container input[type="submit"] {
      width: 100%;
      padding: 10px;
      background-color: #007bff;
      border: none;
      border-radius: 5px;
      color: #fff;
      font-size: 16px;
      cursor: pointer;
      margin-top: 10px;
    }
    .login-container input[type="submit"]:hover {
      background-color: #0056b3;
    }
  </style>
  <script>
    $(document).ready(function() {
      $("form").submit(function(event) {
        var userId = $("#userId").val();
        var password = $("#password").val();
        if (userId === "" || password === "") {
          alert("Both fields are required.");
          event.preventDefault();
        }
      });
    });
  </script>
</head>
<body>
<div class="login-container">
  <h1>Login Page</h1>
  <form action="login" method="post">
    <div class="form-group">
      <label for="userId">User ID:</label>
      <input type="text" id="userId" name="userId">
    </div>
    <div class="form-group">
      <label for="password">Password:</label>
      <input type="password" id="password" name="password">
    </div>
    <input type="submit" value="Login">
  </form>
</div>
</body>
</html>
