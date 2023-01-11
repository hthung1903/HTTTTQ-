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
    public partial class DT : Form
    {
        public static string MaTD = "";
        public static List<string> ttdt = new List<string>();
        public DT(string maTieuDoan)
        {
            MaTD = maTieuDoan;
            InitializeComponent();
            getListDT();
            bunifuPanel4.Hide();
            
        }

        public void getListDT()
        {
            string query = "TieuDoan_detai '" + MaTD +"'";
            DataTable dt = ConnectDB.Connected.getData(query);
            ListDT.DataSource = dt;
        }
        private void DT_Load(object sender, EventArgs e)
        {

        }

        private void ListDT_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            bunifuPanel4.Show();
            int index = e.RowIndex;
            DataGridViewRow selectedRow = ListDT.Rows[index];
            string MADT = selectedRow.Cells["MADT"].Value.ToString();
            string TenDT = selectedRow.Cells["TenDT"].Value.ToString();
            string NgayBD = selectedRow.Cells["NgayBD"].Value.ToString();
            string NgayNT = selectedRow.Cells["NgayNT"].Value.ToString();
            string Kp = selectedRow.Cells["KinhPhi"].Value.ToString();
            string TienDo = selectedRow.Cells["TienDo"].Value.ToString();
            string TrangThai = selectedRow.Cells["TrangThai"].Value.ToString();
            string NH = selectedRow.Cells["NamHoc"].Value.ToString();
            string[] dataDT = { MADT, TenDT, NgayBD, NgayNT, Kp, TienDo, TrangThai, NH };
            ttdt.Clear();
            ttdt.AddRange(dataDT);
        }

        private void cmbTrangThai_SelectedIndexChanged(object sender, EventArgs e)
        {
            string query = "";
            query = "TieuDoan_lay_dtdt_tt'" + MaTD + "', N'" + cmbTrangThai.Text.Trim() + "'";
            DataTable dt = ConnectDB.Connected.getData(query);
            ListDT.DataSource = dt;
        }

        private void btnLoc_Click(object sender, EventArgs e)
        {
            string query2 = "select distinct(TrangThai) from DeTai ";
            DataTable dt2 = ConnectDB.Connected.getData(query2);
            foreach (DataRow dr in dt2.Rows)
            {
                cmbTrangThai.Items.Add(dr[0].ToString());
            }
            panelLoc.Visible = true;
        }

        private void btntimkiem_Click(object sender, EventArgs e)
        {
            string query = "TieuDoan_tk_dt '"+MaTD+"',N'"+tb_tk.Text+"'";
            DataTable dt = ConnectDB.Connected.getData(query);
            ListDT.DataSource = dt;
        }

        private void tb_tk_TextChanged(object sender, EventArgs e)
        {
            string query = "TieuDoan_tk_dt '" + MaTD + "',N'" + tb_tk.Text + "'";
            DataTable dt = ConnectDB.Connected.getData(query);
            ListDT.DataSource = dt;
        }

        private void bunifuPanel1_Click(object sender, EventArgs e)
        {

        }

        private void btnXuatExcel_Click(object sender, EventArgs e)
        {
            ListDT.SelectAll();
            DataObject copydata = ListDT.GetClipboardContent();
            if (copydata != null) Clipboard.SetDataObject(copydata);
            Microsoft.Office.Interop.Excel.Application xlapp = new Microsoft.Office.Interop.Excel.Application();
            xlapp.Visible = true;
            Microsoft.Office.Interop.Excel.Workbook xlWbook;
            Microsoft.Office.Interop.Excel.Worksheet xlsheet;
            object misedata = System.Reflection.Missing.Value;
            xlWbook = xlapp.Workbooks.Add(misedata);
            xlsheet = (Microsoft.Office.Interop.Excel.Worksheet)xlWbook.Worksheets.get_Item(1);
            Microsoft.Office.Interop.Excel.Range xlr = (Microsoft.Office.Interop.Excel.Range)xlsheet.Cells[1, 1];
            xlr.Select();
            xlsheet.PasteSpecial(xlr, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, true);
        }

        private void bunifuPanel3_Click(object sender, EventArgs e)
        {

        }

        private void bunifuButton1_Click(object sender, EventArgs e)
        {
            Form dsdt = new QLDT.hvdt(ttdt);
            dsdt.ShowDialog();
            
        }

        private void bunifuPanel4_Click(object sender, EventArgs e)
        {

        }

        private void ListDT_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                bunifuPanel4.Show();
                int index = e.RowIndex;
                DataGridViewRow selectedRow = ListDT.Rows[index];
                string MADT = selectedRow.Cells["MADT"].Value.ToString();
                string TenDT = selectedRow.Cells["TenDT"].Value.ToString();
                string NgayBD = selectedRow.Cells["NgayBD"].Value.ToString();
                string NgayNT = selectedRow.Cells["NgayNT"].Value.ToString();
                string Kp = selectedRow.Cells["KinhPhi"].Value.ToString();
                // string TenBM = selectedRow.Cells["TenBM"].Value.ToString();
                string TienDo = selectedRow.Cells["TienDo"].Value.ToString();
                string TrangThai = selectedRow.Cells["TrangThai"].Value.ToString();
                string NH = selectedRow.Cells["NamHoc"].Value.ToString();
                string[] dataDT = { MADT, TenDT, NgayBD, NgayNT,Kp,TienDo, TrangThai, NH };
                ttdt.Clear();
                ttdt.AddRange(dataDT);
            }
            catch
            {

            }
            
        }
    }
}
