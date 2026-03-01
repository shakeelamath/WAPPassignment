<%@ Page Title="Manage Content" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageContent.aspx.cs" Inherits="WAPPAssignment.Admin.ManageContent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center mb-4">
        <h1>?? Content Management</h1>
        <p class="lead" style="color: var(--moon-silver);">Manage all CosmoQuest content</p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <div class="card mb-4">
                <div class="card-body text-center">
                    <h2 style="font-size: 3rem;">??</h2>
                    <h4>Planets</h4>
                    <p class="card-text">Add, edit, or remove planet information</p>
                    <asp:HyperLink runat="server" NavigateUrl="~/Admin/ManagePlanets.aspx" CssClass="btn btn-primary">
                        Manage Planets
                    </asp:HyperLink>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card mb-4">
                <div class="card-body text-center">
                    <h2 style="font-size: 3rem;">?</h2>
                    <h4>Stars & Galaxies</h4>
                    <p class="card-text">Manage stars, galaxies, and nebulae</p>
                    <asp:HyperLink runat="server" NavigateUrl="~/Admin/ManageStars.aspx" CssClass="btn btn-primary">
                        Manage Stars
                    </asp:HyperLink>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card mb-4">
                <div class="card-body text-center">
                    <h2 style="font-size: 3rem;">??</h2>
                    <h4>Space Missions</h4>
                    <p class="card-text">Update mission information and status</p>
                    <asp:HyperLink runat="server" NavigateUrl="~/Admin/ManageMissions.aspx" CssClass="btn btn-primary">
                        Manage Missions
                    </asp:HyperLink>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="card mb-4">
                <div class="card-body text-center">
                    <h2 style="font-size: 3rem;">??</h2>
                    <h4>Quizzes</h4>
                    <p class="card-text">Create, edit quizzes and questions</p>
                    <asp:HyperLink runat="server" NavigateUrl="~/Admin/ManageQuizzes.aspx" CssClass="btn btn-warning">
                        Manage Quizzes
                    </asp:HyperLink>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card mb-4">
                <div class="card-body text-center">
                    <h2 style="font-size: 3rem;">??</h2>
                    <h4>Forum Management</h4>
                    <p class="card-text">Moderate discussions and topics</p>
                    <asp:HyperLink runat="server" NavigateUrl="~/Admin/ManageForum.aspx" CssClass="btn btn-info">
                        Manage Forum
                    </asp:HyperLink>
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
