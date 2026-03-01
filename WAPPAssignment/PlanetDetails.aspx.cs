using System;
using System.Data.SqlClient;
using System.Web.UI;
using WAPPAssignment.Helpers;

namespace WAPPAssignment
{
    public partial class PlanetDetails : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string planetId = Request.QueryString["id"];
                if (!string.IsNullOrEmpty(planetId))
                {
                    LoadPlanetDetails(planetId);
                }
                else
                {
                    ShowError();
                }
            }
        }

        private void LoadPlanetDetails(string planetId)
        {
            try
            {
                using (SqlConnection conn = DatabaseHelper.GetConnection())
                {
                    string query = @"SELECT Name, Description, DistanceFromSun, Diameter, Mass, 
                                   OrbitalPeriod, RotationPeriod, Moons, InterestingFacts 
                                   FROM Planets 
                                   WHERE PlanetID = @PlanetID";
                    
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@PlanetID", planetId);

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        lblName.Text = reader["Name"].ToString();
                        Page.Title = reader["Name"].ToString();
                        lblDescription.Text = reader["Description"].ToString();
                        lblDistance.Text = reader["DistanceFromSun"].ToString();
                        lblDiameter.Text = reader["Diameter"].ToString();
                        lblMass.Text = reader["Mass"].ToString();
                        lblOrbital.Text = reader["OrbitalPeriod"].ToString();
                        lblRotation.Text = reader["RotationPeriod"].ToString();
                        lblMoons.Text = reader["Moons"].ToString();
                        lblFacts.Text = reader["InterestingFacts"].ToString();

                        pnlDetails.Visible = true;
                        pnlError.Visible = false;
                    }
                    else
                    {
                        ShowError();
                    }
                }
            }
            catch (Exception ex)
            {
                ShowError();
            }
        }

        private void ShowError()
        {
            pnlDetails.Visible = false;
            pnlError.Visible = true;
        }
    }
}
