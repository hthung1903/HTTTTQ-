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
    public partial class infor : Form
    {
        public static List<string> tthv = new List<string>();
        public static string luachon = "";
        
        public infor(List<string> datahv, string Luachon)
        {
            InitializeComponent();
            tthv = datahv;
            luachon = Luachon.Trim();
            if (datahv.Any())
            {
                getdatahv();
            }
            setup();

        }
        public void getdatahv()
        {
            txtMAHV.Text = tthv[0];
            txtName.Text = tthv[1];            
            txtCapBac.Text = tthv[2];
            txtNamsinh.Text = tthv[3];
            txtGioitinh.Text = tthv[4];
            txtMaDD.Text = tthv[5];
        }
        public void setup()
        {
            string hv = get_nextMhv();
            if (luachon == "sửa")
            {
                txtMAHV.Enabled = false;
                /*txtName.Enabled = false;*/
                
                
            }
            else if (luachon == "thêm")
            {
                txtMAHV.Text = hv;
                txtName.Text = "";
                txtCapBac.Text = "";
                txtNamsinh.Text = "";
                txtGioitinh.Text = "";
                txtMaDD.Text = "";


            }
        }
        private string get_nextMhv()
        {
            string query_get_next_mhv = "declare @nextMahv char(10) \n exec @nextMahv = TuTangMaHV \n select @nextMahv";
            string next_MADT = ConnectDB.Connected.getData(query_get_next_mhv).Rows[0][0].ToString();
            return next_MADT;
        }
        private void btnLuu_Click(object sender, EventArgs e)
        {
            try
            {
                if(luachon == "sửa")
                {
                    string query = " update HocVien set  TenHV = N'"+txtName.Text+"', CapBac = N'"+txtCapBac.Text+"'," +
                        "NamSinh = '" + txtNamsinh.Text + "'," +
                         " GioiTinh = N'" + txtGioitinh.Text + "', MaDD = '"+txtMaDD.Text+"'  where Mahv = '" + txtMAHV.Text + "'";
                    MessageBox.Show(ConnectDB.Connected.ChangeData(query, "Sửa"));
                    this.Hide();
                }
                if(luachon == "thêm")
                {
                    string query = "insert into HocVien (MaHV,TenHV, CapBac, NamSinh, GioiTinh, MaDD) values ('" + txtMAHV.Text + "', " +
                        "N'" + txtName.Text + "', N'" + txtCapBac.Text + "', " +
                        "'" + txtNamsinh.Text + "', N'" + txtGioitinh.Text + "','"+ txtMaDD.Text +"') ";
                    Console.WriteLine(query);
                    MessageBox.Show(ConnectDB.Connected.ChangeData(query, "Thêm"));
                    this.Hide();
                }


            }
            catch
            {
                MessageBox.Show("Thất bại");
            }
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void txtChucVu_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
