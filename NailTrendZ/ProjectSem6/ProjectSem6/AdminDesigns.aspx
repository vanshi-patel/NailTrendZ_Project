<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="AdminDesigns.aspx.cs" Inherits="ProjectSem6.AdminDesigns" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <div class="container">
        <h2 class="mb-4">Manage Designs</h2>

        <!-- Add New Design -->
        <h3 class="mt-4">Add New Design</h3>
        <div class="mb-3">
            <asp:TextBox ID="txtNewPrice" runat="server" CssClass="form-control" Placeholder="Price" onkeypress="return isNumberKey(event);"></asp:TextBox>
        </div>
        <div class="mb-3">
            <asp:FileUpload ID="fuNewImageUpload" runat="server" CssClass="form-control" />
        </div>
        <asp:Button ID="btnAddDesign" runat="server" Text="Add Design" CssClass="btn btn-primary" OnClick="btnAddDesign_Click" />

        <script type="text/javascript">
            function isNumberKey(evt) {
                var charCode = (evt.which) ? evt.which : event.keyCode;
                if (charCode < 48 || charCode > 57) {
                    return false; // Restrict non-numeric characters
                }
                return true;
            }
        </script>

        <br><br>

        <!-- Designs Table -->
        <asp:GridView ID="gvDesigns" runat="server" AutoGenerateColumns="False" DataKeyNames="DesignID" 
            CssClass="table table-bordered" OnRowEditing="gvDesigns_RowEditing" 
            OnRowUpdating="gvDesigns_RowUpdating" OnRowCancelingEdit="gvDesigns_RowCancelingEdit" 
            OnRowDeleting="gvDesigns_RowDeleting">
            <Columns>
                <asp:BoundField DataField="DesignID" HeaderText="ID" ReadOnly="True" />

                <asp:TemplateField HeaderText="Price">
                    <ItemTemplate>
                        <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price", "{0:C}") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPrice" runat="server" Text='<%# Eval("Price") %>' CssClass="form-control"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Design Image">
                    <ItemTemplate>
                        <asp:Image ID="imgDesign" runat="server" ImageUrl='<%# Eval("ImageURL") %>' Width="100px" Height="100px" CssClass="rounded img-thumbnail"/>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Image ID="imgEditDesign" runat="server" ImageUrl='<%# Eval("ImageURL") %>' Width="100px" Height="100px" CssClass="rounded img-thumbnail"/>
                        <asp:FileUpload ID="fuImageUpload" runat="server" CssClass="form-control mt-2"/>
                        <asp:HiddenField ID="hfImageURL" runat="server" Value='<%# Eval("ImageURL") %>' />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit" CssClass="btn btn-sm btn-warning">
                            <i class="fas fa-edit"></i> Edit
                        </asp:LinkButton>
                        <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" CssClass="btn btn-sm btn-danger" OnClientClick="return confirm('Are you sure you want to delete this design?');">
                            <i class="fas fa-trash"></i> Delete
                        </asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="lnkUpdate" runat="server" CommandName="Update" CssClass="btn btn-sm btn-success">
                            <i class="fas fa-save"></i> Save
                        </asp:LinkButton>
                        <asp:LinkButton ID="lnkCancel" runat="server" CommandName="Cancel" CssClass="btn btn-sm btn-secondary">
                            <i class="fas fa-times"></i> Cancel
                        </asp:LinkButton>
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
