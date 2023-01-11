using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDeTai.PKHCN.KTXP
{
    public partial class ThemKhenThuong : Form
    {

        public ThemKhenThuong()
        {
            InitializeComponent();
            getMaKT();
            getCapDo();
            getListND();
            getmadt();
            makt.Enabled = false;
            TDT.Enabled = false;
            capdokt.Enabled = true;
            XL.Enabled = true;
        }
        private void getListND()
        {
            XL.Items.Clear();
            string query = "select distinct noidung from khenthuong where capdo = N'"+capdokt.Text+"'";
            DataTable dt = ConnectDB.Connected.getData(query);
            foreach (DataRow dr in dt.Rows)
            {
                XL.Items.Add(dr[0].ToString());
            }
        }
        private void getMaKT()
        {
            string query = "declare @nextMadt char(10)  exec @nextMadt = PKHQS_TuTangMaKhenThuong select @nextMadt";
            DataTable dt = ConnectDB.Connected.getData(query);
            makt.Text = dt.Rows[0].ItemArray[0].ToString().Trim();
        }

        private void getCapDo()
        {
            capdokt.Items.Clear();
            string query = "select distinct capdo from khenthuong";
            DataTable dt = ConnectDB.Connected.getData(query);
            foreach (DataRow dr in dt.Rows)
            {
                capdokt.Items.Add(dr[0].ToString());
            }
        }
        private void getmadt()
        {
            selectMDT.Items.Clear();
            string query = "PKHCN_GETDTchuaKHENTHUONG";
            DataTable dt = ConnectDB.Connected.getData(query);
            foreach (DataRow dr in dt.Rows)
            {
                selectMDT.Items.Add(dr[0].ToString());
            }
        }

        private void selectMDT_SelectedIndexChanged(object sender, EventArgs e)
        {
            string query = "select tendt from detai where madt= '" + selectMDT.Text + "'";
            DataTable dt = ConnectDB.Connected.getData(query);
            TDT.Text = dt.Rows[0][0].ToString();
        }

        private void Add_Click(object sender, EventArgs e)
        {
            string query = "PKHQS_KhenThuong '" + makt.Text + "',N'" + XL.Text + "',N'" + capdokt.Text + "','" + selectMDT.Text + "'";
            MessageBox.Show(ConnectDB.Connected.ChangeData(query, "Thêm"));
            getmadt();
            reload();
        }

        private void edit_Click(object sender, EventArgs e)
        {
            reload();
            this.Close();
        }

        private void capdokt_SelectedIndexChanged(object sender, EventArgs e)
        {
            getListND();
        }
        private void reload()
        {
            getMaKT();
            getCapDo();
            getmadt();
            TDT.Text = "";
            getListND();
        }
    }
}
