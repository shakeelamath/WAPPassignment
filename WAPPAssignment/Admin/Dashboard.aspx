<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="WAPPAssignment.Admin.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center mb-4">
        <h1>????? Admin Dashboard</h1>
        <p class="lead" style="color: var(--moon-silver);">CosmoQuest System Administration</p>
    </div>

    <div class="row g-4 mb-5">
        <div class="col-md-3">
            <div class="stat-card">
                <h3><asp:Label ID="lblTotalUsers" runat="server" Text="0"></asp:Label></h3>
                <p>Total Users</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stat-card">
                <h3><asp:Label ID="lblTotalQuizzes" runat="server" Text="0"></asp:Label></h3>
                <p>Total Quizzes</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stat-card">
                <h3><asp:Label ID="lblTotalPlanets" runat="server" Text="0"></asp:Label></h3>
                <p>Planets</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stat-card">
                <h3><asp:Label ID="lblTotalTopics" runat="server" Text="0"></asp:Label></h3>
                <p>Forum Topics</p>
            </div>
        </div>
    </div>

    <div class="row g-4">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h3>?? Recent User Registrations</h3>
                </div>
                <div class="card-body">
                    <asp:GridView ID="gvRecentUsers" runat="server" 
                        CssClass="table GridView" 
                        AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="Username" HeaderText="Username" />
                            <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="DateRegistered" HeaderText="Registered" DataFormatString="{0:MM/dd/yyyy}" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h3>?? Quiz Activity</h3>
                </div>
                <div class="card-body">
                    <asp:GridView ID="gvQuizActivity" runat="server" 
                        CssClass="table GridView" 
                        AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="Title" HeaderText="Quiz" />
                            <asp:BoundField DataField="AttemptCount" HeaderText="Attempts" />
                            <asp:BoundField DataField="AvgScore" HeaderText="Avg Score" DataFormatString="{0:F1}%" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

    <div class="row g-4 mt-4">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body text-center">
                    <h3>?? Quick Admin Actions</h3>
                    <div class="mt-3">
                        <asp:HyperLink runat="server" NavigateUrl="~/Admin/ManageUsers.aspx" CssClass="btn btn-primary me-2 mb-2">
                            ?? Manage Users
                        </asp:HyperLink>
                        <asp:HyperLink runat="server" NavigateUrl="~/Admin/ManageContent.aspx" CssClass="btn btn-success me-2 mb-2">
                            ?? Manage Content
                        </asp:HyperLink>
                        <asp:HyperLink runat="server" NavigateUrl="~/Admin/ManagePlanets.aspx" CssClass="btn btn-info me-2 mb-2">
                            ?? Manage Planets
                        </asp:HyperLink>
                        <asp:HyperLink runat="server" NavigateUrl="~/Admin/ManageQuizzes.aspx" CssClass="btn btn-warning mb-2">
                            ?? Manage Quizzes
                        </asp:HyperLink>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
