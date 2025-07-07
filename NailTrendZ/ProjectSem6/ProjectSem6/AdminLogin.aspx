<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="ProjectSem6.AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Admin Login</title>
    
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet" />
    
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #ff9a9e, #fad0c4);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-container {
            width: 380px;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.15);
            text-align: center;
        }

        .login-container h2 {
            font-weight: 600;
            color: #e91e63;
            margin-bottom: 20px;
        }

        .form-control {
            border-radius: 10px;
            border: 1px solid #e91e63;
            padding: 12px;
            font-size: 16px;
        }

        .form-control:focus {
            border-color: #d81b60;
            box-shadow: 0 0 8px rgba(216, 27, 96, 0.3);
        }

        .btn-login {
            background: #e91e63;
            color: white;
            font-size: 18px;
            border-radius: 10px;
            padding: 12px;
            width: 100%;
            border: none;
            transition: 0.3s ease-in-out;
        }

        .btn-login:hover {
            background: #c2185b;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .alert {
            display: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="login-container">
            <h2>Admin Panel Login</h2>
            <asp:Label ID="lblMessage" runat="server" CssClass="alert alert-danger" role="alert"></asp:Label>

            <div class="form-group">
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter Username"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter Password"></asp:TextBox>
            </div>

            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-login" OnClick="btnLogin_Click" />
        </div>
   </div>
    </form>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

