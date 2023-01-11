using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyDeTai.ConnectDB
{
    class Connected
    {
        private static string connectionString = ConfigurationManager.ConnectionStrings["Connect"].ConnectionString;
        public static DataTable getData(string query)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
         
            DataTable dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            return dt;
        }
        public static string ChangeData(string query,string actions)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
    
            try
            {
                cmd.ExecuteNonQuery();
                conn.Close();
                return ""+actions+" thành công";
                
            }
            catch (Exception ex)
            {
                return "Kết nối thất bại";
            }
            
        }
        public static DataSet GetDataSet(string query)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(query, conn);

            DataSet dt = new DataSet();
            da.Fill(dt);
            conn.Close();
            return dt;
        }
        
    }
}
