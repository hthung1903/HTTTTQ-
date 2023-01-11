using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Diagnostics;

namespace QuanLyDeTai.PKHCN.KTXP
{
    public partial class KHENTHUONG : Form
    {
        public static string MaDT = "";
        public static string CapDo = "";
        public static string NoiDung = "";
        public KHENTHUONG()
        {
            InitializeComponent();
            getBB();
            setup();
        }
        private void setup()
        {
            cmbLocCDKT.Items.Clear();
            string query = "select distinct capdo from khenthuong";
            DataTable dt= ConnectDB.Connected.getData(query);
            foreach (DataRow dr in dt.Rows)
            {
                cmbLocCDKT.Items.Add(dr[0]);
            }
            cmbLocCDKT.Text = "Tất cả";
        }
        private void getBB()
        {
            string query = "PKHCN_GETDTKHENTHUONG";
            DataTable dt = ConnectDB.Connected.getData(query);
            ListKT.DataSource = dt;
        }

        private void cmbLocBB_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbLocCDKT.SelectedItem.ToString() == "Tất cả")
            {
                getBB();
            }else
            {
                string query = "PKHCN_GETDTKHENTHUONG_capdo N'" + cmbLocCDKT.SelectedItem.ToString()+"'";
                ListKT.DataSource = ConnectDB.Connected.getData(query);
            }
        }

        private void btnXem_Click(object sender, EventArgs e)
        {
            Form them = new ThemKhenThuong();
            them.ShowDialog();
        }

        private void ListBB_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                int index = e.RowIndex;
                DataGridViewRow selectedRow = ListKT.Rows[index];
                CapDo = selectedRow.Cells["Cấp độ khen thưởng"].Value.ToString();
                NoiDung = selectedRow.Cells["Nội dung khen thưởng"].Value.ToString();
                bunifuTransition1.ShowSync(footerpanel);                        
            }
            catch
            {

            }

        }


        private void bunifuPanel1_Click(object sender, EventArgs e)
        {
            getBB();
            setup();
        }
    }
}
