using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using WAPPAssignment.Helpers;

namespace WAPPAssignment.Admin
{
    public partial class Dashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!AuthHelper.IsAdmin)
            {
                Response.Redirect("~/Default.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadDashboardData();
            }
        }

        private void LoadDashboardData()
        {
            LoadStatistics();
            LoadRecentUsers();
            LoadQuizActivity();
        }

        private void LoadStatistics()
        {
            try
            {
                using (SqlConnection conn = DatabaseHelper.GetConnection())
                {
                    conn.Open();

                    // Total users
                    string userQuery = "SELECT COUNT(*) FROM Users WHERE Role != 'Admin'";
                    SqlCommand cmd = new SqlCommand(userQuery, conn);
                    lblTotalUsers.Text = cmd.ExecuteScalar().ToString();

                    // Total quizzes
                    string quizQuery = "SELECT COUNT(*) FROM Quizzes";
                    cmd = new SqlCommand(quizQuery, conn);
                    lblTotalQuizzes.Text = cmd.ExecuteScalar().ToString();

                    // Total planets
                    string planetQuery = "SELECT COUNT(*) FROM Planets";
                    cmd = new SqlCommand(planetQuery, conn);
                    lblTotalPlanets.Text = cmd.ExecuteScalar().ToString();

                    // Total topics
                    string topicQuery = "SELECT COUNT(*) FROM DiscussionTopics";
                    cmd = new SqlCommand(topicQuery, conn);
                    lblTotalTopics.Text = cmd.ExecuteScalar().ToString();
                }
            }
            catch { }
        }

        private void LoadRecentUsers()
        {
            try
            {
                using (SqlConnection conn = DatabaseHelper.GetConnection())
                {
                    string query = @"SELECT TOP 5 Username, FullName, Email, DateRegistered 
                                   FROM Users 
                                   WHERE Role != 'Admin' 
                                   ORDER BY DateRegistered DESC";
                    
                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvRecentUsers.DataSource = dt;
                    gvRecentUsers.DataBind();
                }
            }
            catch { }
        }

        private void LoadQuizActivity()
        {
            try
            {
                using (SqlConnection conn = DatabaseHelper.GetConnection())
                {
                    string query = @"SELECT q.Title, 
                                   COUNT(qa.AttemptID) AS AttemptCount,
                                   AVG(qa.Percentage) AS AvgScore
                                   FROM Quizzes q
                                   LEFT JOIN QuizAttempts qa ON q.QuizID = qa.QuizID
                                   GROUP BY q.QuizID, q.Title
                                   ORDER BY AttemptCount DESC";
                    
                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvQuizActivity.DataSource = dt;
                    gvQuizActivity.DataBind();
                }
            }
            catch { }
        }
    }
}
