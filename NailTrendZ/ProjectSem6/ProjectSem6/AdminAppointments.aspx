<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="AdminAppointments.aspx.cs" Inherits="ProjectSem6.AdminAppointments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .dark-mode .heading{
             color: white;
         }
    </style>
    <div class="container mt-4">
        <h2 class="text-center">Manage Appointments</h2>

        <!-- APPOINTMENTS LIST -->
        <h4 class="heading">Appointments List</h4>
        <asp:GridView ID="gvAppointments" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False"
            DataKeyNames="AppointmentID"
            OnRowEditing="gvAppointments_RowEditing"
            OnRowUpdating="gvAppointments_RowUpdating"
            OnRowDeleting="gvAppointments_RowDeleting"
            OnRowCancelingEdit="gvAppointments_RowCancelingEdit"
            OnRowCommand="gvAppointments_RowCommand">
            <Columns>
                <asp:BoundField DataField="AppointmentID" HeaderText="ID" ReadOnly="True" />
                <asp:TemplateField HeaderText="Full Name">
                    <ItemTemplate>
                        <asp:Label ID="lblFullName" runat="server" Text='<%# Eval("FullName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email">
                    <ItemTemplate>
                        <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Phone">
                    <ItemTemplate>
                        <asp:Label ID="lblPhone" runat="server" Text='<%# Eval("PhoneNumber") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date">
                    <ItemTemplate>
                        <asp:Label ID="lblDate" runat="server" Text='<%# Eval("AppointmentDate", "{0:yyyy-MM-dd}") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDate" runat="server" Text='<%# Eval("AppointmentDate", "{0:yyyy-MM-dd}") %>' CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Time">
                    <ItemTemplate>
                        <asp:Label ID="lblTime" runat="server" Text='<%# Eval("AppointmentTime", "{0:hh:mm tt}") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtTime" runat="server" Text='<%# Eval("AppointmentTime", "{0:hh:mm tt}") %>' CssClass="form-control" TextMode="Time"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                    <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
                <asp:TemplateField HeaderText="Total Bill Amount">
    <ItemStyle Width="80px" />
    <HeaderStyle Width="80px" />
    <ItemTemplate>
        <asp:Label ID="lblTotalBill" runat="server" Text='<%# Eval("TotalBillAmount", "{0:C}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Actions">
                <ItemStyle Width="300px" />
                <HeaderStyle Width="300px" />
               <ItemTemplate>
                    <div class="btn-group">
                        <asp:Button ID="btnEdit" runat="server" CommandName="Edit" CssClass="btn btn-warning btn-sm me-2" Text="Edit" />
                        <asp:Button ID="btnConfirm" runat="server" CommandName="Confirm" CommandArgument='<%# Eval("AppointmentID") %>' CssClass="btn btn-success btn-sm me-2" Text="Confirm" />
                        <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" CommandArgument='<%# Eval("AppointmentID") %>' CssClass="btn btn-secondary btn-sm me-2" Text="Cancel" />
                        <asp:Button ID="btnDelete" runat="server" CommandName="Delete" CssClass="btn btn-danger btn-sm" Text="Delete" />
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <div class="btn-group">
                        <asp:Button ID="btnUpdate" runat="server" CommandName="Update" CssClass="btn btn-primary btn-sm me-2" Text="Update" />
                        <asp:Button ID="btnCancelEdit" runat="server" CommandName="CancelEdit" CssClass="btn btn-secondary btn-sm" Text="Cancel" />
                    </div>
                </EditItemTemplate>
            </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
