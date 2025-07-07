<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ProjectSem6.index" %>
<%@ Register Src="Product.ascx" TagPrefix="uc" TagName="ProductControl" %>
<%@ Register Src="about.ascx" TagPrefix="uc" TagName="AboutControl" %>
<%@ Register Src="customer.ascx" TagPrefix="uc" TagName="CustomerControl" %>
<%@ Register Src="contact.ascx" TagPrefix="uc" TagName="ContactControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- banner section start -->
    <div class="banner_section layout_padding">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6">
                                <h1 class="banner_taital">Beauty <br />Kit</h1>
                                <p class="banner_text">Nail Trends allows user to browse Nail Art Designs, Book Appointments, and Manage their Services Online.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
         </div>
    </div>
            <!-- banner section end -->

      <!-- product section start -->
     <uc:ProductControl runat="server" />
     <!-- product section end -->

    <!-- about section start -->
      <uc:AboutControl runat="server" />
     <!-- about section end -->

     <!-- customer section start -->
      <uc:CustomerControl runat="server" />
     <!-- customer section end -->

     <!-- contact section start -->
       <uc:ContactControl runat="server" />
      <!-- contact section end -->
</asp:Content>
