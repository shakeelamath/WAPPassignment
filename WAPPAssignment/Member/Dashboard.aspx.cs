using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using WAPPAssignment.Helpers;

namespace WAPPAssignment.Member
{
    public partial class Dashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!AuthHelper.IsLoggedIn)
            {
                Response.Redirect("~/Account/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadDashboardData();
            }
        }

        private void LoadDashboardData()
        {
            lblUsername.Text = AuthHelper.CurrentUsername;
            
            LoadStatistics();
            LoadRecentQuizzes();
            LoadRecentPosts();
        }

        private void LoadStatistics()
        {
            try
            {
                using (SqlConnection conn = DatabaseHelper.GetConnection())
                {
                    conn.Open();

                    // Get user ID
                    int userId = GetUserId(conn);

                    // Quizzes taken
                    string quizQuery = "SELECT COUNT(*) FROM QuizAttempts WHERE UserID = @UserID";
                    SqlCommand cmd = new SqlCommand(quizQuery, conn);
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    lblQuizzesTaken.Text = cmd.ExecuteScalar().ToString();

                    // Average score
                    string avgQuery = "SELECT AVG(Percentage) FROM QuizAttempts WHERE UserID = @UserID";
                    cmd = new SqlCommand(avgQuery, conn);
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    object avgResult = cmd.ExecuteScalar();
                    lblAverageScore.Text = avgResult != DBNull.Value ? 
                        Convert.ToDecimal(avgResult).ToString("F0") : "0";

                    // Forum posts
                    string postQuery = "SELECT COUNT(*) FROM DiscussionPosts WHERE UserID = @UserID";
                    cmd = new SqlCommand(postQuery, conn);
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    lblDiscussions.Text = cmd.ExecuteScalar().ToString();

                    // Days active
                    string daysQuery = "SELECT DATEDIFF(day, DateRegistered, GETDATE()) FROM Users WHERE UserID = @UserID";
                    cmd = new SqlCommand(daysQuery, conn);
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    lblDaysActive.Text = cmd.ExecuteScalar().ToString();
                }
            }
            catch { }
        }

        private void LoadRecentQuizzes()
        {
            try
            {
                using (SqlConnection conn = DatabaseHelper.GetConnection())
                {
                    int userId = GetUserId(conn);

                    string query = @"SELECT TOP 5 q.Title, qa.Score, qa.TotalQuestions, qa.Percentage, qa.AttemptDate 
                                   FROM QuizAttempts qa 
                                   INNER JOIN Quizzes q ON qa.QuizID = q.QuizID 
                                   WHERE qa.UserID = @UserID 
                                   ORDER BY qa.AttemptDate DESC";
                    
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@UserID", userId);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvRecentQuizzes.DataSource = dt;
                    gvRecentQuizzes.DataBind();
                }
            }
            catch { }
        }

        private void LoadRecentPosts()
        {
            try
            {
                using (SqlConnection conn = DatabaseHelper.GetConnection())
                {
                    int userId = GetUserId(conn);

                    string query = @"SELECT TOP 5 dt.Title, dp.PostDate 
                                   FROM DiscussionPosts dp 
                                   INNER JOIN DiscussionTopics dt ON dp.TopicID = dt.TopicID 
                                   WHERE dp.UserID = @UserID 
                                   ORDER BY dp.PostDate DESC";
                    
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@UserID", userId);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvRecentPosts.DataSource = dt;
                    gvRecentPosts.DataBind();
                }
            }
            catch { }
        }

        private int GetUserId(SqlConnection conn)
        {
            string query = "SELECT UserID FROM Users WHERE Username = @Username";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Username", AuthHelper.CurrentUsername);
            
            if (conn.State != ConnectionState.Open)
                conn.Open();

            return (int)cmd.ExecuteScalar();
        }
    }
}
