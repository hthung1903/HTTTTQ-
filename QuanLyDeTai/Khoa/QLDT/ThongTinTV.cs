using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDeTai.Khoa.QLDT
{
    public partial class ThongTinTV : Form
    {
        private static string MaKhoa = "";
        private static string MaDT = "";
        private static string TenDT = "";
        private static string currentMagv = "";
        private static string currentMCN = "";
        public static List<string> inforGV = new List<string>();
        public ThongTinTV(string madt, string tendt, string makhoa)
        {
            MaKhoa = makhoa;
            MaDT = madt;
            TenDT = tendt;
            InitializeComponent();          
            getInfoDT();
            getTV();
      
        }
        private void getInfoDT()
        {
            string query = "pkhcn_lay_tt_dt '" + MaDT + "'";
            DataTable dt = ConnectDB.Connected.getData(query);
            ma.Text = "Mã đề tài: " + MaDT;
            tenndt.Text = "Tên đề tài: " + dt.Rows[0][11];
            CN.Text = "Chuyên ngành: " + dt.Rows[0][1];
            Cap.Text = "Cấp: " + dt.Rows[0][2];
            NBD.Text = "Ngày bắt đầu: " + dt.Rows[0][3].ToString().Split(' ')[0];
            NNT.Text = "Ngày nghiệm thu: " + dt.Rows[0][4].ToString().Split(' ')[0];
            TT.Text = "Trạng thái: " + dt.Rows[0][5];
            SP.Text = "Sản phẩm: " + dt.Rows[0][6];
            TenBM.Text = "Bô môn: " + dt.Rows[0][7];
            TienDo.Text = "Tiến độ: " + dt.Rows[0][8];
            HD.Text = "Hội đồng: " + dt.Rows[0][9];
            XL.Text = "Xếp loại: " + dt.Rows[0][10];
            KP.Text = "Kinh phí: " + dt.Rows[0][12];
        }
        private void getTV()
        {
            string query = "getAllGVByMDT '" + MaDT + "'";
            tv.DataSource = ConnectDB.Connected.getData(query);
        }
        private void getBaiBao()
        {
            string query = "pkhcn_lay_bb_mdt '" + MaDT + "'";
            tv.DataSource = ConnectDB.Connected.getData(query);
        }
        //private void getcurrentMaCN()
        //{
        //    string get_MCN = "proc_khoa_getMCN '" + MaDT + "'";
        //    currentMCN = ConnectDB.Connected.getData(get_MCN).Rows[0][0].ToString();
        //}
        
        //public void fillData_TV()
        //{
        //    txtMaDT.Text = MaDT;
        //    txtTenDT.Text = TenDT;
        //    string query = "exec prd_Khoa_XemDSTV_Theo_MaDT '"+MaDT+"'";
        //    DataTable dt = ConnectDB.Connected.getData(query);
        //    ListTV.DataSource = dt;
        //}



        private void btnCTTV_Click(object sender, EventArgs e)
        {
            
        }

        private void ListTV_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void DS_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DS.Text == "Danh sách thành viên")
            {
                getTV();
            }
            else
            {
                getBaiBao();
            }
        }
    }
}
