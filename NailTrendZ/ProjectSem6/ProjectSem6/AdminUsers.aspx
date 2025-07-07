<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="AdminUsers.aspx.cs" Inherits="ProjectSem6.AdminUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <h2>Manage Users</h2>
        <asp:GridView ID="GridViewUsers" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered"
            OnRowDeleting="GridViewUsers_RowDeleting" DataKeyNames="UserID">
            <Columns>
                <asp:BoundField DataField="UserID" HeaderText="User ID" ReadOnly="True" />
                <asp:BoundField DataField="UserName" HeaderText="User Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="CreatedAt" HeaderText="Created At" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
                
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn btn-danger btn-sm"
                            CommandName="Delete" CommandArgument='<%# Eval("UserID") %>'
                            OnClientClick="return confirm('Are you sure you want to delete this user?');">
                            <i class="fas fa-trash"></i> Delete
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
