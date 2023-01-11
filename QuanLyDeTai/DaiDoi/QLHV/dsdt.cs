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
    public partial class dsdt : Form
    {
        public static List<string> tthv = new List<string>();
        public dsdt(List<string> tthvien)
        {

            tthvien = tthv;
            InitializeComponent();
            if (tthvien.Any())
            {
                getdataDT();
            }
            setup();
            getlistdt();
            
        }
        public void getdataDT()
        {
            txtMAHV.Text = tthv[0];
            txtName.Text = tthv[1];
            
        }
        public void setup()
        {
            txtMAHV.Enabled = false;
            txtName.Enabled = false;
        }
        public void getlistdt()
        {
            string query = "select MaDT as N'Mã đề tài' ,TenDT as N'Tên đề tài',NgayBD as N'Ngày bắt đầu',NgayNT as N'Ngày nghiệm thu',TrangThai as N'Trạng thái',TienDo as N'Tiến độ', KinhPhi as N'Kinh phí' from DeTai where MaDT in (select DISTINCT(MaDT) from VaiTroHV where MaHV = '" + txtMAHV.Text + "')";
            DataTable dt = ConnectDB.Connected.getData(query);
            dhv_dsdt.DataSource = dt;

        }
        private void txtName_TextChanged(object sender, EventArgs e)
        {

        }

        private void bunifuPanel2_Click(object sender, EventArgs e)
        {

        }
    }
}
