<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AppointmentStatus.aspx.cs" Inherits="ProjectSem6.AppointmentStatus" %>
<%@ Register Src="AppointmentStatus.ascx" TagPrefix="uc" TagName="AddAppointmentStatusControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Add AppointmentStatus section start -->
    <uc:AddAppointmentStatusControl runat="server" />
    <!-- Add AppointmentStatus section end -->
</asp:Content>
