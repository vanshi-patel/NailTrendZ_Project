<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Appointments.ascx.cs" Inherits="ProjectSem6.Appointments" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Appointment</title>
    <style>
      /* General styling */
body {
    font-family: Arial, sans-serif;
    background-color: #fbe9ef;
    margin: 0;
    padding: 0;
}

/* Appointment section */
.appointment_section {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: calc(100vh - 100px); /* Adjusting for margin */
    padding: 20px;
}

/* Appointment form container */
.appointment_form {
    max-width: 500px;
    width: 100%;
    margin: 50px auto; /* Centering with margin */
    border-style: solid;
    border-color: #e57ea4;
    border-width: 3px;
    background: white;
    padding: 25px;
    border-radius: 15px;
    box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.2);
}

/* Form fields */
.form_group {
    margin-bottom: 20px;
}

.form_group label {
    font-weight: bold;
    color: #e57ea4;
    display: block;
    margin-bottom: 8px;
}

.form_group input, 
.form_group select {
    width: 100%;
    padding: 15px;
    border-radius: 25px;
    background-color: #fbe9ef;
    border: none;
    font-size: 16px;
    transition: all 0.3s ease-in-out;
}

.form_group input:focus, 
.form_group select:focus {
    outline: none;
    border: 2px solid #e57ea4;
    background-color: #fff;
}

/* Heading styling */
h2 {
    margin-top: 30px;
    text-align: center;
    color: black;
    font-size: 28px;
    font-weight: bold;
    margin-bottom: -40px;
}



/* Submit button */
.submit_btn {
    width: 100%;
    color: black;
    background-color: #363636;
    text-transform: uppercase;
    font-size: 18px;
    padding: 15px;
    font-weight: bold;
    border-radius: 25px;
    border: none;
    cursor: pointer;
    border: 3px solid white;
}

.submit_btn:hover {
    background-color: #f0849b;
    border-color: #8d3d59; /* Darker border on hover */
    color: black;
    box-shadow: 3px 3px 0px #8d3d59, 6px 6px 0px #e57ea4; /* Subtle shadow change */
    transform: translateY(-3px); /* Slight lift effect */
}

/* Responsive adjustments */
@media (max-width: 600px) {
    .appointment_form {
        max-width: 90%;
        padding: 20px;
    }
}

    </style>
</head>
<body>
    <div class="appointment_section layout_padding">
        <div class="container">
            <h2>Book Your Appointment</h2>
            <div class="appointment_form">
                <asp:Panel runat="server">
                    <div class="form_group">
                        <label for="name">Full Name:</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form_control" placeholder="Enter your full name" Required="true"></asp:TextBox>
                    </div>
                    <div class="form_group">
                        <label for="email">Email:</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form_control" TextMode="Email" placeholder="Enter your email address" Required="true"></asp:TextBox>
                    </div>
                    <div class="form_group">
                        <label for="phone">Phone Number:</label>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form_control" TextMode="Phone" placeholder="Enter your phone number" Required="true" MaxLength="10"></asp:TextBox>
                    </div>
                    <div class="form_group">
                        <label for="date">Preferred Date:</label>
                        <asp:TextBox ID="txtDate" runat="server" CssClass="form_control" TextMode="Date" Required="true"></asp:TextBox>
                    </div>
                    <div class="form_group">
                        <label for="time">Preferred Time:</label>
                        <asp:TextBox ID="txtTime" runat="server" CssClass="form_control" TextMode="Time" Required="true"></asp:TextBox>
                    </div>
                    <div class="form_group">
                        <asp:Button ID="btnSubmit" runat="server" CssClass="submit_btn" Text="Book Appointment" OnClick="SubmitAppointment" />
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</body>
</html>