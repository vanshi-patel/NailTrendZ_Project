using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProjectSem6
{
    public class AdminDesignsRepository
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["NailTrendZDB"].ConnectionString;

        public DataTable GetAllDesigns()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Designs ORDER BY DesignID ASC"; // Order by DesignID instead
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        return dt;
                    }
                }
            }
        }


        public void AddDesign(int price, string imageURL)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Designs (Price, ImageURL) VALUES (@Price, @ImageURL)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {

                    cmd.Parameters.AddWithValue("@Price", price);  // Price as an integer
                    cmd.Parameters.AddWithValue("@ImageURL", imageURL);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }



        public void UpdateDesign(int designID, decimal price, string imageURL)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "UPDATE Designs SET Price = @Price, ImageURL = @ImageURL WHERE DesignID = @DesignID";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@DesignID", designID);
                    cmd.Parameters.AddWithValue("@Price", price);
                    cmd.Parameters.AddWithValue("@ImageURL", imageURL);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }


        public void DeleteDesign(int designID)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Designs WHERE DesignID = @DesignID";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@DesignID", designID);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}