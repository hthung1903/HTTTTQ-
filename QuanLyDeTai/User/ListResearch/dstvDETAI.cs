using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDeTai.User.ListResearch
{
    public partial class dstvDETAI : Form
    {
        public string mdt;
        public string tedt;
        public dstvDETAI(string madt, string tendt)
        {
            this.mdt = madt;
            this.tedt = tendt;
            InitializeComponent();
            Get_dstvDT();
            tenDT.Text = "Tên đề tài: " + tendt;
            MaDT.Text = "Mã đề tài: " + madt;
            setup();
        }
        public void setup()
        {
            DataGridView_dstvdt.Enabled = false;
            guna2DataGridView1.Enabled = false;
        }
        private void DataGridView_dstvdt_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
        private void Get_dstvDT()
        {
            string query1 = "GV_DsTVDT_GV'" + mdt + "'";
            DataTable dt1 = ConnectDB.Connected.getData(query1);
            DataGridView_dstvdt.DataSource = dt1;
            string query2 = "GV_DsTVDT_HV'" + mdt + "'";
            DataTable dt2 = ConnectDB.Connected.getData(query2);
            guna2DataGridView1.DataSource = dt2;



        }   

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
