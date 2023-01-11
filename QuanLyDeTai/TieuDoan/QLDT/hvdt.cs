using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDeTai.TieuDoan.QLDT
{
    public partial class hvdt : Form
    {
        public static List<string> tthvdt = new List<string>();
        public hvdt(List<string> inforhvdt)
        {
            tthvdt = inforhvdt;
            InitializeComponent();
            if (tthvdt.Any())
            {
                getdatahv();
            }
            setdatahv();
            getlisthvdt();

        }
        public void getdatahv()
        {
            txtMADT.Text = tthvdt[0];
            txtTenDT.Text = tthvdt[1];
        }
        public void setdatahv()
        {
            txtMADT.Enabled = false;
            txtTenDT.Enabled = false;
        }
        public void getlisthvdt()
        {
            string query = "vaitrohvThamgiadt '" + txtMADT.Text+"' ";
            DataTable dt = ConnectDB.Connected.getData(query);
            dhv_hvdt.DataSource = dt;
        }

        private void dhv_hvdt_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
