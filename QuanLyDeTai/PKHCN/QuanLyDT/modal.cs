using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDeTai.PKHCN.QuanLyDT
{
    public partial class modal : Form
    {
        public static string MaDT;
        public static string State;
        public modal(string MADT,string state)
        {
            State = state;
            InitializeComponent();
            MaDT = MADT;
            getTT();
            MDT.Enabled = false;
            if (state == "Edit")
            {
                getDataInfo();
                MDT.Enabled = false;
                KinhPhi.Enabled = false;
                TienDo.Enabled = false;
                if(TT.Text=="Đã Hoàn Thành")
                {
                    TenDT.Enabled = false;
                    TT.Enabled = false;
                    NgayBD.Enabled = false;
                    NgayNT.Enabled = false;
                    NamHoc.Enabled = false;
                }
            }

        }
        private void getTT()
        {
            TT.Items.Clear();
            string query = "PKHQS_GET_TRANGTHAI";
            DataTable dt = ConnectDB.Connected.getData(query);
            foreach (DataRow dr in dt.Rows)
            {
                TT.Items.Add(dr[0]);
            }
        }
        private void getDataInfo()
        {
            string query = "PKHQS_SHOWDETAI_TIMKIEM_Ma '" + MaDT+"'";
            DataTable dt = ConnectDB.Connected.getData(query);
            MDT.Text = dt.Rows[0][0].ToString().Trim();
            TenDT.Text = dt.Rows[0][1].ToString().Trim();
            KinhPhi.Text=dt.Rows[0][4].ToString().Trim();
            NgayBD.Text = dt.Rows[0][2].ToString().Trim().Split(' ')[0];
            NgayNT.Text=dt.Rows[0][3].ToString().Trim().Split(' ')[0];
            TT.Text = dt.Rows[0][6].ToString().Trim();
            TienDo.Text = dt.Rows[0][5].ToString().Trim();
            NamHoc.Text = dt.Rows[0][7].ToString().Trim();
        }
        private void HT_Click(object sender, EventArgs e)
        {
            string query = "";
            if(State == "Edit")
            {
                query = "PKHQS_SUADT '" + MDT.Text + "',N'" + TenDT.Text + "',N'" + NgayBD.Text + "','" + NgayNT.Text + "',N'" + KinhPhi.Text + "','" + TienDo.Text + "',N'" + TT.Text + "',N'" + NamHoc.Text + "'";
                MessageBox.Show(ConnectDB.Connected.ChangeData(query, "Sửa"));
                this.Close();
            }
            
        }

        private void TienDo_TextChanged(object sender, EventArgs e)
        {

        }

        private void bunifuButton2_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void TT_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (TT.Text == "Đang thực hiện")
            {
                TienDo.Text = "0";
                KinhPhi.Text = "0";
            }
            else if (TT.Text == "Đã hoàn thành")
            {
                TienDo.Text = "100";
            }
            else
            {
                TienDo.Text = "";
                KinhPhi.Text = "";
            }
        }
    }
}
