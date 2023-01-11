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
    public partial class infor : Form
    {
        public static List<string> ttgv = new List<string>();
        public static string luachon = "";
        
        public infor(List<string> datagv, string Luachon)
        {
            InitializeComponent();
            ttgv = datagv;
            luachon = Luachon.Trim();
            if (datagv.Any())
            {
                getdataGV();
            }
            setup();

        }
        public void getdataGV()
        {
            txtMAGV.Text = ttgv[0];
            txtName.Text = ttgv[1];            
            txtCapBac.Text = ttgv[2];
            txtChucVu.Text = ttgv[3];
            txtMABM.Text = ttgv[4];
        }
        public void setup()
        {
            string gv = get_nextMGV();
            if (luachon == "sửa")
            {
                txtMAGV.Enabled = false;
                /*txtName.Enabled = false;*/
                
                
            }
            else if (luachon == "thêm")
            {
                txtMAGV.Text = gv;
                txtName.Text = "";
                txtCapBac.Text = "";
                txtChucVu.Text = "";
                txtMABM.Text = "";
             
            }
        }
        private string get_nextMGV()
        {
            string query_get_next_mGV = "declare @nextMagv char(10) \n exec @nextMagv = TuTangMaGV \n select @nextMagv";
            string next_MADT = ConnectDB.Connected.getData(query_get_next_mGV).Rows[0][0].ToString();
            return next_MADT;
        }
        private void btnLuu_Click(object sender, EventArgs e)
        {
            try
            {
                if(luachon == "sửa")
                {
                    string query = " update GiangVien set  TenGV = N'"+txtName.Text+"', CapBac = N'"+txtCapBac.Text+"'," +
                        "ChucVu = N'" + txtChucVu.Text + "'," +
                         " MaBM = N'" + txtMABM.Text + "'  where MaGV = '" + txtMAGV.Text + "'";
                    MessageBox.Show(ConnectDB.Connected.ChangeData(query, "Sửa"));
                    this.Hide();
                }
                if(luachon == "thêm")
                {
                    string query = "insert into GiangVien (MaGV,TenGV, CapBac, ChucVu,  MABM) values ('" + txtMAGV.Text + "', " +
                        "N'" + txtName.Text + "', N'" + txtCapBac.Text + "', " +
                        "N'" + txtChucVu.Text + "', '" + txtMABM.Text + "') ";
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
