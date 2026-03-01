using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using WAPPAssignment.Helpers;

namespace WAPPAssignment.Member
{
    public partial class Quizzes : Page
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
                LoadQuizzes();
                LoadQuizHistory();
            }
        }

        private void LoadQuizzes()
        {
            try
            {
                using (SqlConnection conn = DatabaseHelper.GetConnection())
                {
                    string query = @"SELECT QuizID, Title, Description, Category, DifficultyLevel, 
                                   TimeLimit, PassingScore 
                                   FROM Quizzes 
                                   WHERE IsActive = 1 
                                   ORDER BY Title";
                    
                    SqlCommand cmd = new SqlCommand(query, conn);
                    conn.Open();

                    SqlDataReader reader = cmd.ExecuteReader();
                    rptQuizzes.DataSource = reader;
                    rptQuizzes.DataBind();
                }
            }
            catch { }
        }

        private void LoadQuizHistory()
        {
            try
            {
                using (SqlConnection conn = DatabaseHelper.GetConnection())
                {
                    int userId = GetUserId(conn);

                    string query = @"SELECT q.Title, qa.Score, qa.TotalQuestions, qa.Percentage, 
                                   q.PassingScore, qa.AttemptDate 
                                   FROM QuizAttempts qa 
                                   INNER JOIN Quizzes q ON qa.QuizID = q.QuizID 
                                   WHERE qa.UserID = @UserID 
                                   ORDER BY qa.AttemptDate DESC";
                    
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@UserID", userId);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvQuizHistory.DataSource = dt;
                    gvQuizHistory.DataBind();
                }
            }
            catch { }
        }

        protected string GetDifficultyClass(string difficulty)
        {
            switch (difficulty?.ToLower())
            {
                case "easy":
                    return "badge bg-success";
                case "medium":
                    return "badge bg-warning";
                case "hard":
                    return "badge bg-danger";
                default:
                    return "badge bg-secondary";
            }
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
