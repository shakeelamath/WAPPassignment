<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WAPPAssignment.Account.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="card">
                <div class="card-header text-center">
                    <h2>?? Join CosmoQuest</h2>
                    <p style="color: var(--moon-silver); margin: 0;">Start your cosmic learning journey today!</p>
                </div>
                <div class="card-body">
                    <asp:Panel ID="pnlMessage" runat="server" Visible="false">
                        <asp:Label ID="lblMessage" runat="server"></asp:Label>
                    </asp:Panel>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="txtFullName" CssClass="form-label">Full Name:</asp:Label>
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Enter your full name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFullName" runat="server" 
                            ControlToValidate="txtFullName" 
                            ErrorMessage="Full name is required" 
                            CssClass="field-validation-error"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="txtUsername" CssClass="form-label">Username:</asp:Label>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Choose a username"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvUsername" runat="server" 
                            ControlToValidate="txtUsername" 
                            ErrorMessage="Username is required" 
                            CssClass="field-validation-error"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revUsername" runat="server" 
                            ControlToValidate="txtUsername"
                            ValidationExpression="^[a-zA-Z0-9_]{4,20}$"
                            ErrorMessage="Username must be 4-20 characters (letters, numbers, underscore only)"
                            CssClass="field-validation-error"
                            Display="Dynamic">
                        </asp:RegularExpressionValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="form-label">Email:</asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" placeholder="your.email@example.com"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                            ControlToValidate="txtEmail" 
                            ErrorMessage="Email is required" 
                            CssClass="field-validation-error"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                            ControlToValidate="txtEmail"
                            ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"
                            ErrorMessage="Please enter a valid email address"
                            CssClass="field-validation-error"
                            Display="Dynamic">
                        </asp:RegularExpressionValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="txtPassword" CssClass="form-label">Password:</asp:Label>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Create a strong password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                            ControlToValidate="txtPassword" 
                            ErrorMessage="Password is required" 
                            CssClass="field-validation-error"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPassword" runat="server" 
                            ControlToValidate="txtPassword"
                            ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"
                            ErrorMessage="Password must be at least 8 characters with uppercase, lowercase, number and special character"
                            CssClass="field-validation-error"
                            Display="Dynamic">
                        </asp:RegularExpressionValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="txtConfirmPassword" CssClass="form-label">Confirm Password:</asp:Label>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Re-enter your password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" 
                            ControlToValidate="txtConfirmPassword" 
                            ErrorMessage="Please confirm your password" 
                            CssClass="field-validation-error"
                            Display="Dynamic">
                        </asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvPassword" runat="server" 
                            ControlToValidate="txtConfirmPassword"
                            ControlToCompare="txtPassword"
                            ErrorMessage="Passwords do not match"
                            CssClass="field-validation-error"
                            Display="Dynamic">
                        </asp:CompareValidator>
                    </div>

                    <div class="d-grid gap-2">
                        <asp:Button ID="btnRegister" runat="server" Text="Create Account" CssClass="btn btn-success btn-lg" OnClick="btnRegister_Click" />
                    </div>

                    <div class="text-center mt-3">
                        <p style="color: var(--moon-silver);">
                            Already have an account? 
                            <asp:HyperLink runat="server" NavigateUrl="~/Account/Login.aspx" style="color: var(--cosmic-gold);">
                                Login here
                            </asp:HyperLink>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
