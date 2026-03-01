using System;
using System.Configuration;
using System.Data.SqlClient;

namespace WAPPAssignment.Helpers
{
    public class DatabaseHelper
    {
        public static string ConnectionString
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["CosmoQuestDB"].ConnectionString;
            }
        }

        public static SqlConnection GetConnection()
        {
            return new SqlConnection(ConnectionString);
        }
    }
}
