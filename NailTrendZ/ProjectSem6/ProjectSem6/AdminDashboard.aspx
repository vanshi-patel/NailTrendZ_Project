<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="ProjectSem6.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .dark-mode .heading {
            color: white;
        }
        .chart-container {
            width: 100%;
            max-width: 600px;
            margin: auto;
        }
    </style>

    <div class="row">
        <div class="col-md-6 chart-container">
            <h4 class="heading">Appointments Overview</h4>
            <canvas id="appointmentsChart"></canvas>
        </div>
        <div class="col-md-6 chart-container">
            <h4 class="heading">Revenue Overview</h4>
            <canvas id="revenueChart"></canvas>
        </div>
    </div>

    <!-- Load Chart.js first -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // Check if Chart.js is loaded
            if (typeof Chart === "undefined") {
                console.error("Chart.js is not loaded. Check the script URL.");
                return;
            }

            // Ensure data is available
            if (typeof appointmentsData === "undefined" || typeof revenueData === "undefined") {
                console.error("Chart data not loaded.");
                return;
            }

            var labels = Object.keys(appointmentsData);
            var appointmentsValues = labels.map(key => appointmentsData[key]);
            var revenueValues = labels.map(key => revenueData[key]);

            // Draw Appointments Chart
            var ctx1 = document.getElementById('appointmentsChart');
            if (ctx1) {
                new Chart(ctx1.getContext('2d'), {
                    type: 'line',
                    data: {
                        labels: labels,
                        datasets: [{
                            label: 'Appointments',
                            data: appointmentsValues,
                            backgroundColor: 'rgba(54, 162, 235, 0.2)',
                            borderColor: 'rgba(54, 162, 235, 1)',
                            borderWidth: 2
                        }]
                    },
                    options: { responsive: true }
                });
            } else {
                console.error("appointmentsChart canvas not found.");
            }

            // Draw Revenue Chart
            var ctx2 = document.getElementById('revenueChart');
            if (ctx2) {
                new Chart(ctx2.getContext('2d'), {
                    type: 'bar',
                    data: {
                        labels: labels,
                        datasets: [{
                            label: 'Revenue (₹)',
                            data: revenueValues,
                            backgroundColor: 'rgba(255, 99, 132, 0.2)',
                            borderColor: 'rgba(255, 99, 132, 1)',
                            borderWidth: 2
                        }]
                    },
                    options: { responsive: true }
                });
            } else {
                console.error("revenueChart canvas not found.");
            }
        });
    </script>
</asp:Content>
