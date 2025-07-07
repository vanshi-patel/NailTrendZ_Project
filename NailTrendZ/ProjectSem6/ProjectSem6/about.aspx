<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="ProjectSem6.about" %>
<%@ Register Src="about.ascx" TagPrefix="uc" TagName="AboutControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <!-- about section start -->
      <uc:AboutControl runat="server" />
     <!-- about section end -->
</asp:Content>
