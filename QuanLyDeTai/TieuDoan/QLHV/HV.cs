using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDeTai.TieuDoan
{
    public partial class HV : Form
    {
        public static List<string> ttHV = new List<string>();
        public static string luachon = "";
        public static string MaTD = "";

        public HV(string MaTd)
        {
            
            InitializeComponent();
            MaTD = MaTd;
            getlistHV();
            getlistD();
            pa_suaxoa.Hide();
        }
        
        public void getlistHV()
        {
            string query = "TieuDoan_GetHocVien '" + MaTD +"'";
            DataTable dt = ConnectDB.Connected.getData(query);
            listhv.DataSource = dt;
        }
        public void getlistD()
        {
            string query = "select distinct madd from daidoi where matd = '" + MaTD + "'";
            DataTable dt = ConnectDB.Connected.getData(query);
            foreach (DataRow dr in dt.Rows)
            {
                selectMaDD.Items.Add(dr[0]);
            }
            selectMaDD.Text = "Tất cả";
        }


        private void bunifuPanel4_Click(object sender, EventArgs e)
        {

        }



        private void bt_timkiem_Click(object sender, EventArgs e)
        {   
            string query = "TieuDoan_GetHocVien_ten '" + MaTD + "' ,N '"+tb_tk.Text+"'";
            DataTable dt = ConnectDB.Connected.getData(query);
            listhv.DataSource = dt;
        }

        private void bt_detai_Click(object sender, EventArgs e)
        {   
            Form dsdt = new QLHV.dsdt(ttHV);
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

        private void listHV_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try {
                pa_suaxoa.Show();
                int index = e.RowIndex;
                DataGridViewRow dataGridViewRow = listhv.Rows[index];
                string MAHV = dataGridViewRow.Cells["MaHV"].Value.ToString();
                string TenHV = dataGridViewRow.Cells["TenHV"].Value.ToString();
                string NS = dataGridViewRow.Cells["NamSinh"].Value.ToString().Split()[0];
                string GioiTinh = dataGridViewRow.Cells["GioiTinh"].Value.ToString();
                string CapBac = dataGridViewRow.Cells["CapBac"].Value.ToString();
                string MaTD = dataGridViewRow.Cells["MaDD"].Value.ToString();
                string[] dataHV = { MAHV, TenHV, CapBac, NS, GioiTinh,  MaTD };
                ttHV.Clear();
                ttHV.AddRange(dataHV);
            }
            catch { }
        }

        private void selectMaDD_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(selectMaDD.Text=="Tất cả")
            {
                getlistHV();
            }
            else
            {
                string query = "select * from hocvien where madd='" + selectMaDD.Text + "'";
                DataTable dt = ConnectDB.Connected.getData(query);
                listhv.DataSource = dt;
            }
        }

        private void tb_tk_TextChange(object sender, EventArgs e)
        {
            string query = "TieuDoan_GetHocVien_ten '"+MaTD+"' ,N'"+tb_tk.Text+"'";
            DataTable dt = ConnectDB.Connected.getData(query);
            listhv.DataSource = dt;
        }
    }
}
