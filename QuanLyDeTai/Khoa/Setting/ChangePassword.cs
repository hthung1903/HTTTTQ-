using System;
using System.Collections.Generic;
using System.Configuration;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDeTai.Khoa.Setting
{
    public partial class ChangePassword : Form
    {
        private static string ma;
        private static string connectionString = ConfigurationManager.ConnectionStrings["Connect"].ConnectionString;
        public ChangePassword(string Ma)
        {
            ma = Ma;
            InitializeComponent();
        }

        private bool CheckPassword()
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            string query = "select Passwords from Users where MaUser ='"+ma+"'";
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            string pass = dt.Rows[0][0].ToString().Trim();
            conn.Close();
            if (mkc.Text.ToString().Trim() == pass)
            {
                return true;
            }
            return false;
       
        }
        private bool ConfirmPassword(string a,string b)
        {
            if(a== b)
            {
                return true;
            }
            return false;
        }
        private void Change_Click(object sender, EventArgs e)
        {
            if (CheckPassword())
            {
                if (ConfirmPassword(mkm.Text.Trim(), nmkm.Text.Trim()))
                {
                    SqlConnection conn = new SqlConnection(connectionString);
                    conn.Open();

                    string query = "update USERS set Passwords ='" + mkm.Text.Trim() + "' where MaUSER = '"+ma+"'";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    MessageBox.Show("Thay đổi mật khẩu thành công");
                }
                else
                {
                    MessageBox.Show("Nhap lai mk moi");
                }
            }
            else
            {
                MessageBox.Show("Nhap lai mk cu");
            }
        }

        private void mkc_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
