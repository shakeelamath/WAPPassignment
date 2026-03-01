<%@ Page Title="Member Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="WAPPAssignment.Member.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center mb-4">
        <h1>?? Welcome, <asp:Label ID="lblUsername" runat="server"></asp:Label>!</h1>
        <p class="lead" style="color: var(--moon-silver);">Your Cosmic Learning Dashboard</p>
    </div>

    <div class="row g-4 mb-5">
        <div class="col-md-3">
            <div class="stat-card">
                <h3><asp:Label ID="lblQuizzesTaken" runat="server" Text="0"></asp:Label></h3>
                <p>Quizzes Taken</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stat-card">
                <h3><asp:Label ID="lblAverageScore" runat="server" Text="0"></asp:Label>%</h3>
                <p>Average Score</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stat-card">
                <h3><asp:Label ID="lblDiscussions" runat="server" Text="0"></asp:Label></h3>
                <p>Forum Posts</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stat-card">
                <h3><asp:Label ID="lblDaysActive" runat="server" Text="0"></asp:Label></h3>
                <p>Days Active</p>
            </div>
        </div>
    </div>

    <div class="row g-4">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h3>?? Recent Quiz Results</h3>
                </div>
                <div class="card-body">
                    <asp:GridView ID="gvRecentQuizzes" runat="server" 
                        CssClass="table GridView" 
                        AutoGenerateColumns="False"
                        EmptyDataText="No quizzes taken yet. Take your first quiz!">
                        <Columns>
                            <asp:BoundField DataField="Title" HeaderText="Quiz" />
                            <asp:BoundField DataField="Score" HeaderText="Score" />
                            <asp:BoundField DataField="Percentage" HeaderText="%" DataFormatString="{0:F1}" />
                            <asp:BoundField DataField="AttemptDate" HeaderText="Date" DataFormatString="{0:MM/dd/yyyy}" />
                        </Columns>
                    </asp:GridView>
                    <div class="text-center mt-3">
                        <asp:HyperLink runat="server" NavigateUrl="~/Member/Quizzes.aspx" CssClass="btn btn-primary">
                            Take a Quiz
                        </asp:HyperLink>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h3>?? Discussion Activity</h3>
                </div>
                <div class="card-body">
                    <asp:GridView ID="gvRecentPosts" runat="server" 
                        CssClass="table GridView" 
                        AutoGenerateColumns="False"
                        EmptyDataText="No forum posts yet. Join the discussion!">
                        <Columns>
                            <asp:BoundField DataField="Title" HeaderText="Topic" />
                            <asp:BoundField DataField="PostDate" HeaderText="Posted" DataFormatString="{0:MM/dd/yyyy}" />
                        </Columns>
                    </asp:GridView>
                    <div class="text-center mt-3">
                        <asp:HyperLink runat="server" NavigateUrl="~/Member/Discussion.aspx" CssClass="btn btn-info">
                            Go to Forums
                        </asp:HyperLink>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row g-4 mt-4">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body text-center">
                    <h3>?? Quick Actions</h3>
                    <div class="mt-3">
                        <asp:HyperLink runat="server" NavigateUrl="~/SolarSystem.aspx" CssClass="btn btn-primary me-2 mb-2">
                            ?? Explore Planets
                        </asp:HyperLink>
                        <asp:HyperLink runat="server" NavigateUrl="~/Member/Quizzes.aspx" CssClass="btn btn-success me-2 mb-2">
                            ?? Take Quiz
                        </asp:HyperLink>
                        <asp:HyperLink runat="server" NavigateUrl="~/Member/Discussion.aspx" CssClass="btn btn-info me-2 mb-2">
                            ?? Join Discussion
                        </asp:HyperLink>
                        <asp:HyperLink runat="server" NavigateUrl="~/StarsGalaxies.aspx" CssClass="btn btn-warning mb-2">
                            ? View Stars
                        </asp:HyperLink>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
