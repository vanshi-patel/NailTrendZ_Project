<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="moreproducts.aspx.cs" Inherits="ProjectSem6.moreproducts" %>
<%@ Register Src="moreproducts.ascx" TagPrefix="uc" TagName="moreProductsControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <!-- More Products Section Start -->
    <uc:moreProductsControl runat="server" />
    <!-- More Products Section End -->
</asp:Content>
