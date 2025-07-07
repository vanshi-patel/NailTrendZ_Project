<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AppointmentStatus.ascx.cs" Inherits="ProjectSem6.AppointmentStatus1" %>
<style>
    .container{
        margin-top: 0px;
    }

    .status-box {
        border-left: 8px solid;
        padding: 15px;
    }

    .status-pending {
        border-color: #ffc107;
        background-color: #fff3cd;
    }

    .status-confirmed {
        border-color: #28a745;
        background-color: #d4edda;
    }

    .status-cancelled {
        border-color: #dc3545;
        background-color: #f8d7da;
    }

    .textcenter{
        margin-bottom: 30px;
        font-size: xx-large;
        font-weight: bold;
    }

</style>
<div class="container">
    <br /><br /><br /><br /><br />
    <h2 class="textcenter">Your Appointments</h2>
    <asp:Repeater ID="rptAppointments" runat="server">
        <ItemTemplate>
            <div class="status-box <%# GetStatusCss(Eval("Status").ToString()) %> p-3 rounded shadow-sm mb-4">
                <h4><strong>Appointment for:</strong> <%# Eval("FullName") %></h4>
                <p><strong>Date:</strong> <%# Eval("AppointmentDate", "{0:yyyy-MM-dd}") %></p>
                <p><strong>Time:</strong> <%# Eval("AppointmentTime") != DBNull.Value ? Convert.ToDateTime(Eval("AppointmentTime")).ToString("hh:mm tt") : "Not Set" %></p>
                <p><strong>Total Bill:</strong> <%# string.Format("{0:C}", Eval("TotalAmount")) %></p>
                <h5>Status: <span class="fw-bold"><%# Eval("Status") %></span></h5>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>

