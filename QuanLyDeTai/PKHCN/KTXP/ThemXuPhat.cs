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
    public partial class ThemXuPhat : Form
    {

        public ThemXuPhat()
        {
            InitializeComponent();
            getMaKT();
            getCapDo();
            getListND();
            getHTXP();
            getdtctd();
            makt.Enabled = false;
            TDT.Enabled = false;
            capdokt.Enabled = true;
            XL.Enabled = true;
        }
        private void getListND()
        {
            XL.Items.Clear();
            string query = "select distinct noidung from xulyvipham where mucdo = N'"+capdokt.Text+"'";
            DataTable dt = ConnectDB.Connected.getData(query);
            foreach (DataRow dr in dt.Rows)
            {
                XL.Items.Add(dr[0].ToString());
            }
        }
        private void getMaKT()
        {
            string query = "declare @nextMadt char(10)  exec @nextMadt = PKHQS_TuTangMaXP select @nextMadt";
            DataTable dt = ConnectDB.Connected.getData(query);
            makt.Text = dt.Rows[0].ItemArray[0].ToString().Trim();
        }

        private void getCapDo()
        {
            capdokt.Items.Clear();
            string query = "select distinct mucdo from xulyvipham";
            DataTable dt = ConnectDB.Connected.getData(query);
            foreach (DataRow dr in dt.Rows)
            {
                capdokt.Items.Add(dr[0].ToString());
            }
        }
        private void getHTXP()
        {
            htxp.Items.Clear();
            string query = "select distinct hinhthucxl from xulyvipham where mucdo = N'" + capdokt.Text + "'";
            DataTable dt = ConnectDB.Connected.getData(query);
            foreach (DataRow dr in dt.Rows)
            {
                htxp.Items.Add(dr[0].ToString());
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
            string query = "PKHQS_XuPhat '" + makt.Text + "',N'" + XL.Text + "',N'" + capdokt.Text + "',N'" + htxp.Text + "','" + selectMDT.Text + "'";
            MessageBox.Show(ConnectDB.Connected.ChangeData(query, "Thêm"));
            this.Close();
        }

        private void edit_Click(object sender, EventArgs e)
        {
            reload();
            this.Close();
        }

        private void capdokt_SelectedIndexChanged(object sender, EventArgs e)
        {
            getListND();
            getHTXP();
        }
        private void reload()
        {
            getMaKT();
            getCapDo();
            TDT.Text = "";
            selectMDT.Text = "";
            getListND();
            getdtctd();
            getHTXP();
        }
        private void getdtctd()

        {
            string current_year = DateTime.Now.Year.ToString();
            if (DateTime.Compare(DateTime.Parse("9/15/" + current_year), DateTime.Now) <= 0 && DateTime.Compare(DateTime.Parse("12/31/" + current_year), DateTime.Now) >= 0)
            {
                string query = "PKHQS_DTCTD '50'";
                DataTable dt = ConnectDB.Connected.getData(query);
                if (dt.Rows.Count > 0)
                {
                    detaictd.DataSource = dt;
                }
                else
                {
                    MessageBox.Show("Không có đề tài nào chậm tiến độ lần 1");
                    getListReasearch();
                }

            }
            else if (DateTime.Compare(DateTime.Parse("1/15/" + current_year), DateTime.Now) <= 0 && DateTime.Compare(DateTime.Parse("3/20/" + current_year), DateTime.Now) >= 0)
            {
                string query = "PKHQS_DTCTD '70'";
                DataTable dt = ConnectDB.Connected.getData(query);
                if (dt.Rows.Count > 0)
                {
                    detaictd.DataSource = dt;
                }
                else
                {
                    MessageBox.Show("Không có đề tài nào chậm tiến độ lần 2");
                    getListReasearch();
                }

            }
        }
        private void getListReasearch()
        {
            string query = "PKHQS_DTCTD '100'";
            detaictd.DataSource = ConnectDB.Connected.getData(query);
        }

        private void detaictd_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                int index = e.RowIndex;
                DataGridViewRow selectedRow = detaictd.Rows[index];
                selectMDT.Text = selectedRow.Cells[0].Value.ToString().Trim();
            }
            catch
            {
            }
        }
    }
}
