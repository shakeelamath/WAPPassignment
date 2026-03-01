<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WAPPAssignment.Account.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">
            <div class="card">
                <div class="card-header text-center">
                    <h2>?? Login to CosmoQuest</h2>
                </div>
                <div class="card-body">
                    <asp:Panel ID="pnlMessage" runat="server" Visible="false" CssClass="alert alert-danger">
                        <asp:Label ID="lblMessage" runat="server"></asp:Label>
                    </asp:Panel>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="txtUsername" CssClass="form-label">Username:</asp:Label>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter your username"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvUsername" runat="server" 
                            ControlToValidate="txtUsername" 
                            ErrorMessage="Username is required" 
                            CssClass="field-validation-error"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="txtPassword" CssClass="form-label">Password:</asp:Label>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter your password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                            ControlToValidate="txtPassword" 
                            ErrorMessage="Password is required" 
                            CssClass="field-validation-error"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-check mb-3">
                        <asp:CheckBox ID="chkRememberMe" runat="server" CssClass="form-check-input" />
                        <label class="form-check-label" for="<%= chkRememberMe.ClientID %>">Remember Me</label>
                    </div>

                    <div class="d-grid gap-2">
                        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary btn-lg" OnClick="btnLogin_Click" />
                    </div>

                    <div class="text-center mt-3">
                        <p style="color: var(--moon-silver);">
                            Don't have an account? 
                            <asp:HyperLink runat="server" NavigateUrl="~/Account/Register.aspx" style="color: var(--cosmic-gold);">
                                Register here
                            </asp:HyperLink>
                        </p>
                    </div>
                </div>
            </div>

            <!-- Demo Credentials Info -->
            <div class="card mt-3">
                <div class="card-body text-center">
                    <h5>?? Demo Credentials</h5>
                    <p style="color: var(--moon-silver); font-size: 0.9rem; margin: 0;">
                        <strong>Admin:</strong> admin / Admin@123<br />
                        <strong>Member:</strong> Create a new account
                    </p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
