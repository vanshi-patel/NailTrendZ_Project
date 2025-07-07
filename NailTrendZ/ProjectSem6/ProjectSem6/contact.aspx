<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="ProjectSem6.contact" %>
<%@ Register Src="contact.ascx" TagPrefix="uc" TagName="ContactControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <!-- contact section start -->
     <uc:ContactControl runat="server" />
     <!-- contact section end -->
</asp:Content>
