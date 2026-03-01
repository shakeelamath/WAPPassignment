using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using WAPPAssignment.Helpers;

namespace WAPPAssignment
{
    public partial class SolarSystem : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPlanets();
            }
        }

        private void LoadPlanets()
        {
            try
            {
                using (SqlConnection conn = DatabaseHelper.GetConnection())
                {
                    string query = @"SELECT PlanetID, Name, Description, DistanceFromSun, 
                                   Diameter, Mass, OrbitalPeriod, RotationPeriod, Moons, ImageURL 
                                   FROM Planets 
                                   ORDER BY DistanceFromSun";
                    
                    SqlCommand cmd = new SqlCommand(query, conn);
                    conn.Open();

                    SqlDataReader reader = cmd.ExecuteReader();
                    rptPlanets.DataSource = reader;
                    rptPlanets.DataBind();
                }
            }
            catch (Exception ex)
            {
                // Log error or show message
                pnlPlanets.Controls.Add(new System.Web.UI.LiteralControl(
                    $"<div class='alert alert-danger'>Error loading planets: {ex.Message}</div>"));
            }
        }

        // Helper for resolving the planet image URL - falls back to a local static image if ImageURL is empty
        protected string ResolvePlanetImage(object imageUrlObj, object nameObj)
        {
            string imageUrl = imageUrlObj?.ToString();
            if (!string.IsNullOrEmpty(imageUrl))
                return ResolveUrl(imageUrl);

            string name = nameObj?.ToString() ?? "";
            // Try to find a local SVG by planet name under Content/planets (e.g., earth.svg)
            if (!string.IsNullOrEmpty(name))
            {
                string candidate = $"~/Content/planets/{name.ToLower()}.svg";
                string physical = Server.MapPath(candidate);
                if (System.IO.File.Exists(physical))
                    return ResolveUrl(candidate);
            }

            // Generic placeholder
            string placeholder = "~/Content/planets/placeholder-planet.jpg";
            if (System.IO.File.Exists(Server.MapPath(placeholder)))
                return ResolveUrl(placeholder);

            // Last fallback to a data URI simple circle (tiny inline SVG)
            string svg = "data:image/svg+xml;utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' width='200' height='200'%3E%3Crect width='100%25' height='100%25' fill='%230a0e27'/%3E%3Ccircle cx='100' cy='100' r='60' fill='%236b46c1'/%3E%3C/svg%3E";
            return svg;
        }
    }
}
