<%@ Page Title="Solar System" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SolarSystem.aspx.cs" Inherits="WAPPAssignment.SolarSystem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center mb-4">
        <h1>?? Explore Our Solar System</h1>
        <p class="lead" style="color: var(--moon-silver);">
            Discover the eight planets orbiting our Sun and learn fascinating facts about each one
        </p>
    </div>

    <asp:Panel ID="pnlPlanets" runat="server">
        <div class="row g-4">
            <asp:Repeater ID="rptPlanets" runat="server">
                <ItemTemplate>
                    <div class="col-md-6 col-lg-3">
                        <div class="card planet-card h-100">
                            <div class="card-body">
                                <h3 class="card-title text-center"><%# Eval("Name") %></h3>
                                <div class="text-center mb-3">
                                    <img src='<%# ResolvePlanetImage(Eval("ImageURL"), Eval("Name")) %>' alt='<%# Eval("Name") %>' class="planet-image" />
                                </div>
                                <p class="card-text"><%# Eval("Description") %></p>
                                <hr />
                                <div style="font-size: 0.9rem; color: var(--moon-silver);">
                                    <p><strong>Distance from Sun:</strong> <%# Eval("DistanceFromSun") %> million km</p>
                                    <p><strong>Diameter:</strong> <%# Eval("Diameter") %> km</p>
                                    <p><strong>Moons:</strong> <%# Eval("Moons") %></p>
                                </div>
                                <asp:HyperLink runat="server" 
                                    NavigateUrl='<%# "~/PlanetDetails.aspx?id=" + Eval("PlanetID") %>' 
                                    CssClass="btn btn-primary btn-sm w-100">
                                    Learn More
                                </asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </asp:Panel>

    <div class="card mt-5">
        <div class="card-body">
            <h3>?? Did You Know?</h3>
            <ul style="color: var(--moon-silver); line-height: 2;">
                <li>Our Solar System formed about 4.6 billion years ago</li>
                <li>The Sun contains 99.86% of the mass in the solar system</li>
                <li>Jupiter is so large that all other planets could fit inside it</li>
                <li>A day on Venus is longer than its year</li>
                <li>Saturn's rings are made mostly of ice particles</li>
            </ul>
        </div>
    </div>
</asp:Content>
