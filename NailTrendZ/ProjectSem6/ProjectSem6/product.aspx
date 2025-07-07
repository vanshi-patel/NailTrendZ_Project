<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="ProjectSem6.product" %>
<%@ Register Src="Product.ascx" TagPrefix="uc" TagName="ProductControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <!-- product section start -->
     <uc:ProductControl runat="server" />
     <!-- product section end -->
</asp:Content>
