using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace QuanLyDeTai.User.AddResearch
{
    public partial class AddReseach : Form
    {
        public static string maGV;
        public static string error = "1";

        private static string MaKhoa = "";
        public AddReseach(string MaGV)
        {
           
            maGV = MaGV;
            InitializeComponent();
            string dt = get_nextMDT();
            MADT.Text = dt;
            getGVKTGDT();
            MADT.Enabled = false;
        }
        private string getMKhoa()
        {
            string query = "proc_gv_getMKhoa '" + maGV + "'";
            string result = ConnectDB.Connected.getData(query).Rows[0][0].ToString();
            return result;
        }
        private void getGVKTGDT()
        {
            GV1.Items.Clear();
            GV2.Items.Clear();
            string query = "proc_khoa_getGVKTGDT'"+ getMKhoa()+ "'";
            DataTable dt = ConnectDB.Connected.getData(query);
            foreach(DataRow dr in dt.Rows)
            {
                GV1.Items.Add(dr[0].ToString().Trim()+ "-" +dr[2].ToString());
                GV2.Items.Add(dr[0].ToString().Trim() + "-" + dr[2].ToString());

            }
        }
        private bool check_duplicate_magv()
        {
            if (maGV == GV1.Text || maGV == GV1.Text )
            {
                return true;
            }
            else if ( GV1.Text == GV2.Text  && GV1.Text != "" && GV2.Text != "" )
            {
                return true;
            }
            else
            {
                return false;
            }
        }
       
        
        private string get_nextMDT()
        {
            string query_get_next_mGV = "declare @nextMadt char(10) \n exec @nextMadt = TuTangMaDT \n select @nextMadt";
            string next_MADT = ConnectDB.Connected.getData(query_get_next_mGV).Rows[0][0].ToString();
            return next_MADT;
        }
      
      

        

        private void btnHuy_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            

                if (!check_duplicate_magv())
                {
                    string query = "GV_them_dt N'"+MADT.Text+"',N'"+Tendt.Text+"',N'"+NBD.Text+ "','" + NGT.Text + "',N'" + NamHoc.Text+"','"+SL.Text+"','"+maGV+"','"+GV1.Text.Split('-')[0]+ "','" + GV2.Text.Split('-')[0] + "'";
                    MessageBox.Show(ConnectDB.Connected.ChangeData(query, "Thêm"));
                }
                else
                {
                    MessageBox.Show("Có  viên trong đề tài trùng nhau");
                }
            
        }

        private void SL_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(SL.Text == "1")
            {
                lalelGV1.Visible = true;
                GV1.Visible = true;
                labelGV2.Visible = false;
                GV2.Visible = false;
            }
            if(SL.Text == "2")
            {
                lalelGV1.Visible = true;
                GV1.Visible = true;
                labelGV2.Visible = true;
                GV2.Visible = true;
                
            }
            
        }

        private void GV1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void GV2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void labelGV2_Click(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {

        }
    }
}
