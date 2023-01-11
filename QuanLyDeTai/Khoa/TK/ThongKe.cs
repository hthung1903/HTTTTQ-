using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDeTai.Khoa.TK
{
    public partial class ThongKe : Form
    {
        public static string MaKhoa = "";
        public ThongKe(string makhoa)
        {
            MaKhoa = makhoa;
            InitializeComponent();
            setup();
        }
        private void setup()
        {
            cmbYearTKBBKH.Text = DateTime.Now.Year.ToString();
            chartTKBBCN.Titles.Clear();
            chartTKBBBM.Titles.Clear();
            string query_tkbb = "";
            string query_TKBBBM = "exec prd_khoa_thongkeBBtheoBoMon_nam '" + MaKhoa + "', '" + cmbYearTKBBKH.Text + "'";
            DataTable dt2 = ConnectDB.Connected.getData(query_TKBBBM);
            chartTKBBBM.DataSource = dt2;
            chartTKBBBM.Series["TKBBTBM"].XValueMember = "Bộ môn";
            chartTKBBBM.Series["TKBBTBM"].YValueMembers = "Số lượng bài báo";
            chartTKBBBM.Titles.Add("Số lượng bài báo của các bộ môn năm '" + cmbYearTKBBKH.Text.Trim() + "'");
            DataTable dt;
            if (cmbSelectCNTC.Text == "Tạp chí" && cmbYearTKBBKH.Text != "")
            {
                query_tkbb = "exec prd_khoa_thongkeBBtheoTapChi '" + MaKhoa + "', '" + cmbYearTKBBKH.Text.Trim() + "'";
                dt = ConnectDB.Connected.getData(query_tkbb);
                chartTKBBCN.DataSource = dt;
                chartTKBBCN.Series["TKBBCNTC"].XValueMember = "Tạp chí";
                chartTKBBCN.Series["TKBBCNTC"].YValueMembers = "Số lượng";
                chartTKBBCN.Titles.Add("Số lượng bài báo theo từng tạp chí của khoa năm '" + cmbYearTKBBKH.Text.Trim() + "'");
            }
            else if (cmbSelectCNTC.Text == "Chuyên ngành" && cmbYearTKBBKH.Text != "")
            {
                query_tkbb = "exec prd_khoa_thongkeBBtheoCN '" + MaKhoa + "', '" + cmbYearTKBBKH.Text.Trim() + "'";
                dt = ConnectDB.Connected.getData(query_tkbb);
                chartTKBBCN.DataSource = dt;
                chartTKBBCN.Series["TKBBCNTC"].XValueMember = "Chuyên ngành";
                chartTKBBCN.Series["TKBBCNTC"].YValueMembers = "Số lượng";
                chartTKBBCN.Titles.Add("Số lượng bài báo theo từng chuyên ngành của khoa năm '" + cmbYearTKBBKH.Text.Trim() + "'");
            }
            cmbSelectCNTC.SelectedItem = cmbSelectCNTC.Items[0];
            cmbSelectCNTC.Text = "Chuyên ngành";
            chartTKBBCN.Titles.Clear();
            string query_tkbbb = "";
            DataTable dt3;
            if (cmbSelectCNTC.Text == "Tạp chí" && cmbYearTKBBKH.Text != "")
            {
                query_tkbbb = "exec prd_khoa_thongkeBBtheoTapChi '" + MaKhoa + "', '" + cmbYearTKBBKH.Text.Trim() + "'";
                dt3 = ConnectDB.Connected.getData(query_tkbb);

                chartTKBBCN.DataSource = dt3;
                chartTKBBCN.Series["TKBBCNTC"].XValueMember = "Tạp chí";
                chartTKBBCN.Series["TKBBCNTC"].YValueMembers = "Số lượng";
                chartTKBBCN.Titles.Add("Số lượng bài báo các bộ môn theo tạp chí năm"+" "+ cmbYearTKBBKH.SelectedItem.ToString());
            }
            else if (cmbSelectCNTC.Text == "Chuyên ngành" && cmbYearTKBBKH.Text != "")
            {
                query_tkbb = "exec prd_khoa_thongkeBBtheoCN '" + MaKhoa + "', '" + cmbYearTKBBKH.Text.Trim() + "'";
                dt3 = ConnectDB.Connected.getData(query_tkbb);
                chartTKBBCN.DataSource = dt3;
                chartTKBBCN.Series["TKBBCNTC"].XValueMember = "Chuyên ngành";
                chartTKBBCN.Series["TKBBCNTC"].YValueMembers = "Số lượng";
                chartTKBBCN.Titles.Add("Số lượng bài báo các bộ môn theo chuyên ngành năm" + " " + cmbYearTKBBKH.SelectedItem.ToString());
            }
            cmbSelectYear.SelectedItem = DateTime.Now.Year.ToString();
            chartTKDTBM.Titles.Clear();
            chartTKPT.Titles.Clear();
            string query_get_per = "exec pro_Khoa_TKPTDTBM_theo_nam '" + cmbSelectYear.Text + "','" + MaKhoa + "'";
            //string query = "select TenBM, count(DeTaiNCKH.MABM) as 'number of topic' from DeTaiNCKH left join BOMON on DeTaiNCKH.MABM = BOMON.MABM where year(DeTaiNCKH.NgayBD) = '" + cmbSelectYear.Text + "' group by  DeTaiNCKH.MABM,BOMON.TenBM";
            DataTable dt4 = ConnectDB.Connected.getData(query_get_per);
            //foreach (DataRow dr in dt.Rows)
            //{
            //    sum_of_topic += int.Parse(dr[1].ToString());
            //}

            chartTKDTBM.DataSource = dt4;
            chartTKDTBM.Series["DTBM"].XValueMember = "TenBM";
            chartTKDTBM.Series["DTBM"].YValueMembers = "number of topic";
            chartTKDTBM.Titles.Add("Số lượng đề tài các bộ môn năm"+" "+ cmbSelectYear.SelectedItem.ToString());
            chartTKPT.DataSource = dt4;
            chartTKPT.Series["TKPT"].XValueMember = "TenBM";
            chartTKPT.Series["TKPT"].YValueMembers = "percentage";
            chartTKPT.Titles.Add("Tỉ lệ đề tài các bộ môn năm " + " " + cmbSelectYear.SelectedItem.ToString());
            txtSLDT.Text = dt4.Rows[0][3].ToString();

        }

        private void cmbSelectYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                //int sum_of_topic = 0;
                chartTKDTBM.Titles.Clear();
                chartTKPT.Titles.Clear();
                string query_get_per = "exec pro_Khoa_TKPTDTBM_theo_nam '" + cmbSelectYear.Text + "','" + MaKhoa + "'";
                //string query = "select TenBM, count(DeTaiNCKH.MABM) as 'number of topic' from DeTaiNCKH left join BOMON on DeTaiNCKH.MABM = BOMON.MABM where year(DeTaiNCKH.NgayBD) = '" + cmbSelectYear.Text + "' group by  DeTaiNCKH.MABM,BOMON.TenBM";
                DataTable dt = ConnectDB.Connected.getData(query_get_per);
                //foreach (DataRow dr in dt.Rows)
                //{
                //    sum_of_topic += int.Parse(dr[1].ToString());
                //}

                chartTKDTBM.DataSource = dt;
                chartTKDTBM.Series["DTBM"].XValueMember = "TenBM";
                chartTKDTBM.Series["DTBM"].YValueMembers = "number of topic";
                chartTKDTBM.Titles.Add("Số lượng đề tài các bộ môn năm"+" "+ cmbSelectYear.SelectedItem.ToString());
                chartTKPT.DataSource = dt;
                chartTKPT.Series["TKPT"].XValueMember = "TenBM";
                chartTKPT.Series["TKPT"].YValueMembers = "percentage";
                chartTKPT.Titles.Add("Tỉ lệ đề tài các bộ môn năm" + " " + cmbSelectYear.SelectedItem.ToString());
                txtSLDT.Text = dt.Rows[0][3].ToString();
            }
            catch
            {

            }
            
        }

        private void cmbSelectCNTC_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                chartTKBBCN.Titles.Clear();
                string query_tkbb = "";
                if (cmbSelectCNTC.Text == "Tạp chí" && cmbYearTKBBKH.Text != "")
                {
                    query_tkbb = "exec prd_khoa_thongkeBBtheoTapChi '" + MaKhoa + "', '" + cmbYearTKBBKH.Text.Trim() + "'";
                    DataTable dt = ConnectDB.Connected.getData(query_tkbb);

                    chartTKBBCN.DataSource = dt;
                    chartTKBBCN.Series["TKBBCNTC"].XValueMember = "Tạp chí";
                    chartTKBBCN.Series["TKBBCNTC"].YValueMembers = "Số lượng";
                    chartTKBBCN.Titles.Add("Số lượng bài báo các bộ môn theo tạp chí năm" + " " + cmbYearTKBBKH.SelectedItem.ToString());
                }
                else if (cmbSelectCNTC.Text == "Chuyên ngành" && cmbYearTKBBKH.Text != "")
                {
                    query_tkbb = "exec prd_khoa_thongkeBBtheoCN '" + MaKhoa + "', '" + cmbYearTKBBKH.Text.Trim() + "'";
                    DataTable dt = ConnectDB.Connected.getData(query_tkbb);
                    chartTKBBCN.DataSource = dt;
                    chartTKBBCN.Series["TKBBCNTC"].XValueMember = "Chuyên ngành";
                    chartTKBBCN.Series["TKBBCNTC"].YValueMembers = "Số lượng";
                    chartTKBBCN.Titles.Add("Số lượng bài báo các bộ môn theo chuyên ngành năm"+" "+ cmbYearTKBBKH.SelectedItem.ToString());
                }          
            }
            catch
            {

            }     
        }

        private void cmbYearTKBBKH_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                chartTKBBCN.Titles.Clear();
                chartTKBBBM.Titles.Clear();
                string query_tkbb = "";
                string query_TKBBBM = "exec prd_khoa_thongkeBBtheoBoMon_nam '" + MaKhoa + "', '" + cmbYearTKBBKH.Text + "'";
                DataTable dt2 = ConnectDB.Connected.getData(query_TKBBBM);
                chartTKBBBM.DataSource = dt2;
                chartTKBBBM.Series["TKBBTBM"].XValueMember = "Bộ môn";
                chartTKBBBM.Series["TKBBTBM"].YValueMembers = "Số lượng bài báo";
                chartTKBBBM.Titles.Add("Số lượng bài báo của các bộ môn năm '" + cmbYearTKBBKH.Text.Trim()+"'");
                if (cmbSelectCNTC.Text == "Tạp chí" && cmbYearTKBBKH.Text != "")
                {
                    query_tkbb = "exec prd_khoa_thongkeBBtheoTapChi '" + MaKhoa + "', '" + cmbYearTKBBKH.Text.Trim() + "'";
                    DataTable dt = ConnectDB.Connected.getData(query_tkbb);

                    chartTKBBCN.DataSource = dt;
                    chartTKBBCN.Series["TKBBCNTC"].XValueMember = "Tạp chí";
                    chartTKBBCN.Series["TKBBCNTC"].YValueMembers = "Số lượng";
                    chartTKBBCN.Titles.Add("Số lượng bài báo theo từng tạp chí của khoa năm '"+cmbYearTKBBKH.Text.Trim()+"'");
                }
                else if (cmbSelectCNTC.Text == "Chuyên ngành" && cmbYearTKBBKH.Text != "")
                {
                    query_tkbb = "exec prd_khoa_thongkeBBtheoCN '" + MaKhoa + "', '" + cmbYearTKBBKH.Text.Trim() + "'";
                    DataTable dt = ConnectDB.Connected.getData(query_tkbb);
                    chartTKBBCN.DataSource = dt;
                    chartTKBBCN.Series["TKBBCNTC"].XValueMember = "Chuyên ngành";
                    chartTKBBCN.Series["TKBBCNTC"].YValueMembers = "Số lượng";
                    chartTKBBCN.Titles.Add("Số lượng bài báo theo từng chuyên ngành của khoa năm '" + cmbYearTKBBKH.Text.Trim() + "'");
                }
                
                
            }
            catch
            {

            }
        }
    }
}
