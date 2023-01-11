using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDeTai.PKHCN.QLK
{
    public partial class DSK : Form
    {
        private string MaKhoa;
        string state;
        public DSK()
        {
            InitializeComponent();
            getKhoa();
            DTTG.Enabled = false;
         
        }
        private void getKhoa()
        {
        
            string query = "select * from Khoa";
            listKhoa.DataSource = ConnectDB.Connected.getData(query);
        }        
        private void CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                int index = e.RowIndex;
                DataGridViewRow selectedRow = listKhoa.Rows[index];
                MaKhoa = selectedRow.Cells[0].Value.ToString().Trim();
                DTTG.Enabled=true;
            }
            catch
            {
                DTTG.Enabled = false;
            }
        } 

        private void DTTG_Click(object sender, EventArgs e)
        {
            string query = "PKHQS_SHOWDETAI_KHOA '" + MaKhoa + "'";
            DataTable dt = ConnectDB.Connected.getData(query);
            if (dt.Rows.Count > 0)
            {
                state = "DT";
                Form dtai = new modal(MaKhoa, state);
                dtai.ShowDialog();
            }
            else
            {
                MessageBox.Show("Khoa chưa có đề tài");
            }
            
        }

        private void ShowDT_Click(object sender, DataGridViewCellEventArgs e)
        {
            int index = e.RowIndex;
            DataGridViewRow selectedRow = listKhoa.Rows[index];
            MaKhoa = selectedRow.Cells[0].Value.ToString().Trim();
            string query = "PKHQS_SHOWbomon '" + MaKhoa + "'";
            DataTable dt = ConnectDB.Connected.getData(query);
            if (dt.Rows.Count > 0)
            {
                state = "BM";
                Form dtai = new modal(MaKhoa, state);
                dtai.ShowDialog();
            }
            else
            {
                MessageBox.Show("Khoa chưa có Bộ Môn");
            }
        }
    }
}
