<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration_form.aspx.cs" Inherits="ProjectSem6.registration_form" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Nail-TrendZ Registration Form</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background: linear-gradient(135deg, #e57ea4, #fbe9ef);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .registration-card {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .registration-card h2 {
            font-family: 'Poppins', sans-serif;
            font-weight: bold;
            color: #e57ea4;
        }

        .form-control {
            border-radius: 25px;
        }

        .btn-custom {
            background: #e57ea4;
            font-size: 18px;
            color: #fff;
            border-radius: 25px;
        }

        .btn-custom:hover {
            border-style: solid;
            border-width: 3px;
            border-color: #e57ea4;
            background: #fbe9ef;
        }

        .mb-3 {
            background-color: #e57ea4;
        }

        .form-control {
            background-color: #fbe9ef;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="registration-card">
                    <h2>Create an Account</h2>
                    <p>Register to get started</p>
                    <form id="form1" runat="server">
                        <div class="mb-3">
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Username" required="true"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email" required="true"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password" required="true"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Confirm Password" required="true"></asp:TextBox>
                        </div>
                        <asp:Button ID="btnRegister" runat="server" CssClass="btn btn-custom w-100" Text="Register" OnClick="btnRegister_Click" />
                        <asp:Label ID="lblMessage" runat="server" CssClass="mt-3" ForeColor="Red" Visible="false"></asp:Label>
                    </form>
                    <p class="mt-3">Already have an account? <a href="login_form.aspx" style="color: #e57ea4;">Log In</a></p>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
