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
    public partial class modal : Form
    {
        private string MaHD;
        private string MaMK;
        private string MATV;
        private string vaitro;
        public modal(string mahd, string makhoa)
        {
            InitializeComponent();
            MaHD = mahd;
            MaMK = makhoa;
            getDSTVHD();
            getNameKhoa();
            getListMAGV();
            TenKhoa.Enabled = false;
            MHD.Enabled = false;
            MHD.Text = mahd;
            btnSuaTV.Visible = false;
            btnXoaTV.Visible = false;
        }
        private void getDSTVHD()
        {
            string query = "PHONG_SHOW_THANHVIENHD '" + MaHD + "'";
            listTV.DataSource = ConnectDB.Connected.getData(query);
        }
        private void getListMAGV()
        {
            MaGV.Items.Clear();
            string query = "Khoa_GiangVienChuaHD '" + MaMK + "'";
            DataTable dt = ConnectDB.Connected.getData(query);
            foreach (DataRow dr in dt.Rows)
            {
                MaGV.Items.Add(dr[0].ToString());
            }

        }
        private void getNameKhoa()
        {
            string query = "select tenk from khoa where mak = '" + MaMK + "'";
            DataTable dt = ConnectDB.Connected.getData(query);
            TenKhoa.Text = dt.Rows[0][0].ToString();
        }
        private void getNameGV()
        {
            string query = "select tengv from giangvien where magv = '" + MaGV.Text + "'";
            DataTable dt = ConnectDB.Connected.getData(query);
            name.Text = dt.Rows[0][0].ToString();
        }
        private void guna2Button1_Click(object sender, EventArgs e)
        {
            if (vaitro == "Chủ tịch")
            {
                MessageBox.Show("Đã có chủ tích hội đồng");
            }
            else
            {
                string query = "KHOA_THEM_GIANGVIENHOIDONG '" + MaHD + "','" + MaGV.Text + "',N'" + Vaitrohd.Text + "'";
                MessageBox.Show(ConnectDB.Connected.ChangeData(query, "Thêm"));
                getDSTVHD();
                Vaitrohd.Text = "";
                MaGV.Text = "";
                getListMAGV();
            }
        }
        private void listMAGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (MaGV.Text != "")
            {
                getNameGV();
            }
        }
        private void guna2Button3_Click(object sender, EventArgs e)
        {
            if (vaitro == "Chủ tịch")
            {
                MessageBox.Show("Không thể xóa chủ tịch của hội đồng");
            }
            else
            {
                string query = "KHOA_XOA_THANHVIEN_HOIDONG '" + MaHD + "','" + MATV + "'";
                MessageBox.Show(ConnectDB.Connected.ChangeData(query, "Xóa"));
                getDSTVHD();
                getListMAGV();
            }
        }
        private void listTV_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            btnSuaTV.Visible = true;
            btnXoaTV.Visible = true;
            int index = e.RowIndex;
            DataGridViewRow selectedRow = listTV.Rows[index];
            vaitro = selectedRow.Cells["VaiTro"].Value.ToString();
            MATV = selectedRow.Cells["MAGV"].Value.ToString();
        }
        private void Suavaitro_click(object sender, EventArgs e)
        {
            string query = "KHOA_SUA_VAITRO_HOIDONG '" + MaHD + "','" + MATV + "',N'" + Vaitrohd.Text + "'";
            MessageBox.Show(ConnectDB.Connected.ChangeData(query, "Sửa"));
            getDSTVHD();
            getListMAGV();
        }
        private void reload(object sender, EventArgs e)
        {
            getDSTVHD();
            getNameKhoa();
            getListMAGV();
            TenKhoa.Enabled = false;
            MHD.Enabled = false;
            btnSuaTV.Visible = false;
            btnXoaTV.Visible = false;
            MHD.Text = MaHD;
        }
    }
}
