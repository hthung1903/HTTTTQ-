using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDeTai.BoMon.QLDT
{
    public partial class DT : Form
    {
        public static string maDT = "";
        public static string tenDT = "";
        public static string MaBM = "";
        public static string tt = "";
        public static List<string> ttdt = new List<string>();
        public DT(string mabomon)
        {
            MaBM = mabomon;
            InitializeComponent();
            getListDT();
            bunifuPanel4.Hide();
            panelLoc.Visible = false;
            
        }

        public void getListDT()
        {
            string query = "bomon_lay_dsdt '" + MaBM +"'";
            DataTable dt = ConnectDB.Connected.getData(query);
            ListDT.DataSource = dt;
        }
        private void DT_Load(object sender, EventArgs e)
        {

        }

        private void cmbNamhoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            string query = "";
            query = "bomon_lay_dtdt_theonamhoc'" + MaBM + "', N'" + cmbNamhoc.Text.Trim() + "'";

            if (cmbTrangThai.Text != "")
            {
                if (cmbTrangThai.Text == "Đã hoàn thành")
                {
                    query = "bomon_lay_dtdt_cap_ttDaHT'" + MaBM + "',N'" + cmbTrangThai.Text.Trim() + "', N'" + cmbNamhoc.Text.Trim() + "'";
                }
                else 
                {
                    query = "bomon_lay_dtdt_cap_tt '" + MaBM + "',N'" + cmbTrangThai.Text.Trim() + "', N'" + cmbNamhoc.Text.Trim() + "'";
                }

            }

            DataTable dt = ConnectDB.Connected.getData(query);
            ListDT.DataSource = dt;
        }

        private void cmbTrangThai_SelectedIndexChanged(object sender, EventArgs e)
        {
            string query = "";
            if (cmbTrangThai.Text == "Đã hoàn thành")
            {
                query = "bomon_lay_dtdt_ttDaHT'" + MaBM + "', N'" + cmbTrangThai.Text.Trim() + "'";

                if (cmbNamhoc.Text != "")
                {
                    query = "bomon_lay_dtdt_cap_ttDaHT'" + MaBM + "',N'" + cmbTrangThai.Text.Trim() + "', N'" + cmbNamhoc.Text.Trim() + "'";

                }
            }
            else
            {
                query = "bomon_lay_dtdt_theott'" + MaBM + "', N'" + cmbTrangThai.Text.Trim() + "'";

                if (cmbNamhoc.Text != "")
                {
                    query = "bomon_lay_dtdt_cap_tt '" + MaBM + "',N'" + cmbTrangThai.Text.Trim() + "', N'" + cmbNamhoc.Text.Trim() + "'";

                }
            }
            

            DataTable dt = ConnectDB.Connected.getData(query);
            ListDT.DataSource = dt;
        }

        private void btnLoc_Click(object sender, EventArgs e)
        {
            if (panelLoc.Visible == false)
            {
                cmbNamhoc.Items.Clear();
                string query1 = "select distinct(NamHoc) from DeTai,VaiTroHD where DeTai.MaDT = VaiTroHD.MaDT and VaiTroHD.MaGV in (select MaGV from GiangVien where GiangVien.MaBM = '" + MaBM + "')   ";
                DataTable dt1 = ConnectDB.Connected.getData(query1);
                foreach (DataRow dr in dt1.Rows)
                {
                    cmbNamhoc.Items.Add(dr[0].ToString());
                }
                string query2 = "select distinct(TrangThai) from DeTai,VaiTroHD where DeTai.MaDT = VaiTroHD.MaDT and VaiTroHD.MaGV in (select MaGV from GiangVien where GiangVien.MaBM = '" + MaBM + "')  ";
                DataTable dt2 = ConnectDB.Connected.getData(query2);
                foreach (DataRow dr in dt2.Rows)
                {
                    cmbTrangThai.Items.Add(dr[0].ToString());
                }
                panelLoc.Visible = true;
            }
            else
            {
                panelLoc.Visible = false;
            }
        }

        private void btntimkiem_Click(object sender, EventArgs e)
        {
            string query = "BM_TIMDETAI_MA_TEN '" + MaBM+"',N'"+tb_tk.Text+"'";
            DataTable dt = ConnectDB.Connected.getData(query);
            ListDT.DataSource = dt;
        }

        private void tb_tk_TextChanged(object sender, EventArgs e)
        {
            /*string query = "bomon_tk_dt '" + MaBM + "',N'" + tb_tk.Text + "'";
            DataTable dt = ConnectDB.Connected.getData(query);
            ListDT.DataSource = dt;*/
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

        private void bunifuLabel2_Click(object sender, EventArgs e)
        {

        }

        private void bunifuPanel3_Click(object sender, EventArgs e)
        {

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
                maDT = selectedRow.Cells["Mã đề tài"].Value.ToString();
                tenDT = selectedRow.Cells["Tên đề tài"].Value.ToString();
                tt = selectedRow.Cells["Trạng thái"].Value.ToString();

             
            }
            catch
            {

            }
            
        }

        private void btn_dstvDETAI_Click(object sender, EventArgs e)
        {
            Form formdstv = new dstvDETAI(maDT, tenDT);
            formdstv.ShowDialog();
        }

        private void btn_duyetDT_Click(object sender, EventArgs e)
        {
            if(tt == "Chờ phê duyệt")
            {
                string query = " update DeTai set  TrangThai = N'Đã phê duyệt' where MaDT = '" + maDT + "'";
                MessageBox.Show(ConnectDB.Connected.ChangeData(query, "Sửa"));
                getListDT();
                
            }
        }
    }
}
