using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDeTai.PKHCN.QuanLyDT
{
   

    public partial class QLDT1 : Form
    {
        public static List<string> inforDT = new List<string>();
        public string MaDT;
        public QLDT1()
        {
            InitializeComponent();
            getListReasearch();
            panelFilter.Visible = false;
            getTT();
            getMaKhoa();
            getYear();
            btnDADTCTD.Enabled = true;
        } 
        private void getListReasearch()
        {
            string query = "PKHQS_SHOWDETAI_ALL";
            listDT.DataSource = ConnectDB.Connected.getData(query);
        }
        private void getTT()
        {
            TT.Items.Clear();
            string query = "PKHQS_GET_TRANGTHAI";
            DataTable dt = ConnectDB.Connected.getData(query);
            foreach (DataRow dr in dt.Rows)
            {
                TT.Items.Add(dr[0]);
            }
        }
        private void getMaKhoa()
        {
            selectMa.Items.Clear();
            string query = "PKHQS_GET_MAK";
            DataTable dt = ConnectDB.Connected.getData(query);
            foreach(DataRow dr in dt.Rows)
            {
                selectMa.Items.Add(dr[0]);
            }
        }
        private void getYear()
        {
            selectYear.Items.Clear();
            string query = "PKHQS_GET_NAMHOC";
            DataTable dt = ConnectDB.Connected.getData(query);
            foreach (DataRow dr in dt.Rows)
            {
                selectYear.Items.Add(dr[0]);
            }
        }
        private void Edit_Click(object sender, EventArgs e)
        {
            string state = "Edit";
            Form modal = new modal(MaDT,state);
            modal.ShowDialog();
            getListReasearch();
        }

        private void delete_Click(object sender, EventArgs e)
        {
            string query = "PKHQS_DELETE_DETAI '" + MaDT+ "'";
            DialogResult dr = MessageBox.Show("Bạn có muốn xóa đề tài có mã:" + MaDT.Trim() + "", "Are you sure for", MessageBoxButtons.YesNo);
            if (dr == DialogResult.Yes)
            {
                MessageBox.Show(ConnectDB.Connected.ChangeData(query, "xóa"));
            }
            else
            {

            }

            getListReasearch();
        }

        private void panel4_Paint(object sender, PaintEventArgs e)
        {

        }

        private void CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                int index = e.RowIndex;
                Chitiet.Enabled = true;
                Edit.Enabled = true;
                delete.Enabled = true;

                DataGridViewRow selectedRow = listDT.Rows[index];
                string MADT = selectedRow.Cells["Mã DT"].Value.ToString();
                MaDT = selectedRow.Cells["Mã DT"].Value.ToString();
                bunifuTransition1.ShowSync(panel4);
            }
            catch
            {

            }
    
        }


        private void search_TextChanged(object sender, EventArgs e)
        {
            string query = "exec PKHQS_SHOWDETAI_TIMKIEM N'" + search.Text+"%'";
            listDT.DataSource = ConnectDB.Connected.getData(query);
        }

        private void filter_Click(object sender, EventArgs e)
        {
            panel4.Visible = false;
            if(panelFilter.Visible == true)
            {

                panelFilter.Visible = false;
                getListReasearch();
            }
            else
            {
                panelFilter.Visible = true;
                TT.SelectedItem = null;
                selectMa.SelectedItem = null;
                selectYear.SelectedItem = null;
                getListReasearch();
            }
        }

        private void guna2GradientButton1_Click(object sender, EventArgs e)
        {
            string tt = TT.Text;
            string ma = selectMa.Text;
            string nam = selectYear.Text;
            string query = "";
            if (nam == "" && ma == "" && tt != "")
            {
                query = "PKHQS_SHOWDETAI_TRANGTHAI N'" + tt + "'";
            }
            if (nam == "" && ma != "" && tt == "")
            {
                query = "PKHQS_SHOWDETAI_KHOA '" + ma + "'";

            }
            if (nam != "" && ma == "" && tt == "")
            {
                query = "PKHQS_SHOWDETAI_NAMHOC '" + nam + "'";

            }
            if (nam == "" && ma != "" && tt != "")
            {
                query = "exec PKHQS_SHOWDETAI_KHOA_TRANGTHAI '" + ma + "',N'" + tt + "'";

            }
            if (nam != "" && ma != "" && tt == "")
            {
                query = "PKHQS_SHOWDETAI_KHOA_NAMHOC '" + ma + "','" + nam + "'";

            }
            if (nam != "" && ma == "" && tt != "")
            {
                query = "PKHQS_SHOWDETAI_TRANGTHAI_NAMHOC N'" + tt + "','" + nam + "'";

            }
            if (nam != "" && ma != "" && tt != "")
            {
                query = "PKHQS_SHOWDETAI_KHOA_TRANGTHAI_NH '" + ma + "',N'" + tt + "','" + nam + "'";

            }
            listDT.DataSource = ConnectDB.Connected.getData(query);
        }

        private void TT_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void TV_Click(object sender, EventArgs e)
        {
            Form TV = new TVTG(MaDT);
            TV.ShowDialog();
        }

        private void selectMa_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void excel_Click(object sender, EventArgs e)
        {
            panel4.Visible = false;
            listDT.SelectAll();
            DataObject copydata = listDT.GetClipboardContent();
            if (copydata != null) Clipboard.SetDataObject(copydata);
            Microsoft.Office.Interop.Excel.Application xlapp = new Microsoft.Office.Interop.Excel.Application();
            xlapp.Visible = true;
            Microsoft.Office.Interop.Excel.Workbook xlWbook;
            Microsoft.Office.Interop.Excel.Worksheet xlsheet;
            object misedata = System.Reflection.Missing.Value;
            xlWbook = xlapp.Workbooks.Add(misedata);
            xlsheet = (Microsoft.Office.Interop.Excel.Worksheet)xlWbook.Worksheets.get_Item(1);
            Microsoft.Office.Interop.Excel.Range xlr = (Microsoft.Office.Interop.Excel.Range)xlsheet.Cells[1, 1];
            xlr.Select();
            xlsheet.PasteSpecial(xlr, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, true);
        }

        private void listDT_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void btnDADTCTD_Click(object sender, EventArgs e)
        {
            string current_year =  DateTime.Now.Year.ToString();
     
            panel4.Visible = false;
            if (DateTime.Compare(DateTime.Parse("9/15/" + current_year), DateTime.Now) <= 0 && DateTime.Compare(DateTime.Parse("12/31/" + current_year), DateTime.Now) >= 0)
            {
                string query = "PKHQS_DTCTD '50'";
                DataTable dt = ConnectDB.Connected.getData(query);
                if (dt.Rows.Count > 0)
                {
                    listDT.DataSource = dt;
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
                    listDT.DataSource = dt;
                }
                else
                {
                    MessageBox.Show("Không có đề tài nào chậm tiến độ lần 2");
                    getListReasearch();
                }

            }
            else
            {
                MessageBox.Show("Chưa đến thời gian cập nhập");
            }



        }

        private void panel3_Paint(object sender, PaintEventArgs e)
        {

        }

        private void panelFilter_Click(object sender, EventArgs e)
        {

        }

        
    }
}
