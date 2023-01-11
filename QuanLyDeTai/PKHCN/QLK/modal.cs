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
    public partial class modal : Form
    {
        private string MaK;
        private string State;
        public modal( string maK,string state)
        {
            InitializeComponent();
            MaK = maK;
            State = state;
            if(state == "DT")
            {
                label.Text = "Danh Sách Các Đề Tài";
                getALLDT();
            }
            else
            {
                label.Text = "Danh Sách Các Bộ Môn";
                getAllBM();
            }


        }
        private void getALLDT()
        {
            string query = "PKHQS_SHOWDETAI_KHOA '" + MaK+"'";
            DataTable dt = ConnectDB.Connected.getData(query);          
            listDT.DataSource = dt;
        }

        private void getAllBM()
        {
            string query = "PKHQS_SHOWbomon '" + MaK+"'";
            DataTable data = ConnectDB.Connected.getData(query);
            listDT.DataSource = data;
           
        }
    }
}
