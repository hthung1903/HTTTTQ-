using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDeTai.TieuDoan.ThongKe
{
    public partial class XuPhat : Form
    {
        public static string MaDT = "";
        public static string CapDo = "";
        public static string NoiDung = "";
        public XuPhat(string matd)
        {
            InitializeComponent();
            MaDT = matd;
            getBB();
            setup();
        }
        private void setup()
        {
            cmbLocMD.Items.Clear();
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
            string query = "TieuDoan_detaiXP '"+MaDT+"'";
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
                string query = "TieuDoan_detaiXP_capdo '"+MaDT+"',N'" + cmbLocMD.SelectedItem.ToString() + "'";
                cmbLocMD.DataSource = ConnectDB.Connected.getData(query);
            }
        }

        
        private void bunifuPanel1_Click_1(object sender, EventArgs e)
        {
            getBB();
            setup();
        }
    }
}
