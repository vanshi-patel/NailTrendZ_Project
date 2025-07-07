<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddFeedbackPage.ascx.cs" Inherits="ProjectSem6.AddFeedbackPage1" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Add Your Feedback</title>
    <style>
        /* Container for feedback page */
.feedback-container {
    width: 80%;
    margin: 0 auto;
    padding: 30px;
    background-color: #f8f8f8;
    border: 2.5px solid black;
    border-radius: 8px;
    box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
}

.feedback-container h1 {
    text-align: center;
    color: #333;
    font-size: 24px;
}

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    font-weight: bold;
    color: black;
    font-size: 16px;
}

.form-control {
    width: 100%;
    padding: 10px;
    font-size: 16px;
    border-radius: 4px;
    border: 1px solid #ccc;
}

.form-control:focus {
    border-color: #e57ea4;
    outline: none;
}

.btnSubmitFeedback {
    color: #ffffff;
    background-color: #363636;
    padding: 10px 20px;
    text-transform: uppercase;
    font-size: 18px;
    border-radius: 5px;
    border: none;
    cursor: pointer;
}

.btnSubmitFeedback:hover {
     background-color: #f0849b;
     border-color: #8d3d59; /* Darker border on hover */
     color: black;
     box-shadow: 3px 3px 0px #8d3d59, 6px 6px 0px #e57ea4; /* Subtle shadow change */
     transform: translateY(-3px); /* Slight lift effect */
}

.feedback-message {
    font-size: 16px;
    color: green;
    text-align: center;
    margin-top: 20px;
}

</style>
</head>
<body>
    <form id="feedbackForm">
        <div class="feedback-container"><br /><br /><br /><br /><br />
            <h1>Add Your Feedback</h1>

            <div class="form-group">
                <label for="txtCustomerName">Your Name:</label>
                <asp:TextBox ID="txtCustomerName" runat="server" CssClass="form-control" placeholder="Enter your name" required="true"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtComments">Your Feedback:</label>
                <asp:TextBox ID="txtComments" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Enter your feedback" required="true"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Button ID="btnSubmitFeedback" runat="server" Text="Submit Feedback" CssClass="btnSubmitFeedback" OnClick="btnSubmitFeedback_Click" />
            </div>
        </div>
    </form>
</body>
</html>
