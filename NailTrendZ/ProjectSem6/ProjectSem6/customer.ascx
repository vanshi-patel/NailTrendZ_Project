<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="customer.ascx.cs" Inherits="ProjectSem6.customer1" %>
  <!-- Customer Section Start -->
<div class="customer_section layout_padding">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h1 class="customer_taital">Nail TrendZer's Feedback</h1>
            </div>
        </div>

        <div id="main_slider" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <asp:Repeater ID="rptFeedback" runat="server">
                    <ItemTemplate>
                        <div class='carousel-item <%# (Container.ItemIndex == 0) ? "active" : "" %>'>
                            <div class="client_section_2">
                                <div class="client_main">
                                    <div class="client_left">
                                        <div class="client_img"><img src="images/client-img.png" alt="Client Image" /></div>
                                    </div>
                                    <div class="client_right">
                                        <h3 class="name_text"><%# Eval("CustomerName") %></h3>
                                        <p class="dolor_text">"<%# Eval("Comments") %>"</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <!-- Carousel Controls -->
            <a class="carousel-control-prev" href="#main_slider" role="button" data-slide="prev">
                <img src="images/previous_logo.png" alt="<" height="20px" width="20px" />
            </a>
            <a class="carousel-control-next" href="#main_slider" role="button" data-slide="next">
                <img src="images/next_logo.png" alt=">" height="20px" width="20px" />
            </a>
        </div>

        <!-- Label for No Feedback Message -->
        <asp:Label ID="lblNoFeedback" runat="server" ForeColor="Red" Visible="false"></asp:Label>
    
        <!-- Button to Add Feedback -->
       <br />
        <div class="feedback-btn-container">
        <asp:Button ID="btnAddFeedback" runat="server" Text="Add Your Feedback" CssClass="btnAddFeedback" OnClick="btnAddFeedback_Click"></asp:Button>
        </div>
        <br /><br />
    </div>
</div>
<!-- Customer Section End -->