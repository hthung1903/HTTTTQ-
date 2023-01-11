using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDeTai.PKHCN.HDNT
{
    public partial class HDNT : Form
    {
        private string MAHD;
        private string MaKhoa;
        public HDNT()
        {
            InitializeComponent();
            getListHD();
            getAllMK();
            getMaHD();
            Ma.Enabled = false;
            TV.Enabled = false;
            DSDT.Enabled = false;
            edit.Enabled = false;
            xoa.Enabled = false;
            
        }
        private void getListHD()
        {
            string query = "select * from HoiDongNT";
            listHD.DataSource = ConnectDB.Connected.getData(query);
        }
        private void getMaHD()
        {
            string query = "declare @nextMadt char(10)  exec @nextMadt = KHOA_TuTangMaHD select @nextMadt";
            DataTable dt = ConnectDB.Connected.getData(query);
            Ma.Text = dt.Rows[0].ItemArray[0].ToString().Trim();
        }
        private void getAllMK()
        {
            string query = "PKHQS_GET_MAK";
            DataTable dt = ConnectDB.Connected.getData(query);
            foreach(DataRow dr in dt.Rows)
            {
                MK.Items.Add(dr[0].ToString());
            }
        }

        private void TV_Click(object sender, EventArgs e)
        {
            Form ListTV = new modal(MAHD,MaKhoa);
            ListTV.ShowDialog();
        }

        private void listHD_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                int index = e.RowIndex;
                DataGridViewRow selectedRow = listHD.Rows[index];
                MAHD = selectedRow.Cells[0].Value.ToString().Trim();
                string Nam = selectedRow.Cells[1].Value.ToString().Trim();
                string tt = selectedRow.Cells[2].Value.ToString().Trim();
                MaKhoa = selectedRow.Cells[3].Value.ToString().Trim();
                Ma.Text = MAHD;
                MK.Text = MaKhoa;
                NamHoc.Text = Nam;
                TT.Text = tt;
                addHD.Enabled = false;
                Ma.Enabled = false;
                edit.Enabled = true;
                xoa.Enabled = true;
                TV.Enabled = true;
                DSDT.Enabled = true;
                getListHD();
            }
            catch
            {
            }
        }

        private void addHD_Click(object sender, EventArgs e)
        {
            string query = "KHOA_THEMHOIDONG '" + Ma.Text + "','" + NamHoc.Text + "',N'" + TT.Text + "','" + MK.Text + "'";
            MessageBox.Show(ConnectDB.Connected.ChangeData(query, "Thêm"));
            getListHD();
        }

        private void xoa_Click(object sender, EventArgs e)
        {
            string query = "PKHQS_XOAHOIDONG '" + MAHD + "'";
            MessageBox.Show(ConnectDB.Connected.ChangeData(query, "Xóa"));
            getListHD();
        }

        private void edit_Click(object sender, EventArgs e)
        {
            string query = "PKHQS_SUAHOIDONG '" + MAHD + "','" + NamHoc.Text + "',N'" + TT.Text+"','"+MK.Text+"'";
            MessageBox.Show(ConnectDB.Connected.ChangeData(query, "Sửa"));
            getListHD();
        }

        private void DSDT_Click(object sender, EventArgs e)
        {
            Form DT = new ListDT(MAHD,MaKhoa);
            DT.ShowDialog();
        }

        private void guna2HtmlLabel1_Click(object sender, EventArgs e)
        {

        }

        private void lockhoa(object sender, EventArgs e)
        {
            string query = "PKHQS_SHOWHOIDONG_Mak '" + MK.Text + "'";
            DataTable dt = ConnectDB.Connected.getData(query);
            listHD.DataSource = dt;
        }

        private void bunifuPanel1_Click(object sender, EventArgs e)
        {
            getListHD();
            getMaHD();
            addHD.Enabled = true;
            Ma.Enabled = false;
            TV.Enabled = false;
            DSDT.Enabled = false;
            edit.Enabled = false;
            xoa.Enabled = false;
            MK.Enabled = true;
            MK.Text = MaKhoa;
        }
    }
}
