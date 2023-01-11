using System;
using System.Configuration;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDeTai.User.Infor
{
    public partial class Infor : Form
    {
        public static string maGV;
        public Infor(string MaGv)
        {
            maGV = MaGv;
            InitializeComponent();
            getInfor();
            enable();
        }
        private void getInfor()
        {
            string query = "select * from GiangVien where MaGV='"+maGV+"'";
            DataTable dt = ConnectDB.Connected.getData(query);
            hoten.Text = dt.Rows[0][1].ToString().Trim();
            Capbac.Text = dt.Rows[0][2].ToString().Trim();
            chucvu.Text = dt.Rows[0][3].ToString().Trim();
            MaBM.Text = dt.Rows[0][4].ToString().Trim();


        }
        private void enable()
        {
            hoten.Enabled = false;
            chucvu.Enabled=false;
            Capbac.Enabled=false;
            MaBM.Enabled=false;
            Save.Enabled=false;
            huy.Enabled=false;



        }
        
        private void Infor_Load(object sender, EventArgs e)
        {

        }
  

        private void Edit_Click_1(object sender, EventArgs e)
        {
            chucvu.Enabled = true;
            Capbac.Enabled = true;
            MaBM.Enabled = true;
            Save.Enabled = true;
            huy.Enabled = true;
            chucvu.Focus();
        }

        private void Save_Click_1(object sender, EventArgs e)
        {
         

            string query = " GV_sua_tt '"+maGV+"',N'"+Capbac.Text+"','"+chucvu.Text+"','"+MaBM.Text+"'";
            MessageBox.Show(ConnectDB.Connected.ChangeData(query, "Sửa"));
            enable();




        }

        private void huy_Click_1(object sender, EventArgs e)
        {
            getInfor();
            enable();
        }

        private void MaKhoa_TextChanged(object sender, EventArgs e)
        {

        }

        private void MaBM_TextChanged(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }
    }
}
