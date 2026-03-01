<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WAPPAssignment._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <section class="text-center mb-5">
            <h1 style="font-size: 3.5rem;">🌌 Welcome to CosmoQuest</h1>
            <p class="lead" style="font-size: 1.5rem; color: var(--moon-silver);">
                Embark on an interstellar journey of discovery and learning
            </p>
            <p style="color: #d0d0d0; font-size: 1.1rem;">
                Explore our solar system and learn fascinating facts about the eight planets — then test your knowledge with interactive quizzes!
            </p>
        </section>
            <div class="row g-4 mb-5">
            <div class="col-md-4 offset-md-4">
                <div class="card planet-card">
                    <div class="card-body text-center">
                        <h2 style="font-size: 3rem;">🪐</h2>
                        <h3 class="card-title">Solar System</h3>
                        <p class="card-text">
                            Discover the eight planets orbiting our Sun, their unique characteristics, 
                            and fascinating facts about each celestial body.
                        </p>
                        <asp:HyperLink runat="server" NavigateUrl="~/SolarSystem.aspx" CssClass="btn btn-primary">
                            Explore Planets
                        </asp:HyperLink>
                    </div>
                </div>
            </div>
        </div>

        <asp:Panel ID="GuestPanel" runat="server">
            <section class="card text-center">
                <div class="card-body">
                    <h2>🌟 Join the CosmoQuest Community</h2>
                    <p class="lead">Create an account to access exclusive features:</p>
                    <div class="row mt-4">
                        <div class="col-md-3">
                            <h4>📝</h4>
                            <p>Interactive Quizzes</p>
                        </div>
                        <div class="col-md-3">
                            <h4>💬</h4>
                            <p>Discussion Forums</p>
                        </div>
                        <div class="col-md-3">
                            <h4>📊</h4>
                            <p>Track Progress</p>
                        </div>
                        <div class="col-md-3">
                            <h4>🏆</h4>
                            <p>Earn Achievements</p>
                        </div>
                    </div>
                    <div class="mt-4">
                        <asp:HyperLink runat="server" NavigateUrl="~/Account/Register.aspx" CssClass="btn btn-warning btn-lg me-3">
                            Register Now
                        </asp:HyperLink>
                        <asp:HyperLink runat="server" NavigateUrl="~/Account/Login.aspx" CssClass="btn btn-info btn-lg">
                            Login
                        </asp:HyperLink>
                    </div>
                </div>
            </section>
        </asp:Panel>

        <asp:Panel ID="MemberPanel" runat="server" Visible="false">
            <section class="card">
                <div class="card-body text-center">
                    <h2>Welcome back, <asp:Label ID="lblWelcome" runat="server"></asp:Label>! 👋</h2>
                    <p class="lead">Continue your cosmic journey:</p>
                    <div class="mt-4">
                        <asp:HyperLink runat="server" NavigateUrl="~/Member/Dashboard.aspx" CssClass="btn btn-success btn-lg me-3">
                            Go to Dashboard
                        </asp:HyperLink>
                        <asp:HyperLink runat="server" NavigateUrl="~/Member/Quizzes.aspx" CssClass="btn btn-primary btn-lg">
                            Take a Quiz
                        </asp:HyperLink>
                    </div>
                </div>
            </section>
        </asp:Panel>

        <section class="mt-5">
            <h2 class="text-center mb-4">🌠 Why Choose CosmoQuest?</h2>
            <div class="row g-4">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h4>📚 Comprehensive Content</h4>
                            <p>Detailed information about planets and related educational content with regular updates.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h4>🎓 Educational Excellence</h4>
                            <p>Curated by space enthusiasts and educators to provide accurate, engaging content.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h4>🤝 Community Driven</h4>
                            <p>Connect with fellow space enthusiasts, share knowledge, and discuss cosmic wonders.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h4>📱 Accessible Anywhere</h4>
                            <p>Responsive design ensures you can learn about space from any device, anywhere.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

</asp:Content>

