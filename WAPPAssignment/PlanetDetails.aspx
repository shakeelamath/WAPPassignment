<%@ Page Title="Planet Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PlanetDetails.aspx.cs" Inherits="WAPPAssignment.PlanetDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="pnlDetails" runat="server">
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body text-center">
                        <span style="font-size: 8rem;">??</span>
                        <h2><asp:Label ID="lblName" runat="server"></asp:Label></h2>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h3>Planet Information</h3>
                    </div>
                    <div class="card-body">
                        <asp:Label ID="lblDescription" runat="server" CssClass="lead"></asp:Label>
                        
                        <hr />
                        
                        <div class="row mt-4">
                            <div class="col-md-6">
                                <h5>Physical Characteristics</h5>
                                <table class="table table-borderless">
                                    <tr>
                                        <td><strong>Diameter:</strong></td>
                                        <td><asp:Label ID="lblDiameter" runat="server"></asp:Label> km</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Mass (Earth = 1):</strong></td>
                                        <td><asp:Label ID="lblMass" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Rotation Period:</strong></td>
                                        <td><asp:Label ID="lblRotation" runat="server"></asp:Label> hours</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Number of Moons:</strong></td>
                                        <td><asp:Label ID="lblMoons" runat="server"></asp:Label></td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-md-6">
                                <h5>Orbital Characteristics</h5>
                                <table class="table table-borderless">
                                    <tr>
                                        <td><strong>Distance from Sun:</strong></td>
                                        <td><asp:Label ID="lblDistance" runat="server"></asp:Label> million km</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Orbital Period:</strong></td>
                                        <td><asp:Label ID="lblOrbital" runat="server"></asp:Label> Earth days</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="card mt-4">
            <div class="card-header">
                <h3>Interesting Facts</h3>
            </div>
            <div class="card-body">
                <asp:Label ID="lblFacts" runat="server"></asp:Label>
            </div>
        </div>

        <div class="text-center mt-4">
            <asp:HyperLink runat="server" NavigateUrl="~/SolarSystem.aspx" CssClass="btn btn-primary">
                ? Back to Solar System
            </asp:HyperLink>
        </div>
    </asp:Panel>

    <asp:Panel ID="pnlError" runat="server" Visible="false" CssClass="alert alert-danger">
        Planet not found. <asp:HyperLink runat="server" NavigateUrl="~/SolarSystem.aspx">Return to Solar System</asp:HyperLink>
    </asp:Panel>
</asp:Content>
