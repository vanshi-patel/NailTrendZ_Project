<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Appointments.aspx.cs" Inherits="ProjectSem6.Appointments1" %>
<%@ Register Src="Appointments.ascx" TagPrefix="uc" TagName="AppointmentsControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Appointment section start -->
     <uc:AppointmentsControl runat="server" />
     <!-- Appointment section end -->
</asp:Content>
