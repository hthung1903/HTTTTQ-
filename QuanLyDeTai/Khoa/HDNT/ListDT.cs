using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDeTai.Khoa.HDNT
{
    public partial class ListDT : Form
    {
        private string mahd;
        private string mk;
        private string mdt;
        public ListDT(string MaHD, string MaKhoa)
        {
            InitializeComponent();
            mahd = MaHD;
            mk = MaKhoa;
            getListDTHD();
            getTenKhoa();
            MHD.Text = MaHD;
            MHD.Enabled = false;
            TenKhoa.Enabled = false;
            getDTKHD();
            TDT.Enabled = false;
            edit.Enabled = false;
        }
        private void getListDTHD()
        {
            string query = "KHOA_DeTaiCuaHoiDong '" + mahd + "'";
            DSDT.DataSource = ConnectDB.Connected.getData(query);
        }
        private void getTenKhoa()
        {
            string query = "select tenk from khoa where mak = '" + mk + "'";
            DataTable dt = ConnectDB.Connected.getData(query);
            TenKhoa.Text = dt.Rows[0][0].ToString();
        }
        private void getDTKHD()
        {
            string query = "KHOA_DeTaiCuaKhoaChuaNghiemThu '" + mk + "'";
            DataTable dt = ConnectDB.Connected.getData(query);
            foreach (DataRow dr in dt.Rows)
            {
                selectMDT.Items.Add(dr[0].ToString());
            }
        }
        private void selectMDT_SelectedIndexChanged(object sender, EventArgs e)
        {
            string query = "select tendt from detai where madt= '" + selectMDT.Text + "'";
            DataTable dt = ConnectDB.Connected.getData(query);
            TDT.Text = dt.Rows[0][0].ToString();
        }

        private void Add_Click(object sender, EventArgs e)
        {
            string query = "KHOA_ThemDTHoiDong '" + mahd + "','" + selectMDT.Text + "'";
            MessageBox.Show(ConnectDB.Connected.ChangeData(query, "Thêm"));
            getListDTHD();
        }

        private void edit_Click(object sender, EventArgs e)
        {
            string query = "PKHCN_XoaDTHoiDong '" + mahd + "','" + mdt + "'";
            MessageBox.Show(ConnectDB.Connected.ChangeData(query, "Xóa"));
            getListDTHD();
        }
        private void DSDT_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                int index = e.RowIndex;
                DataGridViewRow selectedRow = DSDT.Rows[index];
                mdt = selectedRow.Cells["MaDT"].Value.ToString();
                edit.Enabled = true;
                XL.Visible = true;
                guna2Button1.Visible = true;
                guna2HtmlLabel6.Visible = true;
            }
            catch
            {
            }
        }
        private void guna2Button1_Click(object sender, EventArgs e)
        {
            string query = "Khoa_NghiemThuDeTai '" + mahd + "','" + mdt + "',N'" + XL.Text + "'";
            MessageBox.Show(ConnectDB.Connected.ChangeData(query, "Nghiệm thu"));
            XL.Visible = false;
            guna2Button1.Visible = false;
            guna2HtmlLabel6.Visible = false;
            getListDTHD();
        }
    }
}
