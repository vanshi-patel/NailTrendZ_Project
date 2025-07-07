<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="product.ascx.cs" Inherits="ProjectSem6.product1" %>

<div class="product_section layout_padding">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h1 class="product_taital">Nail Palette</h1>
                <p class="product_text">Polish Your Style, Perfect Your Nails.</p>
            </div>
        </div>

        <div class="product_section_2 layout_padding">
            <div class="row">
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-3 col-sm-6">
                            <div class="product_box">
                                <img src='<%# Eval("ImageURL") %>' class="image_1" />

                                <asp:HiddenField ID="hfProductID" runat="server" Value='<%# Eval("ID") %>' />
                                <asp:HiddenField ID="hfImageURL" runat="server" Value='<%# Eval("ImageURL") %>' />
                                <asp:HiddenField ID="hfPrice" runat="server" Value='<%# Eval("Price") %>' />

                                <div class="btn_main">
                                    <div class="buy_bt">
                                        <ul>
                                            <li>
                                                <asp:Button ID="btnAddToCart" runat="server" Text="Add to Bag" CssClass="cart-button" OnClick="btnAddToCart_Click" />
                                            </li>
                                        </ul>
                                    </div>
                                    <h3 class="price_text"> &#8377;<%# Eval("Price") %></h3>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="seemore_bt"><a href="moreproducts.aspx">See More</a></div>
        </div>
    </div>
</div>
