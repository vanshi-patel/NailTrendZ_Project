<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="customer.aspx.cs" Inherits="ProjectSem6.customer" %>
<%@ Register Src="customer.ascx" TagPrefix="uc" TagName="CustomerControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- customer section start -->
    <uc:CustomerControl runat="server" />
    <!-- customer section end -->
</asp:Content>
