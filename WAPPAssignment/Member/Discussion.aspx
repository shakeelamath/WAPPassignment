<%@ Page Title="Discussion Forum" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Discussion.aspx.cs" Inherits="WAPPAssignment.Member.Discussion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center mb-4">
        <h1>?? Discussion Forum</h1>
        <p class="lead" style="color: var(--moon-silver);">Connect with fellow space enthusiasts</p>
    </div>

    <div class="card mb-4">
        <div class="card-body">
            <div class="d-flex justify-content-between align-items-center">
                <h3>Discussion Topics</h3>
                <asp:Button ID="btnNewTopic" runat="server" Text="? New Topic" 
                    CssClass="btn btn-success" OnClick="btnNewTopic_Click" />
            </div>
        </div>
    </div>

    <!-- Admin Uploads -->
    <asp:Panel ID="pnlUpload" runat="server" Visible="false" CssClass="card mb-4">
        <div class="card-header">
            <h3>Upload Discussion Document</h3>
        </div>
        <div class="card-body">
            <div class="mb-3">
                <asp:FileUpload ID="fuDocument" runat="server" CssClass="form-control" />
            </div>
            <asp:Button ID="btnUploadDoc" runat="server" Text="Upload" CssClass="btn btn-primary" OnClick="btnUploadDoc_Click" />
        </div>
    </asp:Panel>

    <!-- Documents List -->
    <div class="card mb-4">
        <div class="card-body">
            <h4>Shared Documents</h4>
            <asp:Repeater ID="rptDocuments" runat="server">
                <ItemTemplate>
                    <div class="mb-2">
                        <asp:HyperLink runat="server" NavigateUrl='<%# Eval("Url") %>' Target="_blank" CssClass="btn btn-link">
                            <%# Eval("FileName") %>
                        </asp:HyperLink>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

    <asp:Panel ID="pnlNewTopic" runat="server" Visible="false" CssClass="card mb-4">
        <div class="card-header">
            <h3>Create New Topic</h3>
        </div>
        <div class="card-body">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="txtTopicTitle" CssClass="form-label">Topic Title:</asp:Label>
                <asp:TextBox ID="txtTopicTitle" runat="server" CssClass="form-control" placeholder="Enter topic title"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvTitle" runat="server" 
                    ControlToValidate="txtTopicTitle" 
                    ErrorMessage="Title is required" 
                    CssClass="field-validation-error"
                    ValidationGroup="NewTopic">
                </asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="ddlCategory" CssClass="form-label">Category:</asp:Label>
                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
                    <asp:ListItem Value="General">General Discussion</asp:ListItem>
                    <asp:ListItem Value="Solar System">Solar System</asp:ListItem>
                    <asp:ListItem Value="Stars">Stars & Galaxies</asp:ListItem>
                    <asp:ListItem Value="Missions">Space Missions</asp:ListItem>
                    <asp:ListItem Value="Technology">Space Technology</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="txtTopicDescription" CssClass="form-label">Description:</asp:Label>
                <asp:TextBox ID="txtTopicDescription" runat="server" TextMode="MultiLine" 
                    Rows="5" CssClass="form-control" placeholder="Describe your topic..."></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDescription" runat="server" 
                    ControlToValidate="txtTopicDescription" 
                    ErrorMessage="Description is required" 
                    CssClass="field-validation-error"
                    ValidationGroup="NewTopic">
                </asp:RequiredFieldValidator>
            </div>

            <asp:Button ID="btnSubmitTopic" runat="server" Text="Create Topic" 
                CssClass="btn btn-success me-2" OnClick="btnSubmitTopic_Click" ValidationGroup="NewTopic" />
            <asp:Button ID="btnCancelTopic" runat="server" Text="Cancel" 
                CssClass="btn btn-secondary" OnClick="btnCancelTopic_Click" CausesValidation="false" />
        </div>
    </asp:Panel>

    <asp:Panel ID="pnlMessage" runat="server" Visible="false" CssClass="alert">
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
    </asp:Panel>

    <div class="row g-3">
        <asp:Repeater ID="rptTopics" runat="server">
            <ItemTemplate>
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-8">
                                    <h4>
                                        <%# (bool)Eval("IsPinned") ? "?? " : "" %>
                                        <%# Eval("Title") %>
                                    </h4>
                                    <p style="color: var(--moon-silver); font-size: 0.9rem;">
                                        <%# Eval("Description") %>
                                    </p>
                                    <p style="font-size: 0.85rem; color: var(--cosmic-gold);">
                                        <span class="badge bg-primary"><%# Eval("Category") %></span>
                                        Posted by <strong><%# Eval("Username") %></strong> 
                                        on <%# Eval("CreatedDate", "{0:MMMM dd, yyyy}") %>
                                    </p>
                                </div>
                                <div class="col-md-4 text-end">
                                    <p style="font-size: 0.9rem; color: var(--moon-silver);">
                                        ??? <%# Eval("Views") %> views<br />
                                        ?? <%# Eval("PostCount") %> replies
                                    </p>
                                    <asp:HyperLink runat="server" 
                                        NavigateUrl='<%# "~/Member/ViewTopic.aspx?id=" + Eval("TopicID") %>' 
                                        CssClass="btn btn-info btn-sm">
                                        View Discussion
                                    </asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <asp:Panel ID="pnlNoTopics" runat="server" Visible="false" CssClass="card mt-3">
        <div class="card-body text-center">
            <h4>No topics yet</h4>
            <p>Be the first to start a discussion!</p>
        </div>
    </asp:Panel>
</asp:Content>
