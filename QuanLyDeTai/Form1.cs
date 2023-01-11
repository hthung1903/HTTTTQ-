using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDeTai
{
    public partial class Form1 : Form
    {
        private static string connectionString = ConfigurationManager.ConnectionStrings["Connect"].ConnectionString;
        public Form1()
        {
            InitializeComponent();
            GetGV();
        }
        private void GetGV()
        {
            string query = "Select * from GV";
            dataGridView1.DataSource = ConnectDB.Connected.getData(query);
        }
        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void guna2Button1_Click(object sender, EventArgs e)
        {
            string query = "prd_khoa_DSchunhiemDT 'K01'";
            DataTable dt = ConnectDB.Connected.getData(query);
            Form t = new Form2(dt);
            t.ShowDialog();
        }
    }
}
