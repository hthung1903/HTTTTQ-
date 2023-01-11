using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDeTai.BoMon
{
    public partial class GV : Form
    {
        public GV(string mabm)
        {
            MaBM = mabm;
            InitializeComponent();
            getlistgv();
            pa_suaxoa.Hide();
        }
        public static List<string> ttgv = new List<string>();
        public static string luachon = "";
        public static string MaBM = "";

        public void getlistgv()
        {
            string query = "bommon_layGV '" + MaBM +"'";
            DataTable dt = ConnectDB.Connected.getData(query);
            listgv.DataSource = dt;

        }

       

        private void bt_sua_Click(object sender, EventArgs e)
        {
            luachon = "sửa";
            Form infor = new QLGV.infor(ttgv,luachon);
            infor.ShowDialog();
            getlistgv();

        }

        private void bt_them_Click(object sender, EventArgs e)
        {
            luachon = "thêm";
            Form infor = new QLGV.infor(ttgv, luachon);
            infor.ShowDialog();
            getlistgv();
        }

        private void bt_xoa_Click(object sender, EventArgs e)
        {
            string query = " bommon_xoaGV'" + ttgv[0] +"'";
            DialogResult dr = MessageBox.Show("Delete " + ttgv[1].Trim() + "", "Are you sure for", MessageBoxButtons.YesNo);
            if (dr == DialogResult.Yes)
            {
                MessageBox.Show(ConnectDB.Connected.ChangeData(query, "xóa"));

            }
            else
            {

            }

            getlistgv();
        }

        private void bunifuPanel4_Click(object sender, EventArgs e)
        {

        }

        private void pa_suaxoa_Click(object sender, EventArgs e)
        {

        }

        private void bt_timkiem_Click(object sender, EventArgs e)

        {
            
            string query = "select * from GiangVien where MaBM = '" + MaBM + "' and (TenGV like N'%"+tb_tk.Text.Trim()+ "%' or MaGV like N'%" + tb_tk.Text.Trim() + "%' )";
            DataTable dt = ConnectDB.Connected.getData(query);
            listgv.DataSource = dt;
        }

        private void bt_detai_Click(object sender, EventArgs e)
        {
            
            Form dsdt = new QLGV.dsdt(ttgv);
            dsdt.ShowDialog();
         

        }

        private void btnXuatExcel_Click(object sender, EventArgs e)
        {
            listgv.SelectAll();
            DataObject copydata = listgv.GetClipboardContent();
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

        private void listgv_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try {
                pa_suaxoa.Show();
                int index = e.RowIndex;
                DataGridViewRow dataGridViewRow = listgv.Rows[index];
                string MAGV = dataGridViewRow.Cells["Mã giảng viên"].Value.ToString();
                string TenGV = dataGridViewRow.Cells["Tên giảng viên"].Value.ToString();
                string CapBac = dataGridViewRow.Cells["Cấp Bậc"].Value.ToString();
                string ChucVu = dataGridViewRow.Cells["Chức vụ"].Value.ToString();
                string MABM = dataGridViewRow.Cells["Mã bộ môn"].Value.ToString();
                string[] dataGV = { MAGV, TenGV, CapBac, ChucVu, MABM };
                ttgv.Clear();
                ttgv.AddRange(dataGV);
            }
            catch { }

        }
    }
}
