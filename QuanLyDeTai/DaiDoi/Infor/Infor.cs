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

namespace QuanLyDeTai.DaiDoi.Infor
{
    public partial class Infor : Form
    {
        public static string maDD;
        public Infor(string MaDD)
        {
            maDD = MaDD;
            InitializeComponent();
            getInfor();
            enable();
        }
        private void getInfor()
        {
            string query = "select * from DaiDoi where MaDD ='"+maDD+"'";
            DataTable dt = ConnectDB.Connected.getData(query);
            TenDV.Text = dt.Rows[0][1].ToString().Trim();
            DiaDiem.Text = dt.Rows[0][2].ToString().Trim();
            MaTD.Text = dt.Rows[0][4].ToString().Trim();
            QuanSo.Text = dt.Rows[0][3].ToString().Trim();
  
        }
        private void enable()
        {
            TenDV.Enabled = false;
            DiaDiem.Enabled=false;
            QuanSo.Enabled=false;
            MaTD.Enabled=false;
            Save.Enabled=false;
            huy.Enabled=false;



        }
        
        private void Infor_Load(object sender, EventArgs e)
        {

        }
  

        private void Edit_Click_1(object sender, EventArgs e)
        {
            DiaDiem.Enabled = true;
            MaTD.Enabled = true;
            Save.Enabled = true;
            huy.Enabled = true;
           
        }

        private void Save_Click_1(object sender, EventArgs e)
        {
         

            string query = " DD_sua_tt '"+maDD+"',N'"+DiaDiem.Text+"','"+MaTD.Text+"'";
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

        private void label5_Click(object sender, EventArgs e)
        {

        }
    }
}
