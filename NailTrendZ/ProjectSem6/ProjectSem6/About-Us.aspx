<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About-Us.aspx.cs" Inherits="ProjectSem6.About_Us" %>
<%@ Register Src="About-Us.ascx" TagPrefix="uc" TagName="AboutUsControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <!-- about section start -->
      <uc:AboutUsControl runat="server" />
     <!-- about section end -->
</asp:Content>
