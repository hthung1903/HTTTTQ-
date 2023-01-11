using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDeTai.PKHCN.QuanLyKinhPhi
{
    public partial class QLKP : Form
    {
        private string madt;
        public QLKP()
        {
            
            InitializeComponent();
            getDTKP();
            getMaKhoa();
            MaKhoa.Text = "Tất Cả Các Khoa";
        }

        private void getMaKhoa()
        {
            string query = "select mak from khoa";
            DataTable dt = ConnectDB.Connected.getData(query);
            foreach (DataRow dr in dt.Rows)
            {
                MaKhoa.Items.Add(dr[0].ToString());
            }
        }
        private void getTenKhoa()
        {
            if (MaKhoa.Text == "Tất Cả Các Khoa") { TenK.Text = "All"; }
            else
            {
                string query = "select tenk from khoa where mak = '"+MaKhoa.Text+"'";
                DataTable dt = ConnectDB.Connected.getData(query);
                TenK.Text = dt.Rows[0][0].ToString().Trim();
            }
        }
        private void getDTKP()
        {
            if (MaKhoa.Text == "Tất Cả Các Khoa") {
                string query = "select * from detai";
                listDTKP.DataSource = ConnectDB.Connected.getData(query);
            }
            else
            {
                string query = "PKHQS_SHOWDETAI_KHOA '" + MaKhoa.Text + "'";
                listDTKP.DataSource = ConnectDB.Connected.getData(query);
                
            }
            listDTKP.Columns[1].Width = 350;
        }
        private void guna2Button1_Click(object sender, EventArgs e)
        {
            string query = "PKHCN_CapKinhphi '"+madt+"','"+kinhphi.Text+"'";
            MessageBox.Show(ConnectDB.Connected.ChangeData(query, "Cấp Kinh Phí"));
            getDTKP();
        }

        private void TenKhoa_SelectedIndexChanged(object sender, EventArgs e)
        {
            getTenKhoa();
            getDTKP();
        }

        private void baocao_Click(object sender, EventArgs e)
        {
            
            Form xinKp = new Baocao();
            xinKp.ShowDialog();
        }

        private void listDTKP_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int index = e.RowIndex;
            DataGridViewRow selectedRow = listDTKP.Rows[index];
            madt = selectedRow.Cells[0].Value.ToString().Trim();
        }
    }
}
