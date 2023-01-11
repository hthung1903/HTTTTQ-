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

namespace QuanLyDeTai.DaiDoi.AddResearch
{
    public partial class AddReseach : Form
    {
        public static string madd;
        public static string error = "1";

        private static string tt = "";
        private static string namhoc = "";
        private static string MaDT = "";
        public AddReseach(string Madd)
        {
           
            madd = Madd;
            InitializeComponent();
            getmaDT();
            MaDT = MADT.Text;
            MADT.Enabled = true;
           
        }
        private void getmaDT()
        {
            //string query = "Select MaDT from DeTai where TrangThai = N'Đã phê duyệt' or TrangThai = N'Chờ thực hiện'";
            string query = "exec daidoi_dangki";
            DataTable dt = ConnectDB.Connected.getData(query);
            foreach (DataRow dr in dt.Rows)
            {
                MADT.Items.Add(dr[0].ToString());
            }
        }

        private void MADT_SelectedIndexChanged(object sender, EventArgs e)
        {
            string query = " select * from Detai where MaDt = '"+ MADT.Text + "'";
            DataTable dt = ConnectDB.Connected.getData(query);           
            if (dt.Rows.Count > 0)
            {
                TenDT.Text = dt.Rows[0]["TenDT"].ToString().Trim();
                NBD.Text = dt.Rows[0]["NgayBD"].ToString().Trim();
                NGT.Text = dt.Rows[0]["NgayNT"].ToString().Trim();
                TT.Text = dt.Rows[0]["TrangThai"].ToString().Trim();
                NamHoc.Text = dt.Rows[0]["NamHoc"].ToString().Trim();
            }

            if(TT.Text == "Chờ thực hiện")
            {
                HV0.Enabled = false;
                gethvKTGDT();
            }
            else
            {
                MADT.Enabled = true;
                gethvCNDT();
                gethvKTGDT();

            }
            

        }
        private void gethvCNDT()
        {
            HV0.Items.Clear();
            string query = "DD_Lay_HvCTdt '" + madd + "', '"+ NamHoc.Text +"'";
            DataTable dt = ConnectDB.Connected.getData(query);
            foreach (DataRow dr in dt.Rows)
            {
                HV0.Items.Add(dr[0].ToString().Trim() + "-" + dr[1].ToString());
            }

        }
        private void gethvKTGDT()
        {            
            HV1.Items.Clear();
            HV2.Items.Clear();
            HV3.Items.Clear();
            HV4.Items.Clear();
            string query = "DD_Lay_HvTGdt '" + madd + "', '" + NamHoc.Text + "'";
            DataTable dt = ConnectDB.Connected.getData(query);
            foreach(DataRow dr in dt.Rows)
            {
                HV1.Items.Add(dr[0].ToString().Trim()+ "-" +dr[1].ToString());
                HV2.Items.Add(dr[0].ToString().Trim() + "-" + dr[1].ToString());
                HV3.Items.Add(dr[0].ToString().Trim() + "-" + dr[1].ToString());
                HV4.Items.Add(dr[0].ToString().Trim() + "-" + dr[1].ToString());
            }
        }
        
       
        private void btnHuy_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            
            if (TT.Text == "Chờ thực hiện")
            {
                string query = "Daidoi_them_HVTGdt'" + MADT.Text + "','" + SL.Text + "','" + HV1.Text.Split('-')[0] + "','" + HV2.Text.Split('-')[0] + "','" + HV3.Text.Split('-')[0] + "','" + HV4.Text.Split('-')[0] + "'";
                MessageBox.Show(ConnectDB.Connected.ChangeData(query, "Thêm"));
            }
            else
            {
                string query = "Daidoi_them_HVCTdt'" + MADT.Text + "','" + HV0.Text.Split('-')[0] + "'";
                MessageBox.Show(ConnectDB.Connected.ChangeData(query, "Thêm"));

                string query1 = "Daidoi_them_HVTGdt'" + MADT.Text + "','" + SL.Text + "','" + HV1.Text.Split('-')[0] + "','" + HV2.Text.Split('-')[0] + "','" + HV3.Text.Split('-')[0] + "','" + HV4.Text.Split('-')[0] + "'";
                MessageBox.Show(ConnectDB.Connected.ChangeData(query1, "Thêm"));

            }
            
                
            
        }

        private void SL_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(SL.Text == "1")
            {
                lalelHV1.Visible = true;
                HV1.Visible = true;
                labelHV2.Visible = false;
                labelHV3.Visible = false;
                HV2.Visible = false;
                HV3.Visible = false;
                labelHV4.Visible = false;
                HV4.Visible = false;
            }
            if(SL.Text == "2")
            {
                lalelHV1.Visible = true;
                HV1.Visible = true;
                labelHV2.Visible = true;
                labelHV3.Visible = false;
                HV2.Visible = true;
                HV3.Visible = false;
                labelHV4.Visible = false;
                HV4.Visible = false;
            }
            if(SL.Text == "3")
            {
                lalelHV1.Visible = true;
                HV1.Visible = true;
                labelHV2.Visible = true;
                labelHV3.Visible = true;
                HV2.Visible = true;
                HV3.Visible = true;
                labelHV4.Visible = false;
                HV4.Visible = false;
            }
            if (SL.Text == "4")
            {
                lalelHV1.Visible = true;
                HV1.Visible = true;
                labelHV2.Visible = true;
                labelHV3.Visible = true;
                HV2.Visible = true;
                HV3.Visible = true;
                labelHV4.Visible = true;
                HV4.Visible = true;
            }
        }

        private void GV1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    }
}
