using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDeTai.TieuDoan.QLHV
{
    public partial class dsdt : Form
    {
        public static List<string> listdt = new List<string>();
        public dsdt(List<string> dsdetai)
        {

            listdt = dsdetai;
            InitializeComponent();
            if (listdt.Any())
            {
                getdataDT();
            }
            getdataDT();
            setup();
            getlistdt();
            
        }
        public void getdataDT()
        {
            txtMAHV.Text = listdt[0];
            txtName.Text = listdt[1];
            
        }
        public void setup()
        {
            txtMAHV.Enabled = false;
            txtName.Enabled = false;
        }
        public void getlistdt()
        {
            string query = "detaivavaitrohocvien '" + txtMAHV.Text +"'";
            DataTable dt = ConnectDB.Connected.getData(query);
            dgv_dsdt.DataSource = dt;

        }
        private void txtName_TextChanged(object sender, EventArgs e)
        {

        }

        private void bunifuPanel2_Click(object sender, EventArgs e)
        {

        }

        private void dsdt_Load(object sender, EventArgs e)
        {
            setup();
            getdataDT();
        }
    }
}
