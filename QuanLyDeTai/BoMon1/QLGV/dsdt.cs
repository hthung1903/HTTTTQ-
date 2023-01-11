using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDeTai.BoMon.QLGV
{
    public partial class dsdt : Form
    {
        public static List<string> ttgv = new List<string>();
        public dsdt(List<string> ttgvien)
        {

            ttgv = ttgvien;
            InitializeComponent();
            if (ttgvien.Any())
            {
                getdataDT();
            }
            setup();
            getlistdt();
            
        }
        public void getdataDT()
        {
            txtMAGV.Text = ttgv[0];
            txtName.Text = ttgv[1];
            
        }
        public void setup()
        {
           
        }
        public void getlistdt()
        {
            string query = "select MaDT as N'Mã đề tài' ,TenDT as N'Tên đề tài',NgayBD as N'Ngày bắt đầu',NgayNT as N'Ngày nghiệm thu',TrangThai as N'Trạng thái',TienDo as N'Tiến độ', KinhPhi as N'Kinh phí' from DeTai where MaDT in (select DISTINCT(MaDT) from VaiTroHD where MaGV = '" + txtMAGV.Text + "')";
            DataTable dt = ConnectDB.Connected.getData(query);
            dgv_dsdt.DataSource = dt;

        }
        private void txtName_TextChanged(object sender, EventArgs e)
        {

        }

        private void bunifuPanel2_Click(object sender, EventArgs e)
        {

        }
    }
}
