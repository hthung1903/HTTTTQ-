using System;
using System.Collections.Generic;
using System.Configuration;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDeTai.User.ListResearch
{
    public partial class ListResearch : Form
    {
        public static string maGV;
        private string TenDT;
        private string TT;
        private static string maDT;
        
    
        public ListResearch(string MaGV)
        {
            maGV = MaGV;
            InitializeComponent();
            Loading.Start();
            btnUpdate.Enabled = false;
            update.Enabled = false;
            delete.Enabled = false;
            bunifuButton1.Visible = false;
           
        }
        private void ListResearch_Load(object sender, EventArgs e)
        {
            
        }
        private void getList()
        {
            string query = "select MaDT as N'Mã đề tài' ,TenDT as N'Tên đề tài',NgayBD as N'Ngày bắt đầu',NgayNT as N'Ngày nghiệm thu',TrangThai as N'Trạng thái',TienDo as N'Tiến độ', KinhPhi as N'Kinh phí' from DeTai where MADT in (select MADT from VaiTroHD where MAGV = '" + maGV+"')";
            guna2DataGridView1.DataSource = ConnectDB.Connected.getData(query);

        } 
        private void Loading_Tick(object sender, EventArgs e)
        {
            progressBar1.Hide();
            progressBar1.PerformStep();
            
            if (progressBar1.Value.ToString() == "10")
            {
                getList();
            }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            string query = "update DeTai set TienDo = '" + update.Text + "' where MADT = '" + maDT + "'";
            MessageBox.Show(ConnectDB.Connected.ChangeData(query,"Cập nhập"));
        }


        private void guna2DataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                DataGridViewRow row = new DataGridViewRow();
                row = guna2DataGridView1.Rows[e.RowIndex];
                maDT = Convert.ToString(row.Cells[0].Value);
                TenDT = Convert.ToString(row.Cells[1].Value);
                update.Text = Convert.ToString(row.Cells[5].Value);
                update.Enabled = true;
                btnUpdate.Enabled = true;
                delete.Enabled = true;
                panel_dstvDETAI.Visible = true;
                bunifuButton1.Visible = true;

            }
            catch
            {

            }
        }

    
        private void delete_Click(object sender, EventArgs e)
        {
           if(TT == "Chờ phê duyệt")
            {
                string query = "deleteResearch '" + maDT + "'";
                ConnectDB.Connected.ChangeData(query, "Xóa");
                getList();
            }
            else
            {
                MessageBox.Show("Không thể hủy đề tài đã duyệt.Mời bạn liên hệ đến PKHCN đề nghị hủy đề tài");
            }
        }

        private void btn_dstvDETAI_Click(object sender, EventArgs e)
        {
            Form formdstv = new dstvDETAI(maDT,TenDT);
            formdstv.ShowDialog();
         }

        private void guna2DataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                DataGridViewRow row = new DataGridViewRow();
                row = guna2DataGridView1.Rows[e.RowIndex];
                maDT = Convert.ToString(row.Cells[0].Value);
                TenDT = Convert.ToString(row.Cells[1].Value);
                update.Text = Convert.ToString(row.Cells[5].Value);
                update.Enabled = true;
                btnUpdate.Enabled = true;
                delete.Enabled = true;
                panel_dstvDETAI.Visible = true;
                bunifuButton1.Visible = true;

            }
            catch
            {

            }
        }

        private void ListResearch_Load_1(object sender, EventArgs e)
        {

        }

        private void bunifuButton1_Click(object sender, EventArgs e)
        {
            Form xuat = new XuatDK(maDT,TenDT);
            xuat.ShowDialog();
        }
    }
}
