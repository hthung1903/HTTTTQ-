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

namespace QuanLyDeTai.DaiDoi.ListResearch
{
    public partial class ListResearch : Form
    {
        public static string maDD;
        private string TenDT;     
        private static string maDT;
        
    
        public ListResearch(string MaDD)
        {
            maDD = MaDD;
            InitializeComponent();
            getList();
            Loading.Start();
            
            panel_dstvDETAI.Enabled = true;

        }

        private void getList()
        {
            string query = "Daidoi_lay_dsdt '" + maDD + "'";
            guna2DataGridView1.DataSource = ConnectDB.Connected.getData(query);

        } 
        


        private void guna2DataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            
                panel_dstvDETAI.Visible = true;
                DataGridViewRow row = new DataGridViewRow();
                row = guna2DataGridView1.Rows[e.RowIndex];
                maDT = Convert.ToString(row.Cells[0].Value);
                TenDT = Convert.ToString(row.Cells[1].Value);
                
            
        }

        private void btn_dstvDETAI_Click(object sender, EventArgs e)
        {
            Form formdstv = new dstvDETAI(maDT,TenDT);
            formdstv.ShowDialog();
         }

        private void guna2DataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void ListResearch_Load_1(object sender, EventArgs e)
        {
            panel_dstvDETAI.Visible = false;

        }

   
    }
}
