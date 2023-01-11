using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDeTai.PKHCN.KTXP
{
    public partial class XuPhat : Form
    {
        public static string MaDT = "";
        public static string CapDo = "";
        public static string NoiDung = "";
        public XuPhat()
        {
            InitializeComponent();
            getBB();
            setup();
        }
        private void setup()
        {
            string query = "select distinct mucdo from xulyvipham";
            DataTable dt = ConnectDB.Connected.getData(query);
            foreach (DataRow dr in dt.Rows)
            {
                cmbLocMD.Items.Add(dr[0]);
            }
            cmbLocMD.Text = "Tất cả";
        }
        private void getBB()
        {
            string query = "PKHCN_GETDTViPham";
            DataTable dt = ConnectDB.Connected.getData(query);
            ListXP.DataSource = dt;
        }

        private void cmbLocBB_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbLocMD.SelectedItem.ToString() == "Tất cả")
            {
                getBB();
            }
            else
            {
                string query = "PKHCN_GETDTvipham_mucdo N'" + cmbLocMD.SelectedItem.ToString() + "'";
                cmbLocMD.DataSource = ConnectDB.Connected.getData(query);
            }
        }

        private void btnXem_Click(object sender, EventArgs e)
        {
            Form them = new ThemXuPhat();
            them.ShowDialog();
        }

        
        private void bunifuPanel1_Click_1(object sender, EventArgs e)
        {
            getBB();
            setup();
        }
    }
}
