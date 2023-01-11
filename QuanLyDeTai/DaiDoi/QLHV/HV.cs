using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDeTai.DaiDoi.QLHV
{
    public partial class HV : Form
    {
        public HV(string madd)
        {
            Madd = madd;
            InitializeComponent();
            getlisthv();
            pa_suaxoa.Hide();
        }
        public static List<string> tthv = new List<string>();
        public static string luachon = "";
        public static string Madd = "";

        public void getlisthv()
        {
            string query = "Daidoi_layHV'" + Madd +"'";
            DataTable dt = ConnectDB.Connected.getData(query);
            listhv.DataSource = dt;

        }

       

        private void bt_sua_Click(object sender, EventArgs e)
        {
            luachon = "sửa";
            Form infor = new QLHV.infor(tthv,luachon);
            infor.ShowDialog();
            getlisthv();

        }

        private void bt_them_Click(object sender, EventArgs e)
        {
            luachon = "thêm";
            Form infor = new QLHV.infor(tthv, luachon);
            infor.ShowDialog();
            getlisthv();
        }

        private void bt_xoa_Click(object sender, EventArgs e)
        {
            string query = "Daidoi_xoaGV'" + tthv[0] +"'";
            DialogResult dr = MessageBox.Show("Delete " + tthv[1].Trim() + "", "Are you sure for", MessageBoxButtons.YesNo);
            if (dr == DialogResult.Yes)
            {
                MessageBox.Show(ConnectDB.Connected.ChangeData(query, "xóa"));

            }
            else
            {

            }

            getlisthv();
        }

        private void bunifuPanel4_Click(object sender, EventArgs e)
        {

        }

        private void pa_suaxoa_Click(object sender, EventArgs e)
        {

        }

        private void bt_timkiem_Click(object sender, EventArgs e)

        {
            
            string query = "select * from HocVien where MaDD = '" + Madd + "' and (TenHV like N'%"+tb_tk.Text.Trim()+ "%' or MaHV like N'%" + tb_tk.Text.Trim() + "%' )";
            DataTable dt = ConnectDB.Connected.getData(query);
            listhv.DataSource = dt;
        }

        private void bt_detai_Click(object sender, EventArgs e)
        {
            
            Form dsdt = new QLHV.dsdt(tthv);
            dsdt.ShowDialog();
         

        }

        private void btnXuatExcel_Click(object sender, EventArgs e)
        {
            listhv.SelectAll();
            DataObject copydata = listhv.GetClipboardContent();
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
                DataGridViewRow dataGridViewRow = listhv.Rows[index];
                string MAGV = dataGridViewRow.Cells["Mã Học viên"].Value.ToString();
                string TenGV = dataGridViewRow.Cells["Tên Học viên"].Value.ToString();
                string CapBac = dataGridViewRow.Cells["Cấp Bậc"].Value.ToString();
                string Namsinh  = dataGridViewRow.Cells["Năm sinh"].Value.ToString();
                string Gioitinh = dataGridViewRow.Cells["Giới tính"].Value.ToString();
                string Madd = dataGridViewRow.Cells["Mã Đại đội"].Value.ToString();
                string[] dataHV = { MAGV, TenGV, CapBac, Namsinh, Gioitinh, Madd };
                tthv.Clear();
                tthv.AddRange(dataHV);
            }
            catch { }

        }
    }
}
