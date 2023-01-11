//using DevExpress.XtraEditors;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace QuanLyDeTai.Khoa
{
    public partial class QuanLyGV : Form
    {
        public static List<string> inforGV = new List<string>();
        public static string state = "";
        public static string MaKhoa = "";
        private string magv, tengv;
        public QuanLyGV(string maKhoa)
        {
            MaKhoa = maKhoa;
            InitializeComponent();
            getListGV();
        }


        public void getListGV()
        {
            string query = "Khoa_getgiangvien '" + MaKhoa+"'";
            DataTable dt = ConnectDB.Connected.getData(query);

            ListGV.DataSource = dt;
        }
        private void btnSua_Click(object sender, EventArgs e)
        {
            state = "update";
            if(lbQLGV.Text == "Danh sách giáo viên"){
                getListGV();
            }
            else
            {
                string query = "exec prd_khoa_DSchunhiemDT '" + MaKhoa + "'";
                DataTable dt = ConnectDB.Connected.getData(query);
                ListGV.DataSource = dt;
            }
            
        }
        private void btnXoa_Click(object sender, EventArgs e)
        {
            string query = "exec prd_khoa_deleteGV '" + inforGV[0] + "'";
            DialogResult dr = MessageBox.Show("Delete " + inforGV[1].Trim() + "", "Are you sure for", MessageBoxButtons.YesNo);
            if (dr == DialogResult.Yes)
            {
                MessageBox.Show(ConnectDB.Connected.ChangeData(query, "xóa"));
            }
            else
            {

            }

            getListGV();
        }


        private void btnXuatExcel_Click(object sender, EventArgs e)
        {
            ListGV.SelectAll();
            DataObject copydata = ListGV.GetClipboardContent();
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


 
        private void txtsearchGV_TextChanged(object sender, EventArgs e)
        {
            string query = "";
            query = "Khoa_getgiangvien '" + MaKhoa + "'";
            string searchGV = txtsearchGV.Text;
            try
            {
                DataTable dt = ConnectDB.Connected.getData(query);
                ListGV.DataSource = dt;
                var re = from row in dt.AsEnumerable()
                         where row[1].ToString().ToLower().Contains(searchGV.ToLower())
                         select row;
                ListGV.DataSource = re.CopyToDataTable();
            }
            catch
            {

            }
        }

        private void ListGV_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                bunifuTransition1.ShowSync(panel1);
                int index = e.RowIndex;
                DataGridViewRow selectedRow = ListGV.Rows[index];
                string MAGV = selectedRow.Cells["MAGV"].Value.ToString().Trim();
                string TenGV = selectedRow.Cells["TenGV"].Value.ToString().Trim();
                string CapBac = selectedRow.Cells["CapBac"].Value.ToString().Trim();
                string ChucVu = selectedRow.Cells["ChucVu"].Value.ToString().Trim();
                string MABM = selectedRow.Cells["MaBM"].Value.ToString();
                string[] dataGV = { MAGV, TenGV, CapBac, ChucVu, MABM };
                inforGV.Clear();
                inforGV.AddRange(dataGV);
            }
            catch
            {

            }
        }

        private void btnTTCT_Click(object sender, EventArgs e)
        {
            state = "xem";
        }

        private void btnDTTG_Click(object sender, EventArgs e)
        {

            Form test = new QLGV.DSDTG(inforGV[0], inforGV[1]);
            test.ShowDialog();

        }

    }
}