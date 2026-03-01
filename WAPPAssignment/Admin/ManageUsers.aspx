<%@ Page Title="Manage Users" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="WAPPAssignment.Admin.ManageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center mb-4">
        <h1>?? User Management</h1>
        <p class="lead" style="color: var(--moon-silver);">Manage registered users and permissions</p>
    </div>

    <asp:Panel ID="pnlMessage" runat="server" Visible="false" CssClass="alert">
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
    </asp:Panel>

    <div class="card">
        <div class="card-header">
            <div class="d-flex justify-content-between align-items-center">
                <h3>Registered Users</h3>
                <div>
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control d-inline-block" 
                        style="width: 200px;" placeholder="Search users..."></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" 
                        CssClass="btn btn-info" OnClick="btnSearch_Click" />
                </div>
            </div>
        </div>
        <div class="card-body">
            <asp:GridView ID="gvUsers" runat="server" 
                CssClass="table GridView" 
                AutoGenerateColumns="False"
                DataKeyNames="UserID"
                OnRowEditing="gvUsers_RowEditing"
                OnRowUpdating="gvUsers_RowUpdating"
                OnRowCancelingEdit="gvUsers_RowCancelingEdit"
                OnRowDeleting="gvUsers_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="UserID" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" />
                    <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:TemplateField HeaderText="Role">
                        <ItemTemplate>
                            <span class='<%# GetRoleBadgeClass(Eval("Role").ToString()) %>'>
                                <%# Eval("Role") %>
                            </span>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control"
                                SelectedValue='<%# Bind("Role") %>'>
                                <asp:ListItem Value="Member">Member</asp:ListItem>
                                <asp:ListItem Value="Admin">Admin</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <span class='<%# (bool)Eval("IsActive") ? "badge bg-success" : "badge bg-danger" %>'>
                                <%# (bool)Eval("IsActive") ? "Active" : "Inactive" %>
                            </span>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:CheckBox ID="chkIsActive" runat="server" 
                                Checked='<%# Bind("IsActive") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="DateRegistered" HeaderText="Registered" 
                        DataFormatString="{0:MM/dd/yyyy}" ReadOnly="True" />
                    <asp:BoundField DataField="LastLogin" HeaderText="Last Login" 
                        DataFormatString="{0:MM/dd/yyyy HH:mm}" ReadOnly="True" />
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" 
                        ButtonType="Button" 
                        EditText="Edit" 
                        UpdateText="Update" 
                        CancelText="Cancel"
                        DeleteText="Delete" />
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <div class="card mt-4">
        <div class="card-body">
            <h4>?? User Statistics</h4>
            <div class="row mt-3">
                <div class="col-md-4">
                    <p><strong>Total Users:</strong> <asp:Label ID="lblTotalUsers" runat="server"></asp:Label></p>
                </div>
                <div class="col-md-4">
                    <p><strong>Active Users:</strong> <asp:Label ID="lblActiveUsers" runat="server"></asp:Label></p>
                </div>
                <div class="col-md-4">
                    <p><strong>New This Month:</strong> <asp:Label ID="lblNewUsers" runat="server"></asp:Label></p>
                </div>
            </div>
        </div>
    </div>

    <div class="text-center mt-4">
        <asp:HyperLink runat="server" NavigateUrl="~/Admin/Dashboard.aspx" CssClass="btn btn-secondary">
            ? Back to Dashboard
        </asp:HyperLink>
    </div>
</asp:Content>
