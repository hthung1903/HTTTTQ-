using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using Microsoft.Reporting.WinForms;


namespace QuanLyDeTai.Khoa.QLDT
{
    public partial class QuanLyDeTai : Form
    {
        public static string MaKhoa = "";
        public static List<string> inforDT = new List<string>();
        public static string state = "";
        public QuanLyDeTai(string makhoa)
        {
            MaKhoa = makhoa;
            InitializeComponent();
            getListDT();
        }

        
        public void getListDT()
        {
            string query = "PKHQS_SHOWDETAI_KHOA '"+MaKhoa+"'";
            DataTable dt = ConnectDB.Connected.getData(query);
            ListDT.DataSource = dt;  
        }

        private void btnLoc_Click(object sender, EventArgs e)
        {
            panelLoc.Visible = true;
            cmbBOMON.Items.Clear();
            cmbTrangThai.Items.Clear();
            string query2 = "KHOA_GETMABOMON '"+MaKhoa+"'";
            DataTable dt2 = ConnectDB.Connected.getData(query2);
            foreach (DataRow dr in dt2.Rows)
            {
                cmbBOMON.Items.Add(dr[0].ToString());
            }
            string query3 = "PKHQS_GET_TRANGTHAI";
            DataTable dt3 = ConnectDB.Connected.getData(query3);
            foreach (DataRow dr in dt3.Rows)
            {
                cmbTrangThai.Items.Add(dr[0].ToString());
            }
            
        }
        private void btnSuaDT_Click(object sender, EventArgs e)
        {
            state = "update";
            getListDT();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                if (check_tgianDKDT())
                {
                    state = "add";
                    string query_get_next_mGV = "declare @nextMadt nvarchar(10) \n exec @nextMadt = TuTangMaDT \n select @nextMadt";
                    string next_MADT = ConnectDB.Connected.getData(query_get_next_mGV).Rows[0][0].ToString();
                    List<string> empty = new List<string>() { next_MADT, "", "", "", "", "", "", "", "", "", "" };
                    getListDT();
                }
                else
                {
                    MessageBox.Show("Hiện tại đã hết thời gian đăng ký đề tài");
                }
            }
            catch
            {
                MessageBox.Show("Có lỗi xảy ra");
            }
            
        }

     
        private void btnApDung_Click(object sender, EventArgs e)
        {
            string query = "";
            
            if (cmbBOMON.Text == "" && cmbTrangThai.Text == "")
            {
                query = "PKHQS_SHOWDETAI_KHOA'" + MaKhoa+"'";

            }
            else if (cmbBOMON.Text == "" && cmbTrangThai.Text != "")
            {
                query = "PKHQS_SHOWDETAI_KHOA_TRANGTHAI '" + MaKhoa+"', N'"+cmbTrangThai.Text+"'";
            }
            else if (cmbBOMON.Text != "" && cmbTrangThai.Text != "")
            {
                query = "KHOA_SHOWDETAI_BOMON_TRANGTHAI '" + cmbBOMON.Text + "', N'"+cmbTrangThai.Text+"'";
            }
            else if (cmbBOMON.Text != "" && cmbTrangThai.Text == "")
            {
                query = "KHOA_SHOWDETAI_BoMon '"+cmbBOMON.Text+"'";
            }
            DataTable dt = ConnectDB.Connected.getData(query);
            ListDT.DataSource = dt;
            panelLoc.Visible = false;
            cmbBOMON.Text = "";
            cmbTrangThai.Text = "";
        }
        private void btnclose_Click(object sender, EventArgs e)
        {
            panelLoc.Visible = false;
        }

        private void txtsearchTopic_TextChanged(object sender, EventArgs e)
        {
            string query = "";
            if (cmbBOMON.Text == "" && cmbTrangThai.Text == "")
            {
                query = "PKHQS_SHOWDETAI_KHOA'" + MaKhoa + "'";

            }
            else if (cmbBOMON.Text == "" && cmbTrangThai.Text != "")
            {
                query = "PKHQS_SHOWDETAI_KHOA_TRANGTHAI '" + MaKhoa + "', N'" + cmbTrangThai.Text + "'";
            }
            else if (cmbBOMON.Text != "" && cmbTrangThai.Text != "")
            {
                query = "KHOA_SHOWDETAI_BOMON_TRANGTHAI '" + cmbBOMON.Text + "', N'" + cmbTrangThai.Text + "'";
            }
            else if (cmbBOMON.Text != "" && cmbTrangThai.Text == "")
            {
                query = "KHOA_SHOWDETAI_BoMon '" + cmbBOMON.Text + "'";
            }
            try
            {
                DataTable dt = ConnectDB.Connected.getData(query);
                ListDT.DataSource = dt;
                var re = from row in dt.AsEnumerable()
                         where row[1].ToString().ToLower().Contains(txtsearchTopic.Text.ToLower())
                         select row;
                ListDT.DataSource = re.CopyToDataTable();
            }
            catch
            {

            }
        }


        private void bunifuLabel4_Click(object sender, EventArgs e)
        {
            getListDT();
            paneltop.Visible = false;
        }

        private void btnTTTV_Click(object sender, EventArgs e)
        {
            string madt = inforDT[0];
            string tendt = inforDT[1];
            Form tttv = new ThongTinTV(madt, tendt, MaKhoa);
            tttv.Show();
        }
        private bool check_tgianDKDT()
        {
            int year = int.Parse(DateTime.Now.Year.ToString());
            DateTime TGBD = new DateTime(year,5,1,0,0,0);
            DateTime TGKT = new DateTime(year, 5, 10, 0, 0, 0);
            DateTime now = DateTime.Now;
            
            if (DateTime.Compare(TGBD,now) < 0 && DateTime.Compare(now,TGKT) < 0)
            {
                return true;
            }
            return false;
        }

        

        private void excel_Click(object sender, EventArgs e)
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

        private void bunifuButton1_Click(object sender, EventArgs e)
        {
            panelLoc.Visible = true;
        }

        private void ListDT_CellContentClick_1(object sender, DataGridViewCellEventArgs e)
        {
            
        }

        private void cmbTrangThai_SelectedIndexChanged_2(object sender, EventArgs e)
        {

        }

        private void ListDT_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                inforDT.Clear();
                int index = e.RowIndex;
                DataGridViewRow selectedRow = ListDT.Rows[index];
                string MADT = selectedRow.Cells["MADT"].Value.ToString();
                string TenDT = selectedRow.Cells["TenDT"].Value.ToString();
                //string ChuyenNganh = selectedRow.Cells["ChuyenNganh"].Value.ToString();
                string Cap = selectedRow.Cells["Cap"].Value.ToString();
                string NgayBD = selectedRow.Cells["NgayBD"].Value.ToString();
                string NgayNT = selectedRow.Cells["NgayNT"].Value.ToString();
                string TrangThai = selectedRow.Cells["TrangThai"].Value.ToString();
                //string LoaiSP = selectedRow.Cells["LoaiSP"].Value.ToString();
                string TenBM = selectedRow.Cells["TenBM"].Value.ToString();
                string TienDo = selectedRow.Cells["TienDo"].Value.ToString();
                string KetQua = selectedRow.Cells["KetQua"].Value.ToString();
                string[] dataGT = { MADT, TenDT, Cap, NgayBD, NgayNT, TrangThai, TenBM, TienDo, KetQua };
                inforDT.AddRange(dataGT);
                if (selectedRow.Cells["TrangThai"].Value.ToString() == "Yêu cầu hủy")
                {

                }
                else
                {

                }
                footerpanel.Visible = true;
            }
            catch
            {

            }
        }

        private void bunifuButton1_MouseClick(object sender, MouseEventArgs e)
        {
            panelLoc.Visible = true;
        }
    }
}
