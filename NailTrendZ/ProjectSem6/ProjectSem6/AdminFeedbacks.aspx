<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="AdminFeedbacks.aspx.cs" Inherits="ProjectSem6.AdminFeedbacks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <h2>Manage Feedbacks</h2>
        <asp:GridView ID="GridViewFeedbacks" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered"
    OnRowDeleting="GridViewFeedbacks_RowDeleting" DataKeyNames="FeedbackID" OnSelectedIndexChanged="GridViewFeedbacks_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="FeedbackID" HeaderText="Feedback ID" ReadOnly="True" />
                <asp:BoundField DataField="UserID" HeaderText="User ID" />
                <asp:BoundField DataField="CustomerName" HeaderText="Customer Name" />
                <asp:BoundField DataField="Comments" HeaderText="Comments" />
                <asp:BoundField DataField="CreatedAt" HeaderText="Created At" DataFormatString="{0:yyyy-MM-dd HH:mm}" />

                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn btn-danger btn-sm"
                            CommandName="Delete" CommandArgument='<%# Eval("FeedbackID") %>'
                            OnClientClick="return confirm('Are you sure you want to delete this feedback?');">
                            <i class="fas fa-trash"></i> Delete
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
