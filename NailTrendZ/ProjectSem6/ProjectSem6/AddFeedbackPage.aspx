<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddFeedbackPage.aspx.cs" Inherits="ProjectSem6.AddFeedbackPage" %>
<%@ Register Src="AddFeedbackPage.ascx" TagPrefix="uc" TagName="AddFeedbackControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Add Feedback section start -->
    <uc:AddFeedbackControl runat="server" />
    <!-- Add feedback section end -->
</asp:Content>
